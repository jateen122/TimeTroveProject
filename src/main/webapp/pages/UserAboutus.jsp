<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
        }

        .full-container {
            padding: 60px 80px;
            background-color: white;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 32px;
        }

        .content p {
            font-size: 17px;
            color: #555;
            line-height: 1.8;
            margin-bottom: 20px;
            max-width: 1000px;
        }

        .content ul {
            list-style-type: none;
            padding-left: 0;
            max-width: 1000px;
        }

        .content li {
            padding-left: 25px;
            margin-bottom: 10px;
            font-size: 16px;
            color: #444;
            position: relative;
        }

        .content li::before {
            content: "•";
            position: absolute;
            left: 0;
            color: #1d72b8;
            font-size: 18px;
        }

        .highlight {
            font-weight: bold;
            color: #1d72b8;
        }

        @media (max-width: 768px) {
            .full-container {
                padding: 30px 20px;
            }
        }
    </style>
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

</body>
</html>
