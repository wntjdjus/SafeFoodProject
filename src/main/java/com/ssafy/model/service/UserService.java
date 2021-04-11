package com.ssafy.model.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.model.vo.Answer;
import com.ssafy.model.vo.Question;
import com.ssafy.model.vo.Recoding;
import com.ssafy.model.vo.User;
import com.ssafy.model.vo.UserAllergy;

public interface UserService {

	int insertUser(User user);
	
	int deleteUser(String uid);
	
	int updateUser(User user);
	
	int insertAllergy(UserAllergy userAllergy);
	
	int deleteAllergy(String uid);
	
	String checkPassword(String uid);
	
	List<String> searchAllergys(String uid);
	
	int insertRecoding(Recoding recoding);

	int deleteRecoding(String uid);
	
	int deleteRecodingOne(HashMap<String, Object> conditions);
	
	List<Recoding> searchRecoding(String uid);
	
	User selectUser(String uid);
	
	int insertQuestion(Question question);
	
	Question selectQuestion(int qnum);
	
	Question selectQuestionWithAnswer(int qnum);
	
	List<Question> selectQuestionList();
	
	int deleteQuestion(int qnum);
	
	int updateQuestion(Question question);
	
	int insertAnswer(Answer answer);
	
	int deleteAnswer(int anum);
	
	int updateAnswer(Answer answer);
	
	Answer selectAnswer(int anum);
	
	int isAnswerTrue(int qnum);
	
	int isAnswerFalse(int qnum);

}
