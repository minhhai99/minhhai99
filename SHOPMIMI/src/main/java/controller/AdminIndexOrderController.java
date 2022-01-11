package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Order;
import model.dao.OrderDAO;
import util.AuthUtil;

public class AdminIndexOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	public AdminIndexOrderController() {
		super();
		orderDAO = new OrderDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// check login
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		int numberPerPage = 10;
		int numberOfItems = orderDAO.numberOfItem();
		int numberOfPages =(int) Math.ceil((float)numberOfItems / numberPerPage);
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
		}
		if(currentPage > numberOfItems || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage -1)* numberPerPage;
		
		
		ArrayList<Order> orders = orderDAO.getItemsPagination(offset);
		
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("numberOfItems", numberOfItems);
		request.setAttribute("offset", offset);
		
		request.setAttribute("orders", orders);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/order/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
