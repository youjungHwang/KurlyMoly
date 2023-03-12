package com.kurly.member;

public class CouponDTO {
	
	private Integer cpIdx; // 쿠폰발급번호
	private Integer cpMemidx; // 회원번호
	private Integer cpCode; // 쿠폰코드
	private String cpName; // 쿠폰명
	private String cpDetails; // 쿠폰발급사유
	private Integer cpAmount; // 쿠폰 금액
	private String cpRegdate; // 발급일시
	private String cpDuedate; // 만료일시
	private Integer cpIsused; // 사용여부 (0 미사용/1 사용)
	
	public Integer getCpIdx() {
		return cpIdx;
	}
	public void setCpIdx(Integer cpIdx) {
		this.cpIdx = cpIdx;
	}
	public Integer getCpMemidx() {
		return cpMemidx;
	}
	public void setCpMemidx(Integer cpMemidx) {
		this.cpMemidx = cpMemidx;
	}
	public Integer getCpCode() {
		return cpCode;
	}
	public void setCpCode(Integer cpCode) {
		this.cpCode = cpCode;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getCpDetails() {
		return cpDetails;
	}
	public void setCpDetails(String cpDetails) {
		this.cpDetails = cpDetails;
	}
	public Integer getCpAmount() {
		return cpAmount;
	}
	public void setCpAmount(Integer cpAmount) {
		this.cpAmount = cpAmount;
	}
	public String getCpRegdate() {
		return cpRegdate;
	}
	public void setCpRegdate(String cpRegdate) {
		this.cpRegdate = cpRegdate;
	}
	public String getCpDuedate() {
		return cpDuedate;
	}
	public void setCpDuedate(String cpDuedate) {
		this.cpDuedate = cpDuedate;
	}
	public Integer getCpIsused() {
		return cpIsused;
	}
	public void setCpIsused(Integer cpIsused) {
		this.cpIsused = cpIsused;
	}
	
	@Override
	public String toString() {
		return "CouponDTO [cpIdx=" + cpIdx + ", cpMemidx=" + cpMemidx + ", cpCode=" + cpCode + ", cpName=" + cpName
				+ ", cpDetails=" + cpDetails + ", cpAmount=" + cpAmount + ", cpRegdate=" + cpRegdate + ", cpDuedate="
				+ cpDuedate + ", cpIsused=" + cpIsused + "]";
	}
	
}
