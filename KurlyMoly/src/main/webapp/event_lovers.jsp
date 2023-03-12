<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 컬리러버스 혜택 -->
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
						<a href="./event_lovers.jsp" class="link_menu">등급별 혜택</a>
						<a href="./shop/recipe/recipe_all.jsp" class="link_menu">레시피</a>
					</div>
				</div>

				<!--=============================== mypage_main 시작=================================-->
				<div id="EventView">
					<div class="menu_Event">
						<div id="EventMenu">
							<ul class="menu">
								<li><a href="./event.jsp">전체보기</a></li>
								<li><a href="./event_lovers.jsp" class="on">회원혜택</a></li>
								<li><a href="./event_friend.jsp">친구초대</a></li>
							</ul>
						</div>
					</div>
					<div id="EventBody">
						<div class="page_Event">
							<div class="cont_view">
								<div class="Event_tit friend_tit">
									<h2 class="tit_Event">
										컬리 러버스 혜택<div class="tit_Event_sub">고객님께 받은 사랑을 혜택으로 돌려드려요. 매월 실적에 따라 달라지는 실용적이고 다채로운 혜택을 확인해보세요.</div>
									</h2>
								</div>
								<div class="grade_info">
									<h3 class="screen_out">등급 안내</h3>
									<div class="grade_list">
										<div class="grade_item on">
											<a href="#none" class="btn_grade"> <strong class="g_tit">더퍼플</strong>
												<p class="g_txt">
													<span class="num">7</span> % <span class="ico_comm ico_arr"></span>
												</p>
											</a>
										</div>
										<div class="grade_item">
											<a href="#none" class="btn_grade"> <strong class="g_tit">퍼플</strong>
												<p class="g_txt">
													<span class="num">7</span> % <span class="ico_comm ico_arr"></span>
												</p>
											</a>
										</div>
										<div class="grade_item">
											<a href="#none" class="btn_grade"> <strong class="g_tit">라벤더</strong>
												<p class="g_txt">
													<span class="num">5</span> % <span class="ico_comm ico_arr"></span>
												</p>
											</a>
										</div>
										<div class="grade_item">
											<a href="#none" class="btn_grade"> <strong class="g_tit">화이트</strong>
												<p class="g_txt">
													<span class="num">3</span> % <span class="ico_comm ico_arr"></span>
												</p>
											</a>
										</div>
										<div class="grade_item">
											<a href="#none" class="btn_grade"> <strong class="g_tit">프렌즈</strong>
												<p class="g_txt">
													<span class="num">1</span> % <span class="ico_comm ico_arr"></span>
												</p>
											</a>
										</div>
										<div class="grade_item">
											<a href="#none" class="btn_grade"> <strong class="g_tit">일반</strong>
												<p class="g_txt">
													<span class="num">0.5</span> % <span class="ico_comm ico_arr"></span>
												</p>
											</a>
										</div>
									</div>

									<div class="grade_desc">
										<div class="grade_item on">
											<div class="wrap_tit">
												<Strong class="tit">더퍼플</Strong>
												<p class="txt">
													전월 실적 150만원 이상<br> (결제 금액+적립금 사용액)
												</p>
											</div>
											<ul class="list_info">
												<li><span class="ico_comm ico_won"></span> <span class="g_txt_info">적립 <span class="num">7</span>%</span></li>
												<li><span class="ico_comm ico_coupon"></span> <span class="g_txt_info">매월 할인 쿠폰 <span class="num">5</span>장 (2만원 상당)</span></li>
												<li><span class="ico_comm ico_double"></span> <span class="g_txt_info">더블 후기 적립금</span></li>
												<li><span class="ico_comm ico_gift"></span> <span class="g_txt_info">매월 더퍼플 선물</span></li>
												<li class="total"><strong class="tit">총 혜택 240만원 이상</strong> <span class="txt">※ 더퍼플 등급 연간 유지 시</span></li>
											</ul>
										</div>

										<div class="grade_item">
											<div class="wrap_tit">
												<Strong class="tit">퍼플</Strong>
												<p class="txt">
													전월 실적 100만원 이상<br> (결제 금액+적립금 사용액)
												</p>
											</div>
											<ul class="list_info">
												<li><span class="ico_comm ico_won"></span> <span class="g_txt_info">적립 <span class="num">7</span>%</span></li>
												<li><span class="ico_comm ico_coupon"></span> <span class="g_txt_info">매월 할인 쿠폰 <span class="num">4</span>장 (1만원 상당)</span></li>
												<li><span class="ico_comm ico_double"></span> <span class="g_txt_info">더블 후기 적립금</span></li>
												<li class="total"><strong class="tit">총 혜택 100-140만원</strong> <span class="txt">※ 퍼플 등급 연간 유지 시</span></li>
											</ul>
										</div>

										<div class="grade_item">
											<div class="wrap_tit">
												<Strong class="tit">라벤더</Strong>
												<p class="txt">
													전월 실적 50만원 이상<br> (결제 금액+적립금 사용액)
												</p>
											</div>
											<ul class="list_info">
												<li><span class="ico_comm ico_won"></span> <span class="g_txt_info">적립 <span class="num">5</span>%</span></li>
												<li><span class="ico_comm ico_coupon"></span> <span class="g_txt_info">매월 할인 쿠폰 <span class="num">4</span>장 (1만원 상당)</span></li>
												<li class="total"><strong class="tit">총 혜택 40-70만원</strong> <span class="txt">※ 라벤더 등급 연간 유지 시</span></li>
											</ul>
										</div>

										<div class="grade_item">
											<div class="wrap_tit">
												<Strong class="tit">화이트</Strong>
												<p class="txt">
													전월 실적 30만원 이상<br> (결제 금액+적립금 사용액)
												</p>
											</div>
											<ul class="list_info">
												<li><span class="ico_comm ico_won"></span> <span class="g_txt_info">적립 <span class="num">3</span>%</span></li>
												<li><span class="ico_comm ico_coupon"></span> <span class="g_txt_info">매월 할인 쿠폰 <span class="num">3</span>장 (7천원 상당)</span></li>
												<li class="total"><strong class="tit">총 혜택 20-30만원</strong> <span class="txt">※ 화이트 등급 연간 유지 시</span></li>
											</ul>
										</div>

										<div class="grade_item">
											<div class="wrap_tit">
												<Strong class="tit">프렌즈</Strong>
												<p class="txt">
													전월 실적 15만원 이상<br> (결제 금액+적립금 사용액)
												</p>
											</div>
											<ul class="list_info">
												<li><span class="ico_comm ico_won"></span> <span class="g_txt_info">적립 <span class="num">1</span>%</span></li>
												<li><span class="ico_comm ico_coupon"></span> <span class="g_txt_info">매월 할인 쿠폰 <span class="num">3</span>장 (6천원 상당)</span></li>
												<li class="total"><strong class="tit">총 혜택 9-11만원</strong> <span class="txt">※ 프렌즈 등급 연간 유지 시</span></li>
											</ul>
										</div>

										<div class="grade_item">
											<div class="wrap_tit">
												<Strong class="tit">일반</Strong>
												<p class="txt">
													전월 실적 15만원 미만<br> (결제 금액+적립금 사용액)
												</p>
											</div>
											<ul class="list_info">
												<li><span class="ico_comm ico_won"></span> <span class="g_txt_info">적립 <span class="num">0.5</span>%</span></li>
												<li class="total"><strong class="tit">총 혜택 1만원 이하</strong> <span class="txt">※ 일반 등급 연간 유지 시</span></li>
											</ul>
										</div>
									</div>
									<div class="grade_noti">
										<strong class="screen_out">유의사항</strong>
										<ul class="list_noti">
											<li>총 혜택 금액은 12개월간 동일 등급을 유지할 경우 받게 되는 적립, 쿠폰할인, 선물(더퍼플) 금액의 총합계입니다.</li>
											<li>등급별 할인 쿠폰 혜택은 변경될 수 있습니다.</li>
										</ul>

									</div>
								</div>
								<script>

                                    // 혜택 타입 탭
                                    $('.grade_list .btn_grade').on('click', function (e) {
                                        var idx = $(this).parent().index();
                                        $(this).parent().addClass('on').siblings().removeClass('on');
                                        $('.grade_desc .grade_item').eq(idx).addClass('on').siblings().removeClass('on');
                                        e.preventDefault();
                                    })
                                </script>
							</div>
							<div class="puple_view">
								<div class="purple_gift">
									<div class="cont_view">
										<div class="gift_month">
											<div class="bundle">
												<div class="wrap_tit">
													<h3 class="tit">이 달의 더퍼플 선물</h3>
													<h4 class="gift_name">GO GREEN KIT</h4>
													<p class="txt_info">
														매일 하는 설거지라도 지구를 위한 조금 더 나은<br> 방법을 고민해 만든 GO GREEN
														KIT를 만나보세요.
													</p>
													<p class="txt_info">
														수세미 열매로 만들어 제 역할을 다하고 나면 자연적으로<br> 썩는 <strong>천연
															수세미</strong>, 플라스틱 병에 담긴 세제가 아니라,<br> 고체 형태로 만들어 잔여물을 남기지 않는
														<strong>GO GREEN 워싱바</strong>,<br> 일회용이 아니라 두고두고 쓸 수
														있는 <strong>소창 행주</strong>까지
													</p>
													<p class="txt_info">
														녹색 지구를 위한 일상 속 작은 실천을 <strong>GO GREEN KIT</strong>로<br>
														시작하며 특별한 4월을 보내보세요.
													</p>
												</div>
												<div class="wrap_thumb">
													<img src="./img/Event/img_purple_gift_v2.webp" alt="이번달 더퍼플 선물">
												</div>
											</div>
											<div class="bundle">
												<div class="wrap_thumb">
													<img src="./img/Event/img_gift_info1_v2.webp" alt="선물 상세1">
												</div>
												<div class="wrap_thumb">
													<img src="./img/Event/img_gift_info2_v2.webp" alt="선물 상세2">
												</div>

												<div class="wrap_txt">
													<h4 class="tit">GO GREEN KIT 구성품</h4>
													<ul class="list_gift">
														<li>1. 구름 수세미 1개</li>
														<li>2. 나뭇잎 수세미 1개</li>
														<li>3. GO GREEN 워싱바 2개</li>
														<li>4. 소창 행주 1개</li>
													</ul>
												</div>
											</div>
											<p class="txt_etc ptxt">*GO GREEN KIT는 더퍼플 고객만을 위해 특별히 제작한 기프트로서, 판매하지 않는 상품입니다.</p>
										</div>
										<div class="gift_history">
											<div class="gift_info type2">
												<strong class="tit_noti">더퍼플 선물 안내</strong>
												<ul class="list_noti">
													<li>3월 실적을 기준으로 4월 초 등급 적용 후 선물을 보내드립니다.</li>
													<li>3월 실적은 3월 결제액과 적립금 사용액을 합산하여 산정됩니다.</li>
													<li>선물은 매달 변경되며, 상품 및 구성품 변경 또는 적립금으로의 대체는 불가능합니다.</li>
												</ul>
											</div>
										</div>
									</div>
								</div>

								<div class="cont_view">
									<div class="Event_noti">
										<strong class="tit_noti lover">확인해주세요!</strong>
										<div class="lover_desc_noti">
											<strong class="tit_noti2">회원 등급 적용</strong>
											<ul class="list_noti lover_list">
												<li>매월 1일에 전월 실적(전월 결제 금액+전월 적립금 사용액)을 기준으로 새로운 등급이 적용됩니다.</li>
												<li>전월 실적은 주문 금액에서 할인, 쿠폰을 제외한 금액으로, 적립금 사용액은 전월 실적에 포함됩니다.</li>
												<li>KURLY LOVERS는 당사의 사정에 따라 변경 또는 중지될 수 있으며, 명백한 오남용이 발견될 시에는<br>혜택 이용에 제한을 받으실 수 있습니다.</li>
											</ul>
											<strong class="tit_noti2">적립금 및 쿠폰</strong>
											<ul class="list_noti lover_list">
												<li>주문 적립금은 배송비를 제외한 결제금액에 각 고객등급별 적립율을 곱한 금액으로, 주문일 다음 날 오전 7시 에 지급됩니다.</li>
												<li>일부 상품은 적립금이 지급되지 않습니다. (상품 상세에서 확인 가능)</li>
												<li>주문 취소 시, 지급되었던 적립금은 자동 차감됩니다.</li>
												<li>할인 쿠폰은 매월 1일에 자동으로 지급됩니다.</li>
												<li>베스트 후기에는 더블 후기 적립금 혜택이 적용되지 않습니다.</li>
											</ul>
											<strong class="tit_noti2">적립금 사용</strong>
											<ul class="list_noti lover_list">
												<li>지급일로부터 1년이 지난 적립금은 당월 마지막 날 소멸됩니다.</li>
												<li>소멸기한이 1개월 내로 임박한 적립금은 PC / Mobile [마이컬리]에서 확인하실 수 있습니다.</li>
												<li>적립금은 자동으로 유효기한이 적게 남은 금액부터 사용됩니다.</li>
												<li>적립금 유효기한은 2018년 4월 1일부터 적용되며, 그 이전에 받으신 적립금은 유효기한이 없습니다.</li>
											</ul>
										</div>
									</div>
									<div class="Event_share share">
										<strong class="tit_share">
											컬리 러버스의 혜택을<br><span class="txt">친구에게도 소개해주세요!</span>
										</strong>
										<a href="https://accounts.kakao.com/login?continue=https://sharer.kakao.com/talk/friends/picker/shortlink/" class="btn_kakao btn_link" data-opt="kakaotalk">카카오톡 공유하기</a>
										<a href="http://blog.naver.com/openapi/share?url=https%3A%2F%2Fwww.kurly.com%2Fshop%2Fmain%2Fhtml.php%3Fhtmid%3Devent%2Fkurly.htm%26name%3Dlovers&title=%EC%BB%AC%EB%A6%AC%20%EB%9F%AC%EB%B2%84%EC%8A%A4%EC%9D%98%20%ED%98%9C%ED%83%9D%EC%9D%84%20%EC%B9%9C%EA%B5%AC%EC%97%90%EA%B2%8C%EB%8F%84%20%EC%86%8C%EA%B0%9C%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94!" class="btn_blog btn_link" data-opt="naverblog">네이버 블로그 공유하기</a>
										<a href="#none" class="btn_share btn_link btn_url" data-opt="link">링크 공유하기 <input type="text" class="inp" value="" readonly="readonly" style="display: none;"></a>
									</div>
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
	<%@ include file="./include/footer.jsp"%>
	<!-- footer 종료 -->
	</div>
	<!-- container 종료 -->

	<!-- quick list 시작 -->
	<a href="#top" id="pageTop" class="on">맨 위로가기</a>
	<!-- quick list 끝 -->
</body>

</html>