package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.model.service.UserService;
import com.ssafy.model.vo.Question;
import com.ssafy.model.vo.Recoding;
import com.ssafy.model.vo.User;
import com.ssafy.model.vo.UserAllergy;

@RequestMapping("/user")
@Controller
public class UserController {

	private UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@PostMapping("/login.do")
	public String login(HttpSession session, String uid, String upw) {
		System.out.println("login...");
		if(userService.checkPassword(uid).equals(upw)) {
			session.setAttribute("user", userService.selectUser(uid));
			session.setAttribute("allergy", userService.searchAllergys(uid));
			session.setAttribute("recodingList", userService.searchRecoding(uid));
		}
		return "index";
	}
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();	
		return "index";
	}
	@PostMapping("/signup.do")
	public String signup(User userinfo, String[] allergy) {
		System.out.println("signup");
		userService.insertUser(userinfo);
		for(int i=0;i<allergy.length;i++) {
			UserAllergy userAllergy=new UserAllergy(userinfo.getUid(), allergy[i]);
			userService.insertAllergy(userAllergy);
		}
		return "index";
	}
	@GetMapping("/delete.do")
	public String delete(HttpSession session) {
		User user=(User)session.getAttribute("user");
		userService.deleteRecoding(user.getUid());
		userService.deleteAllergy(user.getUid());
		userService.deleteUser(user.getUid());
		session.invalidate();
		return "index";
	}
	@PostMapping("/modify.do")
	public String modify(HttpSession session, User user, String[] allergy) {
		userService.deleteAllergy(user.getUid());
		for(int i=0;i<allergy.length;i++) {
			UserAllergy userAllergy=new UserAllergy(user.getUid(), allergy[i]);
			userService.insertAllergy(userAllergy);
		}
		userService.updateUser(user);
		session.setAttribute("user", userService.selectUser(user.getUid()));
		session.setAttribute("allergy", userService.searchAllergys(user.getUid()));
		return "index";
	}
	@PostMapping("/addEat.do")
	public String addEat(HttpSession session, Recoding recoding) {
		User user=(User)session.getAttribute("user");
		userService.insertRecoding(recoding);
		session.removeAttribute("recodingList");
		session.setAttribute("recodingList", userService.searchRecoding(user.getUid()));
		return "index";
	}
	@PostMapping("/recoding_delete.do")
	public String deleteEat(HttpSession session,String uid,String date,Model model) {
		HashMap<String, Object> conditions = new HashMap<String,Object>();
		conditions.put("user_uid", uid);
		conditions.put("date", date);
		userService.deleteRecodingOne(conditions);
		session.removeAttribute("recodingList");
		session.setAttribute("recodingList", userService.searchRecoding(uid));
		return "index";
	}
	
	@GetMapping("/qna.do")
	public String qna() {
		return "qnaPage";
	}
	@GetMapping("/goHome.do")
	public String goHome() {
		return "index";
	}
	
}
