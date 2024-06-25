<%-- 
    Document   : adminOrders
    Created on : Jun 15, 2024, 3:38:28 PM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>
<html>
    <head>
        <link rel="stylesheet" href="css/tablecss.css" type="text/css">
        <%@include file="head.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Ketering Ginic</title>
    </head>
    <%@include file="navbar2.jsp"%>
    <body>

    <center>
        <table class="styled-table">
            <h2>KORISNICI</h2>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>email</th>
                <th>password</th>
                <th>access</th>
                <th>izbrisi</th>

            </tr>
            <%
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/katering","root","SKIJANJE123");
                Statement st=con.createStatement();
                String str="select * from users";
                ResultSet rs=st.executeQuery(str);
            while(rs.next()){%>

            <tr>

                <td><%=rs.getString("id")%></td>
                <td><%=rs.getString("uname")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("password")%></td>
                <td><%=rs.getString("access")%></td>
                <td><a class="btn btn-sm btn-danger" href="CancelUserServlet?id=<%=rs.getString("id")%>">X</a></td>
            </tr>
            <%} 
} catch(Exception e){

}
            %>
        </table>
    </center>
    <center>

        <table class="styled-table">
            <h2>NARUDZBINE</h2>
            <tr>
                <th>Id narudzbine</th>
                <th>Usluga </th>
                <th>Korisnik</th>
                <th>Kolicina</th>
                <th>Datum narudzbine</th>
                <th>Datum dostave</th>
                <th>Izbrisi</th>

            </tr>
            <%
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/katering","root","SKIJANJE123");
                Statement st=con.createStatement();
                String str="select orders.o_id,products.name,users.uname,orders.o_quantity,orders.o_date,orders.datumD from orders JOIN users on users.id=orders.u_id JOIN products on products.id=orders.p_id";
                ResultSet rs=st.executeQuery(str);
            while(rs.next()){%>


            <tr>

                <td><%=rs.getString("o_id") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("uname") %></td>
                <td><%=rs.getString("o_quantity") %></td>
                <td><%=rs.getString("o_date") %></td>
                <td><%=rs.getString("datumD") %></td>
                <td><a class="btn btn-sm btn-danger" href="CancelServlet?id=<%=rs.getString("o_id")%>">X</a></td>
            </tr>
            <%} 
} catch(Exception e){

}
            %>

        </table>
    </center>
    <center>
        <h2>USLUGE</h2>
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
                <td><a class="btn btn-sm btn-danger" href="CancelProductAdminServlet?id=<%=rs.getString("id")%>">X</a></td>
            </tr>
            <%} 
} catch(Exception e){

}
            %>

        </table>

    </center>
</body>
</html>
