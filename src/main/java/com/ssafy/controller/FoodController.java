package com.ssafy.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.model.service.FoodService;
import com.ssafy.model.vo.Food;
import com.ssafy.model.vo.Material;
import com.ssafy.model.vo.RawMaterial;
import com.ssafy.util.FoodSaxParser;

@RequestMapping("/food")
@Controller
public class FoodController {

	private FoodService foodService;

	@Autowired
	public void setFoodService(FoodService foodService) {
		this.foodService = foodService;
	}
	@GetMapping("/search.do")
	public String searchFoodList(String key, String stmt, Model model) {
		System.out.println("search.do 진입");
		if(stmt==null||stmt.equals("")) {
			System.out.println("전체검색");
			model.addAttribute("foodList", foodService.searchAll());
		} else if(key.equals("all")) {
			model.addAttribute("foodList", foodService.searchbyAll(stmt));
		} else if(key.equals("name")) {
			model.addAttribute("foodList", foodService.searchByName(stmt));
		} else if(key.equals("maker")) {
			model.addAttribute("foodList", foodService.searchByMaker(stmt));
		} else if(key.equals("material")) {
			model.addAttribute("foodList", foodService.searchByMaterial(stmt));
		}
		return "index";
	}
	@GetMapping("/detail.do")
	public String searchFood(int code, Model model) {
		model.addAttribute("food", foodService.searchFood(code));
//		List<RawMaterial> materials=foodService.searchRawMaterial(code);
//		List<Material> mlist=new ArrayList<Material>();
//		for(RawMaterial rm : materials) {
//			String mname=rm.getMaterial_mname();
//			Material m=foodService.searchMaterial(mname);
//			mlist.add(m);
//		}
//		model.addAttribute("materials", mlist);
		return "detail";
	}
	@GetMapping("/saveDB.do")
	public String saveDB() {
		List<Food> foods=new LinkedList<Food>();
		FoodSaxParser parser=new FoodSaxParser();
		foods=parser.getFoods();
		for(Food food:foods) {
			String m=food.getMaterial();
			StringTokenizer st=new StringTokenizer(m, ",");
			while(st.countTokens()!=0) {
				String mater=st.nextToken().trim();
				System.out.println(mater);
				StringTokenizer st2=new StringTokenizer(mater, "(");
				String mname=st2.nextToken().trim();
				
				String origin=null;
				if(st2.countTokens()!=0) {
					origin=st2.nextToken().trim();
					origin=origin.replace(")", "");
				}
				System.out.println(mname+" "+origin);
				if(origin!=null) foodService.insertMaterial(new Material(mname, origin));
				else foodService.insertMaterial(new Material(mname, ""));
			}
		}
		for(Food food:foods) {
			Food iFood=new Food(food.getCode(),food.getName(),food.getSupportpereat(),food.getCalory(),food.getCarbo(),food.getProtein(),food.getFat(),food.getSugar(),food.getNatrium(),food.getChole(),food.getFattyacid(),food.getTransfat(),food.getMaker(),food.getImg());
			foodService.insertFood(iFood);
		}
		for(Food food:foods) {
			String m=food.getMaterial();
			StringTokenizer st=new StringTokenizer(m, ",");
			while(st.countTokens()!=0) {
				String mater=st.nextToken().trim();
				System.out.println(mater);
				StringTokenizer st2=new StringTokenizer(mater, "(");
				String mname=st2.nextToken().trim();
				foodService.insertRawMaterial(new RawMaterial(food.getCode(), mname));
			}
		}

		String[] al= {"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};
		for(String all:al) {
			foodService.insertAllergy(all);
		}
		
		
		return "index";
	}
}
