<%-- 
    Document   : index
    Created on : Jun 11, 2024, 8:40:04?PM
    Author     : User
--%>
<%@page import="models.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Ketering Ginic</title>
    <%@include file="head.jsp"%>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/homepage.css">
        
</head>
<body>

	<div class="wrapper">
                <%@include file="navbar2.jsp"%>
			<div class="center">
			<h1>Dobrodosli na nasu stranicu!</h1>
			<h2>Ketering sluzba Ginic</h2>
			<div class="buttons">
                            <button><a href="services2.jsp"> Nase usluge!</a></button>
                            <button class="btn2"><a href="onama.jsp">O nama!</a></button>
		</div>
		</div>
                            

        </div>
                
</body>
</html>