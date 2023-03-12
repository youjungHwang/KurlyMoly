package com.kurly.order;

public class BasketDTO {
	private int bkIdx; // 장바구니 번호
	private String bkUserid; // 회원 번호
	private int bkProdidx; // 상품 번호
	private int bkQuantity; // 수량
	private String bkRegdate; // 등록일시
	
	public int getBkIdx() {
		return bkIdx;
	}

	public void setBkIdx(int bkIdx) {
		this.bkIdx = bkIdx;
	}

	public String getBkUserid() {
		return bkUserid;
	}

	public void setBkUserid(String bkUserid) {
		this.bkUserid = bkUserid;
	}

	public int getBkProdidx() {
		return bkProdidx;
	}

	public void setBkProdidx(int bkProdidx) {
		this.bkProdidx = bkProdidx;
	}

	public int getBkQuantity() {
		return bkQuantity;
	}

	public void setBkQuantity(int bkQuantity) {
		this.bkQuantity = bkQuantity;
	}

	public String getBkRegdate() {
		return bkRegdate;
	}

	public void setBkRegdate(String bkRegdate) {
		this.bkRegdate = bkRegdate;
	}

	@Override
	public String toString() {
		return "BasketDTO [bkIdx=" + bkIdx + ", bkUserid=" + bkUserid + ", bkProdidx=" + bkProdidx + ", bkQuantity="
				+ bkQuantity + ", bkRegdate=" + bkRegdate + "]";
	}
}
