package com.ssafy.model.vo;

public class Answer {

	private int anum;
	private String sdate;
	private String description;
	public Answer() {
		super();
	}
	public Answer(int anum, String sdate, String description) {
		super();
		this.anum = anum;
		this.sdate = sdate;
		this.description = description;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Answer [anum=" + anum + ", sdate=" + sdate + ", description=" + description + "]";
	}
}
