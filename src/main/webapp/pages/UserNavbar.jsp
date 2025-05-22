<%
    String currentPage = request.getRequestURI();
%>
<style>
    body {
        margin: 0;
        padding: 0;
    }

    .navbar {
        background-color: #2e2e2e;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 20px;
        font-family: Arial, sans-serif;
    }

    .navbar-left {
        display: flex;
        align-items: center;
    }

    .navbar-left .title {
        font-weight: bold;
        font-size: 20px;
        color: #fff;
    }

    .navbar-right {
        display: flex;
        align-items: center;
    }

    .navbar-right a {
        color: white;
        padding: 10px 15px;
        text-decoration: none;
        transition: background-color 0.3s;
        border-radius: 5px;
        margin-left: 10px;
    }

    .navbar-right a:hover {
        background-color: #575757;
    }

    .active {
        background-color: #28a745 !important;
        font-weight: bold;
    }

    .search-form {
        display: flex;
        align-items: center;
        margin-left: 10px;
    }

    .search-form input[type="text"] {
        padding: 5px 10px;
        border-radius: 4px 0 0 4px;
        border: none;
        outline: none;
    }

    .search-form button {
        padding: 5px 10px;
        background-color: #28a745;
        border: none;
        color: white;
        border-radius: 0 4px 4px 0;
        cursor: pointer;
    }

    .search-form button:hover {
        background-color: #218838;
    }
</style>

<div class="navbar">
    <div class="navbar-left">
        <div class="title"> TimeTrove</div>
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

		<a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
    </div>
</div>
