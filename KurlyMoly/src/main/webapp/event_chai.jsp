<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 차이 -->
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
                <div id="qnb" class="quick-navigation" style="top: 0px;">
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
                                <li><a href="./event.jsp" class="on">전체보기</a></li>
                                <li><a href="./event_lovers.jsp">회원혜택</a></li>
                                <li><a href="./event_friend.jsp">친구초대</a></li>

                            </ul>
                        </div>
                    </div>
                    <div id="EventBody">
                        <div class="page_Event">
                            <div class="cont_view">
                                <div class="Event_tit pay_tit">
                                    <h2 class="tit_Event">차이<span class="ico_comm ico_chai"></span></h2>
                                    <p class="txt_date">03.15<span class="txt_bar"> - </span>03.28</p>
                                </div>
                                <div class="Event_info chai_info">
                                    <div class="cont_info">
                                        <strong class="tit_info">결제 금액<br><span class="emph">4천원 즉시 할인</span></strong>
                                        <div class="desc_info">
                                            <div class="box_bubble">
                                                <strong class="emph">차이</strong>로 2만원 이상 첫 결제 시
                                            </div>
                                            <ul class="list_info">
                                                <li>
                                                    <strong class="tit">방법</strong>결제 시 차이 선택
                                                </li>
                                                <li>
                                                    <strong class="tit">대상</strong>
                                                    이벤트 기간 내 차이로 2만원 이상 첫 결제하신 분<span class="txt_etc">※ 쿠폰 할인 및 적립금 적용 후 실결제 금액 기준</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="cont_info">
                                        <strong class="tit_info">결제 금액의<br><span class="emph">1.5%차이머니<br>캐시백</span></strong>
                                        <div class="desc_info">
                                            <div class="box_bubble">
                                                <strong class="emph">차이</strong>로 결제할 때마다
                                            </div>
                                            <ul class="list_info">
                                                <li>
                                                    <strong class="tit">방법</strong>결제 시 차이 선택
                                                </li>
                                                <li>
                                                    <strong class="tit">대상</strong>이벤트 기간 내 마켓컬리에서 차이로 결제하신 분<span class="txt_etc">※ 1회 최대2천원까지 차이머니 캐시백</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="Event_noti">
                                    <strong class="tit_noti">확인해주세요!</strong>
                                    <div class="desc_noti chaiDesc">
                                        <ul class="list_noti">
                                            <li>결제 시 차이 간편결제 선택 시에만 할인이 적용됩니다. (기간 내 ID당 1회)</li>
                                            <li>첫 결제 즉시할인은 차이 전체 가맹점에서 결제 이력이 없는 경우 적용됩니다. (차이 ID당 1회)</li>
                                            <li>결제 금액은 쿠폰 할인 및 적립금 적용 후 실 결제 금액입니다.</li>
                                            <li>할인 혜택은 1개 주문건 당 결제 금액을 기준으로 적용됩니다.</li>
                                            <li>체크, 법인, 선불, 충전, 기프트카드는 혜택 적용이 불가합니다.</li>
                                            <li>1.5% 캐시백 혜택은 매 결제마다 적용되며(결제건 당 최대 2천원), 차이 자동충전 결제 시 1% 추가 캐시백됩니다(걸제건 당 최대 500원).</li>
                                            <li>주문 취소 시 취소 금액에 대한 적립금은 회수됩니다.</li>
                                            <li>즉시할인 혜택과 상시 캐시백 혜택은 중복 적용 불가하며, 자동충전 적립 혜택은 즉시할인 및 상시 캐시백 혜택과 중복<br>적용됩니다.</li>
                                            <li>차이 이외의 간편결제수단 (토스, 네이버페이, 스마일페이 등) 이용 혹은 신용카드 선택 시, 혜택 적용이 불가합니다.</li>
                                            <li>3월 1일부터 3월 31일까지 한정된 고객에게 선착순으로 적용되는 행사로, 조기 종료될 수 있습니다.</li>
                                            <li>행사 내용은 차이 및 마켓컬리의 사정으로 중단 또는 변동될 수 있습니다.</li>
                                            <li>캐시백 관련 문의는 차이 고객센터(1544-7839)로 문의 부탁드립니다.</li>
                                        </ul>
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