package com.kurly.order;

public class ClaimDTO {
	
	private Long cIdx; // 클레임 번호
	private Long cOrderidx; // 주문번호. OrderDetailDTO. foreign key
	private Long cClaimtype; // 클레임유형 : 취소(1)/교환(2)/반품(3)
	private String cClaimwhy; // 사유
	private String cClaimdate; // 요청일시
	private String cState; // 처리상태 : 취소요청/취소완료/취소거부
	private String cStatedate; // 처리일시
	private String cRefusalwhy; // 거부사유
	
	public Long getcIdx() {
		return cIdx;
	}
	public void setcIdx(Long cIdx) {
		this.cIdx = cIdx;
	}
	public Long getcOrderidx() {
		return cOrderidx;
	}
	public void setcOrderidx(Long cOrderidx) {
		this.cOrderidx = cOrderidx;
	}
	public Long getcClaimtype() {
		return cClaimtype;
	}
	public void setcClaimtype(Long cClaimtype) {
		this.cClaimtype = cClaimtype;
	}
	public String getcClaimwhy() {
		return cClaimwhy;
	}
	public void setcClaimwhy(String cClaimwhy) {
		this.cClaimwhy = cClaimwhy;
	}
	public String getcClaimdate() {
		return cClaimdate;
	}
	public void setcClaimdate(String cClaimdate) {
		this.cClaimdate = cClaimdate;
	}
	public String getcState() {
		return cState;
	}
	public void setcState(String cState) {
		this.cState = cState;
	}
	public String getcStatedate() {
		return cStatedate;
	}
	public void setcStatedate(String cStatedate) {
		this.cStatedate = cStatedate;
	}
	public String getcRefusalwhy() {
		return cRefusalwhy;
	}
	public void setcRefusalwhy(String cRefusalwhy) {
		this.cRefusalwhy = cRefusalwhy;
	}
	
	@Override
	public String toString() {
		return "ClaimDTO [cIdx=" + cIdx + ", cOrderidx=" + cOrderidx + ", cClaimtype=" + cClaimtype + ", cClaimwhy="
				+ cClaimwhy + ", cClaimdate=" + cClaimdate + ", cState=" + cState + ", cStatedate=" + cStatedate
				+ ", cRefusalwhy=" + cRefusalwhy + "]";
	}
}
