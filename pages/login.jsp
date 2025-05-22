<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/login.css">
</head>
<body>

    <div class="login-box">
        <h2>Login to TimeTrove</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <button type="submit">Login</button>
        </form>

        <%
            String error = request.getParameter("error");
            if ("true".equals(error)) {
        %>
            <p class="error">Invalid username or password.</p>
        <%
            }
        %>

        <div class="signup-link">
            Don't have an account? 
            <a href="${pageContext.request.contextPath}/pages/register.jsp">Create an Account</a>
        </div>
    </div>

</body>
</html>
