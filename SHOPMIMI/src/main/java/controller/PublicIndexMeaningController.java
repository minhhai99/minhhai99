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

public class PublicIndexMeaningController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MeaningDAO meaningDAO;

	public PublicIndexMeaningController() {
		super();
		meaningDAO = new MeaningDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		ArrayList<Meaning> meanings = meaningDAO.getItems();
		request.setAttribute("meanings", meanings);
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/list-view.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
