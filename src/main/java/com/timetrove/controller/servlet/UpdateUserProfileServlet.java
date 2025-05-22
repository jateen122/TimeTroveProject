package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.UserDAO;
import com.timetrove.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("pages/login.jsp");
            return;
        }

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        currentUser.setFirstName(firstName);
        currentUser.setLastName(lastName);
        currentUser.setPhone(phone);
        currentUser.setEmail(email);
        currentUser.setAddress(address);

        UserDAO userDAO = new UserDAO();
        boolean updated = userDAO.updateUser(currentUser);

        if (updated) {
            session.setAttribute("user", currentUser); // update session
            session.setAttribute("flash", "Profile updated successfully!");
        } else {
            session.setAttribute("flash", "Error updating profile.");
        }

        response.sendRedirect("pages/UserProfile.jsp");
    }
}
