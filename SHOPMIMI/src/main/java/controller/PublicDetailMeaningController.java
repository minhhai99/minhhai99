package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Color;
import model.bean.Meaning;
import model.dao.ColorDAO;
import model.dao.MeaningDAO;

public class PublicDetailMeaningController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MeaningDAO meaningDAO;
	private ColorDAO colorDAO;

	public PublicDetailMeaningController() {
		super();
		meaningDAO = new MeaningDAO();
		colorDAO = new ColorDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		
		Meaning meaning = meaningDAO.getItem(id);
		if(meaning == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		
		ArrayList<Color> color = colorDAO.getItemsByMean(id);
		request.setAttribute("meaning", meaning);
		request.setAttribute("color", color);
		
		// các loài hoa khác
		ArrayList<Meaning> means = meaningDAO.getItemNumber(id, 5);
		
		request.setAttribute("means", means);
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/general.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
