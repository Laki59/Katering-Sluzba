<%-- 
    Document   : services
    Created on : Jun 11, 2024, 8:40:21?PM
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

<!DOCTYPE html>
<html lang="en">
    
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Ketering Ginic</title>
    </head>
    <body>
<%@include file="navbar2.jsp"%>
        <%@include file="orderboot.jsp"%>
        <div class="container">
            <center>
                <div class="card-header my-3"><h1>Slatka Hrana</h1>
                
                <div class="row">
                    <%
                    if (!products.isEmpty()) {
                            for (Product p : products) {
                            if("Slatko".equals(p.getCategory())){
                    %>
                    <div class="col-md-3 my-3">
                        <div class="card w-100">
                            <img class="card-img-top" src="product-image/<%=p.getImage() %>"
                                 alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title"><%=p.getName() %></h5>
                                <h6 class="price">Cena: <%=p.getPrice() %> din.</h6>
                                <h6 class="category">Kategorija: <%=p.getCategory() %></h6>
                                <div class="mt-3 d-flex justify-content-between">
                                    <a class="btn btn-dark" href="AddToCartServlet?id=<%=p.getId()%>">U korpu</a> <a
                                        class="btn btn-primary" href="OrderServlet?quantity=1&id=<%=p.getId()%>">Kupi sada</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    }
                    } else {
                    out.println("There is no proucts");
                    }
                    %>

                </div>
                    <a class="btn btn-primary" href="services2.jsp">Nazad na meni</a><br><br>
                    </center>
            </div>
                    
                    
    </body>
</html>