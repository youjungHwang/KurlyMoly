<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.kurly.notice.NoticeDTO" id="notice"/>
<jsp:useBean class="com.kurly.notice.NoticeDAO" id="dao"/>
<jsp:setProperty property="*" name="notice"/> <!-- 필드명과 name이 일치해야 함 -->
<%
   if(dao.noticeadd(notice) == 1){
%>
<script>
      alert('공지가 등록되었습니다.');
      location.href='admin_noticeadd.jsp';
</script>
<%
   } else {
%>
<script>
      alert('공지 등록을 실패했습니다.');
      history.back();
</script>
<%
   }
%>