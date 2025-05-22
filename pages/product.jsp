<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Classic Leather Watch - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/product.css">
</head>
<body>

<header>TimeTrove - Product Details</header>

<div class="container">
    <div class="product-image">
        <img src="${pageContext.request.contextPath}/images/watch1.jpg" alt="Classic Leather Watch">
    </div>

    <div class="product-details">
        <h1>Classic Leather Watch</h1>
        <p>Elegant wristwatch featuring a brown leather strap and a polished silver dial. A timeless accessory for both formal and casual attire. Water-resistant and built with premium materials.</p>

        <div class="price">Rs. 5,999</div>

        <form action="${pageContext.request.contextPath}/addToCart" method="post">
            <input type="hidden" name="productId" value="101">
            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" value="1" min="1">
            <button type="submit">Add to Cart</button>
        </form>
    </div>
</div>

<jsp:include page="Footer.jsp" />

</body>
</html>
