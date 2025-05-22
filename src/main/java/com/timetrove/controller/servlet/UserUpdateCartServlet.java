package com.timetrove.controller.servlet;

import com.timetrove.model.UserCartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/UserUpdateCartServlet")
public class UserUpdateCartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, UserCartItem> cart = (Map<Integer, UserCartItem>) session.getAttribute("cart");

        if (cart == null) {
            response.sendRedirect("pages/UserCart.jsp");
            return;
        }

        // Process each quantity input named as quantity_{productId}
        for (String paramName : request.getParameterMap().keySet()) {
            if (paramName.startsWith("quantity_")) {
                try {
                    int productId = Integer.parseInt(paramName.substring("quantity_".length()));
                    int newQuantity = Integer.parseInt(request.getParameter(paramName));

                    if (newQuantity == 0) {
                        cart.remove(productId);
                    } else {
                        UserCartItem item = cart.get(productId);
                        if (item != null) {
                            item.setQuantity(newQuantity);
                        }
                    }
                } catch (NumberFormatException e) {
                    // Skip invalid inputs
                    e.printStackTrace();
                }
            }
        }

        session.setAttribute("cart", cart);

        if (cart.isEmpty()) {
            session.setAttribute("flash", "Cart is now empty.");
        } else {
            session.setAttribute("flash", "Cart updated successfully!");
        }

        response.sendRedirect("pages/UserCart.jsp");
    }
}
