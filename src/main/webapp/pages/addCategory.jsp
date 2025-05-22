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
    <title>Add New Category</title>
    <style>
			        body {
			        font-family: 'Segoe UI', sans-serif;
			        background-color: #eef2f5;
			        margin: 0;
			        padding: 0;
			    }
			
			    .form-wrapper {
			        display: flex;
			        justify-content: center;
			        align-items: center;
			        height: 100vh;
			    }
			
			    .form-container {
			        width: 100%;
			        max-width: 640px;
			        background-color: #ffffff;
			        padding: 50px;
			        border-radius: 16px;
			        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
			    }
			
			    h2 {
			        text-align: center;
			        margin-bottom: 35px;
			        color: #333;
			        font-size: 28px;
			    }
			
			    label {
			        font-weight: 600;
			        font-size: 18px;
			        display: block;
			        margin-bottom: 10px;
			        color: #444;
			    }
			
			    input[type="text"],
			    textarea {
			        width: 100%;
			        padding: 16px;
			        font-size: 16px;
			        border: 1px solid #ccc;
			        border-radius: 6px;
			        margin-bottom: 25px;
			        transition: border-color 0.3s;
			    }
			
			    input[type="text"]:focus,
			    textarea:focus {
			        border-color: #007bff;
			        outline: none;
			    }
			
			    button {
			        background-color: #001aff;
			        color: white;
			        border: none;
			        width: 100%;
			        padding: 16px;
			        font-size: 18px;
			        border-radius: 6px;
			        cursor: pointer;
			        transition: background-color 0.3s ease;
			    }
			
			    button:hover {
			        background-color: #0000cc;
			    }
			
			    .message {
			        margin-top: 25px;
			        text-align: center;
			        font-size: 16px;
			    }
			
			    .success {
			        color: green;
			        font-weight: bold;
			    }
			
			    .error {
			        color: red;
			        font-weight: bold;
			    }
    </style>
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

<script>
    setTimeout(() => {
        const msg = document.querySelector(".message");
        if (msg) msg.style.display = "none";
    }, 4000);
</script>

</body>
</html>
