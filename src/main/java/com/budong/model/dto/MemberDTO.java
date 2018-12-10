package com.budong.model.dto;

public class MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_img;
	private String mem_region;
	

	public MemberDTO() {
		mem_img = "";
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_img() {
		return mem_img;
	}

	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}

	public String getMem_region() {
		return mem_region;
	}

	public void setMem_region(String mem_region) {
		this.mem_region = mem_region;
	}

	public MemberDTO(String id, String password) {
		this.mem_id = id;
		this.mem_pw = password;
	}

}
