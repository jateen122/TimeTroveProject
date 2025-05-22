<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f6f8;
            padding: 30px;
        }

        .form-box {
            max-width: 500px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: relative;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="file"] {
            margin-top: 10px;
        }

        img {
            width: 100px;
            height: auto;
            margin-top: 10px;
            border-radius: 6px;
        }

        button {
            width: 100%;
            margin-top: 25px;
            background-color: orange;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: darkorange;
        }

        .close-btn {
            position: absolute;
            top: 12px;
            right: 18px;
            font-size: 20px;
            text-decoration: none;
            color: #555;
        }

        .close-btn:hover {
            color: red;
        }
    </style>
</head>
<body>

<div class="form-box">
    <a href="AddProductPageServlet" class="close-btn">&times;</a>
    <h2>Edit Product</h2>
    <form action="${pageContext.request.contextPath}/UpdateProductServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="product_id" value="${product.id}" />

        <label for="product_name">Product Name</label>
        <input type="text" name="product_name" id="product_name" value="${product.name}" required />

        <label for="price">Price</label>
        <input type="text" name="price" id="price" value="${product.price}" required />

        <label for="stock">Stock</label>
        <input type="number" name="stock" id="stock" value="${product.stock}" required />

        <label for="category_id">Category</label>
        <select name="category_id" id="category_id" required>
            <c:forEach var="cat" items="${categoryList}">
                <option value="${cat.id}" <c:if test="${cat.id == product.categoryId}">selected</c:if>>
                    ${cat.name}
                </option>
            </c:forEach>
        </select>

        <label for="product_desc">Description</label>
        <input type="text" name="product_desc" id="product_desc" value="${product.description}" required />

        <label>Current Image:</label><br>
        <img src="${pageContext.request.contextPath}/images/${product.image}" alt="Current Product Image" />

        <label for="file">Change Image (optional)</label>
        <input type="file" name="file" id="file" accept="image/*" />

        <button type="submit">Save Changes</button>
    </form>
</div>

</body>
</html>
