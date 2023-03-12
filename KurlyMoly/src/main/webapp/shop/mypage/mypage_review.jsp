<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ page import="com.kurly.order.OrderDTO"%>
<%@ page import="com.kurly.order.OrderDetailDTO"%>
<%@ page import="com.kurly.product.ProductDTO"%>

<jsp:useBean id="odao" class="com.kurly.order.OrderDAO" />
<jsp:useBean id="oddao" class="com.kurly.order.OrderDetailDAO" />
<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO" />

<jsp:useBean class="com.kurly.member.CouponDTO" id="coupon" />
<jsp:useBean class="com.kurly.member.CouponDAO" id="cdao" />
<jsp:useBean class="com.kurly.member.PointDAO" id="daoP" />		
<jsp:useBean class="com.kurly.member.PointDTO" id="point" />

<%
   request.setCharacterEncoding("utf-8");


// ★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★
	String idx = null;
	if (session.getAttribute("m_idx") != null) {
		idx = (String) session.getAttribute("m_idx");
	}
	Integer cp_idx = 0; 
	Integer cp_memidx = (Integer.parseInt(idx)); 
	Integer cp_isused = 0; // 사용, 미사용 1, 0
	int total = cdao.count(cp_memidx);
	
	Integer po_idx = 0;
	Integer po_memidx = (Integer.parseInt(idx));  
	String po_type = "";
	int po_points = 0;
	String po_duedate = "";
	int po_sumpoints = 0;
	int po_duepoints = 0;
	int sum = daoP.sum(po_memidx);
	int sum2 = daoP.sum2(po_memidx);
	int totalPoint = sum - sum2;
	int sum_duepoint = daoP.sum_duepoint(po_memidx);

	// 계산식 관련
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정
	

   
    // 접속한 회원 정보 가져오기.
//   List<MemberDTO> userinfolist = new ArrayList<MemberDTO>();
//   userinfolist = mdao.useridinfo((String) session.getAttribute("m_id"));
//   System.out.println(userinfolist);
   
      // 주문내역 가져오기.
   List<OrderDTO> orderlist = new ArrayList<OrderDTO>();
   orderlist = odao.selectOrder((String)session.getAttribute("m_id"));
   System.out.println(orderlist);
   
   int sum3=0;
   
      // 상세주문내역 가져오기. -- userid없음, orderdetailList = oddao.selectOrderDetail(o_idx); 밑에 배치
   List<OrderDetailDTO> orderdetailList = new ArrayList<OrderDetailDTO>();
   
      // 상품 리스트 가져오기.
   List<ProductDTO> productlist = new ArrayList<ProductDTO>();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
<script src="../../script/script.js"></script>
<script src="../../script/MJscript.js"></script>
<script src="../../script/kurlytracker.js"></script>
<link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<body>
   <!-- container 시작 -->
   <div id="container">
      <%@ include file="../include/header.jsp"%>
      <!-- main 시작 -->
      <div id="main">
         <!-- 본문 시작 -->
         <div id="content">
            <div id="qnb" class="quick-navigation"
               style="top: 516px; z-index: 500;">
               <div class="bnr_qnb" id="brn_Quick">
                  <a href="../board/delivery.jsp"><img class="thumb"
                     src="../../img/sidebar/bnr_quick_20190403.webp"></a>
               </div>
               <script>
                        var brnQuick = {
                            nowTime: '1614533726294',
                            update: function () {
                                $.ajax({
                                    url: campaginUrl + 'pc/service/bnr_quick.html'
                                }).done(function (result) {
                                    $('#brnQuick').html(result);
                                });
                            }
                        }
                        brnQuick.update();
                    </script>

               <div class="side_menu">
                  <a href="../../event_lovers.html" class="link_menu">등급별 혜택</a> <a
                     href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
               </div>
            </div>

            <!--=============================== mypage_main 시작=================================-->
            <div id="mypage_main">
               <div id="content">
                  <div id="content_back">
                     <div id="myPageTop" class="mypage_top">
                        <h2 class="screen_out">마이 페이지</h2>
                        <div class="mypagetop_user">
                           <div class="inner_mypagetop">
                              <div class="grade_user">
                                 <div class="grade">
                                    <span class="screen_out">등급</span> <span
                                       class="ico_grade class0"> <span class="ineer_grade">
                                          <span class="in_grade">일반</span>
                                    </span>
                                    </span>
                                    <div class="grade_bonus">
                                    
                            <!-- ★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★ --> 
                                       <div class="user">
                                          <strong class="name"><%=session.getAttribute("m_name")%></strong> <span class="txt">님</span>
                                       </div>
                                       <div class="bonus">
                                          <strong class="tit">첫구매 우대 -</strong> 적립 5%
                                       </div>
                                       <div class="bonus">
                                          <strong class="tit">첫구매 우대 -</strong> 20,000원 이상 무료 배송
                                       </div>
                                    </div>
                                 </div>
                                 <div class="next">
                                    <a href="../../event_lovers.jsp" class="total_gd">전체등급 보기</a> 
                                 </div>
                              </div>
                              <ul class="list_mypage">
                                 <li class="user_point">
                                    <div class="link">
                                       <div class="tit">적립금</div>
                                       <a href="./mypage_emoney.jsp" class="info"> <%=nf.format(totalPoint)%> 원 <img
                                          src="../../img/mypage/ico_arrow_56x56.webp" alt="">
                                          <span class="date"> 소멸 예정 <%=nf.format(sum_duepoint)%>원 </span>
                                       </a>
                                    </div>
                                 </li>
                                 <li class="user_coupon">
                                    <div class="link">
                                       <div class="tit">쿠폰</div>
                                       <a href="./mypage_coupon.jsp" class="info"> <%=total%> 개 <img
                                          src="../../img/mypage/ico_arrow_56x56.webp" alt="">
                                       </a>
                                    </div>
                                 </li>
                             <!-- ★★★@@@★★★ 추가함(HYJ) 끝 ★★★@@@★★★ --> 
                             
                                 <li class="user_kurlypass">
                                    <div class="link">
                                       <div class="tit">컬리패스</div>
                                       <a href="../../event_lovers.jsp" class="info">알아보기 <img
                                          src="../../img/mypage/ico_arrow_56x56.webp" alt="">
                                       </a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                           <a href="../../event_friend.jsp" alt="이벤트 페이지로 이동" class="bnr_event"> <img
                              src="../../img/mypage/eventfront.png" alt="이벤트페이지">
                           </a>
                        </div>
                     </div>

                     <div class="page_aticle aticle_type2 clear">
                        <div id="snb" class="snb_mypage">
                           <h2 class="tit_snb">마이컬리</h2>
                           <div class="inner_snb">
                              <ul class="list_menu">
                                 <li><a href="./mypage_main.jsp">주문 내역</a></li>
                                 <li><a href="./mypage_transport.jsp">배송지 관리</a></li>
                                 <li><a href="./mypage_Zzim.jsp">찜한 상품</a></li>
                                 <li class="on"><a href="./mypage_review.jsp">상품 후기</a>
                                 </li>
                                 <li><a href="./mypage_emoney.jsp">적립금</a></li>
                                 <li><a href="./mypage_coupon.jsp">쿠폰</a></li>
                                 <li><a href="./mypage_editinfo.jsp">개인 정보 수정</a></li>
                              </ul>
                           </div>
                           <a href="../mypage/mypage_qna_register.jsp" class="link_inquire">
                              <span class="emph">도움이 필요하신가요 ?</span>
                              <p>1:1 문의하기</p>
                           </a>
                        </div>
                        <!--=========================================== 내용 시작=================================-->
                        <div class="page_section section_review">
                           <div class="head_aticle">
                              <h2 class="tit">상품 후기</h2>
                           </div>
                           <div id="reviewview">
                              <div class="review_notice">
                                 <p>
                                    <b>후기 작성 시 사진후기 100원, 글후기 50원을 적립해드립니다.</b>
                                 </p>
                                 - 퍼플, 더퍼플은 <b>2배</b> 적립 (사진 200원, 글 100원) <br> - 주간 베스트
                                 후기로 선정 시 <b>5,000원</b> 을 추가 적립 <br> * 후기 작성은 배송 완료일로부터
                                 30일 이내 가능합니다.
                              </div>
                              
<%   // ★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★
      
                        for (int i = 0; i < orderlist.size(); i++) {
                        int o_idx = orderlist.get(i).getoIdx();
                        orderdetailList = oddao.selectOrderDetail(o_idx);
                        
                        
                        for (int j = 0; j < orderdetailList.size(); j++) {
                        sum3 += 1;
                        
                        }
                  }
                        
%>
                              <ul class="tab_menu">
                                 <li class="on"><a href="#viewBeforeList">작성가능 후기 <span>(<%=sum3 %>)</span>
                                 </a></li>
                                 <li class=""><a href="#viewAfterList">작성완료 후기 <span>(0)</span>
                                 </a></li>
                              </ul>
                           </div>
                           <div id="viewBeforeList" class="before_view">

<%   // ★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★
      
                  for (int i = 0; i < orderlist.size(); i++) {
                        
                        int o_idx = orderlist.get(i).getoIdx();
                        orderdetailList = oddao.selectOrderDetail(o_idx);
                        
%>
                              <ul class="list_before">
                                 <li><strong class="tit_item"> <span
                                       class="emph"> 주문번호</span> <%=o_idx %>
                                 </strong></li>


<%    // ★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★

                        for (int j = 0; j < orderdetailList.size(); j++) {
                        
                        productlist = pdao.prodinfo(orderdetailList.get(j).getOdProductidx());
                        String p_imgname = productlist.get(0).getImgname();
                        String p_title = productlist.get(0).getTitle();
                        int p_idx = productlist.get(0).getIdx();
                        int od_quantity = orderdetailList.get(j).getOdQuantity();
                        String od_shipdone = orderdetailList.get(j).getOdShipdone();
                        String od_shipstate = orderdetailList.get(j).getOdShipstate();
                     
%>
                                 <!-- ★★★@@@★★★ 추가함(HYJ) 시작 ★★★@@@★★★  -->
                                 <li>
                                    <div class="item">
                                       <a href="" class="thumb"><img
                                          src="../../img/goods_detail/<%=p_imgname %>" alt="상품이미지"></a>
                                       <div class="name">
                                          <div class="inner_name">
                                             <a href="" class="main_name"><%=p_title %></a> <span
                                                class="num"><%=od_quantity %>개 구매</span>
                                          </div>
                                       </div>
                                       <div class="date">
                                          <div class="inner_date">
                                             <div class="in_date">
                                                <span class="start"><%=od_shipdone.substring(0, 10)%> <br> <%=od_shipstate %></span>
                                                <span class="end"></span>
                                             </div>
                                          </div>
                                       </div>
                                       <a href="./mypage_write_review.jsp?p_idx=<%=p_idx%>"
                                          class="btn_write">후기쓰기</a>
                                    </div>
                                 </li>
                                 <!-- ★★★@@@★★★ 추가함(HYJ) 끝 ★★★@@@★★★  -->

                                 <!-- 삭제 -->
                                 <%    //★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★
                        }
                  }
%>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- main 종료 -->

      <!-- footer 시작 -->
      <%@ include file="../include/footer.jsp"%>
      <!-- footer 종료 -->
   </div>
   <!-- container 종료 -->

   <!-- quick list 시작 -->
   <a href="#top" id="pageTop" class="on">맨 위로가기</a>
   <!-- quick list 끝 -->
</body>
</html>