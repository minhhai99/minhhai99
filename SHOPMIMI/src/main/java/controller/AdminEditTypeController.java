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

import model.bean.TypeFlower;
import model.bean.User;
import model.dao.TypeFlowerDAO;
import model.dao.UserDAO;
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminEditTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TypeFlowerDAO typeFlowerDAO;
	private UserDAO userDAO;
	public AdminEditTypeController() {
		super();
		typeFlowerDAO = new TypeFlowerDAO();
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
			response.sendRedirect(request.getContextPath()+"/admin/types?err=1");
			return;
		}
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		TypeFlower typeFlower = typeFlowerDAO.getItem(id);
		if(typeFlower != null) {
		request.setAttribute("typeFlower", typeFlower);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/type/edit.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/types?err=1");
			return;
		}
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/types?err=4");
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
			response.sendRedirect(request.getContextPath()+"/admin/types?err=1");
			return;
		}
		
		//get data
		String name = request.getParameter("name");
		
		Part filePart = request.getPart("picture");
		
		String pag =(String) session.getAttribute("pag");
		if(pag==null) {
			pag="1";
		}

		User userLogin = (User) session.getAttribute("userLogin");
		if("admin".equals(userDAO.getItem(userLogin.getId()).getName()) || "Minhhai".equals(userDAO.getItem(userLogin.getId()).getName()) || (id== userLogin.getId())) {
		// get d??? li???u c??
		TypeFlower typeFlower = typeFlowerDAO.getItem(id);
		if(typeFlower == null) {
			response.sendRedirect(request.getContextPath() + "/admin/types?err=1");
			return;
		}
		
		// t???o muc l??u ???nh
		final String dirPathName = request.getServletContext().getRealPath("/fileTypes");
		File dirFile = new File(dirPathName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// l???y t??n file t??? part
		String fileName = FileUtil.getName(filePart);

		// ki???m tra ng?????i d??ng c?? nh???p ???nh ?
		String picture= "";
		if(fileName.isEmpty()) {
			picture = typeFlower.getPicture_type();
		}else {
			// ?????i t??n file
			 picture = FileUtil.rename(fileName);
		}
		
		// ???????ng d???n ?????n file
		String filePathName = dirPathName + File.separator + picture;
		
		TypeFlower item = new TypeFlower(id, name, picture);
		if(typeFlowerDAO.editItem(item) > 0) {
			// xo?? file c?? (ko r???ng ) tr?????c khi ghi file
			if(!fileName.isEmpty()) {
				String oldFilePathName = dirPathName + File.separator + typeFlower.getPicture_type();
				File oldFile = new File(oldFilePathName);
				if(oldFile.exists()) {
					oldFile.delete();
				}
				// ghi file
					filePart.write(filePathName);
			
			}
			// th??m th??nh c??ng
			response.sendRedirect(request.getContextPath()+"/admin/types?page="+pag+"&msg=2");
		}else {
			// th??m th???t b???i
			RequestDispatcher rd = request.getRequestDispatcher("/admin/type/edit.jsp?err=1");
			rd.forward(request, response);
		}
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/types?err=4");
			return;
		}
	}

}
