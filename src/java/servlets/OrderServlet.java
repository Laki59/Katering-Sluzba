/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;
import java.text.SimpleDateFormat;



import konekcija.DBConnection;
import DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.*;



public class OrderServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String datumD=request.getParameter("datumD");
            Date date = new Date();
            UserDao userDao = new UserDao(DBConnection.getConnection());
            User auth = (User) request.getSession().getAttribute("auth");

            /* Uzima usera iz sesije*/
            if (auth != null) {
                String productId = request.getParameter("id");

                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                if (productQuantity <= 0) {
                	productQuantity = 1;
                }
                /*Ako ima usera uzima product parametre*/
                Order orderModel = new Order();
                orderModel.setId(Integer.parseInt(productId));
                orderModel.setUid(auth.getId());
                orderModel.setQunatity(productQuantity);
                orderModel.setDate(formatter.format(date));
                if(datumD == null){
                orderModel.setDatumD(formatter.format(date));}
                else{
                    orderModel.setDatumD(datumD);
                }
                userDao.addPointsToUser(auth.getId(), auth.getPoeni()+100*productQuantity);
                
                /*Kreira order objekat*/
                OrderDao orderDao = new OrderDao(DBConnection.getConnection());
                boolean result = orderDao.insertOrder(orderModel);
                /*Stavlja ih u BP*/ 
                if (result) {
                    ArrayList<Cart> korpa_list = (ArrayList<Cart>) request.getSession().getAttribute("korpa_list");
                    if (korpa_list!= null) {
                        for (Cart c : korpa_list) {
                            if (c.getId() == Integer.parseInt(productId)) {
                                korpa_list.remove(korpa_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("orders.jsp");
                } else {
                    out.println("order failed");
                }
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		} 
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}