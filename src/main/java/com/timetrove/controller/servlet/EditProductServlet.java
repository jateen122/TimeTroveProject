package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.CategoryDAO;
import com.timetrove.controller.dao.ProductDAO;
import com.timetrove.model.Category;
import com.timetrove.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get product ID from query parameter
            int productId = Integer.parseInt(request.getParameter("productId"));

            // Fetch product and category list
            Product product = productDAO.getProductById(productId);
            List<Category> categoryList = categoryDAO.getAllCategories();

            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

            // Pass to JSP
            request.setAttribute("product", product);
            request.setAttribute("categoryList", categoryList);

            request.getRequestDispatcher("/pages/editProduct.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading edit product page.");
        }
    }
}
