package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PublicInfoCustumerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public PublicInfoCustumerController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/infCustumer.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		//get data
//		String fullname = request.getParameter("fullname");
//		String Email = request.getParameter("Email");
//		String address = request.getParameter("address");
//		String phone = request.getParameter("phone");
//		String note = request.getParameter("note");
		
		
//	Order order = new Order(0, 0, phone, address, Email, phone, note, 0, serialVersionUID);
//		
//		
//		if(orderDAO.addItem(order) > 0) {
//			response.sendRedirect(request.getContextPath()+ "/loginn?msg=1");
//			return;
//		}else {
//			RequestDispatcher rd = request.getRequestDispatcher("/public/infCustumer.jsp?err=1");
//			rd.forward(request, response);
//			return;
//		}
	}

}
