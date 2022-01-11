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
import util.AuthUtil;
import util.StringUtil;

public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private ApiUserDAO apiUserDAO;
	public AdminEditUserController() {
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
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/admin/users?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getApiUser().getName()) || "supper mod".equals(userDAO.getItem(userLogin.getId()).getApiUser().getName()) || (id== userLogin.getId())) {
			// lấy lại các đối tượng cũ
			User item = userDAO.getItem(id);
			if(item != null) {
				
//				ArrayList<ApiUser> apiUsers = apiUserDAO.getItems();
//				request.setAttribute("apiUsers", apiUsers);
				if("admin".equals(userLogin.getApiUser().getName())) {
					ArrayList<ApiUser> apiUsers = apiUserDAO.getItems();
					request.setAttribute("apiUsers", apiUsers);
				}else if(!"admin".equals(userLogin.getApiUser().getName()) && "supper mod".equals(userLogin.getApiUser().getName())) {
					if("admin".equals(item.getApiUser().getName())) {
						response.sendRedirect(request.getContextPath()+"/admin/users?err=6");
						return;
					}
					ArrayList<ApiUser> apiUsers = apiUserDAO.getItemsSupper();
					request.setAttribute("apiUsers", apiUsers);
				}else if(!"admin".equals(userLogin.getApiUser().getName()) && !"supper mod".equals(userLogin.getApiUser().getName())) {
					if("admin".equals(item.getApiUser().getName())) {
						response.sendRedirect(request.getContextPath()+"/admin/users?err=6");
						return;
					}
					ArrayList<ApiUser> apiUsers = apiUserDAO.getItemsOnlyMod();
					request.setAttribute("apiUsers", apiUsers);
				}
				
				request.setAttribute("user", item);

				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp");
				rd.forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+ "/admin/users?err=2");
				return;
			}
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/users?err=4");
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
		HttpSession session = request.getSession();String pag =(String) session.getAttribute("pag");
		if(pag==null) {
			pag="1";
		}
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+ "/admin/users?page="+pag+"err=1");
			return;
		}
		
		
		User userLogin = (User) session.getAttribute("userLogin");
		
		if("admin".equals(userDAO.getItem(userLogin.getId()).getApiUser().getName()) || "supper mod".equals(userDAO.getItem(userLogin.getId()).getApiUser().getName())) {
			int id_api = 0;
			try {
				id_api =Integer.parseInt(request.getParameter("apiuser"));
			} catch (NumberFormatException e) {
				response.sendRedirect(request.getContextPath() + "/admin/users?err=1");
				return;
			}
			// lấy lại các đối tượng cũ
						User item = userDAO.getItem(id);
						
						if(item == null) {
							response.sendRedirect(request.getContextPath()+ "/admin/users?page="+pag+"err=1");
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
					ApiUser apiUser = new ApiUser(id_api, null);
					User itemm = new User(id, null, password, fullname, null, address, apiUser);
					// dữ liệu mới (lấy lại dữ liệu cũ)
//					item.setPassword(password);
//					item.setFullname(fullname);
//					item.setEmail(Email);
//					item.setAddress(address);
					
					if(userDAO.editUser(itemm) > 0) {
						response.sendRedirect(request.getContextPath()+ "/admin/users?page="+pag+"&msg=2");
						return;
					}else {
						RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp?err=2");
						rd.forward(request, response);
						return;
					}
				// nếu đăng nhập là mod ==> chỉ sửa chính mình	
		}else if(!"admin".equals(userDAO.getItem(userLogin.getId()).getApiUser().getName()) || !"supper mod".equals(userDAO.getItem(userLogin.getId()).getApiUser().getName()) || (id== userLogin.getId())) {
			// lấy lại các đối tượng cũ
			User item = userDAO.getItem(id);
			
			if(item == null) {
				response.sendRedirect(request.getContextPath()+ "/admin/users?page="+pag+"err=1");
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
//		ApiUser apiUser = new ApiUser(id_api, null);
		User itemm = new User(id, null, password, fullname, null, address, null);
		// dữ liệu mới (lấy lại dữ liệu cũ)
//		item.setPassword(password);
//		item.setFullname(fullname);
//		item.setEmail(Email);
//		item.setAddress(address);
		
		if(userDAO.editUserMod(itemm) > 0) {
			response.sendRedirect(request.getContextPath()+ "/admin/users?page="+pag+"&msg=2");
			return;
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user/edit.jsp?err=2");
			rd.forward(request, response);
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/users?err=4");
			return;
		}
		
		
	}
				

}
