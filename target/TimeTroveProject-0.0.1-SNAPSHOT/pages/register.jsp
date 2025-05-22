<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="../stylesheets/register.css">
</head>
<body>
<form action="../registerUser" method="post">
    <h2>Registration Form</h2>

    <div class="form-group">
        <div>
            <label>First Name:</label>
            <input type="text" name="firstName" required>
        </div>
        <div>
            <label>Last Name:</label>
            <input type="text" name="lastName" required>
        </div>
    </div>

    <div class="form-group">
        <div>
            <label>User Name:</label>
            <input type="text" name="username" required>
        </div>
        <div>
            <label>Birthday:</label>
            <input type="date" name="birthday" required>
        </div>
    </div>

    <div class="form-group">
        <div>
            <label>Gender:</label>
            <select name="gender" required>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>
        </div>
        <div>
            <label>Phone Number:</label>
            <input type="text" name="phone" required>
        </div>
    </div>

    <div class="form-group">
        <div>
            <label>Email:</label>
            <input type="email" name="email" required>
        </div>
        <div>
            <label>User Role:</label>
            <input type="text" name="role" value="User" required>
        </div>
    </div>

    <div class="form-group">
        <div>
            <label>Password:</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <label>Retype Password:</label>
            <input type="password" name="confirmPassword" required>
        </div>
    </div>

    <label>Address:</label>
    <input type="text" name="address" required>

    <input type="submit" value="Submit" class="submit-btn">
</form>
</body>
</html>
