<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="./css/style.css?ver=3" rel="stylesheet" type="text/css">
<link href="./css/jsScript.css?ver=1" rel="stylesheet" type="text/css">
<link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />

<script src="./script/script.js"></script>
<script src="./script/MJscript.js?ver=2"></script>
<script src="/common_js/kurlytracker/kurlytracker.js?ver=1.26.11"></script>

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	function showPopup() {
		window
				.open(
						"./shop/goods/popup_destination.html",
						"a",
						"border:0 none;margin:0;width:100%;height:100%;min-width:300px;overflow:hidden;padding:0");
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</head>

<body>
	<div id="wrap" class="">
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="./include/header.jsp"%>
			<!-- main 시작 -->
			<div id="main">
				<!-- 본문 시작 -->
				<div id="content">
					<div id="qnbMain" class="quick-navigation" style="z-index: 500;">
						<div class="bnr_qnb" id="brn_Quick">
							<a href="./shop/board/delivery.jsp"><img class="thumb"
								src="./img/sidebar/bnr_quick_20190403.webp"></a>
						</div>
						<script>
							var brnQuick = {
								nowTime : '1614533726294',
								update : function() {
									$
											.ajax(
													{
														url : campaginUrl
																+ 'pc/service/bnr_quick.html'
													}).done(function(result) {
												$('#brnQuick').html(result);
											});
								}
							}
							brnQuick.update();
						</script>

						<div class="side_menu">
							<a href="./event_lovers.jsp" class="link_menu">등급별 혜택</a> <a
								href="./shop/recipe/recipe_all.jsp" class="link_menu">레시피</a>
						</div>
					</div>

					<div id="kurlyMain" class="page_main" style="opacity: 1;">
						<h2 class="screen_out">마켓컬리 메인</h2>
						<div>
							<div class="main_type1">
								<!-- 이벤트 리스트 이미지 슬라이더 부분 -->
								<div class="list_goods">
									<div class="bx_wrapper"
										style="max-width: 100%; margin: 0px auto;">
										<!-- ★★★★★★★★★★ 메인 롤링 ★★★★★★★★★★ -->
										<div class="bx_viewport swiper-container"
											style="width: 100%; overflow: hidden; position: relative; height: 370px;">
											<div data-section="main_banner" class="list swiper-wrapper"
												style="width: 1000%; position: relative;">
												<div data-index="8"
													style="float: left; list-style: none; position: relative; width: 10%;"
													class="bx-clone swiper-slide" data-name="main_banner">
													<a href="./event_friend.jsp" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1583112495.webp'); background-size: cover;"></a>
												</div>
												<div data-index="1" class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;"
													data-name="main_banner">
													<a href="#" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1614935884.webp'); background-size: cover;"></a>
												</div>
												<div data-index="2" data-name="main_banner"
													class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./shop/goods/goods_list.jsp?category1=006" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1614910139.webp'); background-size: cover;"></a>
												</div>
												<div data-index="3" data-name="main_banner"
													class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./shop/goods/goods_list.jsp?category1=005" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1614758267.webp'); background-size: cover;"></a>
												</div>
												<div data-index="4" data-name="main_banner"
													class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./shop/goods/goods_list.jsp?category1=009" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1614909903.webp'); background-size: cover;"></a>
												</div>
												<div data-index="5" data-name="main_banner"
													class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./shop/goods/goods_list.jsp?category1=005" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1614679801.webp'); background-size: cover;"></a>
												</div>
												<div data-index="6" data-name="main_banner"
													class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="./shop/goods/goods_list.jsp?category1=001" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1602809211.webp'); background-size: cover;"></a>
												</div>
												<div data-index="7" data-name="main_banner"
													class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;">
													<a href="#" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1596164134.webp'); background-size: cover;"></a>
												</div>
												<div data-index="8" class="swiper-slide"
													style="float: left; list-style: none; position: relative; width: 10%;"
													data-name="main_banner">
													<a href="#" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1583112495.webp'); background-size: cover;"></a>
												</div>
												<div data-index="1"
													style="float: left; list-style: none; position: relative; width: 10%;"
													class="bx-clone swiper-slide" data-name="main_banner">
													<a href="#" class="thumb_goods"
														style="background-image: url('./img/mainSlide/pc_img_1614935884.webp'); background-size: cover;"></a>
												</div><div data-index="8" style="float: left; list-style: none; position: relative; width: 10%;" class="bx-clone swiper-slide" data-name="main_banner">
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
												let swiper = new Swiper(
														'.swiper-container',
														{
															loop : true,
															autoplay : true,
															speed : 200,
															autoplayDisableOnInteraction : true,
															pagination : '.swiper-pagination',
															paginationClickable : true
														});
											});
										</script>
										<!--★★★★★★★★★★ 메인 롤링 끝 ★★★★★★★★★★-->
									</div>
								</div>
							</div>
						</div>

						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="tit_goods">
										<h3 class="tit">
											<span class="name">이 상품 어때요?</span>
										</h3>
									</div>
									<div class="list_goods">
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">

											<!--★★★★★★★★★★ 중간 롤링 ★★★★★★★★★★-->
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 506px;">
												<div data-title="이 상품 어때요?"
													data-section="today_recommendation"
													class="list swiper-wrapper">

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=54"> <img
															src="./img/goods_detail/0020106_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"> <a class="txt">[유가원] 유기농 바나나칩 230g</a></span> <span class="price"> 5,000원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=167"> <img
															src="./img/goods_detail/0040305_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"> <a class="txt">[버크셔세상] 버크셔K 흑돼지 앞다리살</a></span> <span class="price">6,200원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=202"> <img
															src="./img/goods_detail/0060304_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"> <a class="txt">[스테파노스 키친] 까르보나라 스파게티 세트</a></span> <span class="price">6,800원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=258"> <img
															src="./img/goods_detail/0090306_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"> <a class="txt">[바오담] 호두강정</a></span> <span class="price">12,800원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=120"> <img
															src="./img/goods_detail/0030406_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"> <a class="txt">[삼삼해물] 홍해삼</a></span> <span class="price">33,600원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=220"> <img
															src="./img/goods_detail/0070304_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"><a class="txt">[서강유업] 가족을 위한 사골곰탕</a></span> <span class="price">3,500원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=216"> <img
															src="./img/goods_detail/0070206_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[맹가졸리] 발사믹 모데나 식초</a></span> <span class="price">9,900원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=40"> <img
															src="./img/goods_detail/0010704_mainImg.jpg " alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">아스파라거스 200g</a></span><span class="price">4,500원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=37"> <img
															src="./img/goods_detail/0010701_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">무농약 간편 샐러드 6종</a></span> <span class="price">1,800원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=157"> <img
															src="./img/goods_detail/0040201_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"><a class="txt">호주산 MB4 블랙앵거스 토마호크 스테이크 700g(냉장)</a></span> <span
																class="price">59,000원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=257"> <img
															src="./img/goods_detail/0090305_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[떡미당] 밥알찹쌀떡</a></span> <span class="price">6,200원 </span> 
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=60"> <img
															src="./img/goods_detail/0020206_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[올프레쉬] 프리미엄 금실 딸기 2팩 (820g)</a></span> <span class="price">30,000원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=95"> <img
															src="./img/goods_detail/0020805_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"><a class="txt">[조선마켓] 조선향미 골드퀸 3호</a></span> <span
																class="price">7,800원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=252"> <img
															src="./img/goods_detail/0090206_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[질리맥스] 핀란드 자일리톨 2종</a></span>
															<span class="price">7,900원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=11"> <img
															src="./img/goods_detail/0010205_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[맛꾼푸드] 아이스 엿구마 2종</a></span> <span class="price">2,700원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=122"> <img
															src="./img/goods_detail/0030502_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[제주창해수산] 딱새우 300g</a></span> <span class="price">6,800원</span>
														</div>
													</div>

													
												</div>
												<div class="bx-controls bx-has-controls-direction">
													<div class="bx-controls-direction">
														<a class="bx-prev " href="" onclick="return false">Prev</a>
														<a class="bx-next " href="" onclick="return false">Next</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
							let swiper1 = new Swiper('.swiper-Container', {

								slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
								spaceBetween : 30, // 슬라이드간 간격
								slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

								// 그룹수가 맞지 않을 경우 빈칸으로 메우기
								// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
								loopFillGroupWithBlank : true,

								loop : true, // 무한 반복

								navigation : { // 네비게이션
									nextEl : '.bx-next', // 다음 버튼 클래스명
									prevEl : '.bx-prev', // 이번 버튼 클래스명
								}
							});
						</script>

						<div>
							<div class="main_type3 bg">
								<div class="main_event">
									<div class="tit_goods">
										<h3 class="tit">
											<a class="name" href="./shop/goods/event_list.jsp"><span class="ico">이벤트 소식</span></a>
										</h3>
									</div>
									<div class="list_goods">
										<ul data-title="이벤트 소식" data-section="event" class="list">
											
											<li data-index="1"><a class="thumb_goods" href="./shop/goods/goods_list.jsp?category1=008"> <img
													src="./img/mainSlide/pc_img_1614676370.jpg" alt="상품이미지" class="thumb">
											</a>
												<div class="info_goods">
													<div class="inner_info">
														<span class="name"><a class="txt">small batch 최대 10% 할인</a></span>
														<span class="desc"><a class="txt">한잔에 담긴 우아한 풍미</a></span>
													</div>
												</div></li>
											
											<li data-index="2"><a class="thumb_goods" href="./shop/goods/goods_list.jsp?category1=005"> <img
													src="./img/mainSlide/pc_img_1614771399.jpg" alt="상품이미지" class="thumb">
											</a>
												<div class="info_goods">
													<div class="inner_info">
														<span class="name"><a class="txt">LOTS OF LOVE 최대 30%
																할인</a></span> <span class="desc"><a class="txt">간편하지만 든든한 한 끼</a></span>
													</div>
												</div></li>


											<li data-index="3"><a class="thumb_goods" href="./shop/goods/goods_list.jsp?category1=009"> <img
													src="./img/mainSlide/pc_img_1614676376.jpg" alt="상품이미지" class="thumb">
											</a>
												<div class="info_goods">
													<div class="inner_info">
														<span class="name"><a class="txt">GANSIK 최대 25% 할인</a></span>
														<span class="desc"><a class="txt">모두가 즐기는 간식</a></span>
													</div>
												</div></li>

											

										</ul>
									</div>
								</div>
							</div>
						</div>

						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="tit_goods">
										<h3 class="tit">
											<a class="name" href="./shop/goods/goods_list_sales.jsp"><span class="ico">알뜰 상품</span></a>
										</h3>
									</div>
									<!--복사-->

									<div class="list_goods">
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 506px;">
												<div data-title="알뜰 상품" data-section="sale_goods"
													class="list swiper-wrapper">

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=14"> <img src="./img/goods_detail/0010302_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">친환경 잎채소 로메인 100g</a></span> <span class="price"><span
																class="dc">17%</span>1,500원</span> <span class="cost">1,800원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=68"> <img src="./img/goods_detail/0020402_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">썬키스트 팬시 레몬 1개</a></span> <span class="price"><span
																class="dc">15%</span>670원</span> <span class="cost">790원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=26"> <img src="./img/goods_detail/0010502_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">무농약 깐 양파 1개</a></span> <span class="price"><span
																class="dc">8%</span>1,200원</span> <span class="cost">1,300원</span>
														</div>
													</div>

													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=139"> <img src="./img/goods_detail/0030801_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">자른 미역 30g(냉장)</a></span> <span class="price"><span
																class="dc">12%</span>1,670원</span> <span class="cost">1,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=2"> <img src="./img/goods_detail/0010102_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">국산콩 무농약 콩나물 300g</a></span> <span class="price"><span
																class="dc">20%</span>1,600원</span> <span class="cost">2,000원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=67"> <img src="./img/goods_detail/0020401_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[KF365] 아보카도 1개</a></span> <span class="price"><span
																class="dc">6%</span>2,200원</span> <span class="cost">2,340원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=7"> <img src="./img/goods_detail/0010201_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">친환경 당근 500g</a></span> <span class="price"><span
																class="dc">7%</span>2,800원</span> <span class="cost">3,000원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=198"> <img src="./img/goods_detail/0060206_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[더바른도시락] 퀴노아 영양밥 & 매콤제육볶음</a></span> <span class="price"><span
																class="dc">5%</span>3,500원</span> <span class="cost">3,700원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=244"> <img src="./img/goods_detail/0090104_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[네이처밸리] 그래놀라 바 5종</a></span> <span class="price"><span
																class="dc">30%</span>3,430원</span> <span class="cost">4,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=254"> <img src="./img/goods_detail/0090302_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[유기방아] 떡볶이떡 & 떡국떡 (냉동)</a></span> <span class="price"><span
																class="dc">30%</span>3,010원</span> <span class="cost">4,300원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=268"> <img src="./img/goods_detail/0100204_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[라콩비에트] 프랑스 AOP 버터 2종</a></span> <span class="price"><span
																class="dc">25%</span>26,100원</span> <span class="cost">34,800원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=177"> <img src="./img/goods_detail/0050203_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[명인등심] 차돌된장밥(270g*2입)</a></span> <span class="price"><span
																class="dc">10%</span>8,730원</span> <span class="cost">9,700원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=87"> <img src="./img/goods_detail/0020703_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">매일 색다른 하루 견과 먼투썬 6주</a></span> <span class="price"><span
																class="dc">10%</span>32,310원</span> <span class="cost">35,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=114"> <img src="./img/goods_detail/0030306_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[법성포참맛] 대용량 영광굴비 1.2kg(20마리)(냉동)</a></span> <span class="price"><span
																class="dc">40%</span>15,900원</span> <span class="cost">26,500원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=96"> <img src="./img/goods_detail/0020806_mainImg.jpg	"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[청오건강] 유기농 쌀가루</a></span> <span class="price"><span
																class="dc">11%</span>3,300원</span> <span class="cost">3,700원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=145"> <img src="./img/goods_detail/0030901_mainImg.jpg "
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">바다모음 밥새우 50g(냉장)</a></span> <span class="price"><span
																class="dc">19%</span>2,200원</span> <span class="cost">2,700원</span>
														</div>
													</div>

												</div>
											</div>
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev2 " href="" onclick="return false">Prev</a>
													<a class="bx-next2 " href="" onclick="return false">Next</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
							let swiper2 = new Swiper('.swiper-Container', {

								slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
								spaceBetween : 30, // 슬라이드간 간격
								slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

								// 그룹수가 맞지 않을 경우 빈칸으로 메우기
								// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
								loopFillGroupWithBlank : true,

								loop : true, // 무한 반복

								navigation : { // 네비게이션
									nextEl : '.bx-next2', // 다음 버튼 클래스명
									prevEl : '.bx-prev2', // 이번 버튼 클래스명
								}
							});
						</script>

						<div>
							<div class="main_type2">
								<div class="category_type">
									<div class="tit_goods">
										<h3 class="tit">
											<span class="name">MD의 추천</span>
										</h3>
									</div>
									<div class="category_menu">
										<div class="bg_category">
											<span class="bg_shadow shadow_before"></span> <span
												class="bg_shadow shadow_after"></span>
										</div>
										<div class="category">
											<ul class="list_category">
												<li data-start="33" data-end="75"><a data-no="907"
													href="./shop/goods/goods_list.jsp?category1=001" class="menu"> 채소 </a></li>
												<li data-start="100" data-end="196"><a data-no="908"
													href="./shop/goods/goods_list.jsp?category1=002" class="menu"> 과일·견과·쌀 </a></li>
												<li data-start="221" data-end="343"><a data-no="909"
													href="./shop/goods/goods_list.jsp?category1=003" class="menu"> 수산·해산·건어물 </a></li>
												<li data-start="369" data-end="444"><a data-no="910"
													href="./shop/goods/goods_list.jsp?category1=004" class="menu"> 정육·계란 </a></li>
												<li data-start="468" data-end="590"><a data-no="911"
													href="./shop/goods/goods_list.jsp?category1=005" class="menu"> 국·반찬·메인요리 </a></li>
												<li data-start="616" data-end="717"><a data-no="912"
													href="./shop/goods/goods_list.jsp?category1=006" class="menu"> 샐러드·간편식 </a></li>
												<li data-start="742" data-end="838"><a data-no="913"
													href="./shop/goods/goods_list.jsp?category1=007" class="menu"> 면·양념·오일 </a></li>
												<li data-start="863" data-end="1006"><a data-no="914"
													href="./shop/goods/goods_list.jsp?category1=008" class="menu cut"> 생수·음료·우유·커피 </a></li>
												<li data-start="1031" data-end="1127"><a data-no="249"
													href="./shop/goods/goods_list.jsp?category1=009" class="menu"> 간식·과자·떡 </a></li>
												<li data-start="1151" data-end="1286"><a data-no="915"
													href="./shop/goods/goods_list.jsp?category1=010" class="menu"> 베이커리·치즈·델리 </a></li>
												<li data-start="1311" data-end="1379"><a data-no="032"
													href="./shop/goods/goods_list.jsp?category1=011" class="menu"> 건강식품 </a></li>
												<li data-start="1404" data-end="1505"><a data-no="918"
													href="./shop/goods/goods_list.jsp?category1=012" class="menu"> 생활용품·리빙 </a></li>
												<li data-start="1530" data-end="1631"><a data-no="012"
													href="./shop/goods/goods_list.jsp?category1=013" class="menu on"> 뷰티·바디케어 </a></li>
												<li data-start="1656" data-end="1724"><a data-no="916"
													href="./shop/goods/goods_list.jsp?category1=014" class="menu"> 주방용품 </a></li>
												<li data-start="1748" data-end="1816"><a data-no="085"
													href="./shop/goods/goods_list.jsp?category1=015" class="menu"> 가전제품 </a></li>
												<li data-start="1842" data-end="1930"><a data-no="919"
													href="./shop/goods/goods_list.jsp?category1=016" class="menu"> 베이비·키즈 </a></li>
												<li data-start="1954" data-end="2022"><a data-no="991"
													href="./shop/goods/goods_list.jsp?category1=017" class="menu"> 반려동물 </a></li>
											</ul>
										</div>
									</div>
									<div class="list_goods">
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 462px;">
												<div data-title="MD의 추천" data-section="md_choice"
													class="list swiper-wrapper">
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=231"> <img
															src="./img/goods_detail/0080203_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[돈시몬] 과일 주스 3종 (1L)</a></span> <span class="price">4,100원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=225"> <img
															src="./img/goods_detail/0080103_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[싱하] 소다 워터 (탄산수)</a></span> <span class="price">940원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=266"> <img
															src="./img/goods_detail/0100202_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[마담로익] 크림치즈 5종</a></span> <span class="price">11,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=270"> <img
															src="./img/goods_detail/0100206_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[버나드] 메이플 시럽</a></span> <span class="price">9,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
													<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=180">
														<img src="./img/goods_detail/0050206_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[미트클레버] 소갈비찜</a></span> <span class="price">19,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
													<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=178">
														<img src="./img/goods_detail/0050204_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[벤탄마켓] 감바스 알 아히요</a></span> <span class="price">8,500원</span>
														</div>
													</div>
													<div class="swiper-slide">
													<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=214">
														<img src="./img/goods_detail/0070204_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[ITAL LEMON] 피오디 레몬즙</a></span> <span class="price">5,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
													<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=228">
														<img src="./img/goods_detail/0080106_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[산펠레그리노] 탄산수 250ml</a></span> <span class="price">1,600원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=95"> <img
															src="./img/goods_detail/0020805_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"><a class="txt">[조선마켓] 조선향미 골드퀸 3호</a></span> <span
																class="price">7,800원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=37"> <img
															src="./img/goods_detail/0010701_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">무농약 간편 샐러드 6종</a></span> <span class="price">1,800원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=220"> <img
															src="./img/goods_detail/0070304_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"><a class="txt">[서강유업] 가족을 위한 사골곰탕</a></span> <span class="price">3,500원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=202"> <img
															src="./img/goods_detail/0060304_mainImg.jpg" alt="상품이미지"></a>
														<div class="info_goods">
															<span class="name"> <a class="txt">[스테파노스 키친] 까르보나라 스파게티 세트</a></span> <span class="price">6,800원</span>
														</div>
													</div>
													
													
												</div>
											</div>
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev3 " href="" onclick="return false">Prev</a>
													<a class="bx-next3 " href="" onclick="return false">Next</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
							let swiper3 = new Swiper('.swiper-Container', {

								slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
								spaceBetween : 30, // 슬라이드간 간격
								slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

								// 그룹수가 맞지 않을 경우 빈칸으로 메우기
								// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
								loopFillGroupWithBlank : true,

								loop : true, // 무한 반복

								navigation : { // 네비게이션
									nextEl : '.bx-next3', // 다음 버튼 클래스명
									prevEl : '.bx-prev3', // 이번 버튼 클래스명
								}
							});
						</script>

						<div>
							<div class="bnr_main">
								<a class="link" href="./event.jsp"
									style="background-image: url(&quot;null&quot;); background-color: rgb(249, 234, 234);">
									<span class="inner_link"> <strong class="tit"
										style="color: rgb(106, 38, 38);">장바구니 자랑하면 5천원의 행운이
											매일!</strong> <span class="txt" style="color: rgb(106, 38, 38);">매일
											20분께 드리는 적립금 혜택!</span>
								</span>
								</a>
							</div>
						</div>

						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="tit_goods">
										<h3 class="tit">
											<a class="name" href="./shop/goods/goods_list_new.jsp"> <span class="ico">오늘의 신상품</span> <span
												class="tit_desc">매일 정오, 컬리의 새로운 상품을 만나보세요</span>
											</a>
										</h3>
									</div>
									<div class="list_goods">
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 507px;">
												<div data-title="오늘의 신상품" data-section="today_new"
													class="list swiper-wrapper">
												
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=196"> <img
															src="./img/goods_detail/0060204_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[LOTS OF LOVE] 입맛듬뿍 불낙볶음</a></span> <span class="price">6,800원</span>
														</div>
													</div>
													
												
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=264"> <img
															src="./img/goods_detail/0100106_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">MY FIRST 처음 만나는 진짜 식빵</a></span> <span class="price">4,900원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=155"> <img
															src="./img/goods_detail/0040105_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[일상미소] 안심 200g(냉장)</a></span> <span class="price">15,500원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=150"> <img
															src="./img/goods_detail/0030906_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[해말린] 명품 멸치</a></span> <span class="price">4,300원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=141"> <img
															src="./img/goods_detail/0030803_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">쌈 다시마 150g(냉장)</a></span> <span class="price">1,700원</span>
														</div>
													</div>
												
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=234"> <img
															src="./img/goods_detail/0080206_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[돈시몬] 과일 주스 3종</a></span> <span class="price">3,200원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=160"> <img
															src="./img/goods_detail/0040204_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[오가니아] 호주산 유기농 목심 불고기용 300g(냉동)</a></span> <span class="price">14,400원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=200"> <img
															src="./img/goods_detail/0060302_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[피코크] 홍대 초마 하얀짬뽕</a></span> <span class="price">8,480원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=73"> <img
															src="./img/goods_detail/0020501_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[Dole] 후룻팝 3종</a></span> <span class="price">4,600원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=166"> <img
															src="./img/goods_detail/0040304_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[해올림] 무항생제 돼지 등심 다짐육</a></span> <span class="price">5,900원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=64"> <img
															src="./img/goods_detail/0020304_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">GAP 신고배 2입</a></span> <span class="price">11,500원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=115"> <img
															src="./img/goods_detail/0030401_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[어부네] 주꾸미 2종(냉동)</a></span> <span class="price">9,700원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=192"> <img
															src="./img/goods_detail/0060106_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[크레이브푸드] 아시안 치킨 샐러드 240g</a></span> <span class="price">6,900원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=51"> <img
															src="./img/goods_detail/0020103_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">유기농 깐밤 500g</a></span> <span class="price">13,900원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=24"> <img
															src="./img/goods_detail/0010406_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">무농약 버터헤드레터스</a></span> <span class="price">3,400원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=179"> <img
															src="./img/goods_detail/0050205_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[Traiteur de Paris] 감자 그라탕</a></span> <span class="price">9,900원</span>
														</div>
													</div>

												</div>
											</div>
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev4 " href="" onclick="return false">Prev</a>
													<a class="bx-next4 " href="" onclick="return false">Next</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
							let swiper4 = new Swiper('.swiper-Container', {

								slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
								spaceBetween : 30, // 슬라이드간 간격
								slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

								// 그룹수가 맞지 않을 경우 빈칸으로 메우기
								// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
								loopFillGroupWithBlank : true,

								loop : true, // 무한 반복

								navigation : { // 네비게이션
									nextEl : '.bx-next4', // 다음 버튼 클래스명
									prevEl : '.bx-prev4', // 이번 버튼 클래스명
								}
							});
						</script>

						<div>
							<div class="main_type2 bg"
								style="background-color: rgb(247, 247, 247);">
								<div class="product_list">
									<div class="tit_goods">
										<h3 class="tit">
											<a class="name">지금 가장 핫한 상품</a>
										</h3>
									</div>
									<div class="list_goods">
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 507px;">
												<div data-title="지금 가장 핫한 상품" data-section="theme_goods_9"
													class="list swiper-wrapper">
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=134"> <img
															src="./img/goods_detail/0030702_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">원래 참치</a></span> <span class="price">2,600원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=121"> <img
															src="./img/goods_detail/0030501_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">가재새우살 230g(냉동)</a></span> <span class="price">9,590원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=143"> <img
															src="./img/goods_detail/0030805_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">바다모음 매생이 6g(냉장)</a></span> <span class="price">5,000원</span>
														</div>
													</div>
												<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=133"> <img
															src="./img/goods_detail/0030701_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[CJ] 삼호 안심 김밥 맛살</a></span> <span class="price">2,100원</span>
														</div>
													</div>
												<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=86"> <img
															src="./img/goods_detail/0020702_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[넛쏘굿] 몸에 좋은 믹스넛 2종</a></span> <span class="price">13,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=81"> <img
															src="./img/goods_detail/0020603_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">청도 반시 감말랭이 200g</a></span> <span class="price">6,500원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=119"> <img
															src="./img/goods_detail/0030405_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[제주창해수산] 한치 175~200g(냉동)</a></span> <span class="price">8,700원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=80"> <img
															src="./img/goods_detail/0020602_mainImg.jpg" alt="상품이미지" class="thumb">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">딸기 바나나 믹스 1kg (냉동)</a></span> <span class="price">6,900원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=266"> <img
															src="./img/goods_detail/0100202_mainImg.jpg" alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[마담로익] 크림치즈 5종</a></span> <span class="price">11,900원</span>
														</div>
													</div>
												</div>
											</div>
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev5 " href="" onclick="return false">Prev</a>
													<a class="bx-next5 " href="" onclick="return false">Next</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script>
							let swiper5 = new Swiper('.swiper-Container', {

								slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
								spaceBetween : 30, // 슬라이드간 간격
								slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

								// 그룹수가 맞지 않을 경우 빈칸으로 메우기
								// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
								loopFillGroupWithBlank : true,

								loop : true, // 무한 반복

								navigation : { // 네비게이션
									nextEl : '.bx-next5', // 다음 버튼 클래스명
									prevEl : '.bx-prev5', // 이번 버튼 클래스명
								}
							});
						</script>

						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="tit_goods">
										<h3 class="tit">
											<a class="name">마감세일</a>
										</h3>
									</div>
									<div class="list_goods">
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 507px;">
												<div data-title="마감세일" data-section="deadline_sales"
													class="list swiper-wrapper">
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=114"> <img src="./img/goods_detail/0030306_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[법성포참맛] 대용량 영광굴비 1.2kg(20마리)(냉동)</a></span> <span class="price"><span
																class="dc">40%</span>15,900원</span> <span class="cost">26,500원</span>
														</div>
													</div>
													
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=2"> <img src="./img/goods_detail/0010102_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">국산콩 무농약 콩나물 300g</a></span> <span class="price"><span
																class="dc">20%</span>1,600원</span> <span class="cost">2,000원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=198"> <img src="./img/goods_detail/0060206_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[더바른도시락] 퀴노아 영양밥 & 매콤제육볶음</a></span> <span class="price"><span
																class="dc">5%</span>3,500원</span> <span class="cost">3,700원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=7"> <img src="./img/goods_detail/0010201_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">친환경 당근 500g</a></span> <span class="price"><span
																class="dc">7%</span>2,800원</span> <span class="cost">3,000원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=67"> <img src="./img/goods_detail/0020401_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[KF365] 아보카도 1개</a></span> <span class="price"><span
																class="dc">6%</span>2,200원</span> <span class="cost">2,340원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=14"> <img src="./img/goods_detail/0010302_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">친환경 잎채소 로메인 100g</a></span> <span class="price"><span
																class="dc">17%</span>1,500원</span> <span class="cost">1,800원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=254"> <img src="./img/goods_detail/0090302_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[유기방아] 떡볶이떡 & 떡국떡 (냉동)</a></span> <span class="price"><span
																class="dc">30%</span>3,010원</span> <span class="cost">4,300원</span>
														</div>
													</div>
													<div class="swiper-slide">
														<a class="thumb_goods" href="./shop/goods/goods_detail.jsp?p_idx=177"> <img src="./img/goods_detail/0050203_mainImg.jpg"
															alt="상품이미지">
														</a>
														<div class="info_goods">
															<span class="name"><a class="txt">[명인등심] 차돌된장밥(270g*2입)</a></span> <span class="price"><span
																class="dc">10%</span>8,730원</span> <span class="cost">9,700원</span>
														</div>
													</div>

												</div>
											</div>
											<div class="bx-controls bx-has-controls-direction">
												<div class="bx-controls-direction">
													<a class="bx-prev6 " href="" onclick="return false">Prev</a>
													<a class="bx-next6 " href="" onclick="return false">Next</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<script>
								let swiper6 = new Swiper('.swiper-Container', {

									slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
									spaceBetween : 30, // 슬라이드간 간격
									slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

									// 그룹수가 맞지 않을 경우 빈칸으로 메우기
									// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
									loopFillGroupWithBlank : true,

									loop : true, // 무한 반복

									navigation : { // 네비게이션
										nextEl : '.bx-next6', // 다음 버튼 클래스명
										prevEl : '.bx-prev6', // 이번 버튼 클래스명
									}
								});
							</script>

							<div>
								<div class="main_type2 bg"
									style="background-color: rgb(247, 247, 247);">
									<div class="product_list">
										<div class="tit_goods">
											<h3 class="tit">
												<a class="name"> 늘 기분 좋은 가격<span
													class="tit_desc">가격부터 늘 기분 좋은 컬리 장바구니 필수템</span>
												</a>
											</h3>
										</div>
										<div class="list_goods">
											<div class="bx-wrapper"
												style="max-width: 1050px; margin: 0px auto;">
												<div class="bx-viewport swiper-Container"
													style="width: 100%; overflow: hidden; position: relative; height: 507px;">
													<div data-title="늘 기분 좋은 가격" data-section="theme_goods_11"
														class="list swiper-wrapper">
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=180"> <img
																src="./img/goods_detail/0050206_mainImg.jpg" alt="상품이미지">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[미트클레버]
																		소갈비찜</a></span> <span class="price">19,900원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=166"> <img
																src="./img/goods_detail/0040304_mainImg.jpg" alt="상품이미지"
																class="thumb">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[해올림] 무항생제
																		돼지 등심 다짐육</a></span> <span class="price">5,900원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=121"> <img
																src="./img/goods_detail/0030501_mainImg.jpg" alt="상품이미지"
																class="thumb">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">가재새우살
																		230g(냉동)</a></span> <span class="price">9,590원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=115"> <img
																src="./img/goods_detail/0030401_mainImg.jpg" alt="상품이미지"
																class="thumb">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[어부네] 주꾸미
																		2종(냉동)</a></span> <span class="price">9,700원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=198"> <img
																src="./img/goods_detail/0060206_mainImg.jpg" alt="상품이미지">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[더바른도시락]
																		퀴노아 영양밥 & 매콤제육볶음</a></span> <span class="price"><span
																	class="dc">5%</span>3,500원</span> <span class="cost">3,700원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=143"> <img
																src="./img/goods_detail/0030805_mainImg.jpg" alt="상품이미지"
																class="thumb">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">바다모음 매생이
																		6g(냉장)</a></span> <span class="price">5,000원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=228"> <img
																src="./img/goods_detail/0080106_mainImg.jpg" alt="상품이미지">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[산펠레그리노]
																		탄산수 250ml</a></span> <span class="price">1,600원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"
																href="./shop/goods/goods_detail.jsp?p_idx=95"> <img
																src="./img/goods_detail/0020805_mainImg.jpg" alt="상품이미지"></a>
															<div class="info_goods">
																<span class="name"><a class="txt">[조선마켓] 조선향미
																		골드퀸 3호</a></span> <span class="price">7,800원</span>
															</div>
														</div>
													</div>
													<div class="bx-controls bx-has-controls-direction">
														<div class="bx-controls-direction">
															<a class="bx-prev7 " href="" onclick="return false">Prev</a>
															<a class="bx-next7 " href="" onclick="return false">Next</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<script>
								let swiper7 = new Swiper('.swiper-Container', {

									slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
									spaceBetween : 30, // 슬라이드간 간격
									slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

									// 그룹수가 맞지 않을 경우 빈칸으로 메우기
									// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
									loopFillGroupWithBlank : true,

									loop : true, // 무한 반복

									navigation : { // 네비게이션
										nextEl : '.bx-next7', // 다음 버튼 클래스명
										prevEl : '.bx-prev7', // 이번 버튼 클래스명
									}
								});
							</script>

							<!-- <div>
								<div class="main_type2">
									<div class="product_list">
										<div class="tit_goods">
											<h3 class="tit">
												<a class="name"><span class="ico">컬리가 만든 상품</span></a>
											</h3>
										</div>
										<div class="list_goods">
											<div class="bx-wrapper"
												style="max-width: 1050px; margin: 0px auto;">
												<div class="bx-viewport swiper-Container"
													style="width: 100%; overflow: hidden; position: relative; height: 507px;">
													<div data-title="컬리가 만든 상품" data-section="theme_goods_12"
														class="list swiper-wrapper">
														<div class="swiper-slide">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/1610532035693l0.jpg);">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[Kurly's]
																		시그니처 물티슈 2종</a></span> <span class="price"><span
																	class="dc">7%</span>1,720원 </span> <span class="cost">1,850원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/1610619267363l0.jpg);">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[Kurly's]
																		해양심층수 2종(12병/20병)</a></span> <span class="price">5,900원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/1614067420817l0.jpg);">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[Kurly's]
																		바삭하게 구운 김밥김</a></span> <span class="price"><span
																	class="dc">10%</span>2,250원 </span> <span class="cost">2,500원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/1604972609179l0.jpg);">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[Kurly's]
																		올데이 칫솔 스타터 세트</a></span> <span class="price"><span
																	class="dc">15%</span>4,335원 </span> <span class="cost">5,100원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/1610691817296l0.jpg);">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[Kurly's]
																		한돈 떡갈비 (120g*2입)</a></span> <span class="price"><span
																	class="dc">10%</span>4,320원</span> <span class="cost">4,800원</span>
															</div>
														</div>
														<div class="swiper-slide">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/1571824073516l0.jpg);">
															</a>
															<div class="info_goods">
																<span class="name"><a class="txt">[Kurly's]
																		시저샐러드</a></span> <span class="price"><span class="dc">5%</span>6,555원
																</span> <span class="cost">6,900원</span>
															</div>
														</div>
													</div>
												</div>
												<div class="bx-controls bx-has-controls-direction">
													<div class="bx-controls-direction">
														<a class="bx-prev8 " href="" onclick="return false">Prev</a>
														<a class="bx-next8 " href="" onclick="return false">Next</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<script>
								let swiper8 = new Swiper('.swiper-Container', {

									slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
									spaceBetween : 30, // 슬라이드간 간격
									slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

									// 그룹수가 맞지 않을 경우 빈칸으로 메우기
									// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
									loopFillGroupWithBlank : true,

									loop : true, // 무한 반복

									navigation : { // 네비게이션
										nextEl : '.bx-next8', // 다음 버튼 클래스명
										prevEl : '.bx-prev8', // 이번 버튼 클래스명
									}
								});
							</script> -->

							<div>
								<div class="main_type3">
									<div class="main_recipe">
										<div class="tit_goods">
											<h3 class="tit">
												<a class="name" href="./shop/recipe/recipe_all.jsp"><span class="ico">컬리의 레시피</span></a>
											</h3>
										</div>
										<div class="list_goods">
											<div class="bx-wrapper"   
												style="max-width: 1050px; margin: 0px auto;">
												<div class="bx-viewport swiper-Container"
													style="width: 100%; overflow: hidden; position: relative; height: 303px;">
													<ul data-title="컬리의 레시피" data-section="kurly_recipe"
														class="list swiper-wrapper"
														style="width: 715%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
														<li
															style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
															<a class="thumb_goods" onclick='location.href="./shop/recipe/recipe_all_Buckwheat_Gallet.jsp"'> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/main_v2_a269923987b05291.jpg);">
														</a>
															<div class="info_goods">
																<div class="inner_info">
																	<span class="name"><a class="txt">메밀 갈레트</a></span>
																</div>
															</div>
														</li>
														<li
															style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
															<a class="thumb_goods" onclick='location.href="./shop/recipe/recipe_all_Rucola_Pizza.jsp"'> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/main_v2_6341580e2dae2d31.jpg);">
														</a>
															<div class="info_goods">
																<div class="inner_info">
																	<span class="name"><a class="txt">플랫 브레드 루꼴라
																			피자</a></span>
																</div>
															</div>
														</li>
														<li
															style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
															<a class="thumb_goods"  onclick='location.href="./shop/recipe/recipe_all_Spinach_Pesto_Pasta.jsp"'> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/main_v2_70707728dc9e7eab.jpg);">
														</a>
															<div class="info_goods">
																<div class="inner_info">
																	<span class="name"><a class="txt">시금치 페스토
																			파스타</a></span>
																</div>
															</div>
														</li>
														<li
															style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/main_v2_7a5597e725b03e2d.jpg);">
														</a>
															<div class="info_goods">
																<div class="inner_info">
																	<span class="name"><a class="txt">황태양념구이</a></span>
																</div>
															</div>
														</li>
														<li
															style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
															<a class="thumb_goods"> <img
																src="./img/mainSlide/blank.png" alt="상품이미지"
																class="thumb"
																style="background-image: url(./img/mainSlide/main_v2_8c159e9c2e3bfb34.jpg);">
														</a>
															<div class="info_goods">
																<div class="inner_info">
																	<span class="name"><a class="txt">도다리 양념구이</a></span>
																</div>
															</div>
														</li>
													</ul>
												</div>
												<div class="bx-controls bx-has-controls-direction"></div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div>
								<div class="main_type4">
									<div class="tit_goods">
										<h3 class="tit">인스타그램 고객 후기</h3>
									</div>
									<div class="list_goods" onclick='location.href="https://www.instagram.com/marketkurly_regram/"' target="_blank" >
										<div class="bx-wrapper"
											style="max-width: 1050px; margin: 0px auto;">
											<div class="bx-viewport swiper-Container"
												style="width: 100%; overflow: hidden; position: relative; height: 175px;">
												<ul data-title="인스타그램 고객 후기" data-section="instagram"
													class="list swiper-wrapper"
													style="width: 2715%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
													<li data-index="1" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/156375236_744821476468447_4087172593722258612_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="2" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/155456815_1398800410459351_6780887602414016090_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="3" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/150784848_1393446994349602_1401250154172282106_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="4" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/153049675_788852455083675_6031104269567675303_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="5" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/153163120_1536664699865697_712758804955381070_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="6" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/150342697_705553070117671_505551291555992922_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="7" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/148464448_1871380143012554_4787561268067230435_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="8" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/146717917_1133595607155564_6927575805678431077_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="9" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/145829497_429910031618977_2686700364585205332_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="10" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/145699202_173277657764348_7186325738012278752_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="11" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/145166627_690796704929009_3137692220607683881_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="12" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/138612535_1002060843651200_8038603372875075827_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="13" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/137535263_288737882673797_5133712456374454917_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="14" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/137225553_774188450120787_6930718593709013243_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="15" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/136366996_192615215904205_8306368317716846058_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="16" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/135353939_2979344559018503_6638205904339600026_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="17" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/135855569_1106024176515262_7522184421204961221_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="18" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/133740249_1081468305645551_7425631588608142276_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="19" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/133794738_431775864614286_3979166985680235825_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="20" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/132014374_874243333323044_334545707376363984_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="21" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/131992660_3453712921407975_3537333884386915309_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="22" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/131300330_426265792076878_8415232806622742688_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="23" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/131276883_834147770758904_1061547541056682891_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="24" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/130524946_388830355790279_2119235762455725959_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
													<li data-index="25" data-name="instagram"
														style="float: left; list-style: none; position: relative; width: 175px;">
														<a target="_blank" class="thumb_goods"> <img
															src="./img/insta/130527127_1510988522425735_7992170002968224868_n.jpg"
															alt="상품이미지" class="thumb">
													</a>
													</li>
												</ul>
											</div>
											<div class="bx-controls bx-has-controls-direction"></div>
										</div>
									</div>
									<div class="bnr">
										<span class="txt">더 많은 고객 후기가 궁금하다면?</span> <a
											href="https://www.instagram.com/marketkurly_regram/"
											target="_blank">@marketkurly_regram</a>
									</div>
								</div>
							</div>

							<div>
								<div class="bnr_main">
									<a class="link" href="./shop/board/delivery.jsp"
										style="background-image: url(./img/mainSlide/pc_img_1568875999.webp);">
										<span class="inner_link"> <img
											src="./img/mainSlide/pc_img_1568875999.webp"
											onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
									</span>
									</a>
								</div>
							</div>

						</div>
					</div>
					<!-- 본문 종료 -->
				</div>
				<!-- main 종료 -->

				<!-- footer 시작 -->
				<%@ include file="./include/footer.jsp"%>
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
</body>

</html>