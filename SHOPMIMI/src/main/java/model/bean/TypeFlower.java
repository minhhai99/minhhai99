package model.bean;

public class TypeFlower {
	private int id;
	private String name;
	private String picture_type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture_type() {
		return picture_type;
	}
	public void setPicture_type(String picture_type) {
		this.picture_type = picture_type;
	}
	public TypeFlower(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public TypeFlower(int id, String name, String picture_type) {
		super();
		this.id = id;
		this.name = name;
		this.picture_type = picture_type;
	}
	public TypeFlower() {
		super();
	}
	

}
