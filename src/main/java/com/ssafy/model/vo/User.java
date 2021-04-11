package com.ssafy.model.vo;

import java.util.Arrays;
import java.util.List;

public class User {
	private String uid;
	private String upw;
	private String uname;
	private String address;
	private String phone;
	
	private List<String> allergys;
	
	public User() {
		super();
	}

	public User(String uid, String upw, String uname, String address, String phone) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.address = address;
		this.phone = phone;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<String> getAllergys() {
		return allergys;
	}

	public void setAllergys(List<String> allergys) {
		this.allergys = allergys;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", address=" + address + ", phone=" + phone
				+ ", allergys=" + allergys + "]";
	}

}
