<%-- 
    Document   : register
    Created on : Jun 11, 2024, 11:19:27 PM
    Author     : User
--%>
<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ketering Ginic</title>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar2.jsp"%>
        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-body">
                    <form action="RegistracijaServlet" method="post">
                         <div class="form-group">
                            <label>Ime:</label> 
                            <input type="text" name="ime" class="form-control" placeholder="Ime">
                        </div>
                        <div class="form-group">
                            <label>Email:</label> 
                            <input type="text" name="email" class="form-control" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label>Sifra</label> 
                            <input type="password" name="sifra" class="form-control" placeholder="Password">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Registruji se</button>
                        </div>
                    </form>
                </div>
        </div>
          
    </body>
</html>