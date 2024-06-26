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
	
	
	%>
<!DOCTYPE html>
<html>
<head>

<%@include file="head.jsp"%>

 <title>Ketering Ginic</title>
</head>
<body>
	<%@include file="navbar2.jsp"%>
	
		<div class="card-header my-3">
		<table class="table table-light">
			<thead>
				<tr>
                                    <th scope="col">Id</th>
					<th scope="col">Datum</th>
                                        <th scope="col">Datum dostave</th>
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
                                                <td><%=o.getDatumD() %></td>
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