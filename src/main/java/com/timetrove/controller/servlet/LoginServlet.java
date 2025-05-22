package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.UserDAO;
import com.timetrove.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and password are required.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }

        System.out.println(">>> Login attempt: " + username);

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password);

        if (user != null) {
            System.out.println(">>> Login successful for role: " + user.getRole());

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/adminDashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/UserHome.jsp");
            }

        } else {
            System.out.println(">>> Login failed: Invalid credentials");
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
