package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.OrderDetailDAO;
import util.AuthUtil;

public class AdminDelOrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDAO orderDetailDAO;
	public AdminDelOrderDetailController() {
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
					response.sendRedirect(request.getContextPath()+"/admin/orderDetails?err=1");
					return;
				}
		if(orderDetailDAO.delItem(id) > 0) {
			response.sendRedirect(request.getContextPath() + "/admin/orderDetails?msg=3");
			return;
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/orderDetails?err=2");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
