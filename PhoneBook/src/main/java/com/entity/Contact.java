package com.entity;

public class Contact {
	private int id;
	private String name;
	private String email;
	private String phono;
	private String about;
	private int userid;

	public Contact(String name, String email, String phono, String about, int userid) {
		super();
		this.name = name;
		this.email = email;
		this.phono = phono;
		this.about = about;
		this.userid = userid;
	}

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhono() {
		return phono;
	}

	public void setPhono(String phono) {
		this.phono = phono;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

}
