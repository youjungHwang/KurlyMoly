<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="com.kurly.member.MemberDTO" id="member"/>
<jsp:useBean class="com.kurly.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>
<%
	if (dao.login(member) != null) {
		session.setAttribute("m_id", member.getmUserid());
		session.setAttribute("password", member.getmPassword());
		session.setAttribute("m_idx", member.getmIdx());
%>	
		<script>
			alert('로그인 되었습니다');
			location.href='index.jsp';
		</script>
<%
	} else {
%>
		<script>
			alert('아이디 또는 비밀번호를 오류입니다.');
			history.back();
		</script>
<%
	}
%>