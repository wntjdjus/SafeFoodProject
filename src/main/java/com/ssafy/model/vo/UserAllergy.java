package com.ssafy.model.vo;

public class UserAllergy {

	private String user_uid;
	private String allergy_allergy_name;
	public UserAllergy() {
		super();
	}
	public UserAllergy(String user_uid, String allergy_allergy_name) {
		super();
		this.user_uid = user_uid;
		this.allergy_allergy_name = allergy_allergy_name;
	}
	public String getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(String user_uid) {
		this.user_uid = user_uid;
	}
	public String getAllergy_allergy_name() {
		return allergy_allergy_name;
	}
	public void setAllergy_allergy_name(String allergy_allergy_name) {
		this.allergy_allergy_name = allergy_allergy_name;
	}
	@Override
	public String toString() {
		return "UserAllergy [user_uid=" + user_uid + ", allergy_allergy_name=" + allergy_allergy_name + "]";
	}
}
