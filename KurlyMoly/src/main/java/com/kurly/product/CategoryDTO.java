package com.kurly.product;

public class CategoryDTO {
	Integer cateIdx;
	String cateName1;
	String cateName1Kor;
	String cateName2;
	String cateName2Kor;

	public Integer getCateIdx() {
		return cateIdx;
	}

	public void setCateIdx(Integer cateIdx) {
		this.cateIdx = cateIdx;
	}

	public String getCateName1() {
		return cateName1;
	}

	public void setCateName1(String cateName1) {
		this.cateName1 = cateName1;
	}

	public String getCateName1Kor() {
		return cateName1Kor;
	}

	public void setCateName1Kor(String cateName1Kor) {
		this.cateName1Kor = cateName1Kor;
	}

	public String getCateName2() {
		return cateName2;
	}

	public void setCateName2(String cateName2) {
		this.cateName2 = cateName2;
	}

	public String getCateName2Kor() {
		return cateName2Kor;
	}

	public void setCateName2Kor(String cateName2Kor) {
		this.cateName2Kor = cateName2Kor;
	}

	@Override
	public String toString() {
		return "CategoryDTO [cateIdx=" + cateIdx + ", cateName1=" + cateName1 + ", cateName1Kor=" + cateName1Kor
				+ ", cateName2=" + cateName2 + ", cateName2Kor=" + cateName2Kor + "]";
	}
}
