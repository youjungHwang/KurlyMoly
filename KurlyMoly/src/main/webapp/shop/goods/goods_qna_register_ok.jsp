<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.kurly.inquiry.PinquiryDAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	try{
		
		Integer prodidx = Integer.parseInt(request.getParameter("prodidx"));
		String userid = request.getParameter("userid");
		String issecret = request.getParameter("issecret");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isreply = request.getParameter("isreply");
		
		
		System.out.println(prodidx);
		System.out.println(userid);
		System.out.println(issecret);
		System.out.println(title);
		System.out.println(isreply);
		
	
			if (dao.insertData(prodidx, userid, issecret, title, content, isreply)) {
				%>
				<script>
				alert("상품문의가 등록되었습니다.");
				location.href= "./goods_detail.jsp?p_idx=" + <%=prodidx %>;
				</script>	
				<%
			} else {
				out.print("<script>alert('에러!!'); history.back();</script>");
			} 

	} catch(Exception e) {
		e.printStackTrace();
	}
%>
