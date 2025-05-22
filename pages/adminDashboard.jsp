<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.timetrove.model.Order" %>

<jsp:include page="adminNavbar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/adminDashboard.css">
</head>
<body>

<div class="dashboard-container">

    <div class="stats-cards">
        <div class="card">
            <h3>Total Registered Users</h3>
            <p>${totalUsers}</p>
        </div>
        <div class="card">
            <h3>Total Products</h3>
            <p>${totalProducts}</p>
        </div>
        <div class="card">
            <h3>Total Categories</h3>
            <p>${totalCategories}</p>
        </div>
    </div>

    <div class="orders-section">
        <h2>Recent Orders</h2>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Amount (Rs.)</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
            <c:forEach var="order" items="${recentOrders}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.fullName}</td>
                    <td>${order.totalAmount}</td>
                    <td>${order.status}</td>
                    <td>${order.orderDate}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>

<jsp:include page="Footer.jsp" />

</body>
</html>
