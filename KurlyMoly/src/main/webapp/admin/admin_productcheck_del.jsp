<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean class="com.kurly.product.ProductDAO" id="daoPro" />
<%
	String[] check = request.getParameterValues("selectrows");
	
	try {
		for (int i = 0; i < check.length; i++) {
			out.println(check[i]);
			int checkamount = (Integer.parseInt(check[i]));
	
			if (daoPro.admindelete(checkamount)) {
%>
			<script>
				location.href = './admin_productcheck.jsp';
			</script>

<%
			}
		}
	} catch (Exception e) {
	e.printStackTrace();
%>
<script>
	alert('선택한 항목이 없습니다!')
	history.back();
</script>
<%
}
%>