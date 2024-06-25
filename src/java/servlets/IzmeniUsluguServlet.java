/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import DAO.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



import konekcija.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;


public class IzmeniUsluguServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
        /*Duge me oKorisniku.jsp,obezbedjuje menjaje podataka preko UserDao*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
                    int id=Integer.parseInt(request.getParameter("pId"));
			String ime = request.getParameter("pIme");
                      String kategorija = request.getParameter("pKategorija");
                      String slika = request.getParameter("pSlika");
                      double cena=Double.parseDouble(request.getParameter("pCena"));
			if(ime != null) {
				ProductDao productDao = new ProductDao(DBConnection.getConnection());
				productDao.izmenaProduct(id, ime, kategorija, cena, slika);
			}
			response.sendRedirect("services2.jsp");
		
        } catch (SQLException ex) {
            System.out.println("GRESK " + ex);
        }   catch (ClassNotFoundException ex) {
                Logger.getLogger(OKorisnikuServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	}

}