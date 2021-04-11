package com.ssafy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.service.UserService;
import com.ssafy.model.vo.Answer;
import com.ssafy.model.vo.Question;

@CrossOrigin(origins= {"*"})
@RequestMapping("/rest")
@RestController
public class QnAController {

	private UserService userService;
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/questions")
	public @ResponseBody List<Question> getQuestionList() {
		return userService.selectQuestionList();
	} 
	
	@GetMapping("/question/{qnum}")
	public Question getQuestion(@PathVariable int qnum) {
		Question q=userService.selectQuestion(qnum);
		if(q.getIsanswer()==1) {
			return userService.selectQuestionWithAnswer(qnum);
		}
		return q;
	}
	
	@PostMapping("/question")
	public boolean registerQuestion(@RequestBody Question q) {
		userService.insertQuestion(q);
		return true;
	}
	
	@PutMapping("/question")
	public boolean modifyQuestion(@RequestBody Question q) {
		userService.updateQuestion(q);
		return true;
	}
	
	@DeleteMapping("/question/{qnum}")
	public boolean deleteQuestion(@PathVariable int qnum) {
		userService.deleteQuestion(qnum);
		userService.deleteAnswer(qnum);
		return true;
	}
	
	@GetMapping("/answer/{anum}")
	public Answer getAnswer(@PathVariable int anum) {
		return userService.selectAnswer(anum);
	}
	
	@PostMapping("/answer")
	public boolean registerAnswer(@RequestBody Answer a) {
		userService.insertAnswer(a);
		userService.isAnswerTrue(a.getAnum());
		return true;
	}
	
	@PutMapping("/answer")
	public boolean modifyAnswer(@RequestBody Answer a) {
		userService.updateAnswer(a);
		return true;
	}
	
	@DeleteMapping("/answer/{anum}")
	public boolean deleteAnswer(@PathVariable int anum) {
		userService.deleteAnswer(anum);
		userService.isAnswerFalse(anum);
		return true;
	}
}
