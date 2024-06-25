/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import models.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {


            ArrayList<Cart> korpaList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            Cart cm = new Cart();
            cm.setId(id);
            cm.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<Cart> korpa_list = (ArrayList<Cart>) session.getAttribute("korpa_list");
            if (korpa_list == null) {
                korpaList.add(cm);
                session.setAttribute("korpa_list", korpaList);
                response.sendRedirect("services2.jsp");
            } else {
                korpaList = korpa_list;

                boolean exist = false;
                for (Cart c : korpa_list) {
                    if (c.getId() == id) {
                        exist = true;
                        response.sendRedirect("services2.jsp");
                    }
                }

                if (!exist) {
                    korpaList.add(cm);
                    response.sendRedirect("services2.jsp");
                }
            }
        }
	}

}