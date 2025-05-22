package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.CategoryDAO;
import com.timetrove.controller.dao.ProductDAO;
import com.timetrove.model.Category;
import com.timetrove.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddProductPageServlet")
public class AddProductPageServlet extends HttpServlet {

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
            List<Product> productList = productDAO.getAllProducts();
            List<Category> categoryList = categoryDAO.getAllCategories();

            request.setAttribute("productList", productList);
            request.setAttribute("categoryList", categoryList);

            request.getRequestDispatcher("/pages/addProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading add product page.");
        }
    }
}
