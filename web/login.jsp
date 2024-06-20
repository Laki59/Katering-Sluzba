<%-- 
    Document   : login
    Created on : Jun 13, 2024, 1:55:43?AM
    Author     : User
--%>


<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	%>

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
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <label>Email address</label> 
                            <input type="text" name="login-email" class="form-control" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label>Password</label> 
                            <input type="password" name="login-sifra" class="form-control" placeholder="Password">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                </div>
                

      
        </div>
            <center>
                      <% String poruka=(String)request.getAttribute("poruka");
        if(poruka != null && !poruka.trim().equals("")){%>
        <p style="color:red;"> <%=poruka%></p>
        <%}%>
            </center>
            
    </body>
</html>