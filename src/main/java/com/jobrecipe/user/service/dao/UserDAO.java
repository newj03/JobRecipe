package com.jobrecipe.user.service.dao;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.jobrecipe.user.vo.UserVO;

@Repository
public interface UserDAO {
	
	//ȸ������
	public int userEmailCheck(String u_email);
	
	public void insertMember(UserVO userVO);
	
	//�α���üũ
	public UserVO signinCheck(UserVO vo1);
	//�α���
	public UserVO signin(UserVO vo1);
	//�α׾ƿ�
	public void logout(HttpSession session);
	//�̸���üũ
	public void emailCheck(String u_email);
	
	public UserVO viewMember(UserVO vo1);
	
	public void pass_change(UserVO vo1)throws Exception;
	
	public int findEmail(String u_email);
	//ȸ��Ż��
	public void memberDelete(UserVO vo1);
	//�̸��� ���� üũ
	public void newsCheck(UserVO vo);

}