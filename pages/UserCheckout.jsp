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
    <title>Checkout - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserCheckout.css">
</head>
<body>

<jsp:include page="UserNavbar.jsp" />

<%
    Map<Integer, UserCartItem> cart = (Map<Integer, UserCartItem>) session.getAttribute("cart");
    User user = (User) session.getAttribute("user");
    double total = 0;
%>

<div class="container">
    <!-- Billing Section -->
    <div class="billing">
        <h2>Billing & Shipping</h2>
        <form action="${pageContext.request.contextPath}/PlaceOrderServlet" method="post">
            <label>First name *</label>
            <input type="text" name="firstName" value="<%= user != null ? user.getFirstName() : "" %>"
                   required pattern="[A-Za-z\s]+" title="Only letters allowed">

            <label>Last name *</label>
            <input type="text" name="lastName" value="<%= user != null ? user.getLastName() : "" %>"
                   required pattern="[A-Za-z\s]+" title="Only letters allowed">

            <label>Street address *</label>
            <input type="text" name="address" value="<%= user != null ? user.getAddress() : "" %>"
                   required pattern="[A-Za-z0-9\s]+" title="Only letters/numbers allowed">

            <label>Town / City *</label>
            <input type="text" name="city" required pattern="[A-Za-z\s]+" title="Only letters allowed">

            <label>State / Zone *</label>
            <input type="text" name="region" required pattern="[A-Za-z\s]+" title="Only letters allowed">

            <label>Postcode / ZIP (optional)</label>
            <input type="text" name="postalCode" title="Only numbers allowed">

            <label>Phone *</label>
            <input type="text" name="phone" value="<%= user != null ? user.getPhone() : "" %>"
                   title="Phone number must be 10 digits">

            <label>Email address *</label>
            <input type="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" required>

            <div class="radio-group">
                <label>Cash on Delivery</label>
                <p style="margin-left: 25px; font-size: 13px; color: gray;">Pay with cash upon delivery.</p>
            </div>

            <button type="submit" class="btn-submit">Place Order</button>
        </form>
    </div>

    <!-- Order Summary Section -->
    <div class="summary">
        <h2>Your order</h2>
        <table>
            <tr>
                <th>Product</th>
                <th>Subtotal</th>
            </tr>
            <%
                if (cart != null) {
                    for (UserCartItem item : cart.values()) {
                        Product product = item.getProduct();
                        int qty = item.getQuantity();
                        double price = product.getPrice();
                        double subtotal = qty * price;
                        total += subtotal;
            %>
            <tr>
                <td><%= product.getName() %> × <%= qty %></td>
                <td>Rs. <%= String.format("%.2f", subtotal) %></td>
            </tr>
            <%
                    }
                }
            %>
            <tr>
                <td>Subtotal</td>
                <td>Rs. <%= String.format("%.2f", total) %></td>
            </tr>
            <tr>
                <td>Shipping</td>
                <td>Flat rate: Rs. 100.00</td>
            </tr>
            <tr class="total-row">
                <td>Total</td>
                <td>Rs. <%= String.format("%.2f", total + 100) %></td>
            </tr>
        </table>
    </div>
</div>

<jsp:include page="Footer.jsp" />

</body>
</html>
