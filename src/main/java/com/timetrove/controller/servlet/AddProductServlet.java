package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.ProductDAO;
import com.timetrove.controller.database.DBUtil;
import com.timetrove.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import java.sql.Connection;

@WebServlet("/AddProductServlet")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form data
            String name = request.getParameter("product_name");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String description = request.getParameter("product_desc");

            // Handle image upload
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName(); // e.g., rolex.jpeg

            // Save image to /images folder
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            filePart.write(uploadPath + File.separator + fileName);

            // Create product object
            Product product = new Product();
            product.setName(name);
            product.setPrice(price);
            product.setStock(stock);
            product.setCategoryId(categoryId);
            product.setDescription(description);
            product.setImage(fileName); // Save only "rolex.jpeg", not "images/rolex.jpeg"

            // Save product to database
            ProductDAO productDAO = new ProductDAO();
            boolean success = productDAO.addProduct(product);

            if (success) {
                response.sendRedirect("AddProductPageServlet");
            } else {
                response.getWriter().println("Failed to add product.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding product: " + e.getMessage());
        }
    }
}