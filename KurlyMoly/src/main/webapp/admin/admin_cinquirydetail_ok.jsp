<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.inquiry.CinquiryDAO" %>

<%
	CinquiryDAO dao = new CinquiryDAO();

	try{
		String ciq_idx = request.getParameter("ciq_idx");
		String reply = request.getParameter("reply");
		String isreply = request.getParameter("isreply");
		
	
	if(dao.insertReply(reply, isreply, ciq_idx)){
	%>
	<script>
	alert('답변이 등록되었습니다.');
	location.href='view.jsp?b_idx=<%=ciq_idx%>';
	</script>
	<% }
	
	}catch(Exception e){
		e.printStackTrace();
	} 
	%>