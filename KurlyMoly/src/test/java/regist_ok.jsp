<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="com.kurly.member.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member"class="com.kurly.member.MemberDTO" />
<jsp:useBean id="dao" class="com.kurly.member.MemberDAO" />
<jsp:setProperty property="*" name="member"/> <!-- 필드명과 name이 일치해야 함 -->
<%
   if(dao.join(member) == 1){
%>
<script>
      alert('회원가입이 완료되었습니다.');
      location.href='login.jsp';
</script>
<%
   } else {
%>
<script>
      alert('회원가입이 실패되었습니다.');
      history.back();
</script>
<%
   }
%>