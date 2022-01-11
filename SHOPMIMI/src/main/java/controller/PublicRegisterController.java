package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ApiUser;
import model.bean.User;
import model.dao.UserDAO;
import util.StringUtil;

public class PublicRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	public PublicRegisterController() {
		super();
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
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
				RequestDispatcher rd = request.getRequestDispatcher("/public/register.jsp?err=3");
				rd.forward(request, response);
				return;
			}
			
		// mã hoá password
		password = StringUtil.md5(password);
		ApiUser apiUser = new ApiUser(2, null);
		User item = new User(0, username, password, fullname, Email, address, apiUser);
		
		
			if(userDAO.addItem(item) > 0) {
				response.sendRedirect(request.getContextPath()+ "/loginn?msg=1");
				return;
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("/public/register.jsp?err=1");
				rd.forward(request, response);
				return;
			}
	}else {
			RequestDispatcher rd = request.getRequestDispatcher("/public/register.jsp?err=2");
			rd.forward(request, response);
			return;
		}
	}

}
