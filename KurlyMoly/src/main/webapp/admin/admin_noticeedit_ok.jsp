<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!--  isELIgnored= "false" -->
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
  
      // editinfo_myinfo.jsp로 부터 데이터를 전달 받음.
 	  String title =  request.getParameter("title");
   	  String content =   request.getParameter("content");
   	  String isimpt =    request.getParameter("isimpt");
   	  String isdisplay =     request.getParameter("isdisplay");
	  Integer idx =Integer.parseInt( request.getParameter("idx"));
	 
 
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
               
               sql = "select * from tb_notice where n_idx=?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1,idx);
               rs = pstmt.executeQuery();
             
               if(rs.next()){   
            	   System.out.println("@@@@@@@@@@@@@@@@@@@@@@");
                   System.out.println(idx);
                   System.out.println(title);
                   System.out.println(content);
                   System.out.println(isimpt);
                   System.out.println(isdisplay);
                   System.out.println("@@@@@@@@@@@@@@@@@@@@@@");
                  //update문 실행
                  sql = "update tb_notice set n_title=?, n_content=?, n_isimpt=?, n_isdisplay=? where n_idx=?";
                  pstmt = conn.prepareStatement(sql);
	              pstmt.setString(1,title);
	              pstmt.setString(2,content);
	              pstmt.setString(3,isimpt);
	              pstmt.setString(4,isdisplay);
	              pstmt.setInt(5, idx);
	              pstmt.executeUpdate();
          
%>
   <script>
      alert('공지사항 수정되었습니다.');
      location.href='./admin_noticelist.jsp';
   </script>
<%
               }else{   
%>
   <script>
      alert('수정실패!');
      history.back();
   </script>
<%
               }
            }
         }catch(Exception e){
            e.printStackTrace();
         }
   
%>
   

      
      
      