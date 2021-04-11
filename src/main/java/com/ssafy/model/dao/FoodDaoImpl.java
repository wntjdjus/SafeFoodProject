package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.model.vo.Food;
import com.ssafy.model.vo.Material;
import com.ssafy.model.vo.RawMaterial;

public class FoodDaoImpl implements FoodDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		System.out.println("SEARCHALL");
		this.session = session;
	}
	@Override
	public List<Food> searchAll(){
		return session.selectList("food.searchAll");
	}
	@Override
	public List<Food> searchByName(String name){
		return session.selectList("food.searchByName", name);
	}
	@Override
	public List<Food> searchByMaker(String maker){
		return session.selectList("food.searchByMaker", maker);
	}
	@Override
	public List<Food> searchByMaterial(String material){
		return session.selectList("food.searchByMaterial", material);
	}
	@Override
	public List<Food> searchByAll(String stmt) {
		return session.selectList("food.searchByAll", stmt);
	}
	@Override
	public Food searchFood(int code) {
		Food food=session.selectOne("food.searchFood", code);
		food.setMaterials(session.selectList("searchMaterials", code));
		return food;
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
	public int insertFood(Food food) {
		return session.insert("insertFood", food);
	}
	@Override
	public int insertMaterial(Material material) {
		return session.insert("insertMaterial", material);
	}
	@Override
	public int insertRawMaterial(RawMaterial rmaterial) {
		return session.insert("insertRawMaterial", rmaterial);
	}
	@Override
	public int insertAllergy(String allergy) {
		return session.insert("insertAllergy", allergy);
	}
	@Override
	public List<RawMaterial> searchRawMaterial(int fcode) {
		return session.selectList("searchRawMaterial", fcode);
	}
	@Override
	public Material searchMaterial(String mname) {
		return session.selectOne("searchMaterial", mname);
	}
}
