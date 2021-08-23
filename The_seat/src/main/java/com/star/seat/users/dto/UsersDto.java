package com.star.seat.users.dto;

public class UsersDto {

	private String name;
	private String email;
	private String pwd;
	private String newPwd;
	private String tag;
	private String phoneNumber;
	private String profile;
	private String regdate;
	
	public UsersDto() {}

	public UsersDto(String name, String email, String pwd, String newPwd, String tag, String phoneNumber,
			String profile, String regdate) {
		super();
		this.name = name;
		this.email = email;
		this.pwd = pwd;
		this.newPwd = newPwd;
		this.tag = tag;
		this.phoneNumber = phoneNumber;
		this.profile = profile;
		this.regdate = regdate;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
}