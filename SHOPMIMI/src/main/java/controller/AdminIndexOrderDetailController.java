package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.OrderDetail;
import model.dao.OrderDetailDAO;
import util.AuthUtil;

public class AdminIndexOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDAO orderDetailDAO;
	public AdminIndexOrderDetailController() {
		super();
		orderDetailDAO = new OrderDetailDAO();
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
		int numberOfItems = orderDetailDAO.numberOfItem();
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
		
		ArrayList<OrderDetail> order = orderDetailDAO.getItemsPagination(offset);
		
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("numberOfItems", numberOfItems);
		request.setAttribute("offset", offset);
		
		request.setAttribute("order", order);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/orderDetail/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
