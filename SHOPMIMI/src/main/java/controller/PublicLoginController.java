package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;
import model.dao.UserDAO;
import util.StringUtil;

public class PublicLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	public PublicLoginController() {
		super();
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		// check login
		HttpSession session = request.getSession();
		User accLogin =(User) session.getAttribute("accLogin");
		session.setMaxInactiveInterval(600);
		// chuyển hướng đến trang chủ public khi đã login
		if(accLogin != null) {
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("/public/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		User accLogin =(User) session.getAttribute("accLogin");
		session.setMaxInactiveInterval(600);
		// chuyển hướng đến trang chủ public khi đã login
		if(accLogin != null) {
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		//get data
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		//response.getWriter().print(email);
		// mã hoá password
		password = StringUtil.md5(password);
		
		response.getWriter().print(password);
		// check login
		User user = userDAO.existAcc(email, password);
		if(user != null) {
			// đăng nhập thành công
			session.setAttribute("accLogin", user);
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}else {
			// đăng nhập thất bại
			response.sendRedirect(request.getContextPath()+"/loginn?err=1");
			return;
		}
 	}

}
