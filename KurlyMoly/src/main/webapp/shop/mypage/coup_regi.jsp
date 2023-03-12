<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   if (session.getAttribute("m_id") == null) {
   } else {
      // editinfo_myinfo.jsp로 부터 데이터를 전달 받음.
      request.setCharacterEncoding("UTF-8");
      String idx = request.getParameter("idx");
      String coupon_code =request.getParameter("coupon_code");


      //DB 연결
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
   
      String sql = "";
      String url = "jdbc:mysql://localhost:3306/kurlymoly";
      String uid = "root";
      String upw = "1234";
      int isUpadated = 0;
      
      try{
         Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
         conn = DriverManager.getConnection(url, uid, upw);
         if(conn != null){
            // 비밀번호가 맞는지 체크
            sql = "update tb_coupon set cp_memidx=? where cp_code=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,idx);
            pstmt.setString(2,coupon_code);
            isUpadated = pstmt.executeUpdate();
           	if(isUpadated !=0){

%>
   <script>
      alert('쿠폰이 등록되었습니다.');
      location.href='./mypage_coupon.jsp';
   </script>

<%
           		}
        }
            %>
            <script>
               alert('등록 실패했습니다.');
               history.back();
            </script>
         <%
         } catch(Exception e) {
            e.printStackTrace();
         }
   }
%>