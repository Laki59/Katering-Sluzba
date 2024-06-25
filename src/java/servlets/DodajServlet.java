/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        String ime = request.getParameter("ime");
        String kategorija = request.getParameter("category");
        double cena =Double.parseDouble( request.getParameter("cena"));
        String slika = request.getParameter("slika");

        try {
            String dbUrl = "jdbc:mysql://localhost:3306/katering";
            String user = "root";
            String pass = "SKIJANJE123";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection veza = DriverManager.getConnection(dbUrl, user, pass);
            PreparedStatement pst = veza.prepareStatement("INSERT INTO products (name,category,price,image) VALUES (?,?,?,?)");

            pst.setString(1, ime);
            pst.setString(2, kategorija);
            pst.setDouble(3, cena);
            pst.setString(4, slika);
            pst.executeUpdate();
            response.sendRedirect("services2.jsp");
            pst.close();
            veza.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistracijaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            System.out.println("GRESK " + ex);
        }

    }

}




     