package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ProductCart;

public class PublicDelQuantyOfCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDelQuantyOfCartController() {
		super();
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
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		 ArrayList<ProductCart> listHoa =(ArrayList<ProductCart>) session.getAttribute("listHoa");
		listHoa.remove(id);
		response.sendRedirect(request.getContextPath()+ "/carts");
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
