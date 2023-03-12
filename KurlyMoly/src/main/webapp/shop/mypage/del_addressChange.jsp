<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   if (session.getAttribute("m_id") == null) {
   } else {
      // editinfo_myinfo.jsp로 부터 데이터를 전달 받음.
      request.setCharacterEncoding("UTF-8");
      String da_memidx = request.getParameter("da_memidx");
      String addrSub =request.getParameter("addrSub");
      String receiverName = request.getParameter("receiverName");
      String receiverPhone = request.getParameter("receiverPhone");
         
      //DB 연결
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
            // 비밀번호가 맞는지 체크
            sql = "update tb_daddress set da_receiver=?, da_tel=?, da_address=?  where da_memidx=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,receiverName);
            pstmt.setString(2,receiverPhone);
            pstmt.setString(3,addrSub);
            pstmt.setString(4,da_memidx);
            pstmt.executeUpdate();
%>
	<script>
      alert('배송지 정보가 수정되었습니다.');
      self.close();
   </script>
<%
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
   }
%>