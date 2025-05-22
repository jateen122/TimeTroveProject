<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TimeTrove - Home</title>
    <link rel="stylesheet" type="text/css" href="../stylesheets/UserHome.css">
</head>
<body>

    <%-- Include Navbar --%>
    <jsp:include page="UserNavbar.jsp" />

    <div class="hero-banner">
        <div class="hero-text">
            <h1> Welcome to TimeTrove</h1>
            <p>Discover luxury, precision, and style in every timepiece.
			From iconic classics to modern masterpieces <br>
			TimeTrove brings you an exclusive collection of wristwatches designed to elevate your persona.
            </p>
		<a href="<%= request.getContextPath() %>/UserProductServlet" class="shop-btn">Shop Now</a>
        </div>
        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/images/HomePageWatch.png" alt="Sample Watch">
        </div>
    </div>

</body>
</html>
