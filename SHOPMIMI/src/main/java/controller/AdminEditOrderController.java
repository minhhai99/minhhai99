package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Order;
import model.bean.User;
import model.dao.OrderDAO;
import model.dao.UserDAO;
import util.AuthUtil;

public class AdminEditOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	private UserDAO userDAO;
	public AdminEditOrderController() {
		super();
		orderDAO = new OrderDAO();
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// check login
//		if (!AuthUtil.checkLogin(request, response)) {
//			response.sendRedirect(request.getContextPath() + "/login");
//			return;
//		}
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) ||  (id== userLogin.getId())) {
		// lấy lại các đối tượng cũ
		Order item = orderDAO.getItem(id);
		
		if(item != null) {
			request.setAttribute("order", item);

			RequestDispatcher rd = request.getRequestDispatcher("/admin/order/edit.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=1");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=3");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		// check login
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		HttpSession session = request.getSession();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=1");
			return;
		}
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		Order item = orderDAO.getItem(id);
				
				if(item != null) {
				request.setAttribute("order", item);
				}
					
		//get data
//			String name = request.getParameter("name");
//	        String phone = request.getParameter("phone");
//	        String email = request.getParameter("email");
//	        String address = request.getParameter("address");
//	        String note = request.getParameter("note");
//	        int quanty = Integer.parseInt(request.getParameter("quanty"));
//	        double total = Double.parseDouble(request.getParameter("total"));
				
				String pag =(String) session.getAttribute("pag");
				if(pag==null) {
					pag="1";
				}
	        int idUser = Integer.parseInt(request.getParameter("idUser"));
	        
	        item.setIdUser(idUser);
		//Order item = new Order(id, idUser, phone, address, email, name, note, quanty, total);
	        
		if(orderDAO.editItem(item) > 0) {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?page="+pag+"&msg=2");
			return;
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/order/edit.jsp?err=2");
			rd.forward(request, response);
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/orders?err=3");
			return;
		}
	}
	
				

}
