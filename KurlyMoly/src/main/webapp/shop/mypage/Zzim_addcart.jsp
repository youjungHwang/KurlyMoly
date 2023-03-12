<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean class="com.kurly.order.BasketDTO" id="basket" />
<jsp:useBean class="com.kurly.order.BasketDAO" id="dao" />
<%
	request.setCharacterEncoding("UTF-8");
	int p_idx = Integer.parseInt(String.valueOf(request.getParameter("idx")));

	try {
		String bkUserid = (String)session.getAttribute("m_id");
		int bkQuantity = 1;
		
		System.out.println(bkUserid);
		System.out.println(p_idx);
		System.out.println(bkQuantity);
		
		if (dao.insertBasket(bkUserid, p_idx, bkQuantity)) {
%>
<script>
				alert("상품을 장바구니에 담았습니다.");
				history.back();
			</script>
<%
		} else {
%>
<script>
				alert('장바구니 담기 실패');
				history.back();
			</script>
<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>