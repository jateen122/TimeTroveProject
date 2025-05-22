package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.ProductDAO;
import com.timetrove.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

@WebServlet("/UpdateProductServlet")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");

            int productId = Integer.parseInt(request.getParameter("product_id"));
            String name = request.getParameter("product_name");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String description = request.getParameter("product_desc");

            if (name == null || name.trim().isEmpty() || description == null || price <= 0 || stock < 0) {
                response.getWriter().println("Invalid form data.");
                return;
            }

            // Fetch existing product to retain old image if new one isn't provided
            ProductDAO productDAO = new ProductDAO();
            Product existing = productDAO.getProductById(productId);

            if (existing == null) {
                response.sendError(404, "Product not found");
                return;
            }

            String imageName = existing.getImage(); // default to existing image

            Part filePart = request.getPart("file");
            if (filePart != null && filePart.getSize() > 0) {
                imageName = filePart.getSubmittedFileName();

                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                File file = new File(uploadPath + File.separator + imageName);
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
                }
            }

            // ✅ Use setter-based approach
            Product updated = new Product();
            updated.setId(productId);
            updated.setName(name);
            updated.setPrice(price);
            updated.setStock(stock);
            updated.setCategoryId(categoryId);
            updated.setDescription(description);
            updated.setImage(imageName);

            boolean success = productDAO.updateProduct(updated);

            if (success) {
                HttpSession session = request.getSession();
                session.setAttribute("flash", "Product updated successfully!");
                response.sendRedirect("AddProductPageServlet");
            } else {
                response.getWriter().println("Failed to update product.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating product: " + e.getMessage());
        }
    }
}
