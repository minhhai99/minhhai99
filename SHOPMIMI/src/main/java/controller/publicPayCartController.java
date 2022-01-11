package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Flower;
import model.bean.Order;
import model.dao.FlowerDAO;
import model.dao.OrderDAO;

public class publicPayCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	private FlowerDAO flowerDAO;
	public publicPayCartController() {
		super();
		orderDAO = new OrderDAO();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		Order order = orderDAO.getItem(id);
		request.setAttribute("order", order);
		ArrayList<Flower> flowerCat = flowerDAO.getItemsN1(4);
		request.setAttribute("flowerCat", flowerCat);
		RequestDispatcher rd = request.getRequestDispatcher("/public/pay.jsp?msg=1");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		
	}

}
