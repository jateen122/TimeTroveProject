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
    <style>
    html{margin: 0;padding:0;}
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding:0;
            padding: 30px;
        }

        .container {
            background: white;
            max-width: 900px;
            margin: auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .success {
            text-align: center;
            color: green;
            font-size: 20px;
            margin-bottom: 30px;
        }

        .summary-box {
            display: flex;
            justify-content: space-between;
            background: #fcfcfc;
            padding: 20px;
            border: 1px dashed #ccc;
            margin-bottom: 30px;
        }

        .summary-box div {
            width: 24%;
            font-size: 14px;
        }

        .summary-box div span {
            display: block;
            margin-top: 6px;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background: #f0f0f0;
        }

        td:last-child {
            text-align: right;
            font-weight: bold;
        }

        .note {
            font-size: 14px;
            color: #666;
            margin: 20px 0;
        }
    </style>
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

</body>
</html>
