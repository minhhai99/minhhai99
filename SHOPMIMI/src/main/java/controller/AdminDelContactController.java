package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.ContactDAO;
import util.AuthUtil;

public class AdminDelContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContactDAO contactDAO;
	public AdminDelContactController() {
		super();
		contactDAO = new ContactDAO();
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
			response.sendRedirect(request.getContextPath()+ "/admin/contacts?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		
		if("admin".equals(userLogin.getName()) || "Minhhai".equals(userLogin.getName())) {
		if(contactDAO.delItem(id) > 0) {
			//xoá thành công
			response.sendRedirect(request.getContextPath()+ "/admin/contacts?msg=1");
			return;
			
		}else {
			//xoá thất bại
			response.sendRedirect(request.getContextPath()+ "/admin/contacts?err=2");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/contacts?err=3");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
