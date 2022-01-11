package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

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
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminAddFlowerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TypeFlowerDAO typeFlowerDAO;
	private FlowerDAO flowerDAO;
	public AdminAddFlowerController() {
		super();
		typeFlowerDAO = new TypeFlowerDAO();
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
		
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm user
		if(!"admin".equals(userLogin.getName()) && !"Minhhai".equals(userLogin.getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/flowers?err=3");
			return;
		}
		
		// get category list
		//ArrayList<Category> categories = categoryDAO.getItems();
		ArrayList<TypeFlower> typeFlowers = typeFlowerDAO.getItems();
		
		//request.setAttribute("categories", categories);
		request.setAttribute("typeFlowers", typeFlowers);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/flower/add.jsp");
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
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm user
		if(!"admin".equals(userLogin.getName()) && !"Minhhai".equals(userLogin.getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/flowers?err=3");
			return;
		}
		//get data
		
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");
		//String picture = request.getParameter("picture");
		
		Part filePart = request.getPart("picture");
		// chèn ngày giờ từ hệ thống (có thể có hoặc ko)
		Timestamp date_Ceate = new Timestamp(new Date().getTime());
		
		//tạo thư mục chứa ảnh
		final String dirPathName = request.getServletContext().getRealPath("/fileFlowers");
		
		File dirFile = new File(dirPathName);
		if(!dirFile.exists()) {
			dirFile.mkdirs();
		}
		
		// lấy tên file từ part
		String fileName = FileUtil.getName(filePart);
		// đổi tên file
		String picture = FileUtil.rename(fileName);
		// đường dẫn đến file
		String filePathName = dirPathName + File.separator + picture;
		
		//Category category = new Category(catID, null);
		TypeFlower typeFlower = new TypeFlower(typeID, null);
		
		Flower item = new Flower(0, name, 0, price, picture, date_Ceate, preview, detail, null, typeFlower);
		
		if(flowerDAO.addItem(item) > 0) {
			// thêm thành công
			if(!fileName.isEmpty()) {
				filePart.write(filePathName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/flowers?msg=1");
			return;
		}else {
			// thêm thất bại
			//ArrayList<Category> categories = categoryDAO.getItems();
			ArrayList<TypeFlower> typeFlowers = typeFlowerDAO.getItems();
			
			//request.setAttribute("categories", categories);
			request.setAttribute("typeFlowers", typeFlowers);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/flower/add.jsp?err=2");
			rd.forward(request, response);
			return;
		}
	}

}
