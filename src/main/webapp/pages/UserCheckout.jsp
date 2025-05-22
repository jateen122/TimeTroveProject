<%@ page import="java.util.*, com.timetrove.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - TimeTrove</title>
    <style>
        html{margin: 0;padding:0;}
        body { font-family: Arial, sans-serif; margin: 0;padding:0; background: #f9f9f9; }
        .container { display: flex; justify-content: space-between; padding: 40px 60px; }

        .billing, .summary {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 48%;
        }

        .billing h2, .summary h2 { margin-top: 0; font-size: 24px; }

        form label { display: block; margin-top: 15px; font-weight: bold; }
        form input, form select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .summary table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        .summary th, .summary td { text-align: left; padding: 10px; }
        .summary tr td:last-child { text-align: right; }

        .total-row { font-weight: bold; border-top: 1px solid #ddd; }


        .terms { margin-top: 20px; }

        .btn-submit {
            margin-top: 20px;
            width: 100%;
            padding: 14px;
            background: #e67e22;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
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
				       required pattern="[A-Za-z\s]+" title="Only letters allowed">
				
				<label>Town / City *</label>
				<input type="text" name="city" required pattern="[A-Za-z\s]+" title="Only letters allowed">
				
				<label>State / Zone *</label>
				<input type="text" name="region" required pattern="[A-Za-z\s]+" title="Only letters allowed">
				
				<label>Postcode / ZIP (optional)</label>
				<input type="text" name="postalCode" " title="Only numbers allowed">
				
				<label>Phone *</label>
				<input type="text" name="phone" value="<%= user != null ? user.getPhone() : "" %>" 
				        title="Phone number must be 10 digits">
				
				<label>Email address *</label>
				<input type="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" required>
            

		    <div class="radio-group">
		    <label>
		        Cash on Delivery
		    </label>
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

</body>
</html>
