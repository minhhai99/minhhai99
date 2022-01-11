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
import util.AuthUtil;
import util.FileUtil;

@MultipartConfig
public class AdminAddMeaningController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MeaningDAO meaningDAO;

	public AdminAddMeaningController() {
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
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		// chỉ có addmin và supper mod mới có quyền thêm
		if(!"admin".equals(userLogin.getName()) && !"Minhhai".equals(userLogin.getName())) {
			response.sendRedirect(request.getContextPath()+ "/admin/meanings?err=3");
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("/admin/meaning/add.jsp");
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
			response.sendRedirect(request.getContextPath()+ "/admin/meanings?err=3");
			return;
		}
		
		// get data
		String name = request.getParameter("name");
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");

		Part filePart = request.getPart("picture");

		// tạo muc lưu ảnh
		final String dirPathName = request.getServletContext().getRealPath("/files");
		File dirFile = new File(dirPathName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// lấy tên file từ part
		String fileName = FileUtil.getName(filePart);

		// đổi tên file
		String picture = FileUtil.rename(fileName);
		// đường dẫn đến file
		String filePathName = dirPathName + File.separator + picture;

		Meaning item = new Meaning(0, name, detail, preview, picture);
		if (meaningDAO.addItem(item) > 0) {
			// thêm thành công
			// ghi file
			if(!fileName.isEmpty()) {
				filePart.write(filePathName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/meanings?msg=1");
			return;
		} else {
			// thêm thất bại
			RequestDispatcher rd = request.getRequestDispatcher("/admin/meaning/add.jsp?err=1");
			rd.forward(request, response);
			return;
		}
	}

}
