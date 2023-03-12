package com.kurly.review;

public class ReviewDTO {

	private Long rvIdx; // 리뷰번호
	private int rvProductidx; // 상품번호. BasketDTO. foreign key
	private String rvUserid; // 작성자아이디
	private String rvTitle; // 제목
	private String rvContent; // 내용
	private int rvHelped; // 도움이 돼요(1), 안돼요(0)
	private String rvRegdate; // 리뷰등록일시
	private String rvImgname; // 리뷰이미지
	private String rvImgpath; // 리뷰이미지 경로

	public Long getRvIdx() {
		return rvIdx;
	}

	public void setRvIdx(Long rvIdx) {
		this.rvIdx = rvIdx;
	}

	public int getRvProductidx() {
		return rvProductidx;
	}

	public void setRvProductidx(int rvProductidx) {
		this.rvProductidx = rvProductidx;
	}

	public String getRvUserid() {
		return rvUserid;
	}

	public void setRvUserid(String rvUserid) {
		this.rvUserid = rvUserid;
	}

	public String getRvTitle() {
		return rvTitle;
	}

	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}

	public String getRvContent() {
		return rvContent;
	}

	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public int getRvHelped() {
		return rvHelped;
	}

	public void setRvHelped(int rvHelped) {
		this.rvHelped = rvHelped;
	}

	public String getRvRegdate() {
		return rvRegdate;
	}

	public void setRvRegdate(String rvRegdate) {
		this.rvRegdate = rvRegdate;
	}

	public String getRvImgname() {
		return rvImgname;
	}

	public void setRvImgname(String rvImgname) {
		this.rvImgname = rvImgname;
	}

	public String getRvImgpath() {
		return rvImgpath;
	}

	public void setRvImgpath(String rvImgpath) {
		this.rvImgpath = rvImgpath;
	}

	@Override
	public String toString() {
		return "ReviewDTO [rvIdx=" + rvIdx + ", rvProductidx=" + rvProductidx + ", rvUserid=" + rvUserid + ", rvTitle="
				+ rvTitle + ", rvContent=" + rvContent + ", rvHelped=" + rvHelped + ", rvRegdate=" + rvRegdate
				+ ", rvImgname=" + rvImgname + ", rvImgpath=" + rvImgpath + "]";
	}

}
