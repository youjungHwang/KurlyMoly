<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.product.ProductDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
	ArrayList<Integer> productList = (ArrayList<Integer>)session.getAttribute("productList");

	session.setAttribute("p_idx", p_idx);

	int p_idx =  Integer.parseInt(request.getParameter("p_idx"));
	
	if (session.getAttribute("productList") == null) {
		productList = new ArrayList<Integer>();
	}
	productList.add(p_idx);
	session.setAttribute("productList", productList);

	System.out.println(p_idx);
	System.out.println(productList);
%>
<script>
	alert("상품을 장바구니에 담았습니다.");
	history.back();
</script>