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
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminAddColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ColorDAO colorDAO;
	private MeaningDAO meaningDAO;
	public AdminAddColorController() {
		super();
		colorDAO = new ColorDAO();
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
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm 
		if(!"admin".equals(userLogin.getName()) && !"Minhhai".equals(userLogin.getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/colors?err=3");
			return;
		}	
		ArrayList<Meaning> meanings = meaningDAO.getItems();
		request.setAttribute("meanings", meanings);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/color/add.jsp");
		rd.forward(request, response);
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
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm user
		if(!"admin".equals(userLogin.getName()) && !"Minhhai".equals(userLogin.getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/colors?err=3");
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
//		String picture = request.getParameter("picture");
		// lấy hình ảnh
		Part filePart = request.getPart("picture");
		
		// tạo thư mục lưu ảnh
		final String dirPathName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPathName);
		if(!dirFile.exists()) {
			dirFile.mkdirs();
		}
		// lấy tên file từ đối tượng part
		String fileName = FileUtil.getName(filePart);
		
		// đổi tên file
		String picture = FileUtil.rename(fileName);
		// dường dẫn đến file
		String filePathName = dirPathName + File.separator + picture;
		
		Meaning meaning = new Meaning(catID, null , null, null, null);
		Color item = new Color(0, name, picture, meaning);
		if(colorDAO.addItem(item) > 0) {
			//ghi file (lưu ảnh vào trong ổ đĩa)
			if(!fileName.isEmpty()) {
				filePart.write(filePathName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/colors?msg=1");
			return;
		}else {
			// thêm thất bại
			ArrayList<Meaning> meanings = meaningDAO.getItems();
			request.setAttribute("meanings", meanings);
			
			RequestDispatcher rd = request.getRequestDispatcher("/admin/color/add.jsp?err=1");
			rd.forward(request, response);
			return;
		}
	}

}
