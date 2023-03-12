<%@ page import="java.time.LocalDateTime"%>
<%@ page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   if(session.getAttribute("m_id") == null) {
%>
   <script>
      alert('로그인 후 이용하세요');
      location.href='../member/login.jsp';
   </script>
<%
   } else {
      request.setCharacterEncoding("UTF-8");
      String userId = (String)session.getAttribute("m_id");
      String userPw = request.getParameter("password");
      Integer m_state = 1;
      String[] m_withdrawwhy =request.getParameterValues("outComplain");
      String why= "";
      String m_withdrawwhy2 = request.getParameter("outComplain_text");

      String m_withdrawdate =  LocalDateTime.now().toString();
      for (String t : m_withdrawwhy) {
			why += t;
		}

      //DB 연결
      Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
      
         String sql = "";
         String url = "jdbc:mysql://localhost:3306/kurlymoly";
         String uid = "root";
         String upw = "1234";
         
         try{
            Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
            conn = DriverManager.getConnection(url, uid, upw);
            if(conn != null){
               // 비밀번호가 맞는지 체크
               sql = "select m_idx from tb_member where m_password=?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, userPw);
               rs = pstmt.executeQuery();
               
               if(rs.next()){   // 비밀번호가 맞을 경우
                  //update문 실행
                  sql = "update tb_member set m_state=?, m_withdrawwhy=?, m_withdrawwhy2=?, m_withdrawdate=?  where m_userid=?";
                  pstmt = conn.prepareStatement(sql);
               
                  //넘겨줘야할 값 새 비밀번호, 이름, 이메일, 휴대폰, 성별, 생년월일
		         pstmt.setInt(1, 2);
		         pstmt.setString(2, why);
		         pstmt.setString(3, m_withdrawwhy2);
		         pstmt.setString(4, m_withdrawdate);
               	 pstmt.setString(5, userId);
                 pstmt.executeUpdate();
            //info.jsp로 이동
%>
   <script>
      alert('탈퇴되었습니다.');
      // location.href='../../index.jsp';
      <%session.invalidate();%>
      location.href='../../index.jsp';
   </script>
<%                  
               }else{   // 비밀번호가 틀릴 경우
%>
   <script>
      alert('비밀번호를 확인하세요');
      history.back()
   </script>
<%
               }
            }
         }catch(Exception e){
            e.printStackTrace();
         }
   }
%>
   

      
      
      