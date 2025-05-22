package com.timetrove.controller.servlet;

import com.timetrove.model.Product;
import com.timetrove.controller.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UserProductDetailServlet")
public class UserProductDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get productId from query parameter
            int productId = Integer.parseInt(request.getParameter("productId"));

            // Fetch product from DAO
            ProductDAO dao = new ProductDAO();
            Product product = dao.getProductById(productId);

            if (product != null) {
            	request.setAttribute("product", product);
            	request.getRequestDispatcher("pages/UserProductDetail.jsp").forward(request, response);

            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        }
    }
}
