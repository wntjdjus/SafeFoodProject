package com.ssafy.model.vo;

public class Question {

	private int qnum;
	private String uid;
	private String title;
	private String qdate;
	private String description;
	private int isanswer;
	private Answer answer;
	public Question() {
		super();
	}
	public Question(int qnum, String uid, String title, String qdate, String description, int isanswer, Answer answer) {
		super();
		this.qnum = qnum;
		this.uid = uid;
		this.title = title;
		this.qdate = qdate;
		this.description = description;
		this.isanswer = isanswer;
		this.answer = answer;
	}
	public Question(int qnum, String uid, String title, String qdate, String description, int isanswer) {
		super();
		this.qnum = qnum;
		this.uid = uid;
		this.title = title;
		this.qdate = qdate;
		this.description = description;
		this.isanswer = isanswer;
	}
	public Question(String uid, String title, String qdate, String description) {
		super();
		this.uid = uid;
		this.title = title;
		this.qdate = qdate;
		this.description = description;
	}
	public Question(String uid, String title, String description) {
		super();
		this.uid = uid;
		this.title = title;
		this.description = description;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getIsanswer() {
		return isanswer;
	}
	public void setIsanswer(int isanswer) {
		this.isanswer = isanswer;
	}
	public Answer getAnswer() {
		return answer;
	}
	public void setAnswer(Answer answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Question [qnum=" + qnum + ", uid=" + uid + ", title=" + title + ", qdate=" + qdate + ", description="
				+ description + ", isanswer=" + isanswer + ", answer=" + answer + "]";
	}
}
