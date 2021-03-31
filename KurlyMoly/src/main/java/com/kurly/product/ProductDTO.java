package com.kurly.product;
// 혜정님 파일 붙여넣기

public class ProductDTO {
	
	private Long pIdx; // 상품번호
	private String pCategory1; // 카테고리 대
	private String pCategory2; // 카테고리 소
	private String pTitle; // 상품명
	private String pSubtitle; // 상품슬로건
	private String pBrand; // 브랜드명
	private Integer pPrice; // 가격
	private Integer pDiscprice; // 할인액 ( 45,000원 중 5,000원)
	private Integer pPoint; // 적립금
	private Integer pStock; // 재고수량
	private String pDeliverytype; // 배송타입 : 샛별배송/택배배송/기타
	private String pPackingtype; // 보관타입 : 냉동/냉장/상온/기타
	private String pSalesUnit; // 판매단위
	private String pWeight; // 중량
	private String pOrigin; // 원산지
	private String pMainImg; // 대표이미지(파일명)
	private String pDescription; // 상세설명
	private String pSaleState; // 판매상태 : 판매대기/판매중/품절/판매중지/판매종료
	private String pDisplay; // 전시상태 : 전시중/전시중단
	private String pRegdate; // 등록시간
	
	public Long getpIdx() {
		return pIdx;
	}
	public void setpIdx(Long pIdx) {
		this.pIdx = pIdx;
	}
	public String getpCategory1() {
		return pCategory1;
	}
	public void setpCategory1(String pCategory1) {
		this.pCategory1 = pCategory1;
	}
	public String getpCategory2() {
		return pCategory2;
	}
	public void setpCategory2(String pCategory2) {
		this.pCategory2 = pCategory2;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpSubtitle() {
		return pSubtitle;
	}
	public void setpSubtitle(String pSubtitle) {
		this.pSubtitle = pSubtitle;
	}
	public String getpBrand() {
		return pBrand;
	}
	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}
	public Integer getpPrice() {
		return pPrice;
	}
	public void setpPrice(Integer pPrice) {
		this.pPrice = pPrice;
	}
	public Integer getpDiscprice() {
		return pDiscprice;
	}
	public void setpDiscprice(Integer pDiscprice) {
		this.pDiscprice = pDiscprice;
	}
	public Integer getpPoint() {
		return pPoint;
	}
	public void setpPoint(Integer pPoint) {
		this.pPoint = pPoint;
	}
	public Integer getpStock() {
		return pStock;
	}
	public void setpStock(Integer pStock) {
		this.pStock = pStock;
	}
	public String getpDeliverytype() {
		return pDeliverytype;
	}
	public void setpDeliverytype(String pDeliverytype) {
		this.pDeliverytype = pDeliverytype;
	}
	public String getpPackingtype() {
		return pPackingtype;
	}
	public void setpPackingtype(String pPackingtype) {
		this.pPackingtype = pPackingtype;
	}
	public String getpSalesUnit() {
		return pSalesUnit;
	}
	public void setpSalesUnit(String pSalesUnit) {
		this.pSalesUnit = pSalesUnit;
	}
	public String getpWeight() {
		return pWeight;
	}
	public void setpWeight(String pWeight) {
		this.pWeight = pWeight;
	}
	public String getpOrigin() {
		return pOrigin;
	}
	public void setpOrigin(String pOrigin) {
		this.pOrigin = pOrigin;
	}
	public String getpMainImg() {
		return pMainImg;
	}
	public void setpMainImg(String pMainImg) {
		this.pMainImg = pMainImg;
	}
	public String getpDescription() {
		return pDescription;
	}
	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}
	public String getpSaleState() {
		return pSaleState;
	}
	public void setpSaleState(String pSaleState) {
		this.pSaleState = pSaleState;
	}
	public String getpDisplay() {
		return pDisplay;
	}
	public void setpDisplay(String pDisplay) {
		this.pDisplay = pDisplay;
	}
	public String getpRegdate() {
		return pRegdate;
	}
	public void setpRegdate(String pRegdate) {
		this.pRegdate = pRegdate;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [pIdx=" + pIdx + ", pCategory1=" + pCategory1 + ", pCategory2=" + pCategory2 + ", pTitle="
				+ pTitle + ", pSubtitle=" + pSubtitle + ", pBrand=" + pBrand + ", pPrice=" + pPrice + ", pDiscprice="
				+ pDiscprice + ", pPoint=" + pPoint + ", pStock=" + pStock + ", pDeliverytype=" + pDeliverytype
				+ ", pPackingtype=" + pPackingtype + ", pSalesUnit=" + pSalesUnit + ", pWeight=" + pWeight
				+ ", pOrigin=" + pOrigin + ", pMainImg=" + pMainImg + ", pDescription=" + pDescription + ", pSaleState="
				+ pSaleState + ", pDisplay=" + pDisplay + ", pRegdate=" + pRegdate + "]";
	}

}
