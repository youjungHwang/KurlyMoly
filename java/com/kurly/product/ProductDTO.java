package com.kurly.product;

public class ProductDTO {

	private int idx;
	private String category1;
	private String category2; 
	private String title; 
	private String subtitle; 
	private String brand; 
	private int price; 
	private int discprice; 
	private int point;
	private int stock;
	private String deliverytype;
	private String packingtype;
	private String salesunit;
	private String weight;
	private String origin;
	private String imgname;
	private String imgpath;
	private String description;
	private String detailimgname;
	private String detailimgpath;
	private String salestate;
	private String isdisplay;
	private String regdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscprice() {
		return discprice;
	}
	public void setDiscprice(int discprice) {
		this.discprice = discprice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getDeliverytype() {
		return deliverytype;
	}
	public void setDeliverytype(String deliverytype) {
		this.deliverytype = deliverytype;
	}
	public String getPackingtype() {
		return packingtype;
	}
	public void setPackingtype(String packingtype) {
		this.packingtype = packingtype;
	}
	public String getSalesunit() {
		return salesunit;
	}
	public void setSalesunit(String salesunit) {
		this.salesunit = salesunit;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDetailimgname() {
		return detailimgname;
	}
	public void setDetailimgname(String detailimgname) {
		this.detailimgname = detailimgname;
	}
	public String getDetailimgpath() {
		return detailimgpath;
	}
	public void setDetailimgpath(String detailimgpath) {
		this.detailimgpath = detailimgpath;
	}
	public String getSalestate() {
		return salestate;
	}
	public void setSalestate(String salestate) {
		this.salestate = salestate;
	}
	public String getIsdisplay() {
		return isdisplay;
	}
	public void setIsdisplay(String isdisplay) {
		this.isdisplay = isdisplay;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [idx=" + idx + ", category1=" + category1 + ", category2=" + category2 + ", title=" + title
				+ ", subtitle=" + subtitle + ", brand=" + brand + ", price=" + price + ", discprice=" + discprice
				+ ", point=" + point + ", stock=" + stock + ", deliverytype=" + deliverytype + ", packingtype="
				+ packingtype + ", salesunit=" + salesunit + ", weight=" + weight + ", origin=" + origin + ", imgname="
				+ imgname + ", imgpath=" + imgpath + ", description=" + description + ", detailimgname=" + detailimgname
				+ ", detailimgpath=" + detailimgpath + ", salestate=" + salestate + ", isdisplay=" + isdisplay
				+ ", regdate=" + regdate + "]";
	}


	
	
	
	
}
