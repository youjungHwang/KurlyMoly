<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 친구초대 이벤트 -->
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
                                <li><a href="./event_lovers.jsp">회원혜택</a></li>
                                <li><a href="./event_friend.jsp" class="on">친구초대</a></li>

                            </ul>
                        </div>
                    </div>
                    <div id="EventBody">
                        <div class="page_Event">
                            <div class="cont_view">
                                <div class="Event_tit friend_tit">
                                    <h2 class="tit_Event">
                                        친구 초대 이벤트
                                        <div class="tit_Event_sub">
                                            컬리를 친구에게 소개하고, 친구와 함께 적립금 혜택을 받아보세요. 초대할 때마다 나의 적립금이 차곡차곡, <br> <span>무제한으로 쌓여요.</span>
                                        </div>
                                    </h2>
                                    <p class="txt_date">
                                        (03.15 - 03.21 내 배송완료 기준)
                                    </p>
                                </div>
                                <div class="Event_info friend_info">
                                    <div class="cont_info">
                                        <strong class="tit_info">
                                            친구도 나도<br>
                                            <span class="emph">일주일 동안만 <br>1만원씩 적립</span>
                                        </strong>
                                        <div class="desc_info">
                                            <div class="box_bubble">
                                                컬리에 친구를 <strong class="emph">초대할 때마다</strong>
                                            </div>
                                            <ul class="list_info">
                                                <li>
                                                    <strong class="tit">Step 01.</strong>
                                                    친구가 회원가입 시 추천인에 나의 ID를 쓰고
                                                </li>
                                                <li>
                                                    <strong class="tit">Step 02.</strong>
                                                    이벤트 기간 내에 나의 ID를 쓴 <span class="underline">친구의 첫 배송이 완료 되면</span>
                                                </li>
                                                <li>
                                                    <strong class="tit">Step 03.</strong>
                                                    친구와 나 모두 무제한 적립금 1만원 지급 (선착순 20,000명)
                                                    <span class="txt_etc">※ 배송 완료 후 2일 이내 지급</span>
                                                    <span class="txt_etc">※ 선착순 마감 이후부터는 각각 적립금 5,000원 지급</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="bnr_kakao">
                                    <a href="https://accounts.kakao.com/login?continue=https://sharer.kakao.com/talk/friends/picker/shortlink/kT_%253CrPci0kxRu8nrU%255DN%255BoG%2540%255B1Q9hsRFj%253B%252Fz8phHP%253F9x%2540Y%255Bh5%253DWsKHUvCz7zBJm8s" class="btn_kakao">
                                        <span class="cell">
                                            <span class="ico_comm ico_kakao"></span>
                                        </span>
                                        <span class="cell">
                                            <Strong class="tit">카카오톡으로 내 ID를 공유하세요!</Strong>지금 친구 초대하기
                                        </span>
                                        <span class="cell">
                                            <span class="ico_comm ico_arr_b"></span>
                                        </span>
                                    </a>
                                </div>
                            </div>

                            <div class="friend_award">
                                <div class="cont_view">
                                    <div class="top_info">
                                        <strong class="tit">컬리 베스트 프렌드 어워드</strong>
                                        <p class="txt_date">
                                            2020.10.01 - 2020.10.31
                                        </p>
                                        <p class="txt_award">
											더 많은 분께 컬리를 소개해주신 "컬리의 베스트 프렌드" 10분을 소개드려요
                                        </p>
                                    </div>
                                    <div class="award_info">
                                        <div class="cell">
                                            <strong class="tit">회원 ID</strong>
                                            kdr7233
                                            <br>
                                            kdr7234
                                            <br>
                                            kdr7235
                                            <br>
                                            kdr7236
                                            <br>
                                            kdr7237
                                            <br>
                                            kdr7238
                                            <br>
                                            kdr7239
                                            <br>
                                            kdr7240
                                            <br>
                                            kdr7241
                                            <br>
                                            kdr7242
                                        </div>
                                        <div class="cell">
                                            <strong class="tit">총 적립 금액</strong>
                                            1,000,000
                                            <br>
                                            900,000
                                            <br>
                                            800,000
                                            <br>
                                            700,000
                                            <br>
                                            600,000
                                            <br>
                                            500,000
                                            <br>
                                            400,000
                                            <br>
                                            300,000
                                            <br>
                                            200,000
                                            <br>
                                            100,000
                                        </div>
                                    </div>
                                    <p class="txt_noti">• 초대횟수는 초대 후 첫 주문 후 배송완료한 친구 기준입니다.</p>
                                </div>
                            </div>

                            <div class="cont_view">
                                <div class="Event_noti">
                                    <strong class="tit_noti">확인해주세요!</strong>
                                    <div class="desc_noti chaiDesc">
                                        <ul class="list_noti friend_noti">
                                            <li>더블 적립금 이벤트는 03월 15일부터 03월 21일까지 진행됩니다.</li>
                                            <li>03월 21일 23:59:59까지 추천 받은 친구의 <span class="underline">첫 주문 배송이 완료되는 기준</span>으로&nbsp;더블적립금이 지급됩니다.</li>
                                            <li>적립금은 친구의 첫 구매 상품을 수령 후, 영업일 기준 2일 뒤 오후 7시 이전에 지급됩니다.</li>
                                            <li>이벤트 기간 동안 친구초대를 통해 첫 주문 상품을 받아 보신 선착순 2만분께만 적립금 1만원이 지급되며, 이후에는 적립금 5,000원이 지급됩니다.</li>
                                            <li>친구 초대를 통해 가입하신 선착순 2만분 한정 추천해주신 분들께는 적립금 1만원이 중복지급됩니다.</li>
                                            <li>친구 초대 이벤트는 컬리 회원만 참여 가능합니다.</li>
                                            <li>ID는 대소문자 및 띄어쓰기를 구분해 정확히 입력해주세요.</li>
                                            <li>초대할 수 있는 친구의 수는 제한이 없으나, 적립금은 이벤트에 따라 변경 및 제한될 수 있습니다.</li>
                                            <li>주문 취소/환불 시, 적립금은 지급되지 않거나 지급된 적립금은 회수될 수 있습니다.</li>
                                            <li>적립금을 위해 중복으로 가입한 것으로 판단되는 경우, 또는 추천인과 피 추천인의 주소지, 연락처 등이 동일할 경우, 적립금이 지급되지 않을 수 있습니다.</li>
                                            <li>기존에 친구 초대로 가입한 친구가 해지/탈퇴 후 다시 친구 초대를 통해 재가입할 경우, 적립금은 지급되지 않습니다.</li>
                                            <li>기타 비정상적인 방법을 통해 금전적인 이득을 취하기 위해 이벤트에 참여한 것으로 판단될 경우, 적립금이 지급되지 않거나 회수될 수 있습니다.</li>
                                            <li>친구 초대 이벤트는 당사의 사정에 의해 사전 고지 없이 변경 혹은 중단될 수 있습니다.</li>
                                        </ul>
                                    </div>
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