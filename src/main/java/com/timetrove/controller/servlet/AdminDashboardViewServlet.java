package com.timetrove.controller.servlet;

import com.timetrove.model.Order;
import com.timetrove.controller.database.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardViewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;

        try {
            conn = DBUtil.getConnection();

            String userQuery = "SELECT COUNT(*) FROM users WHERE role = 'user'";
            PreparedStatement userStmt = conn.prepareStatement(userQuery);
            ResultSet userRs = userStmt.executeQuery();
            int totalUsers = userRs.next() ? userRs.getInt(1) : 0;

            String productQuery = "SELECT COUNT(*) FROM products";
            PreparedStatement productStmt = conn.prepareStatement(productQuery);
            ResultSet productRs = productStmt.executeQuery();
            int totalProducts = productRs.next() ? productRs.getInt(1) : 0;

            String categoryQuery = "SELECT COUNT(*) FROM categories";
            PreparedStatement categoryStmt = conn.prepareStatement(categoryQuery);
            ResultSet categoryRs = categoryStmt.executeQuery();
            int totalCategories = categoryRs.next() ? categoryRs.getInt(1) : 0;

            String orderQuery = "SELECT order_id, full_name, total_amount, status, order_date FROM orders ORDER BY order_date DESC LIMIT 5";
            PreparedStatement orderStmt = conn.prepareStatement(orderQuery);
            ResultSet orderRs = orderStmt.executeQuery();

            List<Order> recentOrders = new ArrayList<>();
            while (orderRs.next()) {
                Order order = new Order();
                order.setOrderId(orderRs.getInt("order_id"));
                order.setFullName(orderRs.getString("full_name"));
                order.setTotalAmount(orderRs.getDouble("total_amount"));
                order.setStatus(orderRs.getString("status"));
                order.setOrderDate(orderRs.getTimestamp("order_date"));
                recentOrders.add(order);
            }

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalCategories", totalCategories);
            request.setAttribute("recentOrders", recentOrders);

            request.getRequestDispatcher("pages/adminDashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
