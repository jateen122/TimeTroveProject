package com.timetrove.controller.servlet;

import com.timetrove.model.Product;
import com.timetrove.model.UserCartItem;
import com.timetrove.controller.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/UserAddToCartServlet")
public class UserAddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        Map<Integer, UserCartItem> cart = (Map<Integer, UserCartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new LinkedHashMap<>();
        }

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        if (cart.containsKey(productId)) {
            cart.get(productId).incrementQuantity();
        } else {
            cart.put(productId, new UserCartItem(product, 1));
        }

        session.setAttribute("cart", cart);
        session.setAttribute("flash", "Product added to cart successfully!");
        response.sendRedirect("pages/UserCart.jsp");
    }
}
