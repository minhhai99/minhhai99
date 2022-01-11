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

public class PublicListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;
	public PublicListViewController() {
		super();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		ArrayList<Flower> flowers = flowerDAO.getItems();
		
		request.setAttribute("flowers", flowers);
		RequestDispatcher rd = request.getRequestDispatcher("/public/list-sp.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
