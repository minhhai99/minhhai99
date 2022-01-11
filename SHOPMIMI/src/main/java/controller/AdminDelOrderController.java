package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.OrderDAO;
import util.AuthUtil;

public class AdminDelOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	public AdminDelOrderController() {
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
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
			
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		
		if("admin".equals(userLogin.getName()) || "Minhhai".equals(userLogin.getName())) {
		if(orderDAO.delItem(id) > 0) {
			//xoá thành công
			response.sendRedirect(request.getContextPath()+ "/admin/orders?msg=3");
			return;
			
		}else {
			//xoá thất bại
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=2");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/orders?err=4");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
