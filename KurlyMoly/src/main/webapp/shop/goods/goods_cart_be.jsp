<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.product.ProductDAO"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<Integer> product = (ArrayList<Integer>)session.getAttribute("productList"); // 상품번호를 가져와 제품 정보 띄우기
	ProductDAO pDAO = new ProductDAO();
	ArrayList list = new ArrayList<>();
	
	String goodsTitle = ""; // 상품명
	String goodsSubTitle = ""; // 상품설명 (회색글씨)
	String userAddress = ""; // 배송지
	int goodsPrice = 0; // 상품금액(정가)
	int discPrice = 0; // 상품할인금액
	int count = 0; // 제품수량
	int quickPrice = 2500; // 배송비
	int freeQuick = 40000; // 4만원 이상 주문 시 무료배송 (계산식)
	int totalPrice = 0; // 최종결제금액
	int reservePrice = 0; // 적립금 (계산식)
	
	if(product != null) {
		for (int i = 0; i < product.size(); i++) {
			list.add(pDAO.cartProduct(product.get(i)));
		}
	}
	
	request.setAttribute("proList", list);
	response.sendRedirect("goods_cart.jsp");
	
	System.out.println(list);

%>