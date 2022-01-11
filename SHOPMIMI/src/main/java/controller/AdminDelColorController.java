package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Color;
import model.bean.User;
import model.dao.ColorDAO;
import util.AuthUtil;

public class AdminDelColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ColorDAO colorDAO;

	public AdminDelColorController() {
		super();
		colorDAO = new ColorDAO();
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
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		
		Color color = colorDAO.getItem(id);
		if(color == null) {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		if("admin".equals(userLogin.getName()) || "Minhhai".equals(userLogin.getName())) {
		if(colorDAO.delItem(id) >0) {
			// xoá ảnh khỏi forder
			final String dirPathName = request.getServletContext().getRealPath("/files");
			String picture = color.getPicture();
			if(!picture.isEmpty()) {
				String filePathName = dirPathName + File.separator + picture;
				File file = new File(filePathName);
				if(file.exists()) {
					file.delete();
				}
			}
			
			response.sendRedirect(request.getContextPath() + "/admin/colors?msg=3");
			return;
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=2");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=5");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
