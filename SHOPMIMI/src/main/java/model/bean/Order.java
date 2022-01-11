package model.bean;

public class Order {

	private int id;
	private int idUser;
	private String phone;
	private String address;
	private String email;
	private String display_name;
	private String note;
	private int quanty;
	private double total;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDisplay_name() {
		return display_name;
	}
	public void setDisplay_name(String display_name) {
		this.display_name = display_name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
	
	public Order(int id, int idUser, String phone, String address, String email, String display_name, String note,
			int quanty, double total) {
		super();
		this.id = id;
		this.idUser = idUser;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.display_name = display_name;
		this.note = note;
		this.quanty = quanty;
		this.total = total;
	}
	public Order() {
		super();
	}
	
	
}
