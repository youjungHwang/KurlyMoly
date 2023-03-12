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
   }else {
      // editinfo_myinfo.jsp로 부터 데이터를 전달 받음.
      request.setCharacterEncoding("UTF-8");
      String userId = (String)session.getAttribute("m_id");
      String userPw = request.getParameter("originalPassword");
      String username =request.getParameter("name");
      String newUserPw = request.getParameter("newPassword");
      String hp = request.getParameter("mobileInp");
      String email = request.getParameter("email");      
      String sex = request.getParameter("sex");
      String birthYear = request.getParameter("birth_year");
      String birthMonth = request.getParameter("birth_month");
      String birthDay = request.getParameter("birth_day");
      String userBirth = birthYear + birthMonth + birthDay;
 
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
               sql = "select m_idx from tb_member where m_userid=? and m_password=?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, userId);
               pstmt.setString(2, userPw);
               rs = pstmt.executeQuery();
               
               if(rs.next()){   // 비밀번호가 맞을 경우
                  //update문 실행
                  sql = "update tb_member set m_password=?, m_name=?, m_email=?, m_tel=?, m_gender=?, m_birth=? where m_userid=?";
                  pstmt = conn.prepareStatement(sql);
               
                  //넘겨줘야할 값 새 비밀번호, 이름, 이메일, 휴대폰, 성별, 생년월일
               pstmt.setString(1,newUserPw);
               pstmt.setString(2,username);
               pstmt.setString(3,email);
               pstmt.setString(4,hp);
               pstmt.setString(5, sex);
               pstmt.setString(6, userBirth);
               pstmt.setString(7, userId);
               pstmt.executeUpdate();
            //info.jsp로 이동
%>
   <script>
      alert('회원정보가 수정되었습니다.');
      location.href='./mypage_editinfo.jsp';
   </script>
<%
               }else{   // 비밀번호가 틀릴 경우
%>
   <script>
      alert('비밀번호를 확인하세요');
      history.back();
   </script>
<%
               }
            }
         }catch(Exception e){
            e.printStackTrace();
         }
   }
%>
   

      
      
      