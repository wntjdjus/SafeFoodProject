package com.ssafy.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.model.vo.Answer;
import com.ssafy.model.vo.Question;
import com.ssafy.model.vo.Recoding;
import com.ssafy.model.vo.User;
import com.ssafy.model.vo.UserAllergy;

public class UserDAOImpl implements UserDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insertUser(User user) {
		return session.insert("user.insertUser", user);
	}

	@Override
	public int deleteUser(String uid) {
		return session.delete("user.deleteUser", uid);
	}

	@Override
	public int updateUser(User user) {
		return session.update("user.updateUser", user);
	}

	@Override
	public int insertAllergy(UserAllergy userAllergy) {
		return session.insert("user.insertAllergy", userAllergy);
	}

	@Override
	public int deleteAllergy(String uid) {
		return session.delete("user.deleteAllergy", uid);
	}

	@Override
	public String checkPassword(String uid) {
		return session.selectOne("user.checkPassword", uid);
	}

	@Override
	public List<String> searchAllergys(String uid) {
		return session.selectList("user.searchAllergys", uid);
	}

	@Override
	public int insertRecoding(Recoding recoding) {
		return session.insert("user.insertRecoding", recoding);
	}

	@Override
	public User selectUser(String uid) {
		return session.selectOne("user.selectUser", uid);
	}

	@Override
	public int deleteRecoding(String uid) {
		return session.delete("user.deleteRecoding", uid);
	}

	@Override
	public List<Recoding> searchRecoding(String uid) {
		return session.selectList("user.searchRecoding", uid);
	}

	@Override
	public int deleteRecodingOne(HashMap<String, Object> conditions) {
		return session.delete("user.deleteRecodingOne", conditions);
	}

	@Override
	public int insertQuestion(Question question) {
		return session.insert("user.insertQuestion", question);
	}

	@Override
	public Question selectQuestion(int qnum) {
		return session.selectOne("user.selectQuestion", qnum);
	}

	@Override
	public List<Question> selectQuestionList() {
		return session.selectList("user.selectQuestionList");
	}

	@Override
	public int deleteQuestion(int qnum) {
		return session.delete("user.deleteQuestion", qnum);
	}

	@Override
	public int updateQuestion(Question question) {
		return session.update("user.updateQuestion", question);
	}

	@Override
	public int insertAnswer(Answer answer) {
		return session.insert("user.insertAnswer", answer);
	}

	@Override
	public int deleteAnswer(int anum) {
		return session.delete("user.deleteAnswer", anum);
	}

	@Override
	public int updateAnswer(Answer answer) {
		return session.update("user.updateAnswer", answer);
	}

	@Override
	public Answer selectAnswer(int anum) {
		return session.selectOne("user.selectAnswer", anum);
	}

	@Override
	public Question selectQuestionWithAnswer(int qnum) {
		return session.selectOne("user.selectQuestionWithAnswer", qnum);
	}

	@Override
	public int isAnswerTrue(int qnum) {
		return session.update("user.isAnswerTrue", qnum);
	}

	@Override
	public int isAnswerFalse(int qnum) {
		return session.update("user.isAnswerFalse", qnum);
	}

}
