package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Flower;
import model.bean.ProductCart;
import model.dao.FlowerDAO;

public class publicAddListCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;
	private ProductCart productCart;
	//private ArrayList<ProductCart> listHoa = new ArrayList<>();
	public publicAddListCartController() {
		super();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		 ArrayList<ProductCart> listHoa =(ArrayList<ProductCart>) session.getAttribute("listHoa");
		boolean check = true;
		// lấy thông tin hoa từ id
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
			
			
		Flower flower = flowerDAO.getItem(id);
		if(flower == null) {
			response.sendRedirect(request.getContextPath() + "/carts?err=1");
			return;
		}
		if(listHoa.size() > 0) {
			//productCart = new  ProductCart(soluong, flower);
			for(ProductCart itemm : listHoa) {
				if(itemm.getFlower().getId() == id) {
					//productCart = listHoa.get(id);
					itemm.increasQuanty();
					check = true;
				}else {
					check = false;
				}
			}
		}
		if(check == false || listHoa.size() == 0) {
			productCart = new ProductCart(1, flower);
			listHoa.add(productCart);
		}
		
		response.sendRedirect(request.getContextPath() + "/list-product?msg=1");
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
