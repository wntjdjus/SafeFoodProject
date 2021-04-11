package com.ssafy.model.vo;

import java.util.ArrayList;
import java.util.List;

public class Food {
	private int code;
	private String name;
	private double supportpereat;
	private double calory;
	private double carbo;
	private double protein;
	private double fat;
	private double sugar;
	private double natrium;
	private double chole;
	private double fattyacid;
	private double transfat;
	private String maker;
	private String img;
	private String material;
	private List<Material> materials;
	public Food() {
		super();
	}
	public Food(int code, String name, double supportpereat, double calory, double carbo, double protein, double fat,
			double sugar, double natrium, double chole, double fattyacid, double transfat, String maker, String img) {
		super();
		this.code = code;
		this.name = name;
		this.supportpereat = supportpereat;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
		this.maker = maker;
		this.img = img;
		this.materials=new ArrayList<Material>();
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getSupportpereat() {
		return supportpereat;
	}
	public void setSupportpereat(double supportpereat) {
		this.supportpereat = supportpereat;
	}
	public double getCalory() {
		return calory;
	}
	public void setCalory(double calory) {
		this.calory = calory;
	}
	public double getCarbo() {
		return carbo;
	}
	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}
	public double getProtein() {
		return protein;
	}
	public void setProtein(double protein) {
		this.protein = protein;
	}
	public double getFat() {
		return fat;
	}
	public void setFat(double fat) {
		this.fat = fat;
	}
	public double getSugar() {
		return sugar;
	}
	public void setSugar(double sugar) {
		this.sugar = sugar;
	}
	public double getNatrium() {
		return natrium;
	}
	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}
	public double getChole() {
		return chole;
	}
	public void setChole(double chole) {
		this.chole = chole;
	}
	public double getFattyacid() {
		return fattyacid;
	}
	public void setFattyacid(double fattyacid) {
		this.fattyacid = fattyacid;
	}
	public double getTransfat() {
		return transfat;
	}
	public void setTransfat(double transfat) {
		this.transfat = transfat;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public List<Material> getMaterials() {
		return materials;
	}
	public void setMaterials(List<Material> materials) {
		this.materials = materials;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	@Override
	public String toString() {
		return "Food [code=" + code + ", name=" + name + ", supportpereat=" + supportpereat + ", calory=" + calory
				+ ", carbo=" + carbo + ", protein=" + protein + ", fat=" + fat + ", sugar=" + sugar + ", natrium="
				+ natrium + ", chole=" + chole + ", fattyacid=" + fattyacid + ", transfat=" + transfat + ", maker="
				+ maker + ", img=" + img + ", materials=" + materials + "]";
	}
}
