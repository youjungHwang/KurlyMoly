package com.kurly.notice;

public class NoticeDTO {
	
	private int n_idx; 
	private String n_title; 
	private String n_content;
	private int n_hit; 
	private String n_isdisplay; 
	private String n_isimpt; 
	private String n_regdate;
	
	public int getN_idx() {
		return n_idx;
	}
	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_hit() {
		return n_hit;
	}
	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}
	public String getN_isdisplay() {
		return n_isdisplay;
	}
	public void setN_isdisplay(String n_isdisplay) {
		this.n_isdisplay = n_isdisplay;
	}
	public String getN_isimpt() {
		return n_isimpt;
	}
	public void setN_isimpt(String n_isimpt) {
		this.n_isimpt = n_isimpt;
	}
	public String getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	
	@Override
	public String toString() {
		return "NoticeDTO [n_idx=" + n_idx + ", n_title=" + n_title + ", n_content=" + n_content + ", n_hit=" + n_hit
				+ ", n_isdisplay=" + n_isdisplay + ", n_isimpt=" + n_isimpt + ", n_regdate=" + n_regdate + "]";
	}

	
	
	

}
