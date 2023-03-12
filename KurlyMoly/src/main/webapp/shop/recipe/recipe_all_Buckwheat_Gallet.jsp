<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 레시피 - 상세페이지 - 메밀갈레트 페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link href="../../css/style.css" rel="stylesheet" type="text/css">
	<link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
	<link href="../../css/etc.css" rel="stylesheet" type="text/css">
	
	<script src="../../script/script.js"></script>
	<script src="../../script/MJscript.js"></script>
	
	<style>
		#content {
			padding-bottom: 120px;
		}
		
		.skin_checkbox input[type=radio], input[type=checkbox] {
			opacity: 1 !important;
		}
		
		.xans-myshop-couponserial th {
			line-height: 1em;
		}
	</style>
</head>

<body>
	<div id="wrap" class="">
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="../include/header.jsp"%>
			<!-- main 시작 -->
			<div id="main">
				<!-- 본문 시작 -->
				<div id="content">
					<div id="qnb" class="quick-navigation">
						<div class="bnr_qnb" id="brn_Quick">
							<a href="./delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
						</div>

						<div class="side_menu">
							<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
							<a href="./recipe_all.jsp" class="link_menu">레시피</a>
						</div>
					</div>

					<!-- 레시피 - 전체보기 - 메밀갈레트 시작 -->
					<div class="tit_page">
						<h2 class="tit">레시피</h2>
					</div>

					<div class="layout-wrapper">
						<table width="100%" align="center">
							<tbody>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td>
														<table class="boardView" width="100%">
															<tbody>
																<tr>
																	<th scope="row" style="border: none;">제목</th>
																	<td>메밀 갈레트</td>
																</tr>
																<tr>
																	<th scope="row">작성자</th>
																	<td>MarketKurly</td>
																</tr>
																<tr class="etcArea">
																	<td colspan="2">
																		<ul>
																			<li class="date"><strong class="th">작성일</strong><span class="td">2021-02-18</span></li>
																			<li class="hit"><strong class="th">조회수</strong><span class="td">68923</span></li>
																		</ul>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td height="200" valign="top" id="contents" class="view_recipe">
														<table width="100%" style="table-layout: fixed" class="goods_wrap">
															<tbody>
																<tr>
																	<td valign="top">
																		<div class="goods_recipe">
																			<h3>
																				<span class="recipe_tit">Kurly’s Recipe</span>
																				<small class="recipe_product">메밀 갈레트</small>
																			</h3>
																			<div class="context">
																				<div class="pic">
																					<img src="//img-cf.kurly.com/shop/data/board/recipe/r/b6d3695bcb4c5569">
																				</div>
																				<p class="words">
																					<strong class="recipe_item_tit">재료</strong> 순메밀가루
																					100g, 우유 200mL, 달걀 1개, 양송이 버섯, 베이컨, 베이비 채소, 경성치즈,
																					소금과 설탕 1/4작은술, 후추
																				</p>
																				<p class="words">
																					<strong class="recipe_item_tit">RECIPE</strong> 1.
																					볼에 순메밀가루, 소금, 설탕을 넣은 뒤 우유를 조금씩 부으면서 섞는다.<br>
																					2. 묽은 상태의 반죽을 냉장고에서 1시간 정도 숙성한다. 이때 편으로 썬 버섯과 베이컨을
																					살짝 굽는다.<br> 3. 약불로 달군 팬에 오일을 둘러 코팅한 뒤 반죽을 얇고
																					넓게 펼쳐 굽는다.<br> 4. 달걀 1개를 깨 ③의 중앙에 위치시킨 뒤 구운
																					버섯과 베이컨을 올리고, 가장자리를 접어 준다.<br> 5. 후추, 경성 치즈를
																					갈아 올린 뒤 베이비 채소로 장식해 마무리한다.<br> <b>Tip.</b>혻베이컨
																					대신 프로슈토나 하몽을 사용해도 좋아요. 에멘탈 치즈 등을 더해주면 짭조름한 감칠맛이 한층
																					살아납니다.
																				</p>
																			</div>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								
							</tbody>
						</table>
						<table width="100%" style="table-layout: fixed; border-top: 1px solid #795c90; height: 80px;">
							<tbody>
								<tr>
									<td align="center" style="padding-top: 10px;">
										<table width="100%">
											<tbody>
												<tr>
													<td></td>
													<td align="right"><a href="../../shop/recipe/recipe_all.jsp"><span class="bhs_button yb" style="float: none;">목록</span></a></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
							<ul>
								<li class="prev "><strong>이전글</strong><a href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a href="./recipe_all_Rucola_Pizza.jsp">플랫 브레드 루꼴라 피자</a></li>
								<p>
									<br>
									<textarea id="examC_392" style="display: none; width: 100%; height: 300px">순메밀가루 100g, 우유 200mL, 달걀 1개, 양송이 버섯, 베이컨, 베이비 채소, 경성치즈, 소금과 설탕 1/4작은술, 후추</textarea>
								</p>
							</ul>
						</div>
						<div class="bg_loading" id="bgLoading" style="display: none;">
							<div class="loading_show"></div>
						</div>
						<script>
							// KM-1483 Amplitude
							KurlyTracker.setScreenName('recipe_detail')
						</script>
					</div>
					<!-- 레시피 - 전체보기 - 메밀갈레트 종료 -->
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
		<a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 15px;">맨 위로가기</a>
		<script>
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

	<!-- 레시피 상세보기 페이지 카트 부분 -->
	<div id="cartPut">
		<div class="cart_option cartList cart_type3" style="opacity: 1;">
			<div class="inner_option">
				<button type="button" class="btn_close1">레이어닫기</button>
				<div class="in_option">
					<div class="list_goods">
						<ul class="list list_nopackage">
							<li class="on"><span class="btn_position"><button type="button" class="btn_del">
										<span class="txt">삭제하기</span>
									</button></span> <span class="name"> [사브로소] 엑스트라버진 올리브 오일 </span>
								<div class="option">
									<span class="count"><button type="button" class="btn down on">수량내리기</button> <input type="number"
										readonly="readonly" onfocus="this.blur()" class="inp">
										<button type="button" class="btn up on">수량올리기</button></span> <span
										class="price"> <span class="dc_price">13,900원</span>
									</span>
								</div></li>
						</ul>
					</div>
					<div class="total">
						<div class="price">
							<strong class="tit">합계</strong> <span class="sum"><span
								class="num">13,900</span> <span class="won">원</span></span>
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
							type="button" class="txt_type">장바구니 담기</button> </span>
				</div>
			</div>
		</div>
		<div class="cart_option cart_type3 notify_option">
			<div class="inner_option">
				<strong class="tit">재입고 알림 신청</strong>
				<p class="name_deal">[사브로소] 엑스트라버진 올리브 오일</p>
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
		<div class="cart_option cart_result cart_type3">
			<div class="inner_option">
				<button type="button" class="btn_close1">pc레이어닫기</button>
				<p class="success">
					상품 구매를 위한 <span class="bar"></span>배송지를 설정해주세요
				</p>
				<div class="group_btn layer_btn2">
					<span class="btn_type2"><button type="button"
							class="txt_type">취소</button></span> <span class="btn_type1"><button
							type="button" class="txt_type">
							<span class="ico_search"></span>주소 검색
						</button></span>
				</div>
			</div>
		</div>
		<form name="frmBuyNow" method="post" action="/shop/order/order.php">
			<input type="hidden" name="mode" value="addItem"> <input
				type="hidden" name="goodsno" value="">
		</form>
		<form name="frmWishlist" method="post"></form>
	</div>

	<script>
		// RECIPE ITEMS 장바구니창 취소버튼(닫기)
		$(function() {
			$('.btn_type2').click(function() {
				$('#cartPut').css("display", "none");
			});
		});

		$(function() {
			$('.btn_cart').click(function() {
				$('#cartPut').css("display", "block");
			});
		});
	</script>

	<script src="../../script/common_filter.js"></script>
	<script src="../../script/cartput_v1.js"></script>

	<script>
		// 클릭인경우
		function cartLayerOpenAction(no, type) {
			var cartPutDefault = {
				'login' : false,
				'no' : no,
				'type' : 'pc'
			}
			cartPutDefault.login = window.webStatus.isSession;
			if (cartPutDefault.login || typeof type === 'undefined') {
				bodyScroll.bodyFixed();
			}
			cartPut.userInfoGet(cartPutDefault,
					(typeof type !== 'undefind' && type === 'notify') ? type
							: false);
		}
	</script>
	<script src="../../script/customeEvent.js"></script>
</body>

</html>