<%@ page import="java.util.*, com.timetrove.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - TimeTrove</title>
    <style>
        body { font-family: Arial; background-color: #f5f7fa; margin: 0; padding: 0; }
        .container { width: 90%; margin: 40px auto; }
        h2 { text-align: center; margin-bottom: 30px; }

        table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        th, td { padding: 15px; text-align: center; border-bottom: 1px solid #ccc; }
        th { background: #343a40; color: white; }
        img { height: 80px; }

        .actions { text-align: right; margin-top: 20px; }
        .empty { text-align: center; font-size: 18px; padding: 50px; background-color: #fff; }
        .btn { padding: 10px 20px; border: none; border-radius: 20px; font-weight: bold; cursor: pointer; }
        .btn-red { background: #e60023; color: white; }
        .btn-grey { background: #f0f0f0; color: #333; margin-right: 10px; }
        .btn-green { background: #28a745; color: white; margin-right: 10px; text-decoration: none; padding: 10px 16px; border-radius: 6px; }

        #toast { position: fixed; bottom: 20px; right: 20px; background: #28a745; color: white; padding: 12px 20px; border-radius: 6px; font-weight: bold; animation: fadeout 4s forwards; z-index: 9999; }
        @keyframes fadeout { 0% { opacity: 1; } 80% { opacity: 1; } 100% { opacity: 0; display: none; } }
    </style>
</head>
<body>

<jsp:include page="UserNavbar.jsp" />

<div class="container">
    <h2>Your Shopping Cart</h2>

    <%
        Map<Integer, UserCartItem> cart = (Map<Integer, UserCartItem>) session.getAttribute("cart");
        double total = 0;
        if (cart == null || cart.isEmpty()) {
    %>
        <div class="empty">
            Your cart is empty.<br><br>
            <a href="${pageContext.request.contextPath}/UserProductServlet" class="btn-green">Back to Products</a>
        </div>
    <%
        } else {
    %>

    <form action="${pageContext.request.contextPath}/UserUpdateCartServlet" method="post">
        <table>
            <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
            </tr>

            <%
                for (UserCartItem item : cart.values()) {
                    Product product = item.getProduct();
                    int quantity = item.getQuantity();
                    int stock = product.getStock();
                    double subtotal = quantity * product.getPrice();
                    total += subtotal;
            %>
            <tr>
                <td><img src="${pageContext.request.contextPath}/images/<%= product.getImage() %>" alt=""></td>
                <td><%= product.getName() %></td>
                <td>Rs. <%= product.getPrice() %></td>
                <td>
                    <select name="quantity_<%= product.getId() %>">
                        <% for (int i = 0; i <= stock; i++) { %>
                            <option value="<%= i %>" <%= (i == quantity) ? "selected" : "" %>><%= i %></option>
                        <% } %>
                    </select>
                </td>
                <td>Rs. <%= String.format("%.2f", subtotal) %></td>
            </tr>
            <%
                }
            %>
        </table>

        <div class="actions">
            <span style="font-size: 18px; margin-right: 30px;">Total: <strong>Rs. <%= String.format("%.2f", total) %></strong></span>
            <a href="${pageContext.request.contextPath}/UserProductServlet" class="btn-green">Back to Products</a>
            <button type="submit" class="btn btn-grey">Update Cart</button>
            <a href="${pageContext.request.contextPath}/pages/UserCheckout.jsp" class="btn btn-red">Proceed to Checkout</a>
        </div>
    </form>

    <%
        }
    %>
</div>

<% String flash = (String) session.getAttribute("flash");
   if (flash != null) { %>
    <div id="toast"><%= flash %></div>
<% session.removeAttribute("flash"); } %>

</body>
</html>
