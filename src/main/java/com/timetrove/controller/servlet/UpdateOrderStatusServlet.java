package com.timetrove.controller.servlet;

import com.timetrove.controller.database.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        String newStatus = request.getParameter("status");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newStatus);
            stmt.setInt(2, Integer.parseInt(orderIdStr));

            int updated = stmt.executeUpdate();
            System.out.println("✅ Order ID " + orderIdStr + " updated to: " + newStatus + " (" + updated + " row(s) affected)");

        } catch (Exception e) {
            System.out.println("❌ Failed to update order status");
            e.printStackTrace();
        }

        // Redirect back to the order list
        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}
