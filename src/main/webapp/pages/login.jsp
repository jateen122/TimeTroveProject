<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - TimeTrove</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 360px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #343a40;
        }

        label {
            font-weight: 600;
            margin-top: 15px;
            display: block;
            color: #495057;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            margin-top: 6px;
            margin-bottom: 15px;
            font-size: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        .error {
            color: #dc3545;
            text-align: center;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 15px;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .signup-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
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
