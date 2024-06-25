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
        <%@include file="orderboot.jsp"%>


    <center>
        <h2>USLUGE</h2>
        <table class="styled-table">
            <tr>
                <th>Id</th>
                <th>Usluga/Hrana </th>
                <th>Kategorija</th>
                <th>Cena</th>
                <th>Slika</th>


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

            </tr>
            <%} 
} catch(Exception e){

}
            %>

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
                            <option value="Slatko"><%=p.getId()%></option>
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
                    </div>
                </form>

            </div>
        </div>

    </body>
</html>