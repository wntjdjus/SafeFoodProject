package com.ssafy.model.vo;

public class Recoding {

	private String user_uid;
	private String date;
	private int food_fcode;
	private int food_num;
	
	public Recoding() {
		super();
	}
	public Recoding(String user_uid, String date, int food_fcode, int food_num) {
		super();
		this.user_uid = user_uid;
		this.date = date;
		this.food_fcode = food_fcode;
		this.food_num = food_num;
	}
	public Recoding(String user_uid, int food_fcode, int food_num) {
		super();
		this.user_uid = user_uid;
		this.food_fcode = food_fcode;
		this.food_num = food_num;
	}
	public String getUser_uid() {
		return user_uid;
	}
	public void setUser_uid(String user_uid) {
		this.user_uid = user_uid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getFood_fcode() {
		return food_fcode;
	}
	public void setFood_fcode(int food_fcode) {
		this.food_fcode = food_fcode;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	@Override
	public String toString() {
		return "Recoding [user_uid=" + user_uid + ", date=" + date + ", food_fcode=" + food_fcode + ", food_num="
				+ food_num + "]";
	}
}
