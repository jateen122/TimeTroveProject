<%
String currentPage = request.getRequestURI().toLowerCase();
%>

<style>
    html body {
        margin: 0;
        padding: 0;
    }

    .navbar {
        background-color: #2e2e2e;
        overflow: hidden;
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
</style>

<div class="navbar">
    <div class="navbar-left">
        <div class="title">TimeTrove</div>
    </div>

    <div class="navbar-right">
        <a href="<%= request.getContextPath() %>/adminDashboard"
           class="<%= currentPage.contains("adminDashboard") ? "active" : "" %>">Dashboard</a>

        <a href="<%= request.getContextPath() %>/AddProductPageServlet"
   class="<%= (currentPage.contains("addproductpageservlet") || currentPage.contains("editproductservlet")) ? "active" : "" %>">
   Add Product</a>


        <a href="<%= request.getContextPath() %>/pages/addCategory.jsp"
           class="<%= currentPage.contains("addCategory") ? "active" : "" %>">Add Category</a>

        <a href="<%= request.getContextPath() %>/admin/orders"
   class="<%= (currentPage.contains("admin/orders") || currentPage.contains("updateorderstatusservlet")) ? "active" : "" %>">
   Order List</a>



<a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>
