<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="com.kurly.member.MemberDTO" id="member"/>
<jsp:useBean class="com.kurly.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>
<%
	if (dao.info(member) != null) {
		session.setAttribute("srch_name", member.getmName()); // 이름
		session.setAttribute("srch_id", member.getmUserid()); // 아이디
		session.setAttribute("srch_mail", member.getmEmail()); // 이메일
		session.setAttribute("m_idx", member.getmIdx());
%>	
		<script>
			location.href='find_pwd_ok.jsp';
		</script>
<%
	} else {
%>
		<script>
			alert('일치하는 정보가 없습니다.');
			history.back();
		</script>
<%
	}
%>