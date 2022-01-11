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
import model.bean.Order;
import model.bean.OrderDetail;
import model.bean.ProductCart;
import model.dao.OrderDAO;
import model.dao.OrderDetailDAO;

public class PublicOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;
	private Order order;
	private OrderDetailDAO orderDetailDAO;
	private OrderDetail orderDetail;
	public PublicOrderController() {
		super();
		orderDAO = new OrderDAO();
		orderDetailDAO = new OrderDetailDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("/public/infBill.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<ProductCart> listHoa = (ArrayList<ProductCart>) session.getAttribute("listHoa");
		//HashMap<Integer, ProductCart> cart = new HashMap<Integer, ProductCart>();
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String note = request.getParameter("note");
		
		int number =(Integer) session.getAttribute("j");
		double sum = (Double) session.getAttribute("sum");
		
		order = new Order(0, 0, phone, address, email, fullname, note, number, sum);
		
//		if(orderDAO.addItem(order) > 0) {
//			
//			response.sendRedirect(request.getContextPath()+ "/carts?id="+orderDAO.addItem(order));
//			
//		}else {
//			response.sendRedirect(request.getContextPath()+ "/public/login.jsp?err=1");
//			
//		}
		
		int orderId = orderDAO.addItem(order);
		
	
		//if(listHoa != null) {
//		for(ProductCart productCart1 : listHoa) {
//			cart.put(productCart1.getQuanty(), productCart1);
//		}
//		for(Map.Entry<Integer, ProductCart> productCart1 : cart.entrySet()) {
//			orderDetail = new OrderDetail(0, productCart1.getValue().getFlower().getId(), orderId, productCart1.getValue().getQuanty(), productCart1.getValue().getFlower().getPrice()*productCart1.getValue().getQuanty());
//			orderDetailDAO.addItemq(orderDetail);
//		}
		
		Order order = new Order(orderId, 0, null, null, null, null, null, 0, 0);
		
		int t1 = 0;
		double tong = 0.0d;
		for(ProductCart item : listHoa) {
			Flower flower = new Flower(item.getFlower().getId(), null, 0, 0, null, null, null, null, null, null);
			t1 = item.getQuanty() ;
			tong =(double) item.getQuanty() * item.getFlower().getPrice();
			orderDetail = new OrderDetail(0, flower, order, t1, tong);
//			if(orderDetailDAO.addItemq(orderDetail) > 0) {
//				 response.sendRedirect(request.getContextPath()+ "/homes");
//				 return;
//			 }else {
//				 response.sendRedirect(request.getContextPath()+ "/loginn");
//				 return;
//			 }
			
			orderDetailDAO.addItemq(orderDetail);
			
		 } 
		
		session.setAttribute("listHoa", null);
		response.sendRedirect(request.getContextPath() + "/cart/pay?id="+orderId);
		return;
		
		}

}
