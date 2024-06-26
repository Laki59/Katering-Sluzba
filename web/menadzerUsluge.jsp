<%-- 
    Document   : menadzerUsluge
    Created on : Jun 19, 2024, 7:47:34 PM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>
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
            <%
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/katering","root","SKIJANJE123");
                Statement st=con.createStatement();
                String str="select id,name,category,price,image from products";
                ResultSet rs=st.executeQuery(str);
            while(rs.next()){%>
   

            <tr>

                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("category") %></td>
                <td><%=rs.getString("price") %></td>
                <td><%=rs.getString("image") %></td>
                <td><a class="btn btn-sm btn-danger" href="CancelProductServlet?id=<%=rs.getString("id")%>">X</a></td>
            </tr>
            <%} 
} catch(Exception e){

}
            %>
                       
        </table>
    </center>
    </body>
    <%}%>
</html>