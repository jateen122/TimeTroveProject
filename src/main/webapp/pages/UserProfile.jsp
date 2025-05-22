<%@ page import="com.timetrove.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile - TimeTrove</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 600px;
            margin: 60px auto;
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-submit {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background: #0056b3;
        }

        #toast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border-radius: 6px;
            font-weight: bold;
            z-index: 9999;
            animation: fadeout 4s forwards;
        }

        @keyframes fadeout {
            0% { opacity: 1; }
            80% { opacity: 1; }
            100% { opacity: 0; display: none; }
        }
    </style>
</head>
<body>

<jsp:include page="UserNavbar.jsp"/>

<div class="container">
    <h2>Update Profile</h2>
    <form action="<%= request.getContextPath() %>/UpdateUserProfileServlet" method="post">
        <label>First Name</label>
        <input type="text" name="firstName" value="<%= user.getFirstName() %>" required>

        <label>Last Name</label>
        <input type="text" name="lastName" value="<%= user.getLastName() %>" required>

        <label>Phone</label>
        <input type="text" name="phone" value="<%= user.getPhone() %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required>

        <label>Address</label>
        <input type="text" name="address" value="<%= user.getAddress() %>" required>

        <button type="submit" class="btn-submit">Update Profile</button>
    </form>
</div>

<%
    String flash = (String) session.getAttribute("flash");
    if (flash != null) {
%>
    <div id="toast"><%= flash %></div>
    <script>
        setTimeout(() => document.getElementById("toast").style.display = 'none', 4000);
    </script>
<%
        session.removeAttribute("flash");
    }
%>

</body>
</html>
