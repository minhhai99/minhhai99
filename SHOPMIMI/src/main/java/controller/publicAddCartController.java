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

public class publicAddCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlowerDAO flowerDAO;
	private ProductCart productCart;
	private ArrayList<ProductCart> listHoa = new ArrayList<>();
	public publicAddCartController() {
		super();
		flowerDAO = new FlowerDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
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
//		if(listHoa == null) {
//			productCart = new ProductCart(1, flower);
//			listHoa.add(productCart);
//		}else {
//			for(ProductCart itemm : listHoa) {
//				if(itemm.getFlower().getId() == id) {
//					productCart  = listHoa.get(id);
//					itemm.increasQuanty();
//					}else {
//						productCart = new ProductCart(1, flower);
//						listHoa.add(productCart);
//					}
//				}
//			}
		
		
		if(listHoa.size() > 0) {
			//productCart = new  ProductCart(soluong, flower);
			for(ProductCart itemm : listHoa) {
				//giỏ hang 1 -> giỏ hàng 1  -> check=true
				//giỏ hàng có 2 sản phẩm
				//sản phẩm 1:check =true
				//sản phẩm 2:check ==false
				if(itemm.getFlower().getId() == id) {
					//productCart = listHoa.get(id);
					itemm.increasQuanty();
					check = true;
					break;
				}else {
					//check=false
					check = false;
				}
			}
		}
		if(check == false || listHoa.size() == 0) {
			productCart = new ProductCart(1, flower);
			listHoa.add(productCart);
		}
		
		session.setAttribute("listHoa", listHoa);
		
		
		// sản phẩm liên quan
		Flower flowerD = flowerDAO.getItem(id);
		if(flowerD == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		ArrayList<Flower> relatedFlower = flowerDAO.getRelateItem(flowerD, 8);
		request.setAttribute("relatedFlower", relatedFlower);
		response.sendRedirect(request.getContextPath() + "/carts");
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
