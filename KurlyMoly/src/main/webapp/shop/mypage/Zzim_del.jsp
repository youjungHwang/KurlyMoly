<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean class="com.kurly.product.ProductDAO" id="daoPro" />
<%
	if (request.getParameter("idx") == null || request.getParameter("idx").equals("")) {
%>
	<script>
		alert('잘못된 접근입니다.');
		location.href = './mypage_Zzim.jsp';
	</script>
<%
	} else {
		// 제대로 된 경우
		int idx = Integer.parseInt(request.getParameter("idx"));
		if (daoPro.delete(idx)) {
%>
		<script>
			location.href = './mypage_Zzim.jsp';
		</script>
<%
		} else {
%>
			<script>
				history.back();
			</script>
<%
		}
	}
%>