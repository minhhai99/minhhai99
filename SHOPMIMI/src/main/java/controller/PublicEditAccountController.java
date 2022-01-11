package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ApiUser;
import model.bean.User;
import model.dao.ApiUserDAO;
import model.dao.UserDAO;
import util.StringUtil;

public class PublicEditAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private ApiUserDAO apiUserDAO;
	public PublicEditAccountController() {
		super();
		userDAO = new UserDAO();
		apiUserDAO = new ApiUserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/myAccount?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("accLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		// lấy lại các đối tượng cũ
					User item = userDAO.getItem(id);
					if(item != null) {
						
						ArrayList<ApiUser> apiUsers = apiUserDAO.getItems();
						request.setAttribute("apiUsers", apiUsers);
						
						request.setAttribute("user", item);

						RequestDispatcher rd = request.getRequestDispatcher("/public/updateAcc.jsp");
						rd.forward(request, response);
						return;
					}else {
						response.sendRedirect(request.getContextPath()+ "/myAccount?err=1");
						return;
					}
		}else {
			response.sendRedirect(request.getContextPath()+ "/myAccount?err=3");
			return;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/myAccount?err=1");
			return;
		}
//		int id_api = 0;
//		try {
//			id_api =Integer.parseInt(request.getParameter("apiuser"));
//		} catch (NumberFormatException e) {
//			response.sendRedirect(request.getContextPath() + "/myAccount?err=1");
//			return;
//		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("accLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
			// lấy lại các đối tượng cũ
			User item = userDAO.getItem(id);
			
			if(item == null) {
				response.sendRedirect(request.getContextPath()+ "/myAccount?err=1");
				return;
			}
		//get data
		String fullname = request.getParameter("fullname");
		//String Email = request.getParameter("Email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		// nếu ko nhập pass thì lấy lại pass cũ
		if("".equals(password)) {
			password = item.getPassword();
		}else {
			password = StringUtil.md5(password);
		}
		
		//ApiUser apiUser = new ApiUser(id_api, null);
		User itemm = new User(id, null, password, fullname, null, address, null);
		//User item = new User(0, username, password, fullname);
		// dữ liệu mới (lấy lại dữ liệu cũ)
//		item.setPassword(password);
//		item.setFullname(fullname);
//		//item.setEmail(Email);
//		item.setAddress(address);
		
		if(userDAO.editUserMod(itemm) > 0) {
			response.sendRedirect(request.getContextPath()+ "/myAccount?msg=4");
			return;
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/public/updateAcc.jsp?err=2");
			rd.forward(request, response);
			return;
		}
	}else {
		response.sendRedirect(request.getContextPath()+ "/myAccount?err=3");
		return;
	}	
		
	}

}
