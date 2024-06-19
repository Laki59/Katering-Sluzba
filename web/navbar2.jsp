<%-- 
    Document   : navbar2
    Created on : Jun 13, 2024, 4:15:36?PM
    Author     : User
--%>
<%@page import="DAO.UserDao"%>
<%@page import="models.User"%>

<%    String userId = (String) request.getSession().getAttribute("userId");
        String userM = (String) request.getSession().getAttribute("userM");%>
<link rel="stylesheet" href="css/style.css">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <img  src="product-image/logo.png">
        <a class="navbar-brand" href="index.jsp">Katering sluzba Ginic</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="services.jsp">Usluge</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp">Kolica</a></li>
                <li class="nav-item"><a class="nav-link" href="onama.jsp">O nama</a></li>
                    <%
                    if (auth != null) {
                    %>
                    <%if(auth.getAccess()==userId){%>
                <li class="nav-item"><a class="nav-link" href="dodaj.jsp">Dodaj novi service</a></li>
                <li class="nav-item"><a class="nav-link" href="adminOrders.jsp">ADMIN</a></li>
                    <%} if(auth.getAccess()==userM){%>
                <li class="nav-item"><a class="nav-link" href="menadzerUsluge.jsp">MENADZER</a></li>
                 <li class="nav-item"><a class="nav-link" href="dodaj.jsp">Dodaj novi service</a></li>
                <%}%>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Narudzbine</a></li>
                <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                <li class="nav-item"><a class="nav-link" href="oKorisnku.jsp"><%=auth.getName()%></a></li>

                <%}else {
                %>
                <li class="nav-item"><a class="nav-link" href="register.jsp">Register </a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <%}%>

            </ul>
        </div>
    </div>

</nav>