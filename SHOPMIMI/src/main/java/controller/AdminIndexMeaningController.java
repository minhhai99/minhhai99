package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Meaning;
import model.dao.MeaningDAO;
import util.AuthUtil;
import util.DefineUtil;

public class AdminIndexMeaningController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MeaningDAO meaningDAO;
	public AdminIndexMeaningController() {
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
		int numberOfItems = meaningDAO.numberOfItems();
		
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
		}
		if(currentPage > numberOfItems || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1)* DefineUtil.NUMBER_PER_PAGE;
		
		ArrayList<Meaning> meanings = meaningDAO.getItemsPagination(offset);
		request.setAttribute("meanings", meanings);
		
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("numberOfItems", numberOfItems);
		request.setAttribute("offset", offset);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/meaning/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
