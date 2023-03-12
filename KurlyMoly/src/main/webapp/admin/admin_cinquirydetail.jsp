<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored= "false"%>
    
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<jsp:useBean id="cinquiryDAO" class="com.kurly.inquiry.CinquiryDAO"/>
<c:set var="cinquiryList" value ="${cinquiryDAO.selectList()}"/>
<c:set var="noreplyList" value ="${cinquiryDAO.noreplyList()}"/>
<c:set var="replyList" value ="${cinquiryDAO.replyList()}"/>
		
<%

//String ciq_idx = request.getParameter("ciq_idx");
int ciq_idx = 1; 
String ciq_about = "";
String ciq_title = "";
String ciq_content = "";
int ciq_orderidx = 0;
String ciq_userid = "";
String ciq_filename = "";
String ciq_inquirydate = "";
String ciq_reply = "";
String ciq_replydate = "";
String ciq_isreply = "";


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "";
String url = "jdbc:mysql://localhost:3306/KurlyMoly";
String uid = "root";
String upw = "1234";

try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, uid, upw);
    if(conn != null){
       sql = "select * from tb_cinquiry where ciq_idx=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setInt(1, ciq_idx);
       rs = pstmt.executeQuery();
       
       if(rs.next()){
    	  ciq_idx = rs.getInt("ciq_idx");
          ciq_about = rs.getString("ciq_about");
          ciq_orderidx = rs.getInt("ciq_orderidx");
          ciq_userid = rs.getString("ciq_userid");
          ciq_title = rs.getString("ciq_title");
          ciq_content = rs.getString("ciq_content");
          ciq_filename = rs.getString("ciq_filename");
          ciq_inquirydate = rs.getString("ciq_inquirydate");  
          ciq_reply = rs.getString("ciq_reply");
          ciq_replydate = rs.getString("ciq_replydate");
          ciq_isreply = rs.getString("ciq_isreply");
             
       }
    }
 }catch(Exception e){
    e.printStackTrace();
 }   
 
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">
     <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <title>고객 문의</title>
</head>

<body>
    <div id="wrap">
        <!-- 상단 메뉴 시작 -->
        <header id="header">
            <div id="header_menu1" class="header_menu">
                <ul>
                    <li>
                        <a href="#"><img id="kurly_logo" src="../img/kurly.png" alt="컬리로고"></a>
                    </li>
                    <li>
                        <h2>관리자 센터</h2>
                    </li>
                </ul>
            </div>

            <div id="header_menu2">
                <ul class="util clear" class="header_menu">
                    <li><a href="admin_dashboard.html">Admin 님</a></li>
                    <li><a href="admin_mypage.html">내 정보</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </header>
        <!-- 상단 메뉴 끝 -->

        <!--컨테이너 시작-->
        <div class="container clear">
            <!-- 사이드 메뉴 시작 -->
            <div class="side_menu">
                <div id="profile_area"><img id="pro_file" src="../img/profile.png"></div>
                <div id="tab1" class="menutab">
                    <ul>
                        <li class="category"><a href="admin_dashboard.html">대시보드</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab2" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category">공지사항</li>
                        <li><a href="admin_noticecheck.html">공지사항 조회</a></li>
                        <li><a href="admin_noticeadd.html">공지사항 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab3" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">상품 관리</li>
                        <li><a href="admin_productcheck.html">상품 조회/수정</a></li>
                        <li><a href="admin_productadd.html">상품 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab4" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">판매 관리</li>
                        <li><a href="admin_ordercheck.html">주문 조회</a></li>
                        <li><a href="admin_deliverycheck.html">주문/배송 현황</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab5" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category clear">클레임 관리</li>
                        <li><a href="admin_cancelcheck.html">취소 관리</a></li>
                        <li><a href="admin_exchangecheck.html">교환 관리</a></li>
                        <li><a href="admin_refundcheck.html">반품 관리</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab6" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">문의 사항</li>
                        <li><a href="admin_prd_inquiry.html">상품 문의</a></li>
                        <li class="__activepage1">고객 문의</li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab7" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">회원 관리</li>
                        <li><a href="admin_membercheck.html">회원 조회</a></li>
                        <li><a href="admin_wd_member.html">탈회회원 조회</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab8" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">이벤트 관리</li>
                        <li><a href="admin_eventcheck.html">이벤트 조회</a></li>
                        <li><a href="admin_eventadd.html">이벤트 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab9" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">기본 정보</li>
                        <li><a href="admin_mypage.html">내 정보</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- 사이드 메뉴 끝 -->
            <!-- 내용 시작-->
            <div id="content">
                <div class="title">
                    <p>고객 문의</p>
                </div>
            	  <!-- 1:1 문의 Form 시작 -->
                            <div class="xans-board-write">
                                <form name="fm" id="fm" method="post" action="admin_cinquiry_ok.jsp"
                                    enctype="multipart/form-data" onsubmit="return chkForm(this)" style="height: 100%;">

                                    <input type="hidden" name="isreply" value="답변완료">
                                        
                                    <table id="table_after" class="boardWrite2" width="100%">
                                        <colgroup>
                                            <col width="14%" align="right">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="input_txt">고객 문의 번호</th>     
                                                <td><%=ciq_idx%></td>
                                            </tr>
                                            <tr>
                                                <th class="input_txt">구분</th>     
                                                <td><%=ciq_about%></td>
                                            </tr>
                                            <tr>
                                                <th class="input_txt">주문번호</th>
                                                <td><%=ciq_orderidx%></td>  
                                            <tr>
                                             <tr>
                                                <th class="input_txt">제목</th>
                                                <td><%=ciq_title%></td>  
                                            <tr>
                                            <tr>
                                                <th class="input_txt">내용</th>
                                                <td class="edit_area" style="position: relative;">
                                                    <textarea name="contents" style="width:80%;height:100px;"
                                                        class="editing_area" required="" fld_esssential=""
                                                        label="내용" ><%=ciq_content %></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="input_txt">이미지</th>
                                                <td><%=ciq_filename%></td>
                                            </tr>
                                            <tr>
                                                <th class="input_txt">답변</th>
                                                <td class="edit_area" style="position: relative;">
                                                    <textarea name="reply" style="width:80%;height:200px;"
                                                        class="editing_area" required="" fld_esssential=""
                                                        label="답변" value="<%= ciq_reply%>"></textarea>
                                                </td>
                                            </tr>
                                               <tr>
                                                <th class="input_txt">문의일자</th>
                                                <td><%=ciq_inquirydate%></td>
                                            </tr>
                                               <tr>
                                                <th class="input_txt">답변일자</th>
                                                <td><%=ciq_replydate%></td>
                                            </tr>
                                        </tbody>
                                    </table>
 
                                    <table width="100%">
                                        <tbody>
                                            <tr>
                                                <td align="right" style="padding-top:5px; border:none;" id="avoidDbl">
                                                    <input type="submit" class="bhs_button yb" value="저장"
                                                        style="float:none;">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>

                        </div>
                    </div>
            
            
            <!-- 푸터 시작 -->
            <div class="footer">
                <div class="footer_menu">
                    <ul class="footer_list">
                        <li><a href="./admin_manual.pdf" download>관리자센터 메뉴얼</a></li>
                        <li> | </li>
                        <li><a href="https://analytics.google.com/analytics">구글 애널리틱스</a></li>
                        <li> | </li>
                        <li><a href="https://trello.com/">마켓컬리 협업툴</a></li>
                        <li> | </li>
                        <li><a href="https://opentutorials.org/">개발도구</a></li>
                    </ul>
                </div>
            </div>
            <!-- 푸터 끝-->
        </div>
        <!-- 내용 끝-->
        </div>
        <!--컨테이너 끝-->

    </div>
</body>

</html>