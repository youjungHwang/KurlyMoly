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

		Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         String sql = "";
         String url = "jdbc:mysql://localhost:3306/KurlyMoly";
         String uid = "root";
         String upw = "1234";
         
         // 페이징 작업
         int start; // 시작 글번호
         int totalCount = 0; // 전체 글 개수
         String pageSize = request.getParameter("pageSize");  /// 5, 10, 20개 
         int pagePerCount ; // 페이지당 글 개수 
  
         if (pageSize == null){
         		pagePerCount = 5; // default
         	}else {
         		pagePerCount = Integer.parseInt(pageSize);
         	}
         
         
         	String pageNum = request.getParameter("pageNum");
			if(pageNum != null && !pageNum.equals("")){
				start = (Integer.parseInt(pageNum)-1) * pagePerCount;
			}else{
				pageNum = "1";
				start = 0;
			}

		    

         try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, uid, upw);
            if(conn != null){
               sql = "select count(ciq_idx) as total from tb_cinquiry;";
               pstmt= conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
               if(rs.next()){
                  totalCount = rs.getInt("total");
               }
               
               
               sql = "select * from tb_cinquiry order by ciq_idx desc limit ?, ?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setInt(1, start);
               pstmt.setInt(2, pagePerCount);
               rs = pstmt.executeQuery();
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
    	<script>
   function chageLangSelect(){
       var langSelect = document.getElementById("id-lang");
     
       // select element에서 선택된 option의 value가 저장된다.
       var selectValue = langSelect.options[langSelect.selectedIndex].value;
 
       // select element에서 선택된 option의 text가 저장된다.
       var selectText = langSelect.options[langSelect.selectedIndex].text;
       window.console.log(selectValue)
       var pageNumJs = <%=pageNum%> ;
       location.href="admin_cinquirycheck.jsp?pageNum=" +1 + "&pageSize=" + selectValue
   }
   
   </script>
    
    
</head>

<body>
    <div id="wrap">
        <!-- 상단 메뉴 시작 -->
        <header id="header">
            <div id="header_menu1" class="header_menu">
                <ul>
                    <li>
                        <a href="admin_dashboard.jsp"><img id="kurly_logo" src="../img/kurly.png" alt="컬리로고"></a>
                    </li>
                    <li>
                        <h2>관리자 센터</h2>
                    </li>
                </ul>
            </div>

            <div id="header_menu2">
                <ul class="util clear" class="header_menu">
                    <li><a href="admin_dashboard.jsp">Admin 님</a></li>
                    <li><a href="admin_mypage.jsp">내 정보</a></li>
                    <li><a href="admin_logout.jsp">로그아웃</a></li>
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
                        <li class="category"><a href="admin_dashboard.jsp">대시보드</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab2" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category">공지사항</li>
                        <li><a href="admin_noticelist.jsp">공지사항 조회</a></li>
                        <li><a href="admin_noticeadd.jsp">공지사항 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab3" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">상품 관리</li>
                        <li><a href="admin_productcheck.jsp">상품 조회/수정</a></li>
                        <li><a href="admin_productadd.jsp">상품 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab4" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">판매 관리</li>
                        <li><a href="admin_ordercheck.jsp">주문 조회</a></li>
                        <li><a href="admin_deliverycheck.jsp">주문/배송 현황</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab5" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category clear">클레임 관리</li>
                        <li><a href="admin_cancelcheck.jsp">취소 관리</a></li>
                        <li><a href="admin_exchangecheck.jsp">교환 관리</a></li>
                        <li><a href="admin_refundcheck.jsp">반품 관리</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab6" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">문의 사항</li>
                        <li><a href="admin_pinquirycheck.jsp">상품 문의</a></li>
                        <li class="__activepage1">고객 문의</li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab7" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">회원 관리</li>
                        <li><a href="admin_membercheck.jsp">회원 조회</a></li>
                        <li><a href="admin_wd_member.jsp">탈회회원 조회</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab8" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">이벤트 관리</li>
                        <li><a href="admin_eventcheck.jsp">이벤트 조회</a></li>
                        <li><a href="admin_eventadd.jsp">이벤트 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab9" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">기본 정보</li>
                        <li><a href="admin_mypage.jsp">내 정보</a></li>
                    </ul>
                </div>
            </div>
            
            <!-- 사이드 메뉴 끝 -->
            <!-- 내용 시작-->
            <div id="content">
                <div class="title">
                    <p>고객 문의</p>
                </div>
                <div class="quickcheck">
                    <ul>
                        <li>
                            <div class="quickmenu">
                                <img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">답변대기<br><span>${fn:length(noreplyList)}</span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">답변완료<br>
                                <span>${fn:length(replyList)}</span> 건</span>
                            </div>
                        </li>
                    </ul>
                </div>
<!-- 
                <div class="filter">
                    <form class="regForm" method='GET' action='admin_cinquirycheck_ok.jsp'>
                        <ul class="reg_list clear">
                            <li class="clear">
                                <label class="o_tit_lbl_search">조회기간</label>
                                <div class="select_duration">
                                    <input type="date"> ~ <input type="date">
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="clear">
                                <label class="tit_lbl">처리상태</label>
                                <div class="select_sales">
                                    <label class="space"><input type="checkbox" name="orderstate" value="전체"> 전체</label>
                                    <label class="space"><input type="checkbox" name="orderstate" value="답변대기"> 답변대기</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="답변완료"> 답변완료</label>
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="search_detail clear">
                                <label class="tit_lbl_search "> 상세조건</label>
                                <div class="search_box"> 
                                    <select name="col" >
                                        <option value="*" >전체</option>
                                        <option value="ciq_idx">고객문의번호</option>
                                        <option value="ciq_about">문의구분</option>
                                        <option value="ciq_userid">작성자ID</option>
                                        <option value="ciq_title">제목</option>
                                        <option value="ciq_content">내용</option>
                                    </select> <input type="text" name='word' value='' >
                                </div>
                            </li>
                            <li>
                                <p class="btn_line">
                                    <Input type="submit" value="검색" class="btn_basecolor1"> <Input type="reset"
                                        value="초기화" class="btn_basecolor2">
                                </p>
                            </li>
                        </ul>
                    </form>
                </div>
  					
			 -->
			
                <div class="listview">
                    <div class="subtitle float_left">
                        <h3>고객 문의 목록 (총 <span>${fn:length(cinquiryList)}</span> 개)</h3>
                    </div>
                   <div class="subfunc float_right clear"> 
                   <select  name="pn_cnt" id="id-lang" onchange="chageLangSelect()">
                       <option value=5 <c:if test="${pagePerCount == 5}">selected</c:if>>5개씩보기</option>
                       <option value=10 <c:if test="${pagePerCount == 10}">selected</c:if>>10개씩보기</option>
                       <option value=20 <c:if test="${pagePerCount == 20}">selected</c:if>>20개씩보기</option>
                   </select>
        			 </div>
                    <div class="bssBox">
                        <table class="bbsListTbl">
                            <tr>
                                <th>고객문의번호</th>
                                <th>문의구분</th>
                                <th width="30%">제목</th>
                                <th>작성자ID</th>
                                <th>문의일시</th>
                                <th>답변여부</th>
                                <th>답변등록</th>
                            </tr>
                            
							  <c:forEach var="item" items="${cinquiryList}" varStatus ="status" begin="<%=start %>" end="<%=start+pagePerCount-1 %>" >
	                            <tr>
									<td><a href="./admin_cinquirydetail.jsp?ciq_idx=${item.idx}" >${item.idx}</a></td>
									<td>${item.about}</td>
									<td>${item.title}</td>
									<td>${item.userid}</td>
									<fmt:parseDate value="${item.inquirydate}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
									<td><fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" /></td>
									<td>${item.isreply}</td>
									<td><input type="button" class="bbs_btn" value="답변" onclick="location.href='./admin_cinquirydetail.jsp?ciq_idx=${item.idx}'" ></td>
								</tr>
								</c:forEach>
					
                        </table>
                      </div>
                     <% 
						int pageNums = 0;   
						if(totalCount % pagePerCount == 0){
							pageNums = (totalCount / pagePerCount);
						}else{
							pageNums = (totalCount / pagePerCount) + 1;
						}
					
					%>

                       <div  class = "pagination">
                        <a href="#" class="pn_btn pn_firstpage">맨 처음 페이지로 가기</a>
                        <a href="#" class="pn_btn pn_prevpage">이전 페이지로 가기</a>
						<%
						       for(int i=1; i<=pageNums; i++) {
						             out.print("<a href='admin_cinquirycheck.jsp?pageNum=" + i + "&pageSize=" + 
						            		 pagePerCount + "' class='pn_btn pn_num' __active>"+ i +"</a>");
						          }
						%>                   
                         
                        <a href="#" class="pn_btn pn_nextpage">다음 페이지로 가기</a>
                        <a href="#" class="pn_btn pn_lastpage">맨 끝 페이지로 가기</a>
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