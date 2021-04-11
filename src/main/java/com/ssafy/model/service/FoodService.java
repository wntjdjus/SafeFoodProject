package com.ssafy.model.service;

import java.util.List;

import com.ssafy.model.vo.Food;
import com.ssafy.model.vo.Material;
import com.ssafy.model.vo.RawMaterial;

public interface FoodService {

	List<Food> searchAll();

	List<Food> searchByName(String name);

	List<Food> searchByMaker(String maker);

	List<Food> searchByMaterial(String material);

	Food searchFood(int code);

	List<Food> searchBest();

	List<Food> searchBestIndex();

	List<Food> searchbyAll(String stmt);
	
	int insertFood(Food food);
	
	int insertMaterial(Material material);
	
	int insertRawMaterial(RawMaterial rmaterial);
	
	int insertAllergy(String allergy);
	
	List<RawMaterial> searchRawMaterial(int fcode);
	
	Material searchMaterial(String mname);

}