package model.bean;

import java.sql.Timestamp;

public class Handmade {

	private int id;
	private String name;
	private int counter;
	private int price;
	private String picture;
	private Timestamp date_create;
	private String preview_text;
	private String detail_text;
	private int id_cat;
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
	public int getCounter() {
		return counter;
	}
	public void setCounter(int counter) {
		this.counter = counter;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public String getPreview_text() {
		return preview_text;
	}
	public void setPreview_text(String preview_text) {
		this.preview_text = preview_text;
	}
	public String getDetail_text() {
		return detail_text;
	}
	public void setDetail_text(String detail_text) {
		this.detail_text = detail_text;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public Handmade(int id, String name, int counter, int price, String picture, Timestamp date_create,
			String preview_text, String detail_text, int id_cat) {
		super();
		this.id = id;
		this.name = name;
		this.counter = counter;
		this.price = price;
		this.picture = picture;
		this.date_create = date_create;
		this.preview_text = preview_text;
		this.detail_text = detail_text;
		this.id_cat = id_cat;
	}
	public Handmade() {
		super();
	}
	
}
