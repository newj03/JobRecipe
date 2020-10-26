package com.jobrecipe.profile.vo;


public class CertiOtherVO {
	
	private int cer_no;
	private int u_no;
	private String cer_item;
	private String cer_description;
	
	public CertiOtherVO() {
		// TODO Auto-generated constructor stub
	}
	
	public CertiOtherVO(int cer_no, int u_no, String cer_item, String cer_description) {
		super();
		this.cer_no = cer_no;
		this.u_no = u_no;
		this.cer_item = cer_item;
		this.cer_description = cer_description;
	}

	public CertiOtherVO(int u_no, String cer_item, String cer_description) {
		super();
		this.u_no = u_no;
		this.cer_item = cer_item;
		this.cer_description = cer_description;
	}

	public int getCer_no() {
		return cer_no;
	}

	public void setCer_no(int cer_no) {
		this.cer_no = cer_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getCer_item() {
		return cer_item;
	}

	public void setCer_item(String cer_item) {
		this.cer_item = cer_item;
	}

	public String getCer_description() {
		return cer_description;
	}

	public void setCer_description(String cer_description) {
		this.cer_description = cer_description;
	}


	@Override
	public String toString() {
		return "CertiOtherVO [cer_no=" + cer_no + ", u_no=" + u_no + ", cer_item=" + cer_item + ", cer_description="
				+ cer_description + "]";
	}
	
}
