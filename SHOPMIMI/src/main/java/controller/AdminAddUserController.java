package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Pattern;

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
import util.AuthUtil;
import util.StringUtil;

public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private ApiUserDAO apiUserDAO;
	public AdminAddUserController() {
		super();
		userDAO = new UserDAO();
		apiUserDAO = new ApiUserDAO();
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
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm user
		if(!"admin".equals(userLogin.getApiUser().getName()) && !"supper mod".equals(userLogin.getApiUser().getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/users?err=3");
			return;
		}
		if("admin".equals(userLogin.getApiUser().getName())) {
			ArrayList<ApiUser> apiUsers = apiUserDAO.getItems();
			request.setAttribute("apiUsers", apiUsers);
		}else if(!"admin".equals(userLogin.getApiUser().getName()) && "supper mod".equals(userLogin.getApiUser().getName())) {
			ArrayList<ApiUser> apiUsers = apiUserDAO.getItemsSupper();
			request.setAttribute("apiUsers", apiUsers);
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp");
		rd.forward(request, response);
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
		
		int id_api = 0;
		try {
			id_api =Integer.parseInt(request.getParameter("apiuser"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/users?err=1");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm user
		if(!"admin".equals(userLogin.getApiUser().getName()) && !"supper mod".equals(userLogin.getApiUser().getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/users?err=3");
			return;
		}
		//get data
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String Email = request.getParameter("Email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		
		
		// kiểm tra username đúng định dạng ko(ko cách, ko trùng với username đã có)
		String regex = "^[a-zA-Z0-9]+$";
		
		Pattern patter = Pattern.compile(regex);
		if(patter.matcher(username).find()) {
			
			// kiểm tra có trùng tên đăng nhập?
			if (userDAO.hasUser(username, Email)) {
				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp?err=3");
				rd.forward(request, response);
				return;
			}
			
		// mã hoá password
		password = StringUtil.md5(password);
		
		ApiUser apiUser = new ApiUser(id_api, null);
		
		User item = new User(0, username, password, fullname, Email, address, apiUser);
		
		
		if(userDAO.addItem(item) > 0) {
			response.sendRedirect(request.getContextPath()+ "/admin/users?msg=1");
			return;
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp?err=1");
			rd.forward(request, response);
			return;
		}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add.jsp?err=2");
			rd.forward(request, response);
			return;
		}
	}
				

}
