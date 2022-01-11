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

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;

	public PublicIndexController() {
		super();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		// show sp nổi bật được xem nhiều nhất
		ArrayList<Flower> flowersNB = flowerDAO.getItemsNB(3);
		request.setAttribute("flowersNB", flowersNB);
		
		// show sp bán chạy
		ArrayList<Flower> flowerSell = flowerDAO.getItemsSell(3);
		request.setAttribute("flowerSell", flowerSell);
		
		// show sp (phổ biến)  
		ArrayList<Flower> flowerPB = flowerDAO.getItemsPB(3);
		request.setAttribute("flowerPB", flowerPB);
		// show sp mới
		ArrayList<Flower> flowerNew = flowerDAO.getItemsNew(3);
		request.setAttribute("flowerNew", flowerNew);
		
		ArrayList<Flower> flowerN1 = flowerDAO.getItemsN1(4);
		request.setAttribute("flowerN1", flowerN1);
		
		ArrayList<Flower> flowerN2 = flowerDAO.getItemsN2(4);
		request.setAttribute("flowerN2", flowerN2);
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
