package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Flower;
import model.bean.TypeFlower;
import model.dao.FlowerDAO;
import model.dao.TypeFlowerDAO;

public class PublicTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TypeFlowerDAO typeFlowerDAO;
	private FlowerDAO flowerDAO;
	public PublicTypeController() {
		super();
		typeFlowerDAO = new TypeFlowerDAO();
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
		TypeFlower typeFlower = typeFlowerDAO.getItem(id);
		if(typeFlower == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		ArrayList<Flower> flowerType = flowerDAO.getItemsBYType(id);
		
		request.setAttribute("typeFlower", typeFlower);
		request.setAttribute("flowerType", flowerType);
		RequestDispatcher rd = request.getRequestDispatcher("/public/type.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
