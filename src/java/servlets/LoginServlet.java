/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import DAO.UserDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import konekcija.DBConnection;
import models.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String poruka="";
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-sifra");

            UserDao udao = new UserDao(DBConnection.getConnection());
            User user = udao.userLogin(email, password);
            if (user != null) {
                request.getSession().setAttribute("auth", user);
                if ("admin".equals(user.getAccess())) {
                    request.getSession().setAttribute("userId", user.getAccess());
                }
                else if ("menadzer".equals(user.getAccess())) {
                    request.getSession().setAttribute("userM", user.getAccess());
                }
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
               poruka+="Sva polja moraju biti popunjena<br>"
                       + "Email ili lozinka su pogresno uneseni";
               request.setAttribute("poruka", poruka);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
               
            }

        } catch (Exception e){
            e.printStackTrace();
            poruka+="Pogresna lozinka itd";
        }

    }
}
