/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



import konekcija.DBConnection;
import DAO.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
        /*Uzima ID,pita da li ima ID,ako ima,poziva cancelProduct iz PorductDao*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			if(id != null) {
				ProductDao productDao = new ProductDao(DBConnection.getConnection());
				productDao.cancelProduct(Integer.parseInt(id));
			}
			response.sendRedirect("menadzerUsluge.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(ClassNotFoundException s){
                    s.printStackTrace();
                }
	}

}
