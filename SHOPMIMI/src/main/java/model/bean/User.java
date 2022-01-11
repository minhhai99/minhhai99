package model.bean;

public class User {

	private int id;
	private String name;
	private String password;
	private String fullname;
	private String Email;
	private String address;
	private ApiUser apiUser;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public ApiUser getApiUser() {
		return apiUser;
	}
	public void setApiUser(ApiUser apiUser) {
		this.apiUser = apiUser;
	}
	public User(int id, String name, String password, String fullname) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.fullname = fullname;
	}
	public User(int id, String name, String password, String fullname, String email, String address, ApiUser apiUser) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.fullname = fullname;
		Email = email;
		this.address = address;
		this.apiUser = apiUser;
	}
	public User(int id, String name, String password, String fullname, String email, String address) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.fullname = fullname;
		Email = email;
		this.address = address;
	}
	public User() {
		super();
	}
	
	
}
