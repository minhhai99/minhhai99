package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Meaning;
import model.bean.User;
import model.dao.MeaningDAO;
import util.AuthUtil;

public class AdminDelMeaningController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MeaningDAO meaningDAO;

	public AdminDelMeaningController() {
		super();
		meaningDAO = new MeaningDAO();
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
			id =Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=1");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		
		Meaning item = meaningDAO.getItem(id);
		if(item == null) {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=1");
			return;
		}
		if("admin".equals(userLogin.getName()) || "Minhhai".equals(userLogin.getName())) {
		if(meaningDAO.delItem(id) > 0) {
			// thành công
			// xoá ảnh
			final String dirPathName = request.getServletContext().getRealPath("/files");
			
			String picture = item.getPicture();
			if(!picture.isEmpty()) {
				String filePathName = dirPathName + File.separator + picture;
				File file = new File(filePathName);
				if(file.exists()) {
					file.delete();
				}
			}
			
			
			response.sendRedirect(request.getContextPath() + "/admin/meanings?msg=3");
			return;
		}else {
			// thất bại
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=2");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=5");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
