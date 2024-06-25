<%-- 
    Document   : cart
    Created on : Jun 13, 2024, 9:58:54?PM
    Author     : User
--%>

<%@page import="konekcija.DBConnection"%>
<%@page import="DAO.*"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>


<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> korpa_list = (ArrayList<Cart>) session.getAttribute("korpa_list");
List<Cart> cartProduct = null;
if (korpa_list != null ) {
	ProductDao pDao = new ProductDao(DBConnection.getConnection());
	cartProduct = pDao.getCartProducts(korpa_list);
	double total = pDao.getTotalCartPrice(korpa_list);
	request.setAttribute("total", total);
	request.setAttribute("korpa_list", korpa_list);
}
ProductDao pd = new ProductDao(DBConnection.getConnection());
List<Product> products = pd.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
    <style type="text/css">

        body{
            background-color:#ffffff;
        }

.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>

<%@include file="head.jsp"%>
  <title>Ketering Ginic</title>
</head>
<body>
	<%@include file="navbar2.jsp"%>

	<div class="container my-3">
            <form action="CheckoutServlet" method="GET">
		
           
               
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Ime</th>
					<th scope="col">Kategorija</th>
					<th scope="col">Cena</th>
					<th scope="col"></th>
                                      
					<th scope="col">Odustani</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (korpa_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="OrderServlet" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="QuantityServlet?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="QuantityServlet?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                                                
							</div>
							
          
                                                
					</td>
                                       
					<td><a href="RemoveServlet?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
                        
		</table>
                        <div class="d-flex py-2"><h3>Cena: ${total} din. </h3> <input type="submit"  class="mx-3 btn btn-primary" value="Kupi sve">
                    <h3> Datum: </h3><input type="datetime-local" name="datumD" required="" /></div>
                     <div class="d-flex py-3"><h3>Cena sa koriscenjem Vasih poena ${total-auth.getPoeni()} din. </h3> </div>
                        </form>
	</div>

</body>
</html>