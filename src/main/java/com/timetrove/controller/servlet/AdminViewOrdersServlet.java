package com.timetrove.controller.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import com.timetrove.controller.database.DBUtil;

@WebServlet("/admin/orders")
public class AdminViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, String>> orders = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {

            String sql = "SELECT order_id, full_name, email, total_amount, status, order_date FROM orders ORDER BY order_id DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> order = new HashMap<>();
                order.put("orderId", String.valueOf(rs.getInt("order_id")));
                order.put("name", rs.getString("full_name"));
                order.put("email", rs.getString("email"));
                order.put("total", String.format("%.2f", rs.getDouble("total_amount")));
                order.put("status", rs.getString("status"));
                order.put("date", String.valueOf(rs.getTimestamp("order_date")));
                orders.add(order);
            }

            // ✅ Debug output
            System.out.println("✅ AdminViewOrdersServlet: Orders fetched from DB = " + orders.size());
            for (Map<String, String> o : orders) {
                System.out.println("   - Order ID: " + o.get("orderId") +
                                   ", Customer: " + o.get("name") +
                                   ", Email: " + o.get("email") +
                                   ", Total: " + o.get("total") +
                                   ", Status: " + o.get("status") +
                                   ", Date: " + o.get("date"));
            }

            request.setAttribute("orderList", orders);
            request.getRequestDispatcher("/pages/AdminOrderList.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("❌ Error in AdminViewOrdersServlet: " + e.getMessage());
            e.printStackTrace();

            request.setAttribute("error", "Unable to fetch orders.");
            request.getRequestDispatcher("/pages/adminDashboard.jsp").forward(request, response);
        }
    }
}
