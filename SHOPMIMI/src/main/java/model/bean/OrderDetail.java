package model.bean;

public class OrderDetail {
	private int id;
	private Flower flower;
	private Order order;
	private int quanty;
	private double total;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Flower getFlower() {
		return flower;
	}
	public void setFlower(Flower flower) {
		this.flower = flower;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	
//	public OrderDetail(int id, int id_flower, int id_order, int quanty, double total) {
//		super();
//		this.id = id;
//		this.id_flower = id_flower;
//		this.id_order = id_order;
//		this.quanty = quanty;
//		this.total = total;
//	}
	
	public OrderDetail() {
		super();
	}
public OrderDetail(int id, Flower flower, Order order, int quanty, double total) {
	super();
	this.id = id;
	this.flower = flower;
	this.order = order;
	this.quanty = quanty;
	this.total = total;
}
	
	

}
