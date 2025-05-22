<%
    String currentPage = request.getRequestURI();
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/UserNavbar.css">

<div class="navbar">
    <div class="navbar-left">
        <div class="title">TimeTrove</div>
    </div>
    <div class="navbar-right">
        <a href="<%= request.getContextPath() %>/pages/UserHome.jsp"
           class="<%= currentPage.endsWith("UserHome.jsp") ? "active" : "" %>">Home</a>

        <a href="<%= request.getContextPath() %>/UserProductServlet"
           class="<%= currentPage.endsWith("UserProductServlet") ? "active" : "" %>">Product</a>

        <a href="<%= request.getContextPath() %>/pages/UserCart.jsp"
           class="<%= currentPage.endsWith("UserCart.jsp") ? "active" : "" %>">Cart</a>

        <a href="<%= request.getContextPath() %>/pages/UserProfile.jsp"
           class="<%= currentPage.endsWith("UserProfile.jsp") ? "active" : "" %>">My Profile</a>

        <a href="${pageContext.request.contextPath}/pages/UserAboutus.jsp">About Us</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>
