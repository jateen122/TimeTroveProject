package com.timetrove.controller.servlet;

import com.timetrove.controller.dao.ProductDAO;
import com.timetrove.controller.database.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ConfirmDeleteProductServlet")
public class ConfirmDeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("productId");
        String confirm = request.getParameter("confirm");

        if ("yes".equals(confirm)) {
            try {
                Connection conn = DBUtil.getConnection();
                ProductDAO dao = new ProductDAO(conn);
                dao.deleteProduct(productId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("AddProductPageServlet");
    }
}
