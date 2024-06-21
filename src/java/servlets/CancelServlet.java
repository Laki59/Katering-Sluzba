/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



import konekcija.DBConnection;
import DAO.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/*CancelOrder isto se pita da li ID postoji,ako da zove cancelOrder komandu iz OrderDao*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			if(id != null) {
				OrderDao orderDao = new OrderDao(DBConnection.getConnection());
				orderDao.cancelOrder(Integer.parseInt(id));
			}
			response.sendRedirect("adminOrders.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(ClassNotFoundException s){
                    s.printStackTrace();
                }
	}

}
