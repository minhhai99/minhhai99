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

import model.bean.Flower;
import model.bean.TypeFlower;
import model.bean.User;
import model.dao.FlowerDAO;
import model.dao.TypeFlowerDAO;
import model.dao.UserDAO;
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminEditFlowerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TypeFlowerDAO typeFlowerDAO;
	private FlowerDAO flowerDAO;
	private UserDAO userDAO;
	public AdminEditFlowerController() {
		super();
		typeFlowerDAO = new TypeFlowerDAO();
		flowerDAO = new FlowerDAO();
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
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		Flower flower = flowerDAO.getItem(id);
		if(flower == null) {
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
		// get category list
//		ArrayList<Category> categories = categoryDAO.getItems();
		ArrayList<TypeFlower> typeFlowers = typeFlowerDAO.getItems();
		
		request.setAttribute("flower", flower);
//		request.setAttribute("categories", categories);
		request.setAttribute("typeFlowers", typeFlowers);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/flower/edit.jsp");
		rd.forward(request, response);
			
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/flowers?err=4");
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
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
		
//		int catID = 0;
//		try {
//			catID =Integer.parseInt(request.getParameter("category"));
//		} catch (NumberFormatException e) {
//			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
//			return;
//		}
		int typeID = 0;
		try {
			typeID =Integer.parseInt(request.getParameter("type"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
		//get data
		
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		//String picture = request.getParameter("picture");
		String pag =(String) session.getAttribute("pag");
		if(pag==null) {
			pag="1";
		}
		
		Part filePart = request.getPart("picture");
		// chèn ngày giờ từ hệ thống (có thể có hoặc ko)
		//Timestamp date_Ceate = new Timestamp(new Date().getTime());
		
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		// get dữ liệu cũ
		Flower flower = flowerDAO.getItem(id);
		if(flower == null) {
			response.sendRedirect(request.getContextPath() + "/admin/flowers?err=1");
			return;
		}
		
		//tạo thư mục chứa ảnh
		final String dirPathName = request.getServletContext().getRealPath("/fileFlowers");
		
		File dirFile = new File(dirPathName);
		if(!dirFile.exists()) {
			dirFile.mkdirs();
		}
		
		// lấy tên file từ part
		String fileName = FileUtil.getName(filePart);
		// đổi tên file
		String picture="";
		// kiểm tra người dùng có thêm ảnh mới ? nếu ko thì sử dụng lại ảnh cũ
		if(fileName.isEmpty()) {
			picture = flower.getPicture();
		}else {
			picture = FileUtil.rename(fileName);
		}
		
		// đường dẫn đến file
		String filePathName = dirPathName + File.separator + picture;
		
//		Category category = new Category(catID, null);
		TypeFlower typeFlower = new TypeFlower(typeID, null);
		
		Flower item = new Flower(id, name, 0, price, picture, null , preview, detail, null, typeFlower);
		
		if(flowerDAO.editItem(item) > 0) {
			// thêm thành công
			if(!fileName.isEmpty()) {
				String oldFilePathName = dirPathName + File.separator + flower.getPicture();
				File oldFile = new File(oldFilePathName);
				if(oldFile.exists()) {
					oldFile.delete();
				}
				// ghi file mới
				filePart.write(filePathName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/flowers?page="+pag+"&msg=2");
			return;
		}else {
			// thêm thất bại
//			ArrayList<Category> categories = categoryDAO.getItems();
			ArrayList<TypeFlower> typeFlowers = typeFlowerDAO.getItems();
			
//			request.setAttribute("categories", categories);
			request.setAttribute("typeFlowers", typeFlowers);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/flower/edit.jsp?err=2");
			rd.forward(request, response);
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+ "/admin/flowers?err=4");
			return;
		}
	}

}
