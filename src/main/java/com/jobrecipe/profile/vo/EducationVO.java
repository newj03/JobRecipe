package com.jobrecipe.profile.vo;


public class EducationVO {
	
	private int e_no;
	private int u_no;
	private String e_edate;
	private String e_gdate;
	private int e_attendcheck;
	private String e_sname;
	private String e_majordegree;
	private String e_description;
	
	public EducationVO() {
		// TODO Auto-generated constructor stub
	}
	
	public EducationVO(int e_no, int u_no, String e_edate, String e_gdate, int e_attendcheck, String e_sname,
			String e_majordegree, String e_description) {
		super();
		this.e_no = e_no;
		this.u_no = u_no;
		this.e_edate = e_edate;
		this.e_gdate = e_gdate;
		this.e_attendcheck = e_attendcheck;
		this.e_sname = e_sname;
		this.e_majordegree = e_majordegree;
		this.e_description = e_description;
	}

	public EducationVO(int u_no, String e_edate, String e_gdate, int e_attendcheck, String e_sname,
			String e_majordegree, String e_description) {
		super();
		this.u_no = u_no;
		this.e_edate = e_edate;
		this.e_gdate = e_gdate;
		this.e_attendcheck = e_attendcheck;
		this.e_sname = e_sname;
		this.e_majordegree = e_majordegree;
		this.e_description = e_description;
	}

	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getE_edate() {
		return e_edate;
	}
	public void setE_edate(String e_edate) {
		this.e_edate = e_edate;
	}
	public String getE_gdate() {
		return e_gdate;
	}
	public void setE_gdate(String e_gdate) {
		this.e_gdate = e_gdate;
	}
	public int getE_attendcheck() {
		return e_attendcheck;
	}
	public void setE_attendcheck(int e_attendcheck) {
		this.e_attendcheck = e_attendcheck;
	}
	public String getE_sname() {
		return e_sname;
	}
	public void setE_sname(String e_sname) {
		this.e_sname = e_sname;
	}
	public String getE_majordegree() {
		return e_majordegree;
	}
	public void setE_majordegree(String e_majordegree) {
		this.e_majordegree = e_majordegree;
	}
	public String getE_description() {
		return e_description;
	}
	public void setE_description(String e_description) {
		this.e_description = e_description;
	}

	@Override
	public String toString() {
		return "EucationVO [e_no=" + e_no + ", u_no=" + u_no + ", e_edate=" + e_edate + ", e_gdate=" + e_gdate
				+ ", e_attendcheck=" + e_attendcheck + ", e_sname=" + e_sname + ", e_majordegree=" + e_majordegree
				+ ", e_description=" + e_description + "]";
	}
	
}
