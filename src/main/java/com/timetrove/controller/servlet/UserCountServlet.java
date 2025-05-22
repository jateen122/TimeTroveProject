package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/userCount")
public class UserCountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        int count = userDAO.getUserCount(); // <-- This should fetch count from DB
        System.out.println(">>> Total user count fetched from DB: " + count);

        request.setAttribute("userCount", count);
        request.getRequestDispatcher("/pages/adminDashboard.jsp").forward(request, response);
        
        
    }
}
