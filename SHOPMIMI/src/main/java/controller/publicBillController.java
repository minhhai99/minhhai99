package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Flower;
import model.bean.OrderDetail;
import model.bean.User;
import model.dao.FlowerDAO;
import model.dao.OrderDetailDAO;

public class publicBillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDAO orderDetailDAO;
	private FlowerDAO flowerDAO;
	public publicBillController() {
		super();
		orderDetailDAO = new OrderDetailDAO();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
//		int id = 0;
//		try {
//			id = Integer.parseInt(request.getParameter("id"));
//		} catch (NumberFormatException e) {
//			response.sendRedirect(request.getContextPath() + "/404");
//			return;
//		}
		
		// đăng nhập vào
		HttpSession session = request.getSession();
		User users =(User) session.getAttribute("accLogin");
		if(users != null) {
			ArrayList<OrderDetail> orderDetail = orderDetailDAO.getItem(users.getEmail());
			request.setAttribute("orderDetail", orderDetail);
			ArrayList<Flower> flowerCat = flowerDAO.getItemsN1(4);
			request.setAttribute("flowerCat", flowerCat);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/public/bills.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		
	}

}
