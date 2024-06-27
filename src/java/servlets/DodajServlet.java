/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import DAO.ProductDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import konekcija.DBConnection;


/**
 *
 * @author User
 */
public class DodajServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
        String ime = request.getParameter("ime");
        String kategorija = request.getParameter("category");
        double cena =Double.parseDouble( request.getParameter("cena"));
        String slika = request.getParameter("slika");

        
            if(ime!=null){
                ProductDao productDao=new ProductDao(DBConnection.getConnection());
                productDao.DodajProduct(ime, kategorija, cena, slika);
                response.sendRedirect("services2.jsp");
            }
        } catch(Exception e){
            String poruka="";
                        e.printStackTrace();
                        poruka+="Cena nije broj";
                        request.setAttribute("poruka", poruka);
                        RequestDispatcher rd = request.getRequestDispatcher("dodajHranu.jsp");
                rd.forward(request, response);
        }
        

    }

}




     