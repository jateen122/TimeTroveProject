<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Order List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px 30px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 14px 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #343a40;
            color: white;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 1px;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .status {
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: bold;
            display: inline-block;
        }

        .Pending {
            background-color: #ffeeba;
            color: #856404;
        }

        .Shipped {
            background-color: #d4edda;
            color: #155724;
        }

        .Cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }

        .update-btn {
            background-color: #007bff;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 13px;
            margin-left: 5px;
        }

        select {
            padding: 5px;
            font-size: 14px;
            border-radius: 4px;
        }

        .footer-note {
            font-size: 13px;
            color: #666;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>All Customer Orders</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>Customer</th>
            <th>Email</th>
            <th>Total</th>
            <th>Status</th>
            <th>Order Date</th>
            <th>Action</th>
        </tr>

        <c:choose>
            <c:when test="${not empty orderList}">
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.name}</td>
                        <td>${order.email}</td>
                        <td>Rs. ${order.total}</td>
                        <td>
                            <span class="status ${order.status}">${order.status}</span>
                        </td>
                        <td>${order.date}</td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/UpdateOrderStatusServlet">
                                <input type="hidden" name="orderId" value="${order.orderId}" />
                                <select name="status">
                                    <option value="Pending" ${order.status eq 'Pending' ? 'selected' : ''}>Pending</option>
                                    <option value="Shipped" ${order.status eq 'Shipped' ? 'selected' : ''}>Shipped</option>
                                    <option value="Cancelled" ${order.status eq 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                </select>
                                <button type="submit" class="update-btn">Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="7" style="text-align:center;">No orders found.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>

    <div class="footer-note">Showing latest orders placed by customers.</div>
</div>

</body>
</html>
