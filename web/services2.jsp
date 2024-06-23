<%-- 
    Document   : services2
    Created on : Jun 21, 2024, 6:44:07?PM
    Author     : User
--%>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <style>
            a{
                padding-top: 2px;
            }
    </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ketering Ginic</title>
    </head>
    <body>
        <%@include file="navbar2.jsp"%>
        <%@include file="orderboot.jsp"%>
        <div class="container">
            <center>
                <div class="card-header my-3"><br><h1>Nase usluge</h1>

                   <div class="col-md-3 my-3">
                        <div class="card w-100">
                            <div class="card-body">
                                <br>
                                <a class="btn btn-primary" href="SlanaHrana.jsp">Slana hrana</a><br><br>
                                
                                <a class="btn btn-primary" href="SlatkaHrana.jsp">Slatka hrana</a><br><br>
                                
                                <a class="btn btn-primary" href="proslave.jsp">Proslave</a><br><br>
                            </div>
                        </div>
                    </div>
            </center>
        </div>
            
    </body>
</html>