<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	// 로그인 세션 체크
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	
	String sql = " ";
	String url = "jdbc:mysql://localhost:3306/jspstudy";
	String uid = "root";
	String upw = "12345678";
	
	try{
		Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			sql = "select mem_idx,mem_name from tb_member where mem_userid=? and mem_userpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//로그인 성공
				session.setAttribute("userid", userid);
				session.setAttribute("username", rs.getString("mem_name"));
				session.setAttribute("useridx", rs.getString("mem_idx"));
%>
				<script>
				alert('로그인 되었습니다.');
				location.href = 'info.jsp';	
				</script>
<%
			}else{
				//로그인 실패
%>
				<script>
					alert('아이디 또는 비밀번호를 확인하세요');
					history.back();
				</script>
				
<%
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//admin /1234
	if(userid.equals("admin") && userpw.equals("1234")){
		//로그인 성공
		session.setAttribute("userid", userid);

%>
	<script>
	alert('로그인 되었습니다.');
	location.href = 'info.jsp';	
	</script>
<%
	}else{
		//로그인 실패 
%>

	<script>
		alert('아이디 또는 비밀번호를 확인하세요');
		history.back();
	</script>
	
<%
	}
%>
	
//info.jsp로 부터 데이터를 전달 받음
	
	//db연결
	
	//비밀번호가 맞는지 체크
	
	//update 문 실행
	
	//info.jsp 로 다시 이동