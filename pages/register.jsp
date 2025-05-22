<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/register.css">
</head>
<body>

<div class="register-container">
    <h2>Create Your Account</h2>

    <form action="${pageContext.request.contextPath}/registerUser" method="post">
        <input type="text" name="first_name" placeholder="First Name" required />
        <input type="text" name="last_name" placeholder="Last Name" required />
        <input type="text" name="username" placeholder="Username" required />
        <input type="date" name="birthday" required />

        <select name="gender" required>
            <option value="">Select Gender</option>
            <option>Male</option>
            <option>Female</option>
        </select>

        <input type="text" name="phone" placeholder="Phone" required />
        <input type="email" name="email" placeholder="Email" required />

        <select name="role" required>
            <option value="">Select Role</option>
            <option>User</option>
            <option>Admin</option>
        </select>

        <input type="password" name="password" placeholder="Password" required />
        <input type="password" name="retype_password" placeholder="Retype Password" required />
        <input type="text" name="address" placeholder="Address" required />

        <button type="submit">Register</button>
    </form>

    <p class="error">
        <c:if test="${param.error == 'true'}">Registration failed. Try again.</c:if>
        <c:if test="${param.error == 'password_mismatch'}">Passwords do not match.</c:if>
    </p>

    <p class="login-link">
        Already have an account? <a href="${pageContext.request.contextPath}/pages/login.jsp">Login here</a>
    </p>
</div>

</body>
</html>
