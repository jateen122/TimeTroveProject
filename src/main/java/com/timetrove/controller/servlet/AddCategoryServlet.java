// AddCategoryServlet.java
package com.timetrove.controller.servlet;

import com.timetrove.model.Category;
import com.timetrove.controller.dao.CategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Category category = new Category();
        category.setName(name);
        category.setDescription(description);

        boolean success = new CategoryDAO().addCategory(category);

        if (success) {
            response.sendRedirect("pages/addCategory.jsp?success=true");
        } else {
            response.sendRedirect("pages/addCategory.jsp?error=true");
        }
    }
}
