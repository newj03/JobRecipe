package com.jobrecipe.profile.vo;

import java.sql.Date;

public class ResumeVO {
	private int res_no;
	private int u_no;
	private String res_title;
	private int pro_no;
	private int e_no;
	private int car_no;
	private int act_no;
	private int cer_no;
	private int por_no;
	private Date write_date;
	
	public ResumeVO() {
		// TODO Auto-generated constructor stub
	}

	public ResumeVO(int res_no, int u_no, String res_title, int pro_no, int e_no, int car_no, int act_no, int cer_no,
			int por_no, Date write_date) {
		super();
		this.res_no = res_no;
		this.u_no = u_no;
		this.res_title = res_title;
		this.pro_no = pro_no;
		this.e_no = e_no;
		this.car_no = car_no;
		this.act_no = act_no;
		this.cer_no = cer_no;
		this.por_no = por_no;
		this.write_date = write_date;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getRes_title() {
		return res_title;
	}

	public void setRes_title(String res_title) {
		this.res_title = res_title;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getE_no() {
		return e_no;
	}

	public void setE_no(int e_no) {
		this.e_no = e_no;
	}

	public int getCar_no() {
		return car_no;
	}

	public void setCar_no(int car_no) {
		this.car_no = car_no;
	}

	public int getAct_no() {
		return act_no;
	}

	public void setAct_no(int act_no) {
		this.act_no = act_no;
	}

	public int getCer_no() {
		return cer_no;
	}

	public void setCer_no(int cer_no) {
		this.cer_no = cer_no;
	}

	public int getPor_no() {
		return por_no;
	}

	public void setPor_no(int por_no) {
		this.por_no = por_no;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
	
}
