<%-- 
    Document   : cart
    Created on : Jun 13, 2024, 9:58:54?PM
    Author     : User
--%>

<%@page import="konekcija.DBConnection"%>
<%@page import="DAO.ProductDao"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
		<div class="d-flex py-3"><h3>Total Price: ${total} din. </h3> <a class="mx-3 btn btn-primary" href="CheckoutServlet">Kupi sve</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Ime</th>
					<th scope="col">Kategorija</th>
					<th scope="col">Cena</th>
					<th scope="col">Kupi sada!</th>
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
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
                                        
					<td><a href="RemoveServlet?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>

</body>
</html>