package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.dao.FoodDAO;
import com.ssafy.model.vo.Food;
import com.ssafy.model.vo.Material;
import com.ssafy.model.vo.RawMaterial;

public class FoodServiceImpl implements FoodService {

	private FoodDAO foodDao;

	public void setFoodDao(FoodDAO foodDao) {
		this.foodDao = foodDao;
	}
	@Override
	public List<Food> searchAll(){
		return foodDao.searchAll();
	}
	@Override
	public List<Food> searchByName(String name){
		return foodDao.searchByName(name);
	}
	@Override
	public List<Food> searchByMaker(String maker){
		return foodDao.searchByMaker(maker);
	}
	@Override
	public List<Food> searchByMaterial(String material){
		return foodDao.searchByMaterial(material);
	}
	@Override
	public Food searchFood(int code) {
		return foodDao.searchFood(code);
	}
	@Override
	public List<Food> searchBest(){
		return null;
	}
	@Override
	public List<Food> searchBestIndex(){
		return null;
	}
	@Override
	public List<Food> searchbyAll(String stmt) {
		return foodDao.searchByAll(stmt);
	}
	@Override
	public int insertFood(Food food) {
		return foodDao.insertFood(food);
	}
	@Override
	public int insertMaterial(Material material) {
		return foodDao.insertMaterial(material);
	}
	@Override
	public int insertRawMaterial(RawMaterial rmaterial) {
		return foodDao.insertRawMaterial(rmaterial);
	}
	@Override
	public int insertAllergy(String allergy) {
		return foodDao.insertAllergy(allergy);
	}
	@Override
	public List<RawMaterial> searchRawMaterial(int fcode) {
		return foodDao.searchRawMaterial(fcode);
	}
	@Override
	public Material searchMaterial(String mname) {
		return foodDao.searchMaterial(mname);
	}
}
