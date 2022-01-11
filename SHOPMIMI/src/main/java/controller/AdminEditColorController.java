package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.Color;
import model.bean.Meaning;
import model.bean.User;
import model.dao.ColorDAO;
import model.dao.MeaningDAO;
import model.dao.UserDAO;
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminEditColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ColorDAO colorDAO;
	private MeaningDAO meaningDAO;
	private UserDAO userDAO;
	public AdminEditColorController() {
		super();
		colorDAO = new ColorDAO();
		meaningDAO = new MeaningDAO();
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
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		Color color = colorDAO.getItem(id);
		if(color == null) {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		request.setAttribute("color", color);
		
		ArrayList<Meaning> meanings = meaningDAO.getItems();
		request.setAttribute("meanings", meanings);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/color/edit.jsp");
		rd.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/colors?err=4");
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
		HttpSession session = request.getSession();
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		
		int catID = 0;
		try {
			catID = Integer.parseInt(request.getParameter("category"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		//get data
		String name = request.getParameter("name");

		String pag =(String) session.getAttribute("pag");
		if(pag==null) {
			pag="1";
		}
		
		// lấy hình ảnh
		Part filePart = request.getPart("picture");
		
		// check quyeen truy cap
				User userLogin = (User) session.getAttribute("userLogin");
				if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		// get dữ liệu cũ
		Color color = colorDAO.getItem(id);
		if(color == null) {
			response.sendRedirect(request.getContextPath() + "/admin/colors?err=1");
			return;
		}
		
		// tạo thư mục lưu ảnh
		final String dirPathName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPathName);
		if(!dirFile.exists()) {
			dirFile.mkdirs();
		}
		// lấy tên file từ đối tượng part
		String fileName = FileUtil.getName(filePart);
		
		// đổi tên file
		String picture= "";
		if(fileName.isEmpty()) {
			picture = color.getPicture();
		}else {
		 picture = FileUtil.rename(fileName);
		}
		// dường dẫn đến file
		String filePathName = dirPathName + File.separator + picture;
		
		Meaning meaning = new Meaning(catID, null , null, null, null);
		Color item = new Color(id, name, picture, meaning);
		if(colorDAO.editItem(item) > 0) {
			
			if(!fileName.isEmpty()) {
				// xoá file ảnh cũ nếu có ảnh mới
				String oldFilePathName = dirPathName + File.separator + color.getPicture();
				
				File oldFile = new File(oldFilePathName);
				if(oldFile.exists()) {
					oldFile.delete();
				}
				
				//ghi file (lưu ảnh vào trong ổ đĩa)
				filePart.write(filePathName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/colors?page="+pag+"&msg=2");
			return;
		}else {
			// thêm thất bại
			ArrayList<Meaning> meanings = meaningDAO.getItems();
			request.setAttribute("meanings", meanings);
			
			RequestDispatcher rd = request.getRequestDispatcher("/admin/color/edit.jsp?err=1");
			rd.forward(request, response);
			return;
		}
	}else {
		response.sendRedirect(request.getContextPath()+"/admin/colors?err=4");
		return;
	}
	}

}
