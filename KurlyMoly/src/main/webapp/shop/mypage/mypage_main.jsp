<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	if (session.getAttribute("m_idx") != null) { idx = (String) session.getAttribute("m_idx"); }
	Integer cp_idx = 0; 
	Integer cp_memidx = Integer.parseInt(idx);
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
						<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a> <a
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
														<span class="in_grade"> 일반</span>
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
			                                    <a href="" class="total_gd">전체등급 보기</a> 
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
									<a href="" alt="이벤트 페이지로 이동" class="bnr_event"> <img
										src="../../img/mypage/eventfront.png" alt="이벤트페이지">
									</a>
								</div>
							</div>

							<div class="page_aticle aticle_type2 clear">
								<div id="snb" class="snb_mypage">
									<h2 class="tit_snb">마이컬리</h2>
									<div class="inner_snb">
										<ul class="list_menu">
											<li class="on"><a href="./mypage_main.jsp">주문 내역</a></li>
											<li><a href="./mypage_transport.jsp">배송지 관리</a></li>
											<li><a href="./mypage_Zzim.jsp">찜한 상품</a></li>
											<li><a href="./mypage_review.jsp">상품 후기</a></li>
											<li><a href="./mypage_emoney.jsp">적립금</a></li>
											<li><a href="./mypage_coupon.jsp">쿠폰</a></li>
											<li><a href="./mypage_editinfo.jsp">개인 정보 수정</a></li>
										</ul>
									</div>
									<a href="" class="link_inquire"> <span class="emph">도움이
											필요하신가요 ?</span>
										<p>1:1 문의하기</p>
									</a>
								</div>
								<!--=============================== viewOrderList 시작=================================-->
								<div id="viewOrderList" class="page_section">
									<div class="head_aticle">
										<h2 class="tit">
											<span class="tit_t">주문 내역</span> <span class="tit_sub">지난
												3년간의 주문 내역 조회가 가능합니다</span>
										</h2>
									</div>
									<div class="search_date">
										<h3 class="screen_out">기간 선택 패널</h3>
										<a href="#none" class="btn_layer">전체기간</a>
										<ul class="layer_search">
											<li><a href="#none" class="on">전체기간</a></li>
											<li><a href="#none" date-year="2021">2021년</a></li>
											<li><a href="#none" date-year="2020">2020년</a></li>
											<li><a href="#none" date-year="2019">2019년</a></li>
										</ul>
									</div>
									<ul class="list_order">
<%
					                  for (int i = 0; i < orderlist.size(); i++) {
					                        
					                      int o_idx = orderlist.get(i).getoIdx();
					                      String o_paiddate =  orderlist.get(i).getoPaiddate();
					                      int o_amountpaid =  orderlist.get(i).getoAmountpaid();
					                      String o_shipstate =  orderlist.get(i).getoShipstate();
					                      
					                      orderdetailList = oddao.selectOrderDetail(o_idx);
					                      productlist = pdao.prodinfo(orderdetailList.get(0).getOdProductidx());
					                      String p_imgname = productlist.get(0).getImgname();
					                      String p_title = productlist.get(0).getTitle();
					                      
%>										<li>
											<div class="date"><%= o_paiddate %></div>
   
											<div class="order_goods">
												<div class="goods_name">
													<a href="mypage_review.jsp"><%= p_title %>
													<% if(orderdetailList.size() > 1) { %>
														외 <%= orderdetailList.size()-1 %>건
													<%}%>
													</a>
												</div>
												<div class="order_info">
													<div class="goods_image">
														<img src="../../img/goods_detail/<%= p_imgname%>" alt="해당 주문의 썸네일">
													</div>

													<div class="goods_desc">
														<dl>
															<dt>주문번호</dt>
															<dd><%=o_idx%></dd>
														</dl>
														<dl>
															<dt>결제금액</dt>
															<dd><%=o_amountpaid%>원</dd>
														</dl>
														<dl>
															<dt>주문상태</dt>
															<dd><%=o_shipstate%></dd>
														</dl>
													</div>
												</div>
			
												<div class="order_status">
													<span class="inner_status"> 
														<a href="./mypage_qna_register.jsp?o_idx=<%=o_idx%>" class="link ga_tracking_event">1:1 문의</a>
													</span>
												</div>

											</div>
										</li>
<%
                  					}
%>
									</ul>
									<div class="layout_page">
										<div class="page_div">
											<a href="#viewOrderList" class="lay-pg-btn lay-pg-first">처음</a><a
												href="#viewOrderList" class="lay-pg-btn lay-pg-prev">이전</a><span><strong
												class="lay-pg-btn lay-pg-number __active">1</strong></span><a
												href="#viewOrderList" class="lay-pg-btn lay-pg-next">다음</a><a
												href="#viewOrderList" class="lay-pg-btn lay-pg-last">맨끝</a>
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