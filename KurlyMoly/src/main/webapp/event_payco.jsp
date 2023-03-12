<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!-- 페이코 -->
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
                                    <h2 class="tit_Event">
                                        페이코<span class="ico_comm ico_payco"></span>
                                    </h2>
                                    <p class="txt_date">
                                        03.15<span class="txt_bar"> - </span>03.28
                                    </p>
                                </div>
                                <div class="Event_info payco_info">
                                    <div class="cont_info">
                                        <strong class="tit_info">
                                            결제금액의 최대 5%<br><span class="emph">페이코 포인트로 적립</span>
                                        </strong>
                                        <div class="desc_info">
                                            <div class="box_bubble">
                                                <strong class="emph">페이코</strong> 충전 포인트로 결제 시
                                            </div>
                                            <ul class="list_info">
                                                <li>
                                                    <strong class="tit">방법</strong>
                                                    결제 시 페이코 선택
                                                </li>
                                                <li>
                                                    <strong class="tit">대상</strong>
                                                    이벤트 기간 내 마켓컬리에서 페이코 충전 포인트로 결제하신 분
                                                    <span class="txt_etc">※ 쿠폰 할인 및 적립금 적용 후 실결제 금액 기준</span>
                                                    <span class="txt_etc payco_txt">결제건당 최대 1,000원 적립</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="Event_noti">
                                    <strong class="tit_noti">확인해주세요!</strong>
                                    <div class="desc_noti paycoDesc">
                                        <ul class="list_noti">
                                            <li>이벤트 기간 내 페이코 충전포인트로 결제 시, 결제한 구매 금액의 5%를 페이코 포인트로 적립해드립니다.</li>
                                            <li>결제 시 페이코 간편결제 &gt; 포인트 결제 선택 시에만 혜택이 적용됩니다.</li>
                                            <li>페이코 슈퍼세이브 충전리워드는 기본 2% 적립이며, 3월 9일부터 4월 30일까지 마켓컬리에서 결제 시에만 5% 적립이
                                                적용됩니다.</li>
                                            <li>5% 포인트 적립 시, 결제 건당 최대 1,000원까지 적립 가능합니다.</li>
                                            <li>페이코 포인트 사용 시 무상 적립 포인트 소진 후 유상충전 포인트가 차감됩니다.</li>
                                            <li>미성년자가 법정대리인의 동의 없이 포인트를 사용한 경우, 본인 또는 법정대리인이 사용을 취소할 수 있습니다.</li>
                                            <li>페이코 최종 결제창에서 적립예정 포인트 확인이 가능하며, '유상충전포인트 결제분'을 제외한 '무상 적립포인트 결제분'은 적립
                                                대상에서 제외가 됩니다.</li>
                                            <li>적립 포인트는 결제 완료된 달의 다음 달 25일에 일괄 지급됩니다.</li>
                                            <li>이벤트를 통해 적립되는 페이코 포인트 유효기간은 지급일로부터 1년입니다.</li>
                                            <li>'슈퍼세이브 충전리워드' 혜택과 관련한 포인트 충전 상세사항은 [페이코앱 &gt; 더보기 &gt; SUPER SAVE+ &gt;
                                                충전하면 기본 2% 리워드]에서 확인 가능합니다.</li>
                                            <li>본 이벤트는 페이코 회원 전용 이벤트이며, 페이코앱이 설치되어 있지 않은 경우, 앱 설치 후 진행해 주시기 바랍니다.</li>
                                            <li>충전 포인트 사용 혜택은 엔에이치엔페이코(주) 또는 마켓컬리 사정에 의해 별도 고지 없이 종료 또는 변경될 수 있습니다.
                                            </li>
                                            <li>결제 취소 시 해당 결제를 통해 적립된 포인트는 전액 회수되며, 적립(무상) 포인트 부족 시 유상으로 충전한 포인트에서 차감될 수
                                                있습니다. (유상으로 충전한 포인트도 부족할 경우 결제 취소가 불가하며, PAYCO 고객센터(1544-6891)에 연락하여 부족한
                                                포인트 만큼 입금 후 취소가 가능합니다)</li>
                                        </ul>
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