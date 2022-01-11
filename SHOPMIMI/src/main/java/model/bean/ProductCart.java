package model.bean;

public class ProductCart {

	private int quanty;
	private Flower flower;
	public int getQuanty() {
		return quanty;
	}
	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	public Flower getFlower() {
		return flower;
	}
	public void setFlower(Flower flower) {
		this.flower = flower;
	}
	public ProductCart(int quanty, Flower flower) {
		super();
		this.quanty = quanty;
		this.flower = flower;
	}
	public void increasQuanty() {
		this.quanty++;
	}
	public void reduceQuanty() {
		this.quanty--;
	}
	public ProductCart() {
		super();
	}
	
	
}
