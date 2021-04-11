package com.ssafy.model.service;

import java.util.HashMap;
import java.util.List;

import com.ssafy.model.dao.UserDAO;
import com.ssafy.model.vo.Answer;
import com.ssafy.model.vo.Question;
import com.ssafy.model.vo.Recoding;
import com.ssafy.model.vo.User;
import com.ssafy.model.vo.UserAllergy;

public class UserServiceImpl implements UserService {

	private UserDAO userDao;
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int deleteUser(String uid) {
		return userDao.deleteUser(uid);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int insertAllergy(UserAllergy userAllergy) {
		return userDao.insertAllergy(userAllergy);
	}

	@Override
	public int deleteAllergy(String uid) {
		return userDao.deleteAllergy(uid);
	}

	@Override
	public String checkPassword(String uid) {
		return userDao.checkPassword(uid);
	}

	@Override
	public List<String> searchAllergys(String uid) {
		return userDao.searchAllergys(uid);
	}

	@Override
	public int insertRecoding(Recoding recoding) {
		return userDao.insertRecoding(recoding);
	}

	@Override
	public User selectUser(String uid) {
		return userDao.selectUser(uid);
	}

	@Override
	public int deleteRecoding(String uid) {
		return userDao.deleteRecoding(uid);
	}

	@Override
	public List<Recoding> searchRecoding(String uid) {
		return userDao.searchRecoding(uid);
	}

	@Override
	public int deleteRecodingOne(HashMap<String, Object> conditions) {
		return userDao.deleteRecodingOne(conditions);
	}

	@Override
	public int insertQuestion(Question question) {
		return userDao.insertQuestion(question);
	}

	@Override
	public Question selectQuestion(int qnum) {
		return userDao.selectQuestion(qnum);
	}

	@Override
	public List<Question> selectQuestionList() {
		return userDao.selectQuestionList();
	}

	@Override
	public int deleteQuestion(int qnum) {
		return userDao.deleteQuestion(qnum);
	}

	@Override
	public int updateQuestion(Question question) {
		return userDao.updateQuestion(question);
	}

	@Override
	public int insertAnswer(Answer answer) {
		return userDao.insertAnswer(answer);
	}

	@Override
	public int deleteAnswer(int anum) {
		return userDao.deleteAnswer(anum);
	}

	@Override
	public int updateAnswer(Answer answer) {
		return userDao.updateAnswer(answer);
	}

	@Override
	public Answer selectAnswer(int anum) {
		return userDao.selectAnswer(anum);
	}

	@Override
	public Question selectQuestionWithAnswer(int qnum) {
		return userDao.selectQuestionWithAnswer(qnum);
	}

	@Override
	public int isAnswerTrue(int qnum) {
		return userDao.isAnswerTrue(qnum);
	}

	@Override
	public int isAnswerFalse(int qnum) {
		return userDao.isAnswerFalse(qnum);
	}

}
