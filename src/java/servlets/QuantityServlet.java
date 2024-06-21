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
import java.io.PrintWriter;
import java.util.ArrayList;

import models.Cart;

public class QuantityServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /*dohvata parametre action i id,action je smesten pod "inc" i "dec" kao increase i decrease*/
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            ArrayList<Cart> korpa_list = (ArrayList<Cart>) request.getSession().getAttribute("korpa_list");

            /*Ako action postoji ovo vrsi inkrementaciju na qunatity-u*/
            if (action != null && id >= 1) {
                if (action.equals("inc")) {
                    for (Cart c : korpa_list) {
                        if (c.getId() == id) {
                            int quantity = c.getQuantity();
                            quantity++;
                            c.setQuantity(quantity);
                            response.sendRedirect("cart.jsp");
                        }
                    }
                }
                /*Ako action postoji ovo vrsi dekrementaciju na qunatity-u*/
                if (action.equals("dec")) {
                    for (Cart c : korpa_list) {
                        if (c.getId() == id && c.getQuantity() > 1) {
                            int quantity = c.getQuantity();
                            quantity--;
                            c.setQuantity(quantity);
                            break;
                        }
                    }
                    response.sendRedirect("cart.jsp");
                }
            } else {
                response.sendRedirect("cart.jsp");
            }
        }
    }

}
