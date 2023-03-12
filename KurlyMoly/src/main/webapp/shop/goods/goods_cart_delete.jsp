<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean class="com.kurly.order.BasketDAO" id="dao" />
<%
        if(request.getParameter("idx") == null || request.getParameter("idx").equals("")){
        	%>
			<script>
            	alert('잘못된 접근입니다.');
                location.href='./goods_cart.jsp'; 
            </script>
<% 
		} else {
         // 제대로 된 경우
        	int idx = Integer.parseInt(request.getParameter("idx"));
			if(dao.delete(idx)) {
			%>
			<script>
         			location.href='./goods_cart.jsp';
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