<%@ page import="java.util.*, com.timetrove.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserCart.css">
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
        <a href="<%= request.getContextPath() %>/UserProductServlet" class="btn-green">Back to Products</a>
    </div>
    <%
        } else {
    %>

    <form action="<%= request.getContextPath() %>/UserUpdateCartServlet" method="post">
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
                <td><img src="<%= request.getContextPath() %>/images/<%= product.getImage() %>" alt=""></td>
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
            <a href="<%= request.getContextPath() %>/UserProductServlet" class="btn-green">Back to Products</a>
            <button type="submit" class="btn btn-grey">Update Cart</button>
            <a href="<%= request.getContextPath() %>/pages/UserCheckout.jsp" class="btn btn-red">Proceed to Checkout</a>
        </div>
    </form>

    <%
        }
    %>
</div>

<%
    String flash = (String) session.getAttribute("flash");
    if (flash != null) {
%>
    <div id="toast"><%= flash %></div>
<%
        session.removeAttribute("flash");
    }
%>

<jsp:include page="Footer.jsp" />

</body>
</html>
