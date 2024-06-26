/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



import konekcija.DBConnection;
import DAO.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CancelUserServlet extends HttpServlet {
	
    
	/*Pita da li ID postoji i ako postoji zove deleteUser iz UserDao*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			if(id != null) {
				UserDao userDao = new UserDao(DBConnection.getConnection());
				userDao.deleteUser(Integer.parseInt(id));
			}
			response.sendRedirect("adminOrders.jsp");
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch(ClassNotFoundException s){
                    s.printStackTrace();
                }
	}

}