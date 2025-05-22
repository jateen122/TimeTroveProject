<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.timetrove.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details - TimeTrove</title>

    <!-- Font Awesome for cart icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            display: flex;
            max-width: 1100px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            gap: 40px;
            flex-wrap: wrap;
        }

        .product-image {
            flex: 1;
            text-align: center;
        }

        .product-image img {
            width: 100%;
            max-width: 400px;
            height: auto;
            border-radius: 10px;
        }

        .product-details {
            flex: 1;
            min-width: 300px;
        }

        .product-details h2 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }

        .product-details p {
            font-size: 16px;
            color: #444;
            line-height: 1.6;
            margin: 5px 0 15px 0;
        }

        .label {
            font-weight: bold;
            color: #222;
            display: block;
            margin-top: 10px;
        }

        .price {
            font-size: 24px;
            font-weight: bold;
            color: #d10024;
            margin: 20px 0;
        }

        .add-to-cart-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s ease, transform 0.2s ease;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
        }

        .add-to-cart-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        .add-to-cart-btn i {
            font-size: 18px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }
            .product-details {
                text-align: center;
            }
        }
    </style>
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

</body>
</html>
