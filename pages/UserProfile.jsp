<%@ page import="com.timetrove.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserProfile.css">
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
<jsp:include page="Footer.jsp" />
</body>
</html>
