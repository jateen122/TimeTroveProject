package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.ProductDAO;
import com.timetrove.controller.dao.CategoryDAO;
import com.timetrove.model.Product;
import com.timetrove.model.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UserProductServlet")
public class UserProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔍 Get parameters
        String categoryName = request.getParameter("category");
        String search = request.getParameter("search");

        ProductDAO productDAO = new ProductDAO();
        List<Product> products;

        // 🧠 Priority: Search overrides category
        if (search != null && !search.trim().isEmpty()) {
            products = productDAO.searchProductsByName(search);
        } else if (categoryName != null && !categoryName.trim().isEmpty()) {
            products = productDAO.getProductsByCategory(categoryName);
        } else {
            products = productDAO.getAllProducts();
        }

        // ✅ Get all categories for sidebar
        List<Category> categories = CategoryDAO.getAllCategories();

        // ✅ Set data for JSP
        request.setAttribute("productList", products);
        request.setAttribute("categoryList", categories);

        // ✅ Pass success message (optional)
        String success = request.getParameter("success");
        if (success != null) {
            request.setAttribute("success", success);
        }

        // ✅ Forward to product listing JSP
        request.getRequestDispatcher("pages/UserProduct.jsp").forward(request, response);
    }
}
