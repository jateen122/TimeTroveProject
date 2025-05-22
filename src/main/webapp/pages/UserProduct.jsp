<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products - TimeTrove</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
        }

        .main-layout {
            display: flex;
            width: 100%;
            padding: 30px 0;
            gap: 30px;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            padding-left: 20px;
        }

        .category-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        }

        .category-box h3 {
            margin-top: 0;
            font-size: 18px;
            margin-bottom: 15px;
        }

        .category-box ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .category-box li {
            margin-bottom: 8px;
        }

        .category-box a {
            display: block;
            padding: 10px 14px;
            border-radius: 5px;
            background-color: #f0f0f0;
            color: #333;
            text-decoration: none;
            transition: background 0.2s ease;
        }

        .category-box a.active {
            background-color: #28a745;
            color: white;
            font-weight: bold;
        }

        /* Search */
        .search-box {
            width: 100%;
            padding: 8px 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            font-size: 14px;
            outline: none;
        }

        .search-btn {
            width: 100%;
            padding: 8px;
            background-color: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .search-btn:hover {
            background-color: #218838;
        }

        /* Product Grid */
        .product-section {
            flex: 1;
            padding: 0 20px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
        }

        .product-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 100%;
            height: 220px;
            object-fit: contain;
            margin-bottom: 15px;
        }

        .product-category {
            color: #777;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .product-name {
            font-weight: bold;
            font-size: 18px;
            margin: 5px 0;
        }

        .product-price {
            color: #28a745;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .product-link {
            color: #007bff;
            font-size: 14px;
            text-decoration: underline;
        }

        .no-products {
            margin-top: 30px;
            color: #555;
            text-align: center;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .main-layout {
                flex-direction: column;
                padding: 20px;
            }

            .sidebar {
                width: 100%;
                padding-left: 0;
            }

            .product-section {
                padding: 0;
            }

            .product-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
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
