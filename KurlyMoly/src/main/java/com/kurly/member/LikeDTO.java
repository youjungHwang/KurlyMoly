package com.kurly.member;

public class LikeDTO {
	int lIdx; // 찜 번호
	String lUserid; // 유저 아이디
	int lProdidx; // 상품번호
	String lRegdate; // 등록일자

	public int getlIdx() {
		return lIdx;
	}

	public void setlIdx(int lIdx) {
		this.lIdx = lIdx;
	}

	public String getlUserid() {
		return lUserid;
	}

	public void setlUserid(String lUserid) {
		this.lUserid = lUserid;
	}

	public int getlProdidx() {
		return lProdidx;
	}

	public void setlProdidx(int lProdidx) {
		this.lProdidx = lProdidx;
	}

	public String getlRegdate() {
		return lRegdate;
	}

	public void setlRegdate(String lRegdate) {
		this.lRegdate = lRegdate;
	}

	@Override
	public String toString() {
		return "LikeDTO [lIdx=" + lIdx + ", lUserid=" + lUserid + ", lProdidx=" + lProdidx + ", lRegdate=" + lRegdate
				+ "]";
	}
}
