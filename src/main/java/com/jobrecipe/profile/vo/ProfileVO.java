package com.jobrecipe.profile.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProfileVO {
	
	private int pro_no;			//프로필 번호
	private int u_no;			//회원 번호
	private int pro_gender;		//성별
	private int pro_birthYear;	//생년월일
	private int pro_career;		//경력
	private String pro_occu;	//직종
	private String pro_subOccu; //하위 직종
	private String pro_skill;	//업무 및 스킬
	private String pro_name;	//이름
	private String pro_email;	//이메일(이력서)
	private String pro_tel;		//전화번호
	private MultipartFile pro_imgFile; //업로드 이미지 파일
	private String pro_imgPath;	//프로필 이미지 경로
	private String pro_aboutMe;	//자기소개
	
	public ProfileVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProfileVO(int pro_no, int u_no, int pro_gender, int pro_birthYear, int pro_career, String pro_occu,
			String pro_subOccu, String pro_skill, String pro_name, String pro_email, String pro_tel,
			MultipartFile pro_imgFile, String pro_imgPath, String pro_aboutMe) {
		super();
		this.pro_no = pro_no;
		this.u_no = u_no;
		this.pro_gender = pro_gender;
		this.pro_birthYear = pro_birthYear;
		this.pro_career = pro_career;
		this.pro_occu = pro_occu;
		this.pro_subOccu = pro_subOccu;
		this.pro_skill = pro_skill;
		this.pro_name = pro_name;
		this.pro_email = pro_email;
		this.pro_tel = pro_tel;
		this.pro_imgFile = pro_imgFile;
		this.pro_imgPath = pro_imgPath;
		this.pro_aboutMe = pro_aboutMe;
	}



	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getPro_gender() {
		return pro_gender;
	}

	public void setPro_gender(int pro_gender) {
		this.pro_gender = pro_gender;
	}

	public int getPro_birthYear() {
		return pro_birthYear;
	}

	public void setPro_birthYear(int pro_birthYear) {
		this.pro_birthYear = pro_birthYear;
	}

	public int getPro_career() {
		return pro_career;
	}

	public void setPro_career(int pro_career) {
		this.pro_career = pro_career;
	}

	public String getPro_occu() {
		return pro_occu;
	}

	public void setPro_occu(String pro_occu) {
		this.pro_occu = pro_occu;
	}

	public String getPro_skill() {
		return pro_skill;
	}

	public void setPro_skill(String pro_skill) {
		this.pro_skill = pro_skill;
	}

	public String getPro_subOccu() {
		return pro_subOccu;
	}

	public void setPro_subOccu(String pro_subOccu) {
		this.pro_subOccu = pro_subOccu;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getPro_email() {
		return pro_email;
	}

	public void setPro_email(String pro_email) {
		this.pro_email = pro_email;
	}

	public String getPro_tel() {
		return pro_tel;
	}

	public void setPro_tel(String pro_tel) {
		this.pro_tel = pro_tel;
	}

	public MultipartFile getPro_imgFile() {
		return pro_imgFile;
	}

	public void setPro_imgFile(MultipartFile pro_imgFile) {
		this.pro_imgFile = pro_imgFile;
	}

	public String getPro_imgPath() {
		return pro_imgPath;
	}

	public void setPro_imgPath(String pro_imgPath) {
		this.pro_imgPath = pro_imgPath;
	}

	public String getPro_aboutMe() {
		return pro_aboutMe;
	}

	public void setPro_aboutMe(String pro_aboutMe) {
		this.pro_aboutMe = pro_aboutMe;
	}

	@Override
	public String toString() {
		return "ProfileVO [pro_no=" + pro_no + ", u_no=" + u_no + ", pro_gender=" + pro_gender + ", pro_birthYear="
				+ pro_birthYear + ", pro_career=" + pro_career + ", pro_occu=" + pro_occu + ", pro_subOccu=" + pro_subOccu
				+ ", pro_skill=" + pro_skill + ", pro_name=" + pro_name + ", pro_email=" + pro_email + ", pro_tel="
				+ pro_tel + ", pro_imgPath=" + pro_imgPath + ", pro_aboutMe=" + pro_aboutMe + "]";
	}
	
	
}
