<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TimeTrove - Home</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/stylesheets/UserHome.css">
</head>
<body>

    <%-- Include Navbar --%>
    <jsp:include page="UserNavbar.jsp" />

    <div class="hero-banner">
        <div class="hero-text">
            <h1>Welcome to TimeTrove</h1>
            <p>
                Discover luxury, precision, and style in every timepiece.<br>
                From iconic classics to modern masterpieces,<br>
                TimeTrove brings you an exclusive collection of wristwatches designed to elevate your persona.
            </p>
            <a href="<%= request.getContextPath() %>/UserProductServlet" class="shop-btn">Shop Now</a>
        </div>
        <div class="hero-image">
            <img src="<%= request.getContextPath() %>/images/HomePageWatch.png" alt="Sample Watch">
        </div>
    </div>

    <jsp:include page="Footer.jsp" />

</body>
</html>
