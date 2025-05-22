<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.timetrove.model.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="adminNavbar.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 20px;
        }

        .stats-cards {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            flex: 1;
            min-width: 250px;
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            text-align: center;
        }

        .card h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .card p {
            font-size: 28px;
            font-weight: bold;
            color: #0077cc;
        }

        .orders-section h2 {
            color: #444;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #0077cc;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        @media (max-width: 768px) {
            .stats-cards {
                flex-direction: column;
            }
        }
    </style>
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

</body>
</html>
