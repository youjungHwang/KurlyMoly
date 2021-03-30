<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("m_id");
	String userpw = request.getParameter("password");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mysql://localhost:3306/kurlymoly";
	String uid = "root";
	String upw = "1234";
	
	try {
		Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
		conn = DriverManager.getConnection(url, uid, upw);
		if (conn != null) {
			sql = "SELECT m_idx, m_userid, m_name FROM tb_member WHERE m_userid=? AND m_password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 로그인 성공
				// 3개의 세션변수 만들기
				session.setAttribute("m_id", userid);
				session.setAttribute("m_name", rs.getString("m_name"));
				session.setAttribute("m_idx", rs.getString("m_idx"));
%>
				<script>
					alert('로그인 되었습니다');
					location.href='../../index.jsp';
				</script>
<%
			} else { // 로그인 실패
%>
			<script>
				alert('아이디 또는 비밀번호를 오류입니다.');
				history.back(); // 이전 페이지로 돌아감 | cash가 남아있음
			</script>
<%
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>