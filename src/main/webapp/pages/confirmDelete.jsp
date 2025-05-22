<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="adminNavbar.jsp" %>

<%
    // Do NOT redeclare 'session' — it already exists in JSP
    String productId = (String) session.getAttribute("deleteProductId");
    if (productId == null) {
        response.sendRedirect(request.getContextPath() + "/AddProductPageServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Confirm Delete</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
        }

        .confirm-box {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .confirm-box h2 {
            margin-bottom: 10px;
        }

        .confirm-box p {
            margin-bottom: 20px;
            font-weight: bold;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .yes-btn {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .no-btn {
            background-color: #7f8c8d;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .yes-btn:hover {
            background-color: #c0392b;
        }

        .no-btn:hover {
            background-color: #626e70;
        }

        .close-btn {
            position: absolute;
            top: 25px;
            right: 40px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-btn a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>

<div class="confirm-box">
    <div class="close-btn">
        <a href="<%=request.getContextPath()%>/AddProductPageServlet">&times;</a>
    </div>
    <h2>Are you sure you want to delete this product?</h2>
    <p>Product ID: <%= productId %></p>

    <div class="btn-group">
        <form action="<%=request.getContextPath()%>/DeleteProductServlet" method="post">
            <input type="hidden" name="productId" value="<%= productId %>">
            <button type="submit" class="yes-btn">Yes, Delete</button>
        </form>

        <form action="<%=request.getContextPath()%>/AddProductPageServlet" method="get">
            <button type="submit" class="no-btn">No, Cancel</button>
        </form>
    </div>
</div>

</body>
</html>
