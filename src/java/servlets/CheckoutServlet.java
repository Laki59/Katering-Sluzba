/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import konekcija.DBConnection;
import DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.*;



public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
                        /*Uzima cart i user-a iz sesije*/
                         UserDao uDao = new UserDao(DBConnection.getConnection());
                         String datumD=request.getParameter("datumD");
			ArrayList<Cart> korpa_list = (ArrayList<Cart>) request.getSession().getAttribute("korpa_list");
			User auth = (User) request.getSession().getAttribute("auth");
                        /*Proverava da li ih ima*/
			if(auth!=null) {
                            /*Za svaku stvar u kolicima pravi order objekat*/
				for(Cart c:korpa_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));
                                        order.setDatumD(datumD);
                                        /*dodaje poene korisniku*/
                                         uDao.addPointsToUser(auth.getId(),auth.getPoeni()+500);
					/*Konekcija sa BP i ubacivanje u order tabelu*/
                                         
					OrderDao oDao = new OrderDao(DBConnection.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
				}
                               auth.setPoeni(auth.getPoeni());
                                /*Clearuje kart i prebacuje na ordere*/
				korpa_list.clear();
				response.sendRedirect("orders.jsp");
                                /*Ako nismo ulogovani,baca nas na login*/
			}else {
				if(auth==null) {
					response.sendRedirect("login.jsp");
				}
                                /*Ako je cart parazan ne radi nista*/
				
			}
		} catch (SQLException | ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}