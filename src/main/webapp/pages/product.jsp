<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Classic Leather Watch - Timetrove</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #222;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            display: flex;
            gap: 30px;
        }

        .product-image img {
            width: 350px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        .product-details {
            flex: 1;
        }

        .product-details h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .product-details p {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .price {
            font-size: 24px;
            font-weight: bold;
            color: #008060;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="number"] {
            width: 80px;
            padding: 8px;
            margin-right: 20px;
        }

        button {
            background-color: #008060;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #005f47;
        }
    </style>
</head>
<body>

<header>Timetrove - Product Details</header>

<div class="container">

    <div class="product-image">
        <img src="images/watch1.jpg" alt="Classic Leather Watch">
    </div>

    <div class="product-details">
        <h1>Classic Leather Watch</h1>
        <p>Elegant wristwatch featuring a brown leather strap and a polished silver dial. A timeless accessory for both formal and casual attire. Water-resistant and built with premium materials.</p>

        <div class="price">Rs. 5,999</div>

        <form action="addToCart" method="post">
            <input type="hidden" name="productId" value="101">
            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" value="1" min="1">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

</div>

</body>
</html>
