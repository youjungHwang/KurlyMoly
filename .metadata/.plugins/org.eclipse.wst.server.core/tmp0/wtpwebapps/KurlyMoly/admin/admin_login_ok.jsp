<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	// admin / 1234
	if(userid.equals("admin") && userpw.equals("1234")){
		// 로그인 성공
	Cookie cookie = new Cookie("userid", userid);
	cookie.setMaxAge(60*20);	// 20분동안 쿠키 유지
	response.addCookie(cookie);
%>
	<script>
		alert('로그인 되었습니다');
		location.href = 'admin_dashboard.jsp';
	</script>
<%
	}else{
		// 로그인 실패
%>
	<script>
		alert('아이디 또는 비밀번호를 확인하세요');
		history.back();
	</script>
<%
	}
%>
