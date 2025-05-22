<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/addProduct.css">
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

<jsp:include page="Footer.jsp" />

</body>
</html>
