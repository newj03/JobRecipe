package com.jobrecipe.user.vo;

public class UserVO {
	private int u_no;			//회원번호
	private String u_email;		//이메일
	private String u_pw;		//비밀번호
	private int u_privateInfo;	//개인정보제공동의 체크
	private int u_newsLetter;	//뉴스레터수신동의 체크
	private int u_emailAuth;	//이메일 인증 체크
	
	public UserVO() {
		// TODO Auto-generated constructor stub
	}

	public UserVO(int u_no, String u_email, String u_pw, int u_privateInfo, int u_newsLetter, int u_emailAuth) {
		super();
		this.u_no = u_no;
		this.u_email = u_email;
		this.u_pw = u_pw;
		this.u_privateInfo = u_privateInfo;
		this.u_newsLetter = u_newsLetter;
		this.u_emailAuth = u_emailAuth;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public int getU_privateInfo() {
		return u_privateInfo;
	}

	public void setU_privateInfo(int u_privateInfo) {
		this.u_privateInfo = u_privateInfo;
	}

	public int getU_newsLetter() {
		return u_newsLetter;
	}

	public void setU_newsLetter(int u_newsLetter) {
		this.u_newsLetter = u_newsLetter;
	}

	public int getU_emailAuth() {
		return u_emailAuth;
	}

	public void setU_emailAuth(int u_emailAuth) {
		this.u_emailAuth = u_emailAuth;
	}

	@Override
	public String toString() {
		return "UserVO [u_no=" + u_no + ", u_email=" + u_email + ", u_pw=" + u_pw + ", u_privateInfo=" + u_privateInfo
				+ ", u_newsLetter=" + u_newsLetter + ", u_emailAuth=" + u_emailAuth + "]";
	}
	
	
	
}
