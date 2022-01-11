package model.bean;

public class Color {
	private int id;
	private String name;
	private String picture;
	private Meaning meaning;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Meaning getMeaning() {
		return meaning;
	}
	public void setMeaning(Meaning meaning) {
		this.meaning = meaning;
	}
	public Color(int id, String name, String picture, Meaning meaning) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.meaning = meaning;
	}
	public Color() {
		super();
	}

}
