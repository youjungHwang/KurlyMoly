<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="com.kurly.member.MemberDTO" id="member"/>
<jsp:useBean class="com.kurly.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="frmMember"/>
<%
	if(dao.join(member) == 1) {
%>
	<script>
		alert('회원가입 완료되었습니다.');
		location.href='login.jsp';
	</script>
<%
	} else {
%>
	<script>
		alert('회원가입 실패되었습니다.');
		history.back();
	</script>
<%
	}
%>