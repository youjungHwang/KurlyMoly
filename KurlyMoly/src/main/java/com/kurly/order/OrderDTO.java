package com.kurly.order;

public class OrderDTO {

	private int oIdx; // 주문번호
	private String oUserid; // 주문자아이디
	private String oOrderer; // 주문자명
	private String oReceiver; // 수취인명
	private String oTel; // 전화번호
	private String oZipcode; // 우편번호
	private String oAddress1; // 주소1
	private String oAddress2; // 주소2
	private String oAddress3; // 주소3
	private String oAddress4; // 수령장소
	private int oProdamount; // 상품금액
	private int oDiscount; // 상품할인금액
	private int oUsecoupon; // 쿠폰할인금액
	private int oUsepoint; // 적립금사용액
	private int oDeliveryfee; // 배송비
	private int oAmountpaid; // 결제금액
	private int oAddpoint; // 적립예정금액
	private String oPaidtype; // 결제방식
	private String oPaiddate; // 결제일시
	private String oShipnumber; // 송장번호
	private String oShipstart; // 배송시작일시
	private String oShipdone; // 배송완료일시
	private String oShipstate; // 처리상태 : 미확인/상품준비중/배송중/배송완료/구매확정
	private String oRenewdate; // 처리일시

	public int getoIdx() {
		return oIdx;
	}

	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}

	public String getoUserid() {
		return oUserid;
	}

	public void setoUserid(String oUserid) {
		this.oUserid = oUserid;
	}

	public String getoOrderer() {
		return oOrderer;
	}

	public void setoOrderer(String oOrderer) {
		this.oOrderer = oOrderer;
	}

	public String getoReceiver() {
		return oReceiver;
	}

	public void setoReceiver(String oReceiver) {
		this.oReceiver = oReceiver;
	}

	public String getoTel() {
		return oTel;
	}

	public void setoTel(String oTel) {
		this.oTel = oTel;
	}

	public String getoZipcode() {
		return oZipcode;
	}

	public void setoZipcode(String oZipcode) {
		this.oZipcode = oZipcode;
	}

	public String getoAddress1() {
		return oAddress1;
	}

	public void setoAddress1(String oAddress1) {
		this.oAddress1 = oAddress1;
	}

	public String getoAddress2() {
		return oAddress2;
	}

	public void setoAddress2(String oAddress2) {
		this.oAddress2 = oAddress2;
	}

	public String getoAddress3() {
		return oAddress3;
	}

	public void setoAddress3(String oAddress3) {
		this.oAddress3 = oAddress3;
	}

	public String getoAddress4() {
		return oAddress4;
	}

	public void setoAddress4(String oAddress4) {
		this.oAddress4 = oAddress4;
	}

	public int getoProdamount() {
		return oProdamount;
	}

	public void setoProdamount(int oProdamount) {
		this.oProdamount = oProdamount;
	}

	public int getoDiscount() {
		return oDiscount;
	}

	public void setoDiscount(int oDiscount) {
		this.oDiscount = oDiscount;
	}

	public int getoUsecoupon() {
		return oUsecoupon;
	}

	public void setoUsecoupon(int oUsecoupon) {
		this.oUsecoupon = oUsecoupon;
	}

	public int getoUsepoint() {
		return oUsepoint;
	}

	public void setoUsepoint(int oUsepoint) {
		this.oUsepoint = oUsepoint;
	}

	public int getoDeliveryfee() {
		return oDeliveryfee;
	}

	public void setoDeliveryfee(int oDeliveryfee) {
		this.oDeliveryfee = oDeliveryfee;
	}

	public int getoAmountpaid() {
		return oAmountpaid;
	}

	public void setoAmountpaid(int oAmountpaid) {
		this.oAmountpaid = oAmountpaid;
	}

	public int getoAddpoint() {
		return oAddpoint;
	}

	public void setoAddpoint(int oAddpoint) {
		this.oAddpoint = oAddpoint;
	}

	public String getoPaidtype() {
		return oPaidtype;
	}

	public void setoPaidtype(String oPaidtype) {
		this.oPaidtype = oPaidtype;
	}

	public String getoPaiddate() {
		return oPaiddate;
	}

	public void setoPaiddate(String oPaiddate) {
		this.oPaiddate = oPaiddate;
	}

	public String getoShipnumber() {
		return oShipnumber;
	}

	public void setoShipnumber(String oShipnumber) {
		this.oShipnumber = oShipnumber;
	}

	public String getoShipstart() {
		return oShipstart;
	}

	public void setoShipstart(String oShipstart) {
		this.oShipstart = oShipstart;
	}

	public String getoShipdone() {
		return oShipdone;
	}

	public void setoShipdone(String oShipdone) {
		this.oShipdone = oShipdone;
	}

	public String getoShipstate() {
		return oShipstate;
	}

	public void setoShipstate(String oShipstate) {
		this.oShipstate = oShipstate;
	}

	public String getoRenewdate() {
		return oRenewdate;
	}

	public void setoRenewdate(String oRenewdate) {
		this.oRenewdate = oRenewdate;
	}

	@Override
	public String toString() {
		return "OrderDTO [oIdx=" + oIdx + ", oUserid=" + oUserid + ", oOrderer=" + oOrderer + ", oReceiver=" + oReceiver
				+ ", oTel=" + oTel + ", oZipcode=" + oZipcode + ", oAddress1=" + oAddress1 + ", oAddress2=" + oAddress2
				+ ", oAddress3=" + oAddress3 + ", oAddress4=" + oAddress4 + ", oProdamount=" + oProdamount
				+ ", oDiscount=" + oDiscount + ", oUsecoupon=" + oUsecoupon + ", oUsepoint=" + oUsepoint
				+ ", oDeliveryfee=" + oDeliveryfee + ", oAmountpaid=" + oAmountpaid + ", oAddpoint=" + oAddpoint
				+ ", oPaidtype=" + oPaidtype + ", oPaiddate=" + oPaiddate + ", oShipnumber=" + oShipnumber
				+ ", oShipstart=" + oShipstart + ", oShipdone=" + oShipdone + ", oShipstate=" + oShipstate
				+ ", oRenewdate=" + oRenewdate + "]";
	}

}
