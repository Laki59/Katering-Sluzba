<%-- 
    Document   : menadzerUsluge
    Created on : Jun 19, 2024, 7:47:34 PM
    Author     : User
--%>
<%@page import="konekcija.DBConnection"%>
<%@page import="DAO.ProductDao"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DBConnection.getConnection());
List<Product> products = pd.getAllProducts();
%>
 <%@include file="head.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/tablecss.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Ketering Ginic</title>
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
                <th>Izbrisi</th>

            </tr>

   
<%for (Product p:products){%>
            <tr>

                <td><%=p.getId()%></td>
                <td><%=p.getName()%></td>
                <td><%=p.getCategory() %></td>
                <td><%=p.getPrice() %></td>
                <td><%=p.getImage()%></td>
                <td><a class="btn btn-sm btn-danger" href="CancelProductServlet?id=<%=p.getId()%>">X</a></td>
            </tr>
      <%}%>
        </table>
    </center>
        <%}%>
    </body>
    
</html>