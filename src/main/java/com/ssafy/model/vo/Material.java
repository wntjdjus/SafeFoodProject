package com.ssafy.model.vo;

public class Material {

	private String mname;
	private String origin;
	public Material() {
		super();
	}
	public Material(String mname, String origin) {
		super();
		this.mname = mname;
		this.origin = origin;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	@Override
	public String toString() {
		return "Material [mname=" + mname + ", origin=" + origin + "]";
	}
}
