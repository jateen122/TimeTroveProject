<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../stylesheets/login.css">
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="#" method="post">
        <label>User Name:</label>
        <input type="text" name="username" placeholder="Enter Username" required>

        <label>Password:</label>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Log In</button>
    </form>
    <hr>
    <p>Need an account? <a href="register.jsp">Create an account</a></p>
</div>
</body>
</html>
