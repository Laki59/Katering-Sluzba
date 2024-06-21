/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import jakarta.servlet.ServletException;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;



import models.Cart;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String productId = request.getParameter("id");
			if (productId != null) {
				ArrayList<Cart> korpa_list = (ArrayList<Cart>) request.getSession().getAttribute("korpa_list");
				if (korpa_list != null) {
					for (Cart c : korpa_list) {
                                            /*uzima Id od tekuceg item-a i klikom na dugme brise taj item sa tim ID-om*/
						if (c.getId() == Integer.parseInt(productId)) {
							korpa_list.remove(korpa_list.indexOf(c));
							break;
						}
					}
				}
				response.sendRedirect("cart.jsp");

			} else {
				response.sendRedirect("cart.jsp");
			}

		}
	}

}
