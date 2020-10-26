package com.jobrecipe.profile.vo;


public class CareerVO {
	private int car_no;
	private int u_no;
	private String car_edate;
	private String car_rdate;
	private int car_inoffice;
	private String car_cname;
	private String car_department;
	private String car_position;
	private String car_duty;
	private String car_workexp;
	
	public CareerVO() {
		// TODO Auto-generated constructor stub
	}
	
	public CareerVO(int car_no, int u_no, String car_edate, String car_rdate, int car_inoffice, String car_cname,
			String car_department, String car_position, String car_duty, String car_workexp) {
		super();
		this.car_no = car_no;
		this.u_no = u_no;
		this.car_edate = car_edate;
		this.car_rdate = car_rdate;
		this.car_inoffice = car_inoffice;
		this.car_cname = car_cname;
		this.car_department = car_department;
		this.car_position = car_position;
		this.car_duty = car_duty;
		this.car_workexp = car_workexp;
	}

	public CareerVO(int u_no, String car_edate, String car_rdate, int car_inoffice, String car_cname,
			String car_department, String car_position, String car_duty, String car_workexp) {
		super();
		this.u_no = u_no;
		this.car_edate = car_edate;
		this.car_rdate = car_rdate;
		this.car_inoffice = car_inoffice;
		this.car_cname = car_cname;
		this.car_department = car_department;
		this.car_position = car_position;
		this.car_duty = car_duty;
		this.car_workexp = car_workexp;
	}

	public int getCar_no() {
		return car_no;
	}

	public void setCar_no(int car_no) {
		this.car_no = car_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getCar_edate() {
		return car_edate;
	}

	public void setCar_edate(String car_edate) {
		this.car_edate = car_edate;
	}

	public String getCar_rdate() {
		return car_rdate;
	}

	public void setCar_rdate(String car_rdate) {
		this.car_rdate = car_rdate;
	}

	public int getCar_inoffice() {
		return car_inoffice;
	}

	public void setCar_inoffice(int car_inoffice) {
		this.car_inoffice = car_inoffice;
	}

	public String getCar_cname() {
		return car_cname;
	}

	public void setCar_cname(String car_cname) {
		this.car_cname = car_cname;
	}

	public String getCar_department() {
		return car_department;
	}

	public void setCar_department(String car_department) {
		this.car_department = car_department;
	}

	public String getCar_position() {
		return car_position;
	}

	public void setCar_position(String car_position) {
		this.car_position = car_position;
	}

	public String getCar_duty() {
		return car_duty;
	}

	public void setCar_duty(String car_duty) {
		this.car_duty = car_duty;
	}

	public String getCar_workexp() {
		return car_workexp;
	}

	public void setCar_workexp(String car_workexp) {
		this.car_workexp = car_workexp;
	}

	@Override
	public String toString() {
		return "CareerVO [car_no=" + car_no + ", u_no=" + u_no + ", car_edate=" + car_edate + ", car_rdate=" + car_rdate
				+ ", car_inoffice=" + car_inoffice + ", car_cname=" + car_cname + ", car_department=" + car_department
				+ ", car_position=" + car_position + ", car_duty=" + car_duty + ", car_workexp=" + car_workexp + "]";
	}

	
}
