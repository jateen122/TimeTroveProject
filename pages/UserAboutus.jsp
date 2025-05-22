<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - TimeTrove</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserAboutus.css">
</head>
<body>

<jsp:include page="UserNavbar.jsp" />

<div class="full-container">
    <h1>About TimeTrove</h1>
    <div class="content">
        <p><span class="highlight">TimeTrove</span> is your one-stop destination for discovering elegant and powerful timepieces. We bring together luxury, sport, and smart watches for everyone – from classic collectors to modern trendsetters.</p>

        <p>Our mission is to deliver a premium shopping experience with authenticity, quality, and speed. We’re committed to offering watches that don’t just tell time – they tell your story.</p>

        <p>Why shop with us?</p>
        <ul>
            <li>🕒 Wide collection of premium, sports, and smartwatches</li>
            <li>✅ Verified & authentic products</li>
            <li>🚚 Fast shipping and reliable service</li>
            <li>📞 Dedicated customer support</li>
        </ul>

        <p>Whether you're dressing for business, adventure, or everyday wear – TimeTrove helps you make every second stylish and meaningful.</p>
    </div>
</div>

<jsp:include page="Footer.jsp" />

</body>
</html>
