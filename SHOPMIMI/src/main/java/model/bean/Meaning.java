package model.bean;

public class Meaning {

	private int id;
	private String name;
	private String detail;
	private String preview;
	private String picture;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Meaning(int id, String name, String detail, String preview, String picture) {
		super();
		this.id = id;
		this.name = name;
		this.detail = detail;
		this.preview = preview;
		this.picture = picture;
	}
	public Meaning() {
		super();
	}
	
}
