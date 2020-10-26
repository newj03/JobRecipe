package com.jobrecipe.user.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.jobrecipe.user.vo.UserVO;

public interface UserService {
	
	/*
	 *** ȸ������ ���� ���� ***
	 */
	public int userEmailCheck(String u_email);
	
	public void signupMember(UserVO userVO);
	
	/*
	 * �α��� �� ��й�ȣ ã�� ���� ����
	 */
	
	//�α���üũ
	public UserVO signinCheck(UserVO vo1) throws ClassNotFoundException, SQLException;
	
	//�α���
	public UserVO signin(UserVO vo1) throws ClassNotFoundException, SQLException;
	
	//�α׾ƿ�
	public void logout(HttpSession session) throws ClassNotFoundException, SQLException;
	
	//��й�ȣã��
	public void newPwForm(String u_email) throws ClassNotFoundException, SQLException;
	
	//��й�ȣ �缳��
	/*public void sendNewPwMail();*/
	
	public UserVO viewMember(UserVO vo1) throws ClassNotFoundException, SQLException;
	
    public void pass_change(UserVO vo1) throws Exception;
    
    public int findEmail(String u_email);

    //ȸ��Ż��
	public void memberDelete(UserVO vo1) throws Exception;
	
	//�̸��ϼ��� ����
	public void newsCheck(UserVO vo) throws Exception;
	

}