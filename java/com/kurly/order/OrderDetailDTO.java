package com.kurly.order;

public class OrderDetailDTO {

	private int odIdx; // 주문내역번호
	private int odOrderidx; // 주문번호 // OrderDTO. foreign key
	private int odProductidx; // 상품번호 // ProductDTO. foreign key
	private int odQuantity; // 수량
	private String odDeliverytype; // 배송구분 : 냉동/냉장/상온/기타
	private String odShipnumber; // 송장번호 // OrderDTO. foreign key
	private String odShipstart; // 배송시작일시
	private String odShipdone; // 배송완료일시
	private String odShipstate; // 처리상태 : 미확인/상품준비중/배송중/배송완료/구매확정
	private String odRenewdate; // 처리일시

	public int getOdIdx() {
		return odIdx;
	}

	public void setOdIdx(int odIdx) {
		this.odIdx = odIdx;
	}

	public int getOdOrderidx() {
		return odOrderidx;
	}

	public void setOdOrderidx(int odOrderidx) {
		this.odOrderidx = odOrderidx;
	}

	public int getOdProductidx() {
		return odProductidx;
	}

	public void setOdProductidx(int odProductidx) {
		this.odProductidx = odProductidx;
	}

	public int getOdQuantity() {
		return odQuantity;
	}

	public void setOdQuantity(int odQuantity) {
		this.odQuantity = odQuantity;
	}

	public String getOdDeliverytype() {
		return odDeliverytype;
	}

	public void setOdDeliverytype(String odDeliverytype) {
		this.odDeliverytype = odDeliverytype;
	}

	public String getOdShipnumber() {
		return odShipnumber;
	}

	public void setOdShipnumber(String odShipnumber) {
		this.odShipnumber = odShipnumber;
	}

	public String getOdShipstart() {
		return odShipstart;
	}

	public void setOdShipstart(String odShipstart) {
		this.odShipstart = odShipstart;
	}

	public String getOdShipdone() {
		return odShipdone;
	}

	public void setOdShipdone(String odShipdone) {
		this.odShipdone = odShipdone;
	}

	public String getOdShipstate() {
		return odShipstate;
	}

	public void setOdShipstate(String odShipstate) {
		this.odShipstate = odShipstate;
	}

	public String getOdRenewdate() {
		return odRenewdate;
	}

	public void setOdRenewdate(String odRenewdate) {
		this.odRenewdate = odRenewdate;
	}

	@Override
	public String toString() {
		return "OrderDetailDTO [odIdx=" + odIdx + ", odOrderidx=" + odOrderidx + ", odProductidx=" + odProductidx
				+ ", odQuantity=" + odQuantity + ", odDeliverytype=" + odDeliverytype + ", odShipnumber=" + odShipnumber
				+ ", odShipstart=" + odShipstart + ", odShipdone=" + odShipdone + ", odShipstate=" + odShipstate
				+ ", odRenewdate=" + odRenewdate + "]";
	}

}
