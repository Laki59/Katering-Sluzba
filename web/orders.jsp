<%-- 
    Document   : order
    Created on : Jun 15, 2024, 2:58:06?PM
    Author     : User
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.OrderDao"%>
<%@page import="konekcija.DBConnection"%>
<%@page import="DAO.ProductDao"%>
<%@page import="models.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DBConnection.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> korpa_list = (ArrayList<Cart>) session.getAttribute("korpa_list");
	if (korpa_list != null) {
		request.setAttribute("korpa_list", korpa_list);
	}
	
	%>
<!DOCTYPE html>
<html>
<head>

<%@include file="head.jsp"%>

 <title>Ketering Ginic</title>
</head>
<body>
	<%@include file="navbar2.jsp"%>
	
		<div class="card-header my-3">Vase narudzbine!</div>
		<table class="table table-light">
			<thead>
				<tr>
                                    <th scope="col">Id</th>
					<th scope="col">Datum</th>
					<th scope="col">Ime</th>
					<th scope="col">Kategorija</th>
					<th scope="col">Kolicina</th>
					<th scope="col">Cena</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
                                            <td><%=o.getOrderId() %></td>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	
</body>
</html>