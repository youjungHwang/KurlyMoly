<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!--  isELIgnored= "false" -->


<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.kurly.order.OrderDTO"%>
<%@ page import="com.kurly.order.OrderDetailDTO"%>
<%@ page import="com.kurly.product.ProductDTO"%>

<jsp:useBean id="odao" class="com.kurly.order.OrderDAO" />
<jsp:useBean id="oddao" class="com.kurly.order.OrderDetailDAO" />
<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO" />


<%@ page import="com.kurly.order.OrderDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정


	// 주문내역 가져오기
	List<OrderDTO> orderlist = new ArrayList<OrderDTO>();
	orderlist = odao.selectAllOrder();

 
    // 상세주문내역 가져오기. -- userid없음, orderdetailList = oddao.selectOrderDetail(o_idx); 밑에 배치
 	List<OrderDetailDTO> orderdetailList = new ArrayList<OrderDetailDTO>();
 	

    // 상품 리스트 가져오기.
 List<ProductDTO> productlist = new ArrayList<ProductDTO>();
	
	String duration = request.getParameter("duration"); // 조회기간 
	String datestart = request.getParameter("datestart"); // 기간 시작일
	String datefinish = request.getParameter("datefinish"); // 기간 마감일
	String keyword = request.getParameter("keyword"); // 검색컬럼
	String searchword = request.getParameter("searchword"); // 검색단어

	orderlist = odao.searchOrderList(duration, datestart,datefinish, keyword, searchword );
	
	// 페이징 작업
	
	int pagePerCount = 10; // 페이지당 글 개수 ** 10개씩 보기
	int start = 0; // 시작 글번호
	
	String pageNum = request.getParameter("pageNum");
	if (pageNum != null && !pageNum.equals("")) {
		start = (Integer.parseInt(pageNum) - 1) * pagePerCount;
	} else {
		pageNum = "1";
		start = 0;
	}

 	String pageSize = request.getParameter("pageSize");
 	if (pageSize == null) {
 		pagePerCount = 5;
 	} else {
 		pagePerCount = Integer.parseInt(pageSize);
 	}

 	//상단 목록별 개수 가져오기
 	

    int totalCount = 0; // 전체 글 개수
    int order1Count = 0; // 판매대기 글 개수
    int order2Count = 0; // 판매중 글 개수
    int order3Count = 0; // 품절 글 개수
    int order4Count = 0; // 판매중단 글 개수
    int order5Count = 0; // 판매완료 글 개수
    
	
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
          sql = "select count(*) as total, "  
       		   + "count(case when o_shipstate='주문완료' then 1 end) as order1, "
       		   + "count(case when o_shipstate='상품준비중' then 1 end) as order2,"
       		   + "count(case when o_shipstate='배송중' then 1 end) as order3,"
       		   + "count(case when o_shipstate='배송완료' then 1 end) as order4,"
       		   + "count(case when o_shipstate='구매확정' then 1 end) as order5 from tb_order;";
       		   
          pstmt= conn.prepareStatement(sql);
          rs = pstmt.executeQuery();
          
          if(rs.next()){
             totalCount = rs.getInt("total");
             order1Count = rs.getInt("order1");
             order2Count = rs.getInt("order2");
             order3Count = rs.getInt("order3");
             order4Count = rs.getInt("order4");
             order5Count = rs.getInt("order5");
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

    <title>주문 조회</title>
          <script>
     
		function chageLangSelect(){
	    	var langSelect = document.getElementById("id-lang");
	     
	    	// select element에서 선택된 option의 value가 저장된다.
	    	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	 
	    	// select element에서 선택된 option의 text가 저장된다.
	    	var selectText = langSelect.options[langSelect.selectedIndex].text;
	    	window.console.log(selectValue);
	    	var pageNumJs = <%=pageNum%>;
	    	location.href="./admin_productcheck.jsp?pageNum=" + pageNumJs + "&pageSize=" + selectValue;
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

                <div id="tab4" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">판매 관리</li>
                        <li class="__activepage1">주문 조회</li>
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

                <div id="tab6" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">문의 사항</li>
                        <li><a href="admin_pinquirycheck.jsp">상품 문의</a></li>
                        <li><a href="admin_cinquirycheck.jsp">고객 문의</a></li>
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
                    <p>주문 조회</p>
                </div>
                  <div class="quickcheck">
        
                    <ul>
                        <li>
                            <div class="quickmenu">
                                <img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">전체    <br><span><%=totalCount%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">주문완료<br>
                                <span><%= order1Count%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">상품준비 <br>
                                <span><%= order2Count%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">배송중    <br>
                                <span><%= order3Count%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">배송완료<br>
                                <span><%= order4Count%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">구매확정<br>
                                <span><%= order5Count%></span> 건</span>
                            </div>
                        </li>
                    </ul>
                </div>
                
                
                <div class="filter">
                    <form aciton="admin_ordercheck_ok.jsp" class="regForm">
                        <ul class="reg_list clear">
                            <li class="clear">
                                <label class="o_tit_lbl_search">조회기간</label>
                                <div class="select_duration">
                                    <select name="duration" >
                                        <option value="o_paiddate" selected>결제일</option>
                                        <option value="o_renewdate">최근처리일</option>
                                    </select>
                                    <input type="date" name= "datestart" > ~ <input type="date" name="datefinish" >
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="search_detail clear">
                                <label class="tit_lbl_search o_search_detail"> 상세조건</label>
                                <div class="search_box"> 
                                    <select name="keyword">
                                        <option value="o_idx" selected>주문번호</option>
                                        <option value="o_userid">주문자ID</option>
                                        <option value="o_orderer">주문자명</option>
                                        <option value="o_address1">주소</option>
                                        <option value="o_shipnumber">송장번호</option>
                                        <option value="o_amountpaid">결제금액</option>
                                        <option value="o_shipstate">처리상태</option>
                                    </select> 
                                    <input type="text" name="searchword" > 
                                </div>
                            </li>
                            <li>
                                <p class="btn_line">
                                    <Input type="submit" value="검색" class="btn_basecolor1">
									<Input type="reset" value="초기화" class="btn_basecolor2">
                                </p>
                            </li>
                        </ul>
                    </form>
                </div>

				<div class="listview">
					<div class="subtitle float_left">
						<h3>
							주문 목록 (총 <span><%=totalCount%></span> 개)
						</h3>
					</div>
				   <div class="subfunc float_right clear"> 
						<select name="pn_cnt" id="id-lang" onchange="chageLangSelect()">
							<option value="5" <c:if test="${pagePerCount == 5}">selected</c:if>>5개씩 보기</option>
							<option value="10" <c:if test="${pagePerCount == 10}">selected</c:if>>10개씩 보기</option>
							<option value="20" <c:if test="${pagePerCount == 20}">selected</c:if>>20개씩 보기</option>
						</select>
                    </div>

					<div class="bssBox">
						<table class="bbsListTbl">
							<tr>
								<th>주문번호</th>
								<th>주문자ID</th>
								<th>주문자명</th>
								<th>주소</th>
								<th>주문내역</th>
								<th>결제금액</th>
								<th>결제일시</th>
								<th>최종처리상태</th>
								<th>송장번호</th>
							</tr>
<%
						for(int i = 0 ; i < orderlist.size(); i++){   
							
							int o_idx = orderlist.get(i).getoIdx();
							String o_userid = orderlist.get(i).getoUserid();
							String o_orderer = orderlist.get(i).getoOrderer();
							String o_shipnumber = orderlist.get(i).getoShipnumber();
							String o_address1 = orderlist.get(i).getoAddress1();
							String o_address2 = orderlist.get(i).getoAddress2();
							int o_amountpaid = orderlist.get(i).getoAmountpaid();
							String o_paiddate = orderlist.get(i).getoPaiddate();
							String o_shipstate = orderlist.get(i).getoShipstate();

							orderdetailList = oddao.selectOrderDetail(o_idx);
							productlist = pdao.prodinfo(orderdetailList.get(0).getOdProductidx());
							String p_title = productlist.get(0).getTitle();
%>
							<tr>
								
								<td><a href="#" class="order_datails"><%=o_idx%></a></td>
								<td><%=o_userid%></td>
								<td><%=o_orderer%></td>
								<td><%=o_address1%></td>
								<td style="width:20%"><%=p_title%><% if(orderdetailList.size() > 1) { %> 외 <%= orderdetailList.size()-1 %>건 <%}%></td>
								<td><%=nf.format(o_amountpaid)%></td>
								<td><%=o_paiddate.substring(0,10)%></td>
								<td><a href="#" class="order_datails"><%=o_shipstate%></a></td>
								<td>
								<% if( o_shipnumber != null){ %>  <!--  송장번호 없을 경우 - 입력  -->
								<a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank" class="order_datails"><%=o_shipnumber%></a>
								<% }else{ 
									out.print("-");
									} %>
								</td>
							</tr>
<%
			}
%>
						</table>
					</div>
<%
						int pageNums = 0;
						if (totalCount % pagePerCount == 0) {
							pageNums = (totalCount / pagePerCount);
						} else {
							pageNums = (totalCount / pagePerCount) + 1;
						}
%>

					<div class="pagination">
						<a href="#" class="pn_btn pn_firstpage">맨 처음 페이지로 가기</a>
						<a href="#" class="pn_btn pn_prevpage">이전 페이지로 가기</a>
<%
						for (int i = 1; i <= pageNums; i++) {
							out.print("<a href='./admin_ordercheck.jsp?pageNum=" + i +"&pageSize=" + 
				            		 pagePerCount + "' class='pn_btn pn_num' __active>" + i + "</a>");
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