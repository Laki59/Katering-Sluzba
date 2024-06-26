<%-- 
    Document   : izmeniUslugu
    Created on : Jun 23, 2024, 10:10:30?PM
    Author     : User
--%>
<%@page import="konekcija.DBConnection"%>
<%@page import="DAO.ProductDao"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
  
}
ProductDao pd = new ProductDao(DBConnection.getConnection());
List<Product> products = pd.getAllProducts();
%>


<!DOCTYPE html>
<html>

    <title>Ketering Ginic</title>
    <head>
        <link rel="stylesheet" href="css/tablecss.css" type="text/css">
        <%@include file="head.jsp"%>
    </head>
    <body>
         <%@include file="navbar2.jsp"%>
         <% if(auth.getAccess()==userM || auth.getAccess()==userId){%>
    <center>
        <table class="styled-table">
            <tr>
                <th>Id narudzbine</th>
                <th>Usluga </th>
                <th>Kategorija</th>
                <th>Cena</th>
                <th>Slika</th>

            </tr>

   
<%for (Product p:products){%>
            <tr>

                <td><%=p.getId()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getCategory() %></td>
                <td><%=p.getPrice() %></td>
                <td><%=p.getImage()%></td>
            </tr>
      <%}%>
        </table>
    </center>
       


    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-body">
                <form method="GET" action="IzmeniUsluguServlet">
                    <div class="form-group">
                        <label>Id</label> <br>
                        <select name="pId" id="pId" class="form-control">
                            <% for (Product p : products){%>
                            <option value="<%=p.getId()%>"><%=p.getId()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Ime hrane/usluge</label> 
                        <input type="text"  class="form-control" name="pIme" required="">
                    </div>
                    <div class="form-group">
                        <label>Kategorija</label> <br>
                        <select name="pKategorija" id="pKategorija" class="form-control">
                            <option value="Slatko">Slatko</option>
                            <option value="Slano">Slano</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Cena</label> 
                        <input type="text"  name="pCena" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label>Slika</label> 
                        <input type="file" name="pSlika"  class="form-control" required="">
                    </div>
                    <div class="text-center">
                        <input type="submit" value="izmeni"/>
                                        <% String poruka=(String)request.getAttribute("poruka");
        if(poruka != null && !poruka.trim().equals("")){%>
        <p style="color:red;"> <%=poruka%></p>
        <%}%>            
<%}%>
                    </div>
                </form>

            </div>
        </div>


    </body>
</html>