<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<jsp:useBean class="com.kurly.member.LikeDTO" id="basket"/>
<jsp:useBean class="com.kurly.member.LikeDAO" id="dao"/>
<%
	request.setCharacterEncoding("UTF-8");
	int p_idx = Integer.parseInt(String.valueOf(request.getParameter("p_idx")));

	try {
		String userid = (String) session.getAttribute("m_id");
		
		System.out.println(userid);
		System.out.println(p_idx);
		
		if (dao.insertLike(userid, p_idx)) {
%>
			<script>
				alert("찜 리스트에 추가했습니다.");
				history.back();
			</script>
<%
		} else {
%>
			<script>
				alert('찜 하기 실패!');
				history.back();
			</script>
<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>