package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.TypeFlower;
import model.bean.User;
import model.dao.TypeFlowerDAO;
import util.AuthUtil;

public class AdminDelTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TypeFlowerDAO typeFlowerDAO;

	public AdminDelTypeController() {
		super();
		typeFlowerDAO = new TypeFlowerDAO();
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
			response.sendRedirect(request.getContextPath()+"/admin/types?err=1");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		
		TypeFlower item = typeFlowerDAO.getItem(id);
		if(item == null) {
			response.sendRedirect(request.getContextPath() + "/admin/types?err=1");
			return;
		}
		if("admin".equals(userLogin.getName()) || "Minhhai".equals(userLogin.getName())) {
		if(typeFlowerDAO.delItem(id) > 0) {
			// xoá ảnh
						final String dirPathName = request.getServletContext().getRealPath("/fileTypes");
						
						String picture = item.getPicture_type();
						if(!picture.isEmpty()) {
							String filePathName = dirPathName + File.separator + picture;
							File file = new File(filePathName);
							if(file.exists()) {
								file.delete();
							}
						}
						
			response.sendRedirect(request.getContextPath()+"/admin/types?msg=3");
			return;
		}else {
			//xoá thất bại
			response.sendRedirect(request.getContextPath()+"/admin/types?err=2");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/types?err=5");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
