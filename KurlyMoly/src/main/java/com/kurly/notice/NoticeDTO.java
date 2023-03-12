package com.kurly.notice;

public class NoticeDTO {

	private int idx;
	private String title;
	private String content;
	private int hit;
	private String isdisplay;
	private String isimpt;
	private String regdate;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getIsdisplay() {
		return isdisplay;
	}

	public void setIsdisplay(String isdisplay) {
		this.isdisplay = isdisplay;
	}

	public String getIsimpt() {
		return isimpt;
	}

	public void setIsimpt(String isimpt) {
		this.isimpt = isimpt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeDTO [idx=" + idx + ", title=" + title + ", content=" + content + ", hit=" + hit + ", isdisplay="
				+ isdisplay + ", isimpt=" + isimpt + ", regdate=" + regdate + "]";
	}
}
