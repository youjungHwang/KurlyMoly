<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.product.CategoryDTO"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<jsp:useBean id="dao" class="com.kurly.product.ProductDAO" />
<jsp:useBean id="cdao" class="com.kurly.product.CategoryDAO" />
<%
request.setCharacterEncoding("UTF-8");
NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정

String category1 = "";
String category2 = "";
String sort = "";

sort = request.getParameter("sort");

System.out.println(category1);
System.out.println(category2);
System.out.println(sort);

List<ProductDTO> categoryList = new ArrayList<ProductDTO>();
List<CategoryDTO> topcategoryList = new ArrayList<CategoryDTO>();

if (request.getParameter("category1") == null || request.getParameter("category1") == "") {
	if (request.getParameter("category2") == null || request.getParameter("category2") == "") {
		if (request.getParameter("sort") == null || request.getParameter("sort") == "") {
	categoryList = dao.selectList(); // null null null
		} else { // null null 1234
	switch (sort) {
		case "1" :
			categoryList = dao.sortList001();
			break; //추천순
		case "2" :
			categoryList = dao.sortList002();
			break; //신상품순
		case "3" :
			categoryList = dao.sortList003();
			break; //인기상품순
		case "4" :
			categoryList = dao.sortList004();
			break; //혜택순

	}
		}
	} else { // null cate2  > 001 cate2
		category1 = "001";
		category2 = request.getParameter("category2");
		if (request.getParameter("sort") == null || request.getParameter("sort") == "") { // 001 cate2 null
	categoryList = dao.categoryList2(category1, category2);

		} else { // 001 cate2 1234
	switch (sort) {
		case "1" :
			categoryList = dao.sortList111(category1, category2);
			break; //추천순
		case "2" :
			categoryList = dao.sortList112(category1, category2);
			break; //신상품순
		case "3" :
			categoryList = dao.sortList113(category1, category2);
			break; //인기상품순
		case "4" :
			categoryList = dao.sortList114(category1, category2);
			break; //혜택순
	}
		}

	}
} else { // cate1 
	category1 = request.getParameter("category1");
	topcategoryList = cdao.showCategoryList(category1); //해당 카테고리 정보 가져오기
	if (request.getParameter("category2") == null || request.getParameter("category2") == "") {
		if (request.getParameter("sort") == null || request.getParameter("sort") == "") { // cate1 null null 
	categoryList = dao.categoryList1(category1);

		} else { // cate1 null 1234
	switch (sort) {
		case "1" :
			categoryList = dao.sortList101(category1);
			break; //추천순
		case "2" :
			categoryList = dao.sortList102(category1);
			break; //신상품순
		case "3" :
			categoryList = dao.sortList103(category1);
			break; //인기상품순
		case "4" :
			categoryList = dao.sortList104(category1);
			break; //혜택순
	}
		}
	} else { // cate1 cate2 

		category2 = request.getParameter("category2");
		if (request.getParameter("sort") == null || request.getParameter("sort") == "") { // cate1 cate2 null
	categoryList = dao.categoryList2(category1, category2);

		} else { // cate1 cate2 1234
	switch (sort) {
		case "1" :
			categoryList = dao.sortList111(category1, category2);
			break; //추천순
		case "2" :
			categoryList = dao.sortList112(category1, category2);
			break; //신상품순
		case "3" :
			categoryList = dao.sortList113(category1, category2);
			break; //인기상품순
		case "4" :
			categoryList = dao.sortList114(category1, category2);
			break; //혜택순
	}
		}

	}

}

System.out.println("categoryList :" + categoryList);
System.out.println("topcategoryList :" + topcategoryList);
%>

<!-- 상품리스트 -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="../../css/jsScript.css" rel="stylesheet" type="text/css">

<script src="../../script/script.js"></script>
<script src="../../script/MJscript.js"></script>
</head>

<body>
	<div id="wrap" class="">
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="../include/header.jsp"%>
			<!-- main 시작 -->
			<div id="goods_main">
				<div id="qnb" class="quick-navigation" style="top: 325px; right: 20px;">
					<div class="bnr_qnb" id="brn_Quick">
						<a href="../board/delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
					</div>

					<div class="side_menu">
						<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
						<a href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
					</div>
				</div>
				<!-- 본문 시작 -->
				<div id="content">
					<!--page_article 시작-->
					<div class="page_article">
						<!--세부 카테고리 바 시작-->
						<div id="top_menu">
							<div id="top_logo_menu">


								<%
								if (category1 == null || category1 == "") {
								%>
								<ul class="top_menu_list">
									<div class="border">
										<li id="top_menu_title"><a href="./goods_list.jsp%>">전체보기</a></li>
										<%
										} else {
										//category1 = request.getParameter("category1");
										// topcategoryList = cdao.showCategoryList(category1); //해당 카테고리 정보 가져오기
										String mainCategoryNum = topcategoryList.get(0).getCateName1();
										String mainCategoryKor = topcategoryList.get(0).getCateName1Kor();
										//String mainCategoryImg = topcategoryList.get(0).getCateImg();
										%>
										<div class="logo">
											<img src="../../img/goods_list/goods_list_logo.png"
												alt="세부 메뉴 로고">
										</div>
										<span>
											<h3><%=mainCategoryKor%></h3>
										</span>
									</div>
									<ul class="top_menu_list">
										<div class="border">
											<li id="top_menu_title"><a
												href="./goods_list.jsp?category1=<%=mainCategoryNum%>">전체보기</a></li>
											<%
											for (int i = 0; i < topcategoryList.size(); i++) {

												String subCategoryNum = topcategoryList.get(i).getCateName2();
												String subCategoryKor = topcategoryList.get(i).getCateName2Kor();
											%>

											<li id="top_menu_title"><a
												href="./goods_list.jsp?category1=<%=mainCategoryNum%>&category2=<%=subCategoryNum%>"><%=subCategoryKor%></a></li>

											<%
											}

											}
											%>


										</div>
									</ul>
							</div>
							<!--세부 카테고리 바 종료-->
							<!--상품리스트 시작-->
							<div id="goodsList" class="page_section section_goodslist">
								<!--품절기능 스위치-->
								<!-- <input type="checkbox" id="list_switch"> <span
								id="list_switch_name">품절기능제외</span> <label for="list_switch"
								class="list_round"></label> -->
								<!--정렬기능-->
								<div class="sort_menu">
									<div class="">
										<div class="select_type user_sort checked">
											<a class="name_select">추천순</a>
											<ul class="list">
												<%
												if ((category1 != null || category1 != "") && (category2 != null || category2 != "")) {
												%>
												<li><a
													href="./goods_list.jsp?sort=1&category1=<%=category1%>&category2=<%=category2%>"
													class="on">추천순</a></li>
												<li><a
													href="./goods_list.jsp?sort=2&category1=<%=category1%>&category2=<%=category2%>">신상품순</a></li>
												<li><a
													href="./goods_list.jsp?sort=3&category1=<%=category1%>&category2=<%=category2%>">인기상품순</a></li>
												<li><a
													href="./goods_list.jsp?sort=4&category1=<%=category1%>&category2=<%=category2%>">혜택순</a></li>
												<%
												} else if ((category1 != null || category1 != "") && (category2 == "" || category2 == null)) {
												%>
												<li><a
													href="./goods_list.jsp?sort=1&category1=<%=category1%>"
													class="on">추천순</a></li>
												<li><a
													href="./goods_list.jsp?sort=2&category1=<%=category1%>">신상품순</a></li>
												<li><a
													href="./goods_list.jsp?sort=3&category1=<%=category1%>">인기상품순</a></li>
												<li><a
													href="./goods_list.jsp?sort=4&category1=<%=category1%>">혜택순</a></li>
												<%
												} else {
												%>
												<li><a href="./goods_list.jsp?sort=1" class="on">추천순</a></li>
												<li><a href="./goods_list.jsp?sort=2">신상품순</a></li>
												<li><a href="./goods_list.jsp?sort=3">인기상품순</a></li>
												<li><a href="./goods_list.jsp?sort=4">혜택순</a></li>
												<%
												}
												%>
											</ul>
										</div>
									</div>
								</div>
								<!--상품 배치 시작-->
								<div id="goodsList_inner">
									<div id="goodsList_inner_box">
										<ul class="goodsList_list">
											<%
											for (int i = 0; i < categoryList.size(); i++) {

												int p_idx = categoryList.get(i).getIdx();
												String p_imgname = categoryList.get(i).getImgname();
												String p_brand = categoryList.get(i).getBrand();
												String p_title = categoryList.get(i).getTitle();
												String p_subtitle = categoryList.get(i).getSubtitle();
												int p_price = categoryList.get(i).getPrice();
												int p_discprice = categoryList.get(i).getDiscprice();

												int percent = (p_price - p_discprice) / p_price;
											%>


											<li>
												<div class="item">
													<div class="product_part">
														<div class="product_photo">
															<a href="./goods_detail.jsp?p_idx=<%=p_idx%>"><img
																src="../../img/goods_detail/<%=p_imgname%>"></img></a>
														</div>
														<!--찜기능 버튼-->
														<div class="wish_btn wish0 turn_off" onclick="location.href='./goods_zzim_ok.jsp?p_idx=<%=p_idx%>';">
															<input type="button"> <img
																src="../../img/goods_list/wish0.png" alt="찜기능off">
															</input>
														</div>
														<div class="wish_btn wish1 turn_on">
															<input type="button"> <img
																src="../../img/goods_list/wish1.png" alt="찜기능on">
															</input>
														</div>
														<!--장바구니 버튼-->
														<div class="chart_btn" onclick="return false">
															<input type="button" class="chart_click_btn">
																<a href=""><img src="../../img/goods_list/ico_cart.svg" alt="장바구니"></a>
															</input>
														</div>
													</div>

													<div class="product_info">
														<div class="name"><%=p_title%></div>
														<span id="cost"> <c:if test="${percent gt 1 }">
																<!-- 가격 할인 있을때만, 상품 할인퍼센트 표시  -->
																<span class="sale"><%=percent%></span>
															</c:if> <span class="cost"><%=nf.format(p_discprice)%>원</span> <c:if
																test="${percent gt 1}">
																<div class="before_sale"><%=nf.format(p_price)%>원
																</div>
															</c:if>
														</span>
														<p class="smalltip"><%=p_subtitle%></p>
														<c:if test="${ p_category2 eq 'KurlyOnly'}">
															<!--  Kurly Only 태그 표시  -->
															<div class="tag">
																<p class="limit_tag">Kurly Only</p>
															</div>
														</c:if>
													</div>
												</div>
											</li>
											<%
											}
											%>

										</ul>
									</div>
								</div>
								<!--상품 배치 종료-->

							</div>
							<!--상품리스트 종료-->
						</div>
						<!--page_article 종료-->

					</div>
					<!-- 본문 종료 -->
				</div>
				<!-- main 종료 -->

				<!-- footer 시작 -->
				<%@ include file="../include/footer.jsp"%>
				<!-- footer 종료 -->
			</div>
			<!-- container 종료 -->

			<!-- quick list 시작 -->
			<a href="#top" id="pageTop" class="on"
				style="opacity: 1; bottom: 15px;">맨 위로가기</a>
			<!--  -->
			<script>
				// 스크롤을 위로 올리면 (top메뉴가 보이면) to_top이 아래로 사라지는 효과
				$(document)
						.ready(
								function() {
									var pageTop = {
										$target : $('#pageTop'),
										$targetDefault : 0,
										$scrollTop : 0,
										$window : $(window),
										$windowHeight : 0,
										setTime : 500,
										saveHeight : 0,
										init : function() {
										},
										action : function() {
											var $self = this;
											$self.$windowHeight = parseInt($self.$window
													.height());
											$self.$window
													.on(
															'scroll',
															function() {
																$self.$scrollTop = parseInt($self.$window
																		.scrollTop());
																if ($self.$scrollTop >= $self.$windowHeight) {
																	if (!$self.$target
																			.hasClass('on')) {
																		$self
																				.position();
																		$self.$target
																				.addClass('on');
																		$self
																				.showAction();
																	}
																} else {
																	if ($self.$target
																			.hasClass('on')) {
																		$self
																				.position();
																		$self.$target
																				.removeClass('on');
																		$self
																				.hideAction();
																	}
																}
															});

											$self.$target.on('click', function(
													e) {
												e.preventDefault();
												$self.topAction();
											});
										},
										showAction : function() {
											var $self = this;
											$self.$target.stop().animate({
												opacity : 1,
												bottom : $self.saveHeight
											}, $self.setTime);
										},
										hideAction : function() {
											var $self = this;
											$self.$target.stop().animate(
													{
														opacity : 0,
														bottom : -$self.$target
																.height()
													}, $self.setTime);
										},
										topAction : function() {
											var $self = this;
											$self.hideAction();
											$('html,body').animate({
												scrollTop : 0
											}, $self.setTime);
										},
										position : function() {
											var $self = this;
											$self.saveHeight = 15;
											if ($('#sectionView').length > 0) {
												$self.saveHeight = 25;
											}
											if ($('#branch-banner-iframe').length > 0
													&& parseInt($(
															'#branch-banner-iframe')
															.css('bottom')) > 0) {
												$('#footer')
														.addClass('bnr_app');
												$self.saveHeight += $(
														'#branch-banner-iframe')
														.height();
											}
										}
									}
									pageTop.action();
								});
			</script>
			<script>
				var bodyScroll = {
					winScrollTop : 0,
					body : $('body'),
					gnb : $('#gnb'),
					bg : $('#bgLoading'),
					bodyFixed : function() {
						var $self = this;
						var gnbCheck = false;
						$self.gnb = $('#gnb');
						if ($self.gnb.hasClass('gnb_stop')) {
							gnbCheck = true;
						}
						$self.body = $('body');
						$self.bg = $('#bgLoading');
						$self.winScrollTop = $(window).scrollTop();
						$self.bg.show();
						$self.body.addClass('noBody').css({
							'top' : -$self.winScrollTop
						});
					},
					bodyDefault : function(type) {
						var $self = this;
						$self.body.removeClass('noBody').removeAttr('style');
						$self.bg.hide();
						if (type === undefined) {
							window.scrollTo(0, $self.winScrollTop);
						}
					}
				}
			</script>
			<!-- quick list 끝 -->
		</div>
		
		<!-- 장바구니 아이콘 클릭 시 레이어 팝업 -->
		<div id="cartPut">
			<div class="cart_option cartList cart_type3" style="opacity: 1;">
				<div class="inner_option">
					<button type="button" class="btn_close1">레이어닫기</button>
					<div class="in_option">
						<div class="list_goods">
							<ul class="list list_nopackage">
								<li class="on"><span class="btn_position"><button
											type="button" class="btn_del">
											<span class="txt">삭제하기</span>
										</button></span> <span class="name">타이틀 들어가는 곳</span>
									<div class="option">
										<span class="count">
											<button type="button" class="btn down on">수량내리기</button> <input
											type="number" readonly="readonly" onfocus="this.blur()"
											class="inp" value="1">
											<button type="button" class="btn up on">수량올리기</button>
										</span> <span class="price"> <span class="dc_price"><%-- <%=nf.format(p_discprice)%> --%> 가격들어가는곳 원</span>
										</span>
									</div></li>
							</ul>
						</div>
						<div class="total">
							<div class="price">
								<strong class="tit">합계</strong> <span class="sum"><span
									class="num">가격들어가는곳</span> <span class="won">원</span></span>
							</div>
							<p class="txt_point">
								<span class="ico">적립</span> <span class="no_login"> <span>로그인
										후, 적립혜택 제공</span>
								</span>
							</p>
						</div>
					</div>
					<div class="group_btn off layer_btn2">
						<span class="btn_type2"><button type="button"
								class="txt_type">취소</button></span> <span class="btn_type1"><button
								type="button" class="txt_type">장바구니 담기</button></span>
					</div>
				</div>
			</div>
			<div class="cart_option cart_type3 notify_option">
				<div class="inner_option">
					<strong class="tit">재입고 알림 신청</strong>
					<p class="name_deal">[KF365] 아보카도 1개</p>

					<p class="notice">
						<span class="ico">·</span>상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.
					</p>
					<div class="group_btn layer_btn2">
						<span class="btn_type2"><button type="button"
								class="txt_type">취소</button></span> <span class="btn_type1"><button
								type="button" class="txt_type">신청하기</button></span>
					</div>
				</div>
			</div>

			<form name="frmBuyNow" method="post" action="./order.jsp">
				<input type="hidden" name="mode" value="addItem"> <input
					type="hidden" name="goodsno" value="">
			</form>
			<form name="frmWishlist" method="post"></form>
		</div>
</body>

</html>