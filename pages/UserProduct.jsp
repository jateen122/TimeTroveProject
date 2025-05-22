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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserProduct.css">
</head>
<body>

<jsp:include page="UserNavbar.jsp" />

<div class="main-layout">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="category-box">
            <form action="${pageContext.request.contextPath}/UserProductServlet" method="get">
                <input type="text" name="search" placeholder="Search watches..." value="${param.search}" class="search-box" />
                <button type="submit" class="search-btn">Search</button>
            </form>

            <h3>Categories</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/UserProductServlet"
                       class="${empty param.category ? 'active' : ''}">All</a></li>
                <c:forEach var="cat" items="${categoryList}">
                    <li>
                        <a href="${pageContext.request.contextPath}/UserProductServlet?category=${cat.name}"
                           class="${param.category == cat.name ? 'active' : ''}">
                            ${cat.name}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <!-- Product Grid -->
    <div class="product-section">
        <c:choose>
            <c:when test="${not empty productList}">
                <div class="product-grid">
                    <c:forEach var="product" items="${productList}">
                        <div class="product-card">
                            <img src="${pageContext.request.contextPath}/images/${product.image}" alt="${product.name}">
                            <div class="product-category">${product.categoryName}</div>
                            <div class="product-name">${product.name}</div>
                            <div class="product-price">Rs. ${product.price}</div>
                            <a href="${pageContext.request.contextPath}/UserProductDetailServlet?productId=${product.id}" class="product-link">View Details</a>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p class="no-products">No products found matching your search.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
