<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Edit Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/editProduct.css">
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

<jsp:include page="Footer.jsp" />

</body>
</html>
