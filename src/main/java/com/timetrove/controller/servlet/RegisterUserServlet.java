package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.UserDAO;
import com.timetrove.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println(">>> Inside RegisterUserServlet");

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String username = request.getParameter("username");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String retypePassword = request.getParameter("retype_password");
        String address = request.getParameter("address");

        System.out.println(">>> Retrieved form values:");
        System.out.println("First Name: " + firstName);
        System.out.println("Last Name: " + lastName);
        System.out.println("Username: " + username);
        System.out.println("Birthday: " + birthday);
        System.out.println("Gender: " + gender);
        System.out.println("Phone: " + phone);
        System.out.println("Email: " + email);
        System.out.println("Role: " + role);
        System.out.println("Password: " + password);
        System.out.println("Retype Password: " + retypePassword);
        System.out.println("Address: " + address);

        if (!password.equals(retypePassword)) {
            System.out.println(">>> Passwords do not match");
            response.sendRedirect(request.getContextPath() + "/pages/register.jsp?error=password_mismatch");
            return;
        }

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username);
        user.setBirthday(birthday);
        user.setGender(gender);
        user.setPhone(phone);
        user.setEmail(email);
        user.setRole(role);
        user.setPassword(password);
        user.setAddress(address);

        System.out.println(">>> User object created successfully");

        UserDAO userDAO = new UserDAO();
        boolean success = userDAO.registerUser(user);
        System.out.println(">>> Registration result: " + success);

        if (success) {
            System.out.println(">>> Redirecting to login.jsp");
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        } else {
            System.out.println(">>> Registration failed. Redirecting back to register.jsp");
            response.sendRedirect(request.getContextPath() + "/pages/register.jsp?error=true");
        }
    }
}
