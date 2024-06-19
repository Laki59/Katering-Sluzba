
<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>

<!DOCTYPE html>
<html>
    <style>

    </style>
  <title>Ketering Ginic</title>
    <head>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar2.jsp"%>

        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-body">

                        <div class="form-group">
                            <label>Id</label> 
                            <input type="text" value="<%=auth.getId()%>" name="dId" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Ime</label> 
                            <input type="text" value="<%=auth.getName()%>" name="dIme" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email</label> 
                            <input type="text" value="<%=auth.getEmail()%>" name="dEmail" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Sifra</label> 
                            <input type="password" value="<%=auth.getPassword()%>" name="dSifra" class="form-control">
                        </div>
                        <div class="text-center">
                             <a class="btn btn-sm btn-danger" href="OKorisnikuServlet">Izmeni</a>
                        </div>

                </div>
            </div>

    </body>
</html>