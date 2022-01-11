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
import model.bean.Handmade;
import model.dao.FlowerDAO;
import model.dao.HandmadeDAO;

public class PublicProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;
	private HandmadeDAO handmadeDAO;
	public PublicProductDetailController() {
		super();
		flowerDAO = new FlowerDAO();
		handmadeDAO = new HandmadeDAO();
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
		
		Flower flowerD = flowerDAO.getItem(id);
		if(flowerD == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		
		//tãng view
		HttpSession session = request.getSession();
		String hasVisited =(String) session.getAttribute("hasVisited: " + id);
		if(hasVisited == null) {
			session.setAttribute("hasVisited: "+ id, "yes");
			session.setMaxInactiveInterval(30);
			flowerDAO.increaseView(id);
		}
		
		ArrayList<Flower> relatedFlower = flowerDAO.getRelateItem(flowerD, 5);
		
		ArrayList<Handmade> handmades = handmadeDAO.getItems();
		request.setAttribute("handmades", handmades);
		
		request.setAttribute("flowerD", flowerD);
		request.setAttribute("relatedFlower", relatedFlower);
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/product_details.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
