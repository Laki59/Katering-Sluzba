<%-- 
    Document   : SlatkaHrana
    Created on : Jun 23, 2024, 1:45:54?PM
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
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Restaurant Menu</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="css/uslugecss.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
    <%@include file="navbar2.jsp"%>
        <%@include file="orderboot.jsp"%>
  <div class="container">
    <div class="menu">
      <h2 class="menu-group-heading">
        Slatka Hrana
      </h2>
        <%
                    if (!products.isEmpty()) {
                            for (Product p : products) {
                            if("Slatko".equals(p.getCategory())){
                    %>
      <div class="menu-group">
        <div class="menu-item">
            <img class="menu-item-image" src="product-image/<%=p.getImage()%>" alt="Bruschetta">
          <div class="menu-item-text">
            <h3 class="menu-item-heading">
              <span class="menu-item-name"><%=p.getName()%></span>
              <span class="menu-item-price"><%=p.getPrice()%></span><br>
              
            </h3>
              
            <p class="menu-item-description">
              Kategorija <%=p.getCategory()%>
            </p>
            <div class="mt-3 d-flex justify-content-between">
              <a class="btn btn-dark" href="AddToCartServlet?id=<%=p.getId()%>">U korpu</a> 
              </div>
          </div>
            
        </div>
              
      </div>
      <%}}}%>
    </div>
    <a class="btn btn-primary" href="services2.jsp">Nazad na meni</a><br><br>
  </div>
</body>
</html>

