<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
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
<%@ include file="adminNavbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Order List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/AdminOrderList.css">
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

<jsp:include page="Footer.jsp" />

</body>
</html>
