package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ContactDAO;
import model.dao.FlowerDAO;
import model.dao.MeaningDAO;
import model.dao.OrderDAO;
import model.dao.TypeFlowerDAO;
import model.dao.UserDAO;
import util.AuthUtil;

public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TypeFlowerDAO typeFlowerDAO;
	private UserDAO userDAO;
	private FlowerDAO flowerDAO;
	private MeaningDAO meaningDAO;
	private OrderDAO orderDAO;
	private ContactDAO contactDAO;
	public AdminIndexController() {
		super();
		typeFlowerDAO = new TypeFlowerDAO();
		userDAO = new UserDAO();
		flowerDAO = new FlowerDAO();
		meaningDAO = new MeaningDAO();
		orderDAO = new OrderDAO();
		contactDAO = new ContactDAO();
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
		// lấy ra tổng số danh mục
		int numberOfType = typeFlowerDAO.numberOfItems();
		int numberOfItemsUser = userDAO.numberOfItems();
		int numberOfFlower = flowerDAO.numberOfItems();
		int numberOfMeaning = meaningDAO.numberOfItems();
		int numberOfOrder = orderDAO.numberOfItem();
		int numberOfContact = contactDAO.numberOfItems();
		
		request.setAttribute("numberOfType", numberOfType);
		request.setAttribute("numberOfItemsUser", numberOfItemsUser);
		request.setAttribute("numberOfFlower", numberOfFlower);
		request.setAttribute("numberOfMeaning", numberOfMeaning);
		request.setAttribute("numberOfOrder", numberOfOrder);
		request.setAttribute("numberOfContact", numberOfContact);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
