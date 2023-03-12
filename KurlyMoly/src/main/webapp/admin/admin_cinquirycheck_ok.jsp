<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<jsp:useBean id="member"class="com.kurly.member.MemberDTO" />
col

    <% CinquiryDAO.searchList(String col, String word); 
    try{
    		String col = SearchDTO.checkNull(request.getParameter("col"));
            String word = SearchDTO.checkNull(request.getParameter("word"));
            ArrayList<Pds3VO> list = dao.list(col, word);
    		}catch(Exception e){
    		e.printStackTrace();
    	}
    %>
	 
	 
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="com.kurly.inquiry.CinquiryDAO" />

 <% if(== 1){
	 
 } ;
		
		
		return true;
		%>

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