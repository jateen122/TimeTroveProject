<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add & Manage Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            align-items: flex-start;
            gap: 30px;
            padding: 30px;
            flex-wrap: wrap;
        }

        .form-container {
            flex: 1;
            max-width: 400px;
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .list-container {
            flex: 3;
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: blue;
            color: white;
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: darkblue;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-card img {
            width: 150px;
            height: 150px;
            object-fit: contain;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .product-info {
            text-align: center;
            margin-bottom: 10px;
        }

        .product-info p {
            margin: 2px 0;
            font-size: 14px;
        }

        .actions {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .actions a {
            padding: 6px 12px;
            background-color: #2196F3;
            color: white;
            border-radius: 4px;
            text-decoration: none;
        }

        .actions a.delete {
            background-color: #f44336;
        }

        /* Flash message */
        .flash-message {
	    position: fixed;
	    bottom: 30px;
	    left: 50%;
	    transform: translateX(-50%);
	    background-color: #d4edda;
	    color: #155724;
	    padding: 12px 30px;
	    border-radius: 5px;
	    font-weight: bold;
	    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	    z-index: 9999;
	    animation: fadeOut 2s ease-in-out 2s forwards;
	}


        @keyframes fadeOut {
            to {
                opacity: 0;
                visibility: hidden;
            }
        }
    </style>
</head>
<body>

<!-- Flash Message -->
<c:if test="${not empty sessionScope.flash}">
    <div class="flash-message" id="flashMessage">
        ${sessionScope.flash}
    </div>
    <c:remove var="flash" scope="session" />
</c:if>

<div class="container">

    <!-- Add Product Form -->
    <div class="form-container">
        <h2>Add New Product</h2>
        <form action="${pageContext.request.contextPath}/AddProductServlet" method="post" enctype="multipart/form-data">
            <label for="product_name">Product Name</label>
            <input type="text" id="product_name" name="product_name" required>

            <label for="price">Price</label>
            <input type="text" id="price" name="price" required>

            <label for="stock">Stock</label>
            <input type="number" id="stock" name="stock" required>

            <label for="category_id">Category</label>
            <select id="category_id" name="category_id" required>
                <option value="" disabled selected>Select a category</option>
                <c:forEach var="c" items="${categoryList}">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>

            <label for="product_desc">Description</label>
            <input type="text" id="product_desc" name="product_desc" required>

            <label for="file">Product Image</label>
            <input type="file" id="file" name="file" accept="image/*" required>

            <button type="submit">Add Product</button>
        </form>
    </div>

    <!-- Product Cards -->
    <div class="list-container">
        <div class="product-grid">
            <c:forEach var="p" items="${productList}">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/images/${p.image}" alt="${p.name}" />
                    <div class="product-info">
                        <p><strong>Name:</strong> ${p.name}</p>
                        <p><strong>Price:</strong> Rs. ${p.price}</p>
                        <p><strong>Stock:</strong> ${p.stock}</p>
                    </div>
                    <div class="actions">
                        <a href="EditProductServlet?productId=${p.id}">Edit</a>
                        <a class="delete" href="${pageContext.request.contextPath}/DeleteProductServlet?productId=${p.id}">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>

</body>
</html>
