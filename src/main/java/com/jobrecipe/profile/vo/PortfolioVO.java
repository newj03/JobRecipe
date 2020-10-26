package com.jobrecipe.profile.vo;

import org.springframework.web.multipart.MultipartFile;

public class PortfolioVO {

	private int por_no;
	private int u_no;
	private MultipartFile por_file;
	private String por_filepath;
	
	public PortfolioVO() {
		// TODO Auto-generated constructor stub
	}

	public PortfolioVO(int por_no, int u_no, MultipartFile por_file, String por_filepath) {
		super();
		this.por_no = por_no;
		this.u_no = u_no;
		this.por_file = por_file;
		this.por_filepath = por_filepath;
	}
	
	public PortfolioVO(int u_no, String por_filepath) {
		super();
		this.u_no = u_no;
		this.por_filepath = por_filepath;
	}

	public int getPor_no() {
		return por_no;
	}

	public void setPor_no(int por_no) {
		this.por_no = por_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
	public MultipartFile getPor_file() {
		return por_file;
	}

	public void setPor_file(MultipartFile por_file) {
		this.por_file = por_file;
	}

	public String getPor_filepath() {
		return por_filepath;
	}

	public void setPor_filepath(String por_filepath) {
		this.por_filepath = por_filepath;
	}


	@Override
	public String toString() {
		return "PortfolioVO [por_no=" + por_no + ", u_no=" + u_no + ", por_filepath=" + por_filepath + "]";
	}
	
}
