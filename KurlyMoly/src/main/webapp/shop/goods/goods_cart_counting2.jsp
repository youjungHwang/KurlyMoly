<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<jsp:useBean class="com.kurly.order.BasketDAO" id="daoBas" />
<%
        if(request.getParameter("idx") == null || request.getParameter("idx").equals("") || request.getParameter("num") == null ){
        	System.out.println("************** zzzz");
        	System.out.println(request.getParameter("idx"));
        	System.out.println(request.getParameter("num"));
        	
        	%>
			<script>
            	alert('잘못된 접근입니다.');
                location.href='./goods_cart.jsp'; 
            </script>
<% 
		} else {
			System.out.println(request.getParameter("idx"));
        	System.out.println(request.getParameter("num"));
			
			if(Integer.parseInt(request.getParameter("num")) > 1){
				int idx = Integer.parseInt(request.getParameter("idx"));
	        	int amount = Integer.parseInt(request.getParameter("num")) - 1;
	        	System.out.println(amount+"개로 변환");
				if(daoBas.amountUpdate(amount,idx)) {
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
			}else{
				%>
				<script>
	            	
	                location.href='./goods_cart.jsp'; 
	            </script>
				<% 
				
			}
         // 제대로 된 경우
	        	
   }   
%>