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

public class PublicListSPOfCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;
	public PublicListSPOfCatController() {
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
		request.setAttribute("id", id);
//		
//		Category listOfCate = categoryDAO.getItem(id);
//		if(listOfCate == null) {
//			response.sendRedirect(request.getContextPath() + "/404");
//			return;
//		}
		// sản phẩm bán chạy nhất
		ArrayList<Flower> flowerCat = flowerDAO.getItemsBYCat();
		request.setAttribute("flowerCat", flowerCat);
		// sản phẩm quan tâm nhất
		ArrayList<Flower> flowerMostView = flowerDAO.getItemsMostView(20);
		request.setAttribute("flowerMostView", flowerMostView);
		// sản phẩm phổ biến nhất
		ArrayList<Flower> flowerPopular = flowerDAO.getItemsPopular(20);
		request.setAttribute("flowerPopular", flowerPopular);
		
		//request.setAttribute("listOfCate", listOfCate);
		RequestDispatcher rd = request.getRequestDispatcher("/public/list-of-cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
