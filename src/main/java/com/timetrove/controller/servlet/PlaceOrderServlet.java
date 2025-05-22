package com.timetrove.controller.servlet;

import com.timetrove.controller.database.DBUtil;
import com.timetrove.model.Product;
import com.timetrove.model.User;
import com.timetrove.model.UserCartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Map;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 📝 Step 1: Get billing form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String region = request.getParameter("region");
        String postalCode = request.getParameter("postalCode");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Map<Integer, UserCartItem> cart = (Map<Integer, UserCartItem>) session.getAttribute("cart");

        // 🔐 Check session state
        if (user == null || cart == null || cart.isEmpty()) {
            response.sendRedirect("UserCart.jsp");
            return;
        }

        // 🧮 Step 2: Calculate total with shipping
        double totalAmount = cart.values().stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum() + 100; // Fixed Rs. 100 shipping

        int orderId = -1;

        try (Connection conn = DBUtil.getConnection()) {

            // 🛒 Step 3: Insert into orders table
            String orderSql = "INSERT INTO orders (user_id, full_name, address, city, region, postal_code, phone, email, total_amount) " +
                              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement orderStmt = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, user.getId());
            orderStmt.setString(2, firstName + " " + lastName);
            orderStmt.setString(3, address);
            orderStmt.setString(4, city);
            orderStmt.setString(5, region);
            orderStmt.setString(6, postalCode);
            orderStmt.setString(7, phone);
            orderStmt.setString(8, email);
            orderStmt.setDouble(9, totalAmount);
            orderStmt.executeUpdate();

         // ✅ Logging starts here
         System.out.println("✅ Order insert successful.");

         ResultSet keys = orderStmt.getGeneratedKeys();
         if (keys.next()) {
             orderId = keys.getInt(1);
             System.out.println("✅ Retrieved Order ID: " + orderId);
             System.out.println("📦 Inserting " + cart.size() + " item(s) into order_items...");


                // 📦 Step 5: Insert each product into order_items table
                String itemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                PreparedStatement itemStmt = conn.prepareStatement(itemSql);

                for (UserCartItem item : cart.values()) {
                    Product product = item.getProduct();
                    itemStmt.setInt(1, orderId);
                    itemStmt.setInt(2, product.getId());
                    itemStmt.setInt(3, item.getQuantity());
                    itemStmt.setDouble(4, product.getPrice());
                    itemStmt.addBatch();
                }

                itemStmt.executeBatch();
                itemStmt.close();
            }

            orderStmt.close();

            // ✅ Step 6: Store values for success page
            session.setAttribute("lastOrderId", orderId);
            session.setAttribute("lastOrderTotal", totalAmount);
            session.setAttribute("lastCart", cart);
            session.removeAttribute("cart");

            // 🚀 Step 7: Redirect to success page
            response.sendRedirect("pages/UserOrderSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error placing order.");
            request.getRequestDispatcher("pages/UserCheckout.jsp").forward(request, response);
        }
    }
}
