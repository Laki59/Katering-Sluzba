<%-- 
    Document   : menadzerUsluge
    Created on : Jun 19, 2024, 7:47:34?PM
    Author     : User
--%>
<!DOCTYPE html>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>
<html>
    <head>
        <style>
            body{
                background-color:lightblue;
            }
            
        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Ketering Ginic</title>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar2.jsp"%>
        <% if(auth.getAccess()==userM || auth.getAccess()==userId){%>
        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-body">
                    <form action="DodajServlet" method="post">
                        <div class="form-group">
                            <label>Ime servisa:</label> 
                            <input type="text" name="ime" class="form-control" placeholder="Ime...">
                        </div>
                        <div class="form-group">
                        <label>Kategorija</label> <br>
                        <select name="category" id="category" class="form-control">
                            <option value="Slatko">Slatko</option>
                            <option value="Slano">Slano</option>
                        </select>
                    </div>
                        <div class="form-group">
                            <label>Cena:</label> 
                            <input type="text" name="cena" class="form-control" placeholder="Cena...">
                        </div>
                        <div class="form-group">
                            <label>Slika</label> 
                            <input type="file" name="slika" class="form-control" placeholder="Slika...">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Dodaj!</button>
                            <% String poruka=(String)request.getAttribute("poruka");
        if(poruka != null && !poruka.trim().equals("")){%>
        <p style="color:red;"> <%=poruka%></p>
        <%}%>            
                        </div>
                    </form>
                </div>
            </div>
           <%}%>
    </body>
</html>