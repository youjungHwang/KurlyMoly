<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 금주혜택 페이지 N -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link href="../../css/style.css?ver=1" rel="stylesheet" type="text/css">
    <link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />
    
    <script src="../../script/script.js"></script>
    <script src="../../script/MJscript.js"></script>
    <script src="/common_js/kurlytracker/kurlytracker.js?ver=1.26.11"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
					<div id="kurlyMain" class="page_main" style="opacity: 1;">
						<h2 class="screen_out">마켓컬리 메인</h2>
						<div>
							<div class="main_type1">
								<!-- 이벤트 리스트 이미지 슬라이더 부분 -->
								<div class="list_goods">
									<div class="bx_wrapper"
										style="max-width: 100%; margin: 0px auto;">
										<!-- ★★★★★★★★★★ HYJ 메인 롤링 ★★★★★★★★★★ -->
										<div class="bx_viewport swiper-container"
											style="width: 100%; overflow: hidden; position: relative; height: 370px;">
											<div data-section="main_banner" class="list swiper-wrapper"
												style="width: 1000%; position: relative;">
												<div data-index="8" style="float: left; list-style: none; position: relative; width: 10%;" class="bx-clone swiper-slide" data-name="main_banner">
													<a href="../../event_friend.jsp" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1583112495.webp'); background-size: cover;"></a>
												</div>
												<div data-index="1" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;" data-name="main_banner">
													<a href="./goods_list.jsp?category1=006&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1614935884.webp'); background-size: cover;"></a>
												</div>
												<div data-index="2" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./goods_list.jsp?category1=008&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1614910139.webp'); background-size: cover;"></a>
												</div>
												<div data-index="3" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./goods_list.jsp?category1=005&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1614758267.webp'); background-size: cover;"></a>
												</div>
												<div data-index="4" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./goods_list.jsp?category1=006&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1614909903.webp'); background-size: cover;"></a>
												</div>
												<div data-index="5" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./goods_list.jsp?category1=005&category2=02" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1614679801.webp'); background-size: cover;"></a>
												</div>
												<div data-index="6" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./goods_list.jsp?category1=001&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1602809211.webp'); background-size: cover;"></a>
												</div>
												<div data-index="7" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./goods_list.jsp?category1=001&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1596164134.webp'); background-size: cover;"></a>
												</div>
												<div data-index="8" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;" data-name="main_banner">
													<a href="../../event_friend.jsp" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1583112495.webp'); background-size: cover;"></a>
												</div>
												<div data-index="1" style="float: left; list-style: none; position: relative; width: 10%;" class="bx-clone swiper-slide" data-name="main_banner">
													<a href="./goods_list.jsp?category1=006&category2=01" class="thumb_goods" style="background-image: url('../../img/mainSlide/pc_img_1614935884.webp'); background-size: cover;"></a>
												</div>
											</div>
										</div>
										
										<script>
											$(function() {
												let swiper = new Swiper (
													'.swiper-container',
													{
														loop : true,
														autoplay : true,
														speed : 200,
														autoplayDisableOnInteraction : true,
														pagination : '.swiper-pagination',
														paginationClickable : true
													}
												);
											});
										</script>
										<!--★★★★★★★★★★ HYJ 메인 롤링 끝 ★★★★★★★★★★-->
									</div>
								</div>
							</div>
						</div>

						<div style="margin-top: 40px;">
							<div class="main_type2">
								<div class="category_type">
									<div class="tit_goods">
										<h3 class="tit">
											<span class="name" style="font-size: 50px;">할인 또 할인</span>
										</h3>
									</div>

									<div class="event_list">
										<table class="event_list_tb">
											<tr class="event_area">
												<td rowspan="2" class="ev_style1">
													<div>
														<a href="./goods_list.jsp?category1=004">
															<span class="bg_black" style="width: 380px; height: 950px;"></span>
															<span class="bg_text"> <span class="event1">EVENT</span>
																<span class="event_title1">설날에<br>전하지 못한 마음</span>
																<span class="event_subTitle1">아직 늦지 않았어요</span>
																<span class="event_day1">한정수량</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-1.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style2" style="height: 470px;">
													<div>
														<a href="./goods_list.jsp?category1=005">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">간편하지만 든든한 한 끼</span>
																<span class="event_subTitle2">LOTS OF LOVE<br>최대 30% 할인</span>
																<span class="event_day2">~2월 24일(수) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-2.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style3">
													<div>
														<a href="./goods_list.jsp?category1=009">
															<span class="bg_black"></span>
															<span class="bg_text"> <span class="event3">EVENT</span>
																<span class="event_title3">모두가 즐기는 간식</span>
																<span class="event_subTitle3">GANSIK<br>최대 25% 할인</span>
																<span class="event_day3">~2월 24일(수) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-3.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style4">
													<div>
														<a href="./goods_list.jsp?category1=008">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">새학기 준비, 한번에 끝!</span>
																<span class="event_subTitle2">피터젠슨<br>최대 45% 할인</span>
																<span class="event_day2">~2월 24일(수) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-4.jpg"></span>
														</a>
													</div>
												</td>
											</tr>
											<tr class="event_area">
												<td class="ev_style2">
													<div>
														<a href="./goods_list.jsp?category1=012">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">믿고 쓰는 두피 케어</span>
																<span class="event_subTitle2">닥터포헤어<br>최대 55% 할인</span>
																<span class="event_day2">~2월 24일(수) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-5.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style3">
													<div>
														<a href="./goods_list.jsp?category1=007&category2=04">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event3">EVENT</span>
																<span class="event_title3">프리미엄 유기농 오일</span>
																<span class="event_subTitle3">구스티<br>최대 30% 할인</span>
																<span class="event_day3">~2월 24일(수) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-6.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style4">
													<div>
														<a href="./goods_list.jsp?category1=006">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">프렌치 프라이의 정석</span>
																<span class="event_subTitle2">심플로트<br>최대 15% 할인</span>
																<span class="event_day2">~2월 23일(화) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event1-7.jpg"></span>
														</a>
													</div>
												</td>
											</tr>
										</table>
									</div>

									<div class="tit_goods" style="margin-top: 30px;">
										<h3 class="tit">
											<span class="name" style="font-size: 50px;">아직 늦지 않았어요!</span>
										</h3>
									</div>

									<div class="event_list" style="margin-bottom: 120px;">
										<table class="event_list_tb">
											<tr class="event_area">
												<td rowspan="2" class="ev_style1">
													<div>
														<a href="./goods_list.jsp?category1=003">
															<span class="bg_black" style="width: 380px; height: 950px;"></span>
															<span class="bg_text">
																<span class="event1">EVENT</span>
																<span class="event_title1">차갑고 깨끗한<br>노르웨이에서 온</span>
																<span class="event_subTitle1">청정 수산물 특별전</span>
																<span class="event_day1">~2월 22일(월) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-1.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style2" style="height: 470px;">
													<div>
														<a href="./goods_list.jsp?category1=017">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">영양소 가득한<br>동결건조 사료</span>
																<span class="event_subTitle2">빅스비<br>최대 15% 할인</span>
																<span class="event_day2">~2월 22일(월) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-2.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style3">
													<div>
														<a href="./goods_list.jsp?category1=013&category2=01">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event3">EVENT</span>
																<span class="event_title3">프랑스에서 온<br>자연 유래 스킨케어</span>
																<span class="event_subTitle3">가란시아<br>최대 30% 할인</span>
																<span class="event_day3">~2월 22일(월) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-3.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style4">
													<div>
														<a href="./goods_list.jsp?category1=008&category2=04">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">한 잔에 담긴<br>우아한 풍미</span>
																<span class="event_subTitle2">small batch<br>최대 10% 할인</span>
																<span class="event_day2">~2월 22일(월) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-4.jpg"></span>
														</a>
													</div>
												</td>
											</tr>
											<tr class="event_area">
												<td class="ev_style2">
													<div>
														<a href="./goods_list.jsp?category1=009">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">설 연휴,<br>입이 심심할 땐</span>
																<span class="event_subTitle2">주전부리연구소<br>최대 20% 할인</span>
																<span class="event_day2">~2월 22일(월) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-5.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style3">
													<div>
														<a href="./goods_list.jsp?category1=006&category2=05">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event3">EVENT</span>
																<span class="event_title3">아낌없이 속을 채운 만두</span>
																<span class="event_subTitle3">해화당<br>최대 35% 할인</span>
																<span class="event_day3">~2월 22일(월) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-6.jpg"></span>
														</a>
													</div>
												</td>
												<td class="ev_style4">
													<div>
														<a href="./goods_list.jsp?category1=009">
															<span class="bg_black"></span>
															<span class="bg_text">
																<span class="event2">EVENT</span>
																<span class="event_title2">단백질로 만들어<br>걱정 없는 간식</span>
																<span class="event_subTitle2">단백질과자점<br>최대 15% 할인</span>
																<span class="event_day2">~2월 23일(화) 11시</span>
															</span>
															<span class="eventImg"><img src="../../img/weekEvent/event2-7.jpg"></span>
														</a>
													</div>
												</td>
											</tr>
										</table>
									</div>

									<div class="loversEvent">
										<div class="loEv">
											<div class="loEvTitle">컬리 러버스 혜택</div>
										</div>

										<div class="loEvContent">
											<div class="loEvImgBox">
												<div>
													<a href="../../event_payco.jsp">
														<span class="bg_black"></span>
														<span class="bg_text">
															<span class="event">EVENT</span>
															<span class="event_title">PAYCO 충전 포인트로<br>결제할 때마다</span>
															<span class="event_subTitle"><br>3.5% 포인트 적립!</span>
															<span class="event_day">12.21(월) - 2.28(일)</span>
														</span>
														<span class="ImgBox"><img src="../../img/weekEvent/loversEvent1.jpg"></span>
													</a>
												</div>
												<div>
													<a href="../../event_woori.jsp">
														<span class="bg_black"></span>
														<span class="bg_text">
															<span class="event">EVENT</span>
															<span class="event_title">삼성앱카드로<br>6만원 이상 결제 시</span>
															<span class="event_subTitle"><br>3천원 청구 할인!</span>
															<span class="event_day">~2월 24일(수) 11시</span>
														</span>
														<span class="ImgBox"><img src="../../img/weekEvent/loversEvent2.jpg"></span>
													</a>
												</div>
												<div>
													<a href="../../event.jsp">
														<span class="bg_black"></span>
														<span class="bg_text">
															<span class="event">EVENT</span>
															<span class="event_title">장바구니 자랑하면<br></span>
															<span class="event_subTitle">5천원의 행운이<br>20분께 매일!</span>
															<span class="event_day">상시 진행</span>
														</span>
														<span class="ImgBox"><img src="../../img/weekEvent/loversEvent3.jpg"></span>
													</a>
												</div>
												<div>
													<a href="../../event_friend.jsp">
														<span class="bg_black"></span>
														<span class="bg_text">
															<span class="event">EVENT</span>
															<span class="event_title">친구 초대하면<br>친구도 나도 5천원씩</span>
															<span class="event_subTitle">참여할 때마다<br>무제한 적립금 혜택</span>
															<span class="event_day">상시 진행</span>
														</span>
														<span class="ImgBox"><img src="../../img/weekEvent/loversEvent4.jpg"></span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
</body>

</html>