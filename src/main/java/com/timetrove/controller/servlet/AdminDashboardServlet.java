package com.timetrove.controller.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedInUser") != null) {
            request.getRequestDispatcher("/pages/adminDashboard.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        }
    }
}