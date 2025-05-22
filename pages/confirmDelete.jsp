<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String productId = (String) session.getAttribute("deleteProductId");
    if (productId == null) {
        response.sendRedirect(request.getContextPath() + "/AddProductPageServlet");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminNavbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Delete</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/confirmDelete.css">
</head>
<body>

<div class="confirm-box">
    <div class="close-btn">
        <a href="<%=request.getContextPath()%>/AddProductPageServlet">&times;</a>
    </div>
    <h2>Are you sure you want to delete this product?</h2>
    <p>Product ID: <%= productId %></p>

    <div class="btn-group">
        <form action="<%=request.getContextPath()%>/DeleteProductServlet" method="post">
            <input type="hidden" name="productId" value="<%= productId %>">
            <button type="submit" class="yes-btn">Yes, Delete</button>
        </form>

        <form action="<%=request.getContextPath()%>/AddProductPageServlet" method="get">
            <button type="submit" class="no-btn">No, Cancel</button>
        </form>
    </div>
</div>

<jsp:include page="Footer.jsp" />

</body>
</html>
