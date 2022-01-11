package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Flower;
import model.dao.FlowerDAO;

public class PublicCatMoneyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;

	public PublicCatMoneyController() {
		super();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
	
		int id=0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		
		// show sp < 200.000vnd
		ArrayList<Flower> flowerT = flowerDAO.getItemsT();
		request.setAttribute("flowerT", flowerT);
		// show sp 200.000-500.000vnd
		ArrayList<Flower> flowerH = flowerDAO.getItemsH();
		request.setAttribute("flowerH", flowerH);
		// show sp 500.000-1.000.000vnd
		ArrayList<Flower> flowerB = flowerDAO.getItemsB();
		request.setAttribute("flowerB", flowerB);
		// show sp 1.000.000-2.000.000vnd
		ArrayList<Flower> flowerTW = flowerDAO.getItemsTW();
		request.setAttribute("flowerTW", flowerTW);
		// show sp > 2.000.000vnd
		ArrayList<Flower> flowerF = flowerDAO.getItemsF();
		request.setAttribute("flowerF", flowerF);
		
		request.setAttribute("id", id);
		RequestDispatcher rd = request.getRequestDispatcher("/public/moneyone.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
