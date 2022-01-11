package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Flower;
import model.bean.User;
import model.dao.FlowerDAO;
import util.AuthUtil;

public class AdminDelFlowerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private CategoryDAO categoryDAO;
//	private TypeFlowerDAO typeFlowerDAO;
	private FlowerDAO flowerDAO;
	public AdminDelFlowerController() {
		super();
//		categoryDAO = new CategoryDAO();
//		typeFlowerDAO = new TypeFlowerDAO();
		flowerDAO = new FlowerDAO();
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
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		
		Flower flower = flowerDAO.getItem(id);
		if(flower == null) {
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
			if("admin".equals(userLogin.getName()) || "Minhhai".equals(userLogin.getName())) {
				if(flowerDAO.delItem(id) > 0) {
					// xoá ảnh trong ổ đĩa
					final String dirPathName = request.getServletContext().getRealPath("/fileFlowers");
					String picture = flower.getPicture();
					if(!picture.isEmpty()) {
						String filePathName = dirPathName + File.separator + picture;
						File file = new File(filePathName);
							if(file.exists()) {
								file.delete();
							}
						
					}
					response.sendRedirect(request.getContextPath() + "/admin/flowers?msg=3");
					return;
				}else {
					response.sendRedirect(request.getContextPath() + "/admin/flowers?err=2");
					return;
				}	
		}else {
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=5");
			return;
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
