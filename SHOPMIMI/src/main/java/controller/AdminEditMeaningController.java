package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.Meaning;
import model.bean.User;
import model.dao.MeaningDAO;
import model.dao.UserDAO;
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminEditMeaningController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MeaningDAO meaningDAO;
	private UserDAO userDAO;
	public AdminEditMeaningController() {
		super();
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
			id =Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		Meaning meaning = meaningDAO.getItem(id);
		if(meaning == null) {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=1");
			return;
		}
		request.setAttribute("meaning", meaning);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/meaning/edit.jsp");
		rd.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/meanings?err=4");
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
			id =Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=1");
			return;
		}

		// get data
		String name = request.getParameter("name");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");

		String pag =(String) session.getAttribute("pag");
		if(pag==null) {
			pag="1";
		}
		
		Part filePart = request.getPart("picture");
		// check quyeen truy cap
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		// get dữ liệu cũ
		Meaning meaning = meaningDAO.getItem(id);
		if(meaning == null) {
			response.sendRedirect(request.getContextPath() + "/admin/meanings?err=1");
			return;
		}
		
		// tạo muc lưu ảnh
		final String dirPathName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPathName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// lấy tên file từ part
		String fileName = FileUtil.getName(filePart);

		// kiểm tra người dùng có nhập ảnh ?
		String picture= "";
		if(fileName.isEmpty()) {
			picture = meaning.getPicture();
		}else {
			// đổi tên file
			 picture = FileUtil.rename(fileName);
		}
		
		// đường dẫn đến file
		String filePathName = dirPathName + File.separator + picture;

		Meaning item = new Meaning(id, name, detail, preview, picture);
		if (meaningDAO.editItem(item) > 0) {
			
			// xoá file cũ (ko rỗng ) trước khi ghi file
			if(!fileName.isEmpty()) {
				String oldFilePathName = dirPathName + File.separator + meaning.getPicture();
				File oldFile = new File(oldFilePathName);
				if(oldFile.exists()) {
					oldFile.delete();
				}
				// ghi file
					filePart.write(filePathName);
			
			}
			response.sendRedirect(request.getContextPath() + "/admin/meanings?page="+pag+"&msg=2");
			return;
		} else {
			// thêm thất bại
			RequestDispatcher rd = request.getRequestDispatcher("/admin/meaning/edit.jsp?err=2");
			rd.forward(request, response);
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/meanings?err=4");
			return;
		}
	}

}
