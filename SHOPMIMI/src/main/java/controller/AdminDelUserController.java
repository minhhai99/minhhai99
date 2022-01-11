package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.UserDAO;
import util.AuthUtil;

public class AdminDelUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	public AdminDelUserController() {
		super();
		userDAO = new UserDAO();
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
			response.sendRedirect(request.getContextPath()+"/admin/users?err=1");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		User user = userDAO.getItem(id);
		// nếu user muốn xoá là admin hoặc quản trị viên thì ko thể xoá
		if("admin".equals(user.getApiUser().getName())) {
			response.sendRedirect(request.getContextPath()+"/admin/users?err=6");
			return;
		}else {
			// admin và supper mod thì được quyền xoá các mod nhưng ko được xoá chính mình và admin có thể xoá dc supper mod
			if("admin".equals(userLogin.getApiUser().getName())) {
				// được quyền xoá
				if(userDAO.delItem(id) > 0) {
					response.sendRedirect(request.getContextPath()+"/admin/users?msg=3");
					return;
				}else {
					//xoá thất bại
					response.sendRedirect(request.getContextPath()+"/admin/users?err=2");
					return;
				}
			}else {
				if("supper mod".equals(user.getApiUser().getName())) {
					
				response.sendRedirect(request.getContextPath()+"/admin/users?err=5");
				return;
				}else {
					if("supper mod".equals(userLogin.getApiUser().getName())) {
						if(userDAO.delItem(id) > 0) {
							response.sendRedirect(request.getContextPath()+"/admin/users?msg=3");
							return;
						}else {
							//xoá thất bại
							response.sendRedirect(request.getContextPath()+"/admin/users?err=2");
							return;
						}
					}
				}
			}
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
