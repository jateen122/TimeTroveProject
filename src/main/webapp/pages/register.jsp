<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - TimeTrove</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background-color: #ffffff;
            width: 420px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #343a40;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 18px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
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
        }

        .login-link {
            text-align: center;
            font-size: 14px;
            margin-top: 18px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Create Your Account</h2>

    <form action="${pageContext.request.contextPath}/registerUser" method="post">
        <input type="text" name="first_name" placeholder="First Name" pattern="[A-Za-z]{2,}" title="Only letters, at least 2 characters" required />
        <input type="text" name="last_name" placeholder="Last Name" pattern="[A-Za-z]{2,}" title="Only letters, at least 2 characters" required />
        <input type="text" name="username" placeholder="Username" minlength="4" required />
        <input type="date" name="birthday" required />

        <select name="gender" required>
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
        </select>

        <input type="text" name="phone" placeholder="Phone"  title="Enter a 10-digit phone number" required />
        <input type="email" name="email" placeholder="Email" required />

        <select name="role" required>
            <option value="">Select Role</option>
            <option>User</option>
            <option>Admin</option>
        </select>

        <input type="password" name="password" placeholder="Password" required />
        <input type="password" name="retype_password" placeholder="Retype Password"  required />
        <input type="text" name="address" placeholder="Address" required />

        <button type="submit">Register</button>
    </form>

    <p class="error">
        <c:if test="${param.error == 'true'}">
            Registration failed. Try again.
        </c:if>
    </p>

    <p class="login-link">
        Already have an account?
        <a href="${pageContext.request.contextPath}/pages/login.jsp">Login here</a>
    </p>
</div>

</body>
</html>
