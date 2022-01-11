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

public class AdminDetailOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDAO orderDetailDAO;
	public AdminDetailOrderController() {
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
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=1");
			return;
		}
		
		ArrayList<OrderDetail> detailOr = orderDetailDAO.getItemDetail(id);
		
		
		request.setAttribute("detailOr", detailOr);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/order/detailOrder.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
