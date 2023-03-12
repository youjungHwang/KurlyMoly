<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id="productDAO" class="com.kurly.product.ProductDAO" />
<c:set var="newestList" value="${productDAO.newestList()}" />
<!-- 최신 상품순 -->


<!-- 신상품 리스트 -->
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
				<div id="qnb" class="quick-navigation"
					style="top: 325px; right: 20px;">
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
					<div class="page_article new_article">
						<!--세부 카테고리 바 시작-->
						<div id="top_menu">
							<div id="new_logo_menu">
								<span><h3>신상품</h3></span>
							</div>
							<ul class="top_menu_list">
								<div class="new_border">
									<li id="top_menu_title"><a href="#">전체보기</a></li>
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
							<!--정렬기능
							<div class="sort_menu">
								<div class="">
									<div class="select_type user_sort checked">
										<a class="name_select">신상품순</a>
										<ul class="list">
											<li><a class="">추천순</a></li>
											<li><a class="on">신상품순</a></li>
											<li><a class="">인기상품순</a></li>
											<li><a class="">혜택순</a></li>
										</ul>
									</div>
								</div>
							</div>-->
							<!--상품 배치 시작-->
							<div id="goodsList_inner">
								<div id="goodsList_inner_box">
									<ul class="goodsList_list">

										<c:forEach var="item" items="${newestList}" varStatus="status">
											<li>
												<div class="item">
													<div class="product_part">
														<div class="product_photo">
															<a href="./goods_detail.jsp?p_idx=${item.idx}"><img src="../../img/goods_detail/${item.imgname}"></img></a>
														</div>
														<!--찜기능 버튼-->
														<div class="wish_btn wish0 turn_off">
															<input type="button"> <img src="../../img/goods_list/wish0.png" alt="찜기능off"></input>
														</div>
														<div class="wish_btn wish1 turn_on">
															<input type="button"> <img src="../../img/goods_list/wish1.png" alt="찜기능on"> </input>
														</div>
														<!--장바구니 버튼-->
														<div class="chart_btn" onclick="return false">
															<input type="button" class="chart_click_btn"> <a href=""><img src="../../img/goods_list/ico_cart.svg" alt="장바구니"></a> </input>
														</div>
													</div>


													<div class="product_info">
														<div class="name">[${item.brand}] ${item.title}</div>
														<span id="cost">
															<fmt:parseNumber value="${item.price}" var="price" />
															<fmt:parseNumber value="${item.discprice}" var="discprice" />
															<fmt:parseNumber value="${(price-discprice)/price*100}" var="percent" pattern="00." integerOnly="true" />
															<c:if test="${percent gt 1 }">
																<!-- 가격 할인 있을때만, 상품 할인퍼센트 표시  -->
																<span class="sale">${percent}%</span>
															</c:if>
															<span class="cost">${item.discprice}원</span>
															<c:if test="${percent gt 1 }">
																<div class="before_sale">${item.price}원</div>
															</c:if>
														</span>
														<p class="smalltip">${item.subtitle}</p>
														<c:if test="${ item.category2 eq 'KurlyOnly'}">
															<!--  Kurly Only 태그 표시  -->
															<div class="tag">
																<p class="limit_tag">Kurly Only</p>
															</div>
														</c:if>
													</div>
												</div>
											</li>
										</c:forEach>

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

										$self.$target.on('click', function(e) {
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
										$self.$target.stop().animate({
											opacity : 0,
											bottom : -$self.$target.height()
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
											$('#footer').addClass('bnr_app');
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
									</button></span> <span class="name"> [KF365] 아보카도 1개 
							</span> <!--value값 1로 디폴트-->
								<div class="option">
									<span class="count"><button type="button"
											class="btn down on">수량내리기</button> <input type="number"
										readonly="readonly" onfocus="this.blur()" class="inp"
										value="1">
										<button type="button" class="btn up on">수량올리기</button></span> <span
										class="price"> <span class="dc_price">2,340원</span>
									</span>
								</div></li>
						</ul>
					</div>
					<div class="total">
						<div class="price">
							<strong class="tit">합계</strong>
							<span class="sum"><span class="num">2,340</span> <span
								class="won">원</span></span>
						</div>
						<p class="txt_point">
							<span class="ico">적립</span> <span class="no_login">
								<span>로그인 후, 적립혜택 제공</span>
							</span>
						</p>
					</div>
				</div>
				<div class="group_btn off layer_btn2">
					<span class="btn_type2"><button type="button"
							class="txt_type">취소</button></span> <span class="btn_type1"><button
							type="button" class="txt_type">장바구니 담기</button> </span>
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
		<!-- <div class="cart_option cart_result cart_type3">
            <div class="inner_option"><button type="button" class="btn_close1">pc레이어닫기</button>
                <p class="success">상품 구매를 위한 <span class="bar"></span>배송지를 설정해주세요</p>
                <div class="group_btn layer_btn2"><span class="btn_type2"><button type="button"
                            class="txt_type">취소</button></span> <span class="btn_type1"><button type="button"
                            class="txt_type"><span class="ico_search"></span>주소 검색</button></span></div>
            </div>
        </div> -->
		<form name="frmBuyNow" method="post" action="/shop/order/order.php">
			<input type="hidden" name="mode" value="addItem"> <input
				type="hidden" name="goodsno" value="">
		</form>
		<form name="frmWishlist" method="post"></form>
	</div>
</body>

</html>