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
    <title>Add New Category</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/addCategory.css">
</head>
<body>

<div class="form-wrapper">
    <div class="form-container">
        <h2>Add New Category</h2>
        <form action="${pageContext.request.contextPath}/AddCategoryServlet" method="post">
            <label for="name">Category Name</label>
            <input type="text" id="name" name="name" placeholder="Enter category name" required>

            <label for="description">Description</label>
            <textarea id="description" name="description" rows="4" placeholder="Enter category description" required></textarea>

            <button type="submit">Add Category</button>
        </form>

        <div class="message">
            <c:if test="${param.success eq 'true'}">
                <p class="success">✅ Category added successfully!</p>
            </c:if>
            <c:if test="${param.error eq 'true'}">
                <p class="error">❌ Failed to add category. Please try again.</p>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="Footer.jsp" />

<script>
    setTimeout(() => {
        const msg = document.querySelector(".message");
        if (msg) msg.style.display = "none";
    }, 4000);
</script>

</body>
</html>
