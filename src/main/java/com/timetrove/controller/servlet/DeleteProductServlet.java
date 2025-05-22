package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));

            ProductDAO productDAO = new ProductDAO();
            boolean deleted = productDAO.deleteProduct(productId);

            if (deleted) {
                // Optional: success flash message
                HttpSession session = request.getSession();
                session.setAttribute("flash", "Product deleted successfully!");
            } else {
                request.getSession().setAttribute("flash", "Failed to delete product.");
            }

            // Redirect back to product list page
            response.sendRedirect("AddProductPageServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting product: " + e.getMessage());
        }
    }
}
