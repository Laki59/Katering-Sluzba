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
import java.util.logging.Level;
import java.util.logging.Logger;


public class OKorisnikuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			String ime = request.getParameter("dIme");
                      Integer id = Integer.valueOf(request.getParameter("dId"));
                      String email = request.getParameter("dEmail");
                      String sifra = request.getParameter("dSifra");
			if(id != null) {
				UserDao userDao = new UserDao(DBConnection.getConnection());
				userDao.izmenaUser(ime,email,sifra,id);
			}
			response.sendRedirect("LogoutServlet");
		
        } catch (SQLException ex) {
            System.out.println("GRESK " + ex);
        }   catch (ClassNotFoundException ex) {
                Logger.getLogger(OKorisnikuServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	}

}