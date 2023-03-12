<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 이벤트 -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<link href="./css/jsScript.css" rel="stylesheet" type="text/css">
	
	<script src="./script/script.js"></script>
	<script src="./script/MJscript.js"></script>
	<style>
		/* 메뉴바 따라옴 */
		#gnb.gnb_stop {
			position: fixed;
			z-index: 300;
			left: 0;
			top: 0;
			width: 100%;
		}
	</style>
</head>

<body>
	<!-- container 시작 -->
	<div id="container">
		<%@ include file="./include/header.jsp"%>
		<!-- main 시작 -->
		<div id="main">
			<!-- 본문 시작 -->
			<div id="content" class="Eve">
				<div id="qnb" class="quick-navigation" style="top: 516px;">
					<div class="bnr_qnb" id="brn_Quick">
						<a href="./shop/board/delivery.jsp"><img class="thumb" src="./img/sidebar/bnr_quick_20190403.webp"></a>
					</div>

					<div class="side_menu">
						<a href="./event_lovers.jsp" class="link_menu">등급별 혜택</a>
						<a href="./shop/recipe/recipe_all.jsp" class="link_menu">레시피</a>
					</div>
				</div>

				<!--=============================== mypage_main 시작=================================-->
				<div id="EventView">
					<div class="menu_Event">
						<div id="EventMenu">
							<ul class="menu">
								<li><a href="./event.jsp" class="on">전체보기</a></li>
								<li><a href="./event_lovers.jsp">회원혜택</a></li>
								<li><a href="./event_friend.jsp">친구초대</a></li>
							</ul>
						</div>
					</div>
					<div id="EventBody">
						<div class="page_Event">
							<div class="total_view">
								<h2 class="screen_out">전체보기</h2>
								<div class="Event_list">
									<div class="Item">
										<a href="#lovers" id="lovers" class="link_Event">
											<h3 class="tit_total">컬리 러버스 혜택</h3>
											<p class="txt_ex">
												연간 혜택 최대 240만원 이상 <span class="ico_comm ico_gift"></span>
											</p>
										</a>
										<p class="txt_info">매월 실적에 따라 적립/쿠폰이 바뀌는 컬리의 회원 등급 혜택이에요. 쓰면 쓸수록 높아지는 혜택을 지금 확인해보세요.</p>
									</div>
									<div class="Item">
										<a href="#friend" id="friend" class="link_Event">
											<h3 class="tit_total">친구 초대 이벤트</h3>
											<p class="txt_ex">
												참여할 때마다 선착순 1만원 적립 <span class="ico_comm ico_won"></span>
											</p>
										</a>
										<p class="txt_info">고객님의 ID를 추천인으로 적고 가입한 친구가 첫 구매를 완료하면 고객님과 친구분 모두에게 각각 1만원씩 적립금을 드려요. (선착순 20,000분 한정)</p>
									</div>
									<div class="Item">
										<a href="basket" id="basket" class="link_Event">
											<h3 class="tit_total">장바구니 이벤트</h3>
											<p class="txt_ex">
												최대 15만원 적립 <span class="ico_comm ico_won"></span>
											</p>
										</a>
										<p class="txt_info">고객님의 SNS에 컬리에서 구매한 상품을 자랑해주세요. 매일 선정을 통해 5천원, 월 최대 15만원의 적립금을 드려요.</p>
									</div>
								</div>

								<div id="benefit" class="pay_benefit">
									<h3 class="tit_benefit">결제 혜택</h3>
									<div id="benefitList" class="Event_btn pay_list">
										<a href="./event_woori.jsp" id="woori" class="link_pay btn_link"> <span class="cell"> <span class="ico_comm ico_woori"> </span>
										</span> <span class="cell"> <strong class="tit">우리카드</strong> 7만원 이상 결제 시 3천원 즉시 할인
										</span> <span class="cell"> <span class="ico_comm ico_arr_b"> </span></span></a>
										
										<a href="./event_chai.jsp" id="chai" class="link_pay btn_link"> <span class="cell"> <span class="ico_comm ico_chai"> </span>
										</span> <span class="cell"> <strong class="tit">차이</strong> 2만원 이상 생애 첫 결제 시 4천원 즉시할인
										</span> <span class="cell"> <span class="ico_comm ico_arr_b"> </span></span></a>
										
										<a href="./event_payco.jsp" id="payco" class="link_pay btn_link"> <span class="cell"> <span class="ico_comm ico_payco"> </span>
										</span> <span class="cell"> <strong class="tit">페이코</strong> 페이코 충전포인트로 결제할 때마다 최대 5% 적립
										</span> <span class="cell"> <span class="ico_comm ico_arr_b"> </span></span></a>
									</div>
								</div>
								<div class="Event_bnr">
									<a href="./shop/goods/event_list.jsp" class="link_bnr bg_purple"> <strong class="tit">다양한 상품을 특가로 만나보세요 <span class="ico_comm ico_arr_w"></span></strong> 지금 진행 중인 특가전 보러가기</a>
									<a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_210224" class="link_bnr bg_dark"> <strong class="tit">컬리가 처음이신가요? <span class="ico_comm ico_arr_w"></span> </strong> 신규 회원 이벤트 & 혜택 보러가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--=================================================================================-->
			</div>
		</div>
	</div>
	<!-- main 종료 -->

	<!-- footer 시작 -->
	<%@ include file="./include/footer.jsp"%>
	<!-- footer 종료 -->
	</div>
	<!-- container 종료 -->

	<!-- quick list 시작 -->
	<a href="#top" id="pageTop" class="on">맨 위로가기</a>
	<!-- quick list 끝 -->
</body>

</html>