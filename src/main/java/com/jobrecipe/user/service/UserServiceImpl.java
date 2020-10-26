package com.jobrecipe.user.service;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobrecipe.user.service.dao.UserDAO;
import com.jobrecipe.user.vo.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;

	/*
	 *** 회원가입 관련 서비스 ***
	 */

	@Override
	public int userEmailCheck(String u_email) {
		System.out.println("userEmailCheck-service call");
		return userDAO.userEmailCheck(u_email);
	}
	
	@Override
	public void signupMember(UserVO userVO) {
		System.out.println("signupMember-service call");
		userDAO.insertMember(userVO);
	}
	
	//로그인체크
	@Override
	public UserVO signinCheck(UserVO vo1) throws ClassNotFoundException, SQLException {
		return userDAO.signinCheck(vo1);
	}

	//로그인
	@Override
	public UserVO signin(UserVO vo1) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return userDAO.signin(vo1);
	}

	//로그아웃
	@Override
	public void logout(HttpSession session) throws ClassNotFoundException, SQLException {
		session.invalidate();
	}

	//이메일체크
	@Override
	public void newPwForm(String u_email) {
		userDAO.emailCheck(u_email);
	}

	@Override
	public UserVO viewMember(UserVO vo1) throws ClassNotFoundException, SQLException {
		return userDAO.viewMember(vo1);
	}

	@Override
	public void pass_change(UserVO vo1) throws Exception {	
		userDAO.pass_change(vo1);
	}

	@Override
	public int findEmail(String u_email) {
		int checkNum = userDAO.findEmail(u_email);

		return checkNum;
	}

	//회원탈퇴
	@Override
	public void memberDelete(UserVO vo1) throws Exception {
		userDAO.memberDelete(vo1);
		
	}

	@Override
	public void newsCheck(UserVO vo) throws Exception {
		userDAO.newsCheck(vo);
		
	}
	
}
