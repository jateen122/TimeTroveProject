<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat, com.timetrove.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    Integer orderId = (Integer) session.getAttribute("lastOrderId");
    Double totalAmount = (Double) session.getAttribute("lastOrderTotal");
    String paymentMethod = "Cash on Delivery";
    String orderDate = new SimpleDateFormat("MMMM dd, yyyy").format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserOrderSuccess.css">
</head>
<body>

<jsp:include page="UserNavbar.jsp" />

<div class="container">
    <div class="success">
        ✅ <strong>Thank you. Your order has been received.</strong>
    </div>

    <div class="summary-box">
        <div>
            Order number:
            <span><%= orderId != null ? orderId : "N/A" %></span>
        </div>
        <div>
            Date:
            <span><%= orderDate %></span>
        </div>
        <div>
            Total:
            <span>Rs. <%= totalAmount != null ? String.format("%.2f", totalAmount) : "0.00" %></span>
        </div>
        <div>
            Payment method:
            <span><%= paymentMethod %></span>
        </div>
    </div>

    <p class="note">💵 Pay with cash upon delivery.</p>

    <h2>Order details</h2>
    <table>
        <tr>
            <th>PRODUCT</th>
            <th>TOTAL</th>
        </tr>
        <%
            Map<Integer, UserCartItem> lastCart = (Map<Integer, UserCartItem>) session.getAttribute("lastCart");
            double subtotal = 0;
            if (lastCart != null) {
                for (UserCartItem item : lastCart.values()) {
                    Product product = item.getProduct();
                    int qty = item.getQuantity();
                    double itemTotal = qty * product.getPrice();
                    subtotal += itemTotal;
        %>
        <tr>
            <td><%= product.getName() %> × <%= qty %></td>
            <td>Rs. <%= String.format("%.2f", itemTotal) %></td>
        </tr>
        <%
                }
            }
        %>
        <tr>
            <td>Subtotal:</td>
            <td>Rs. <%= String.format("%.2f", subtotal) %></td>
        </tr>
        <tr>
            <td>Shipping:</td>
            <td>Rs. 100.00 <span style="font-size: 12px; color: gray;">via Flat rate</span></td>
        </tr>
        <tr>
            <td>Total:</td>
            <td>Rs. <%= totalAmount != null ? String.format("%.2f", totalAmount) : "0.00" %></td>
        </tr>
    </table>
</div>

<jsp:include page="Footer.jsp" />

</body>
</html>
