package com.ssafy.model.vo;

public class RawMaterial {

	private int Food_fcode;
	private String Material_mname;
	public RawMaterial() {
		super();
	}
	public RawMaterial(int food_fcode, String material_mname) {
		super();
		Food_fcode = food_fcode;
		Material_mname = material_mname;
	}
	public int getFood_fcode() {
		return Food_fcode;
	}
	public void setFood_fcode(int food_fcode) {
		Food_fcode = food_fcode;
	}
	public String getMaterial_mname() {
		return Material_mname;
	}
	public void setMaterial_mname(String material_mname) {
		Material_mname = material_mname;
	}
	@Override
	public String toString() {
		return "RawMaterial [Food_fcode=" + Food_fcode + ", Material_mname=" + Material_mname + "]";
	}
}
