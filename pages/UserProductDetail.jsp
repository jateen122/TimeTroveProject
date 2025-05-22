<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.timetrove.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserProductDetails.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

<jsp:include page="UserNavbar.jsp" />

<div class="container">
    <div class="product-image">
        <img src="${pageContext.request.contextPath}/images/${product.image}" alt="${product.name}">
    </div>

    <div class="product-details">
        <h2>${product.name}</h2>

        <p class="label">Category:</p>
        <p>${product.categoryName}</p>

        <p class="label">Description:</p>
        <p>${product.description}</p>

        <p class="label">Price:</p>
        <p class="price">Rs. ${product.price}</p>

        <a href="${pageContext.request.contextPath}/UserAddToCartServlet?productId=${product.id}" class="add-to-cart-btn">
            <i class="fas fa-cart-plus"></i> Add to Cart
        </a>
    </div>
</div>
<jsp:include page="Footer.jsp" />

</body>
</html>
