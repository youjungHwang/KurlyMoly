<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = null;
	if (session.getAttribute("m_id") != null) {
		userid = (String) session.getAttribute("m_id");
	}
%>

<!-- 로그인 N -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
    <link href="../../css/mypage.css" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../../script/script.js"></script>
    <script src="../../script/MJscript.js"></script>
    <script src="../../script/kurlytracker.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<body>
    <div id="wrap" class="">
        <!-- container 시작 -->
        <div id="container">
            <!-- header 시작 -->
            <header id="header">
                <div class="bnr_header" id="top-message">
                    <a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_210224" id="eventLanding">지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png" class="bnr_arr">
                        <div class="bnr_top">
                            <div class="inner_top_close">
                                <button id="top-message-close" class="btn_top_bnr">가입하고 혜택받기</button>
                            </div>
                        </div>
                    </a>
                    <script>
                        // PROM-476 장차석 : GA) 이벤트 트래킹
                        $('#eventLanding').on('click', function () {
                            ga('send', 'event', 'click', 'general_header_sighup', location.href);
                        });
                    </script>
                </div>

                <div id="userMenu">
                    <ul class="menuLeft list_menu">
                        <li>
                            <a href="../board/delivery.html" class="bnr_delivery"><img
                                    src="../../img/delivery_190819.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송"></a>
                        </li>
                    </ul>
                    <ul class="menuRight list_menu">
				<%
					if (userid == null) {
				%>
                        <li class="menu none_sub menu_join">
                            <a href="./join.jsp" class="link_menu">회원가입</a>
                        </li>
                        <li class="menu none_sub menu_login">
                            <a href="./login.jsp" class="link_menu">로그인</a>
                        </li>
                        
				<%
					} else {
				%>
						<li class="menu menu_user" style="width: 120px;">
							<a class="link_menu grade_comm"><span class="ico_grade grade0">일반</span> <span class="txt"><span class="name"><%=session.getAttribute("m_name")%></span><span class="sir">님</span></span></a>
							<ul class="sub" style="left: 20px;">
								<li><a href="../mypage/mypage_main.html">주문 내역</a></li>
								<li><a href="../mypage/mypage_transport.html">배송지 관리</a></li>
								<li><a href="../mypage/mypage_Zzim.html">늘 사는 것</a></li>
								<li><a href="../mypage/mypage_review.jsp">상품 후기</a></li>
								<li><a href="../mypage/mypage_emoney.html">적립금</a></li>
								<li><a href="../mypage/mypage_coupon.html">쿠폰</a></li>
								<li><a href="../mypage/mypage_editinfo.html">개인 정보 수정</a></li>
								<li><a href="./logout.jsp">로그아웃</a></li>
							</ul>
						</li>
				<%
					}
				%>
                        <li class="menu lst">
                            <a href="../board/notice.html" class="link_menu cos">고객센터</a>
                            <ul class="sub">
                                <li>
                                    <a href="../board/notice.html">공지사항</a>
                                </li>
                                <li>
                                    <a href="../board/faq.html">자주하는 질문</a>
                                </li>
                                <li>
                                    <a href="../mypage/mypage_qna.html">1:1 문의</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div id="headerLogo">
                    <h1 class="logo"><a href="../../index.jsp" class="link_main"><img src="../../img/logo_x2.webp" alt="마켓컬리 로고" style="display: block;"></a></h1>
                </div>

                <div id="gnb">
                    <div id="gnbMenu" class="gnb_kurly gnbMenu">
                        <div class="inner_gnbkurly">
                            <div class="gnb_main">
                                <!-- 메뉴들 전체를 감싸는 div -->
                                <ul class="gnb">
                                    <li class="menu1">
                                        <a>
                                            <span class="ico"></span>
                                            <span style="float: left; font-weight: 500;">전체 카테고리</span>
                                        </a>
                                    </li>
                                    <li class="menu2">
                                        <a href="../goods/new_goods_list.html"><span class="txt">신상품</span></a>
                                    </li>
                                    <li class="menu3">
                                        <a href="../goods/best_goods_list.html"><span class="txt">베스트</span></a>
                                    </li>
                                    <li class="menu4">
                                        <a href="../goods/sale_goods_list.html"><span class="txt">알뜰쇼핑</span></a>
                                    </li>
                                    <li class="menu5">
                                        <a href="../goods/event_list.html"><span class="txt">금주혜택</span></a>
                                    </li>
                                </ul>
                                <div id="sideSearch" class="gnb_search">
                                    <form action="../goods/goods_search.html">
                                        <input type="text" name="sword" id="sword" class="inp_search">
                                        <input type="image" src="../../img/ico_search_x2.webp" class="btn_search">
                                        <div class="init">
                                            <button id="searchInit" class="btn_delete">검색어 삭제하기</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="location_set">
                                    <button type="button" class="btn_location">배송지 설정하기</button>
                                    <div class="layer_location">
                                        <div class="no_address">
                                            <span class="emph">배송지를 등록</span>하고<br>구매 가능한 상품을 확인하세요!
                                            <div>
                                                <button type="button" class="btn default login">로그인</button>
                                                <button type="button" class="btn active searchAddress"><span
                                                        class="ico"></span>주소검색</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart_count">
                                    <div class="inner_cartcount">
                                        <a href="../goods/goods_cart.html" class="btn_cart">
                                            <span class="screen_out">장바구니</span>
                                            <span id="cart_item_count" class="num realtime_cartcount"></span>
                                        </a>
                                    </div>
                                    <div id="addMsgCart" class="msg_cart">
                                        <span class="point"></span>
                                        <div class="inner_msgcart">
                                            <img src="#" class="thumb">
                                            <p id="msgReaddedItem" class="desc">
                                                <span class="tit">제품 타이틀</span>
                                                <span class="txt">장바구니에 상품을 담았습니다.
                                                    <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="gnb_sub">
                                <div class="inner_sub">
                                    <ul class="gnb_menu" style="height: auto;" data-default="219" data-min="219"
                                        data-max="731">
                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_veggies_inactive_pc@2x.1586324570.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_veggies_active_pc@2x.1586324570.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">채소</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu current" style="display: block;">
                                                <li><a class="sub"><span class="name">고구마·감자·당근</span></a></li>
                                                <li><a class="sub"><span class="name">시금치·쌈채소·나물</span></a></li>
                                                <li><a class="sub"><span class="name">브로콜리·파프리카·양배추</span></a></li>
                                                <li><a class="sub"><span class="name">양파·대파·마늘·배추</span></a></li>
                                                <li><a class="sub"><span class="name">오이·호박·고추</span></a></li>
                                                <li><a class="sub"><span class="name">냉동·이색·간편채소</span></a></li>
                                                <li><a class="sub"><span class="name">콩나물·버섯</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_fruit_inactive_pc@2x.1568684150.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_fruit_active_pc@2x.1568684150.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">과일·견과·쌀</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">제철과일</span></a></li>
                                                <li><a class="sub"><span class="name">국산과일</span></a></li>
                                                <li><a class="sub"><span class="name">수입과일</span></a></li>
                                                <li><a class="sub"><span class="name">간편과일</span></a></li>
                                                <li><a class="sub"><span class="name">냉동·건과일</span></a></li>
                                                <li><a class="sub"><span class="name">견과류</span></a></li>
                                                <li><a class="sub"><span class="name">쌀·잡곡</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_seafood_inactive_pc@2x.1568684352.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_seafood_active_pc@2x.1568684353.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">수산·해산·건어물</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">제철수산</span></a></li>
                                                <li><a class="sub"><span class="name">생선류</span></a></li>
                                                <li><a class="sub"><span class="name">굴비·반건류</span></a></li>
                                                <li><a class="sub"><span class="name">오징어·낙지·문어</span></a></li>
                                                <li><a class="sub"><span class="name">새우·게·랍스터</span></a></li>
                                                <li><a class="sub"><span class="name">해산물·조개류</span></a></li>
                                                <li><a class="sub"><span class="name">수산가공품</span></a></li>
                                                <li><a class="sub"><span class="name">김·미역·해조류</span></a></li>
                                                <li><a class="sub"><span class="name">건어물·다시팩</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_meat_inactive_pc@2x.1568684452.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_meat_active_pc@2x.1568684452.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">정육·계란</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">국내산 소고기</span></a></li>
                                                <li><a class="sub"><span class="name">수입산 소고기</span></a></li>
                                                <li><a class="sub"><span class="name">돼지고기</span></a></li>
                                                <li><a class="sub"><span class="name">계란류</span></a></li>
                                                <li><a class="sub"><span class="name">닭·오리고기</span></a></li>
                                                <li><a class="sub"><span class="name">양념육·돈까스</span></a></li>
                                                <li><a class="sub"><span class="name">양고기</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_side_inactive_pc@2x.1572243579.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_side_active_pc@2x.1572243579.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">국·반찬·메인요리</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">국·탕·찌개</span></a></li>
                                                <li><a class="sub"><span class="name">밀키트·메인요리</span></a></li>
                                                <li><a class="sub"><span class="name">밑반찬</span></a></li>
                                                <li><a class="sub"><span class="name">김치·젓갈·장류</span></a></li>
                                                <li><a class="sub"><span class="name">두부·어묵·부침개</span></a></li>
                                                <li><a class="sub"><span class="name">베이컨·햄·통조림</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_convenient_inactive_pc@2x.1572243542.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_convenient_active_pc@2x.1572243543.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">샐러드·간편식</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">샐러드·닭가슴살</span></a></li>
                                                <li><a class="sub"><span class="name">도시락·밥류</span></a></li>
                                                <li><a class="sub"><span class="name">파스타·면류</span></a></li>
                                                <li><a class="sub"><span class="name">떡볶이·튀김·순대</span></a></li>
                                                <li><a class="sub"><span class="name">피자·핫도그·만두</span></a></li>
                                                <li><a class="sub"><span class="name">폭립·떡갈비·안주</span></a></li>
                                                <li><a class="sub"><span class="name">죽·스프·카레</span></a></li>
                                                <li><a class="sub"><span class="name">선식·시리얼</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_sauce_inactive_pc@2x.1572243594.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_sauce_active_pc@2x.1572243594.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">면·양념·오일</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">파스타·면류</span></a></li>
                                                <li><a class="sub"><span class="name">식초·소스·드레싱</span></a></li>
                                                <li><a class="sub"><span class="name">양념·액젓·장류</span></a></li>
                                                <li><a class="sub"><span class="name">식용유·참기름·오일</span></a></li>
                                                <li><a class="sub"><span class="name">소금·설탕·향신료</span></a></li>
                                                <li><a class="sub"><span class="name">밀가루·가루·믹스</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_snacks_inactive_pc@2x.1572243615.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_snacks_active_pc@2x.1572243616.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">생수·음료·우유·커피</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">생수·탄산수</span></a></li>
                                                <li><a class="sub"><span class="name">음료·주스</span></a></li>
                                                <li><a class="sub"><span class="name">우유·두유·요거트</span></a></li>
                                                <li><a class="sub"><span class="name">커피</span></a></li>
                                                <li><a class="sub"><span class="name">차</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_cookie_inactive_pc.1610074008.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_cookie_active_pc.1610074008.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">간식·과자·떡</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">과자·스낵·쿠키</span></a></li>
                                                <li><a class="sub"><span class="name">초콜릿·젤리·캔디</span></a></li>
                                                <li><a class="sub"><span class="name">떡·한과</span></a></li>
                                                <li><a class="sub"><span class="name">아이스크림</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_deli_inactive_pc@2x.1568687352.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_deli_active_pc@2x.1568687352.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">베이커리·치즈·델리</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">식빵·빵류</span></a></li>
                                                <li><a class="sub"><span class="name">잼·버터·스프레드</span></a></li>
                                                <li><a class="sub"><span class="name">케이크·파이·디저트</span></a></li>
                                                <li><a class="sub"><span class="name">치즈</span></a></li>
                                                <li><a class="sub"><span class="name">델리</span></a></li>
                                                <li><a class="sub"><span class="name">올리브·피클</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_health_inactive_pc@2x.1574645922.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_health_active_pc@2x.1574645923.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">건강식품</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">영양제</span></a></li>
                                                <li><a class="sub"><span class="name">유산균</span></a></li>
                                                <li><a class="sub"><span class="name">홍삼·인삼·꿀</span></a></li>
                                                <li><a class="sub"><span class="name">건강즙·건강음료</span></a></li>
                                                <li><a class="sub"><span class="name">건강분말·건강환</span></a></li>
                                                <li><a class="sub"><span class="name">다이어트·이너뷰티</span></a></li>
                                                <li><a class="sub"><span class="name">유아동</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_living_inactive_pc@2x.1588814089.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_living_active_pc@2x.1588814090.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">생활용품·리빙</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">휴지·티슈</span></a></li>
                                                <li><a class="sub"><span class="name">여성·위생용품</span></a></li>
                                                <li><a class="sub"><span class="name">세제·청소용품</span></a></li>
                                                <li><a class="sub"><span class="name">화훼·인테리어소품</span></a></li>
                                                <li><a class="sub"><span class="name">의약외품·마스크</span></a></li>
                                                <li><a class="sub"><span class="name">생활잡화·문구</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_beauty_inactive_pc@2x.1588750188.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_beauty_active_pc@2x.1588750188.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">뷰티·바디케어</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">스킨케어</span></a></li>
                                                <li><a class="sub"><span class="name">구강·면도</span></a></li>
                                                <li><a class="sub"><span class="name">바디·제모</span></a></li>
                                                <li><a class="sub"><span class="name">헤어케어</span></a></li>
                                                <li><a class="sub"><span class="name">미용기기·소품</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_kitchen_inactive_pc@2x.1574646457.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_kitchen_active_pc@2x.1574646458.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">주방용품</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">주방소모품·잡화</span></a></li>
                                                <li><a class="sub"><span class="name">주방·조리도구</span></a></li>
                                                <li><a class="sub"><span class="name">냄비·팬·솥</span></a></li>
                                                <li><a class="sub"><span class="name">보관용기·텀블러</span></a></li>
                                                <li><a class="sub"><span class="name">식기·테이블웨어</span></a></li>
                                                <li><a class="sub"><span class="name">컵·잔·커피도구</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_electronic__inactive_pc@2x.1574417978.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_electronic__active_pc@2x.1574417978.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">가전제품</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">주방가전</span></a></li>
                                                <li><a class="sub"><span class="name">생활가전</span></a></li>
                                                <li><a class="sub"><span class="name">계절가전</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_kids_inactive_pc@2x.1568687537.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_kids_active_pc@2x.1568687537.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">베이비·키즈</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">분유·간편 이유식</span></a></li>
                                                <li><a class="sub"><span class="name">이유식 재료</span></a></li>
                                                <li><a class="sub"><span class="name">간식·음식·음료</span></a></li>
                                                <li><a class="sub"><span class="name">건강식품</span></a></li>
                                                <li><a class="sub"><span class="name">이유·수유용품</span></a></li>
                                                <li><a class="sub"><span class="name">기저귀·물티슈</span></a></li>
                                                <li><a class="sub"><span class="name">세제·위생용품</span></a></li>
                                                <li><a class="sub"><span class="name">스킨·구강케어</span></a></li>
                                                <li><a class="sub"><span class="name">완구·잡화류</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="../../img/mainMenu/icon_pet_inactive_pc@2x.1587442293.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="../../img/mainMenu/icon_pet_active_pc@2x.1587442294.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">반려동물</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">강아지 간식</span></a></li>
                                                <li><a class="sub"><span class="name">강아지 주식</span></a></li>
                                                <li><a class="sub"><span class="name">고양이 간식</span></a></li>
                                                <li><a class="sub"><span class="name">고양이 주식</span></a></li>
                                                <li><a class="sub"><span class="name">반려동물 용품</span></a></li>
                                                <li><a class="sub"><span class="name">배변·위생</span></a></li>
                                                <li><a class="sub"><span class="name">소용량·샘플</span></a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- main 시작 -->
            <div id="main">
                <!-- 본문 시작 -->
                <div id="content">
                    <div id="main">
                        <div id="content" style="padding-bottom: 60px;">
                            <div class="section_login">
                                <h3 class="tit_login">로그인</h3>
                                <div class="write_form">
                                    <div class="write_view login_view">
                                        <form method="post" name="form" id="form" onsubmit="return checkReCaptcha();" action="./login_ok.jsp">
                                            <input type="hidden" name="returnUrl" value="https://www.kurly.com/shop/main/index.php?utm_campaign=home&amp;utm_medium=2102&amp;utm_source=1049&amp;utm_content=pc_brand&amp;utm_term=SA_naverBRmain_text">
                                            <input type="hidden" name="return_url" value="">
                                            <input type="hidden" name="close" value="">
                                            <input type="text" name="m_id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
                                            <input type="password" name="password" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
                                            <div class="checkbox_save">
                                                <label class="label_checkbox checked">
                                                    <input type="checkbox" id="chk_security" name="chk_security" value="y" checked="checked"
                                                        onchange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
                                                    보안접속
                                                </label>
                        
                                                <div class="login_search">
                                                    <a href="./find_id.html" class="link">아이디 찾기</a>
                                                    <span class="bar"></span>
                                                    <a href="./find_pwd.html" class="link">비밀번호 찾기</a>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn_type1"><span class="txt_type">로그인</span></button>
                                        </form>
                                        <a href="./join.html" class="btn_type2 btn_member"><span class="txt_type">회원가입</span></a>
                                    </div>
                                </div>
                            </div>

                            <script>
                                window.onload = function () { document.form.m_id.focus(); }

                                function checkReCaptcha() {
                                    var $captcha = $("input[name=captcha]");
                                    if ($captcha.length > 0) {
                                        if (!$captcha.val()) {
                                            alert("인증번호를 입력해 주세요");
                                            $captcha.focus();
                                            return false;
                                        }
                                    } else {
                                        return true;
                                    }
                                }
                            </script>
                        </div>
                    </div>
                </div>
                <!-- 본문 종료 -->
            </div>
            <!-- main 종료 -->

            <!-- footer 시작 -->
            <div class="footerLine"></div>
            <footer id="footer">
                <div class="inner_footer page_aticle">
                    <div class="footer_cc">
                        <h2 class="tit_cc">고객행복센터</h2>
                        <div class="cc_view cc_call">
                            <h3>
                                <span class="tit">1644-1107</span>
                            </h3>
                            <dl class="list">
                                <dt>365고객센터</dt>
                                <dd>오전 7시 - 오후 7시</dd>
                            </dl>
                        </div>
                        <div class="cc_view cc_kakao">
                            <h3>
                                <a class="tit" href="#none">카카오톡 문의</a>
                            </h3>
                            <dl class="list">
                                <dt>365고객센터</dt>
                                <dd>오전 7시 - 오후 7시</dd>
                            </dl>
                        </div>
                        <div class="cc_view cc_qna">
                            <h3>
                                <a href="../mypage/mypage_qna_register.html" class="tit">1:1 문의</a>
                            </h3>
                            <dl class="list">
                                <dt>24시간 접수 가능</dt>
                                <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="company">
                        <ul class="list">
                            <li><a class="link" href="../service/about_kurly.html">컬리소개</a></li>
                            <li><a class="link"
                                    href="https://www.youtube.com/embed/WEep7BcboMQ?rel=0&showinfo=0&wmode=opaque&enablejsapi=1"
                                    onclick="window.open(this.href, 'pop', 'width=1330,height=660,scrollbars=yes'); return false;">컬리소개영상</a>
                            </li>
                            <li><a class="link" href="https://marketkurly.recruiter.co.kr/appsite/company/index"
                                    target="_blank">인재채용</a></li>
                            <li><a class="link" href="#">이용약관</a></li>
                            <li><a class="link" href="#" style="font-weight: 500;">개인정보처리방침</a></li>
                            <li><a class="link" href="#">이용안내</a></li>
                        </ul>
                        <p>
                            법인명 (상호) : 주식회사 컬리 <span class="bar">|</span> 사업자등록번호 : 261-81-23567 <a
                                href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2618123567&apv_perm_no=" class="link"
                                target="_blank">사업자정보 확인</a><br>
                            통신판매업 : 제 2018-서울강남-01646 호 <span class="bar">|</span> 개인정보보호책임자 : 이원준<br>
                            주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F <span class="bar">|</span> 대표이사 : 김슬아<br>
                            입점문의 : <a href="https://forms.gle/oKMAe1SaicqMX3SC9" target="_blank" class="link">입점문의하기</a>
                            <span class="bar">|</span> 제휴문의 : <a href="mailto:business@kurlycorp.com"
                                class="link">business@kurlycorp.com</a><br>
                            채용문의 : <a href="mailto:recruit@kurlycorp.com" class="link">recruit@kurlycorp.com</a><br>
                            팩스: 070 - 7500 - 6098 <span class="bar">|</span> 이메일 : <a href="mailto:help@kurlycorp.com"
                                class="link">help@kurlycorp.com</a>
                        <p class="copy">© KURLY CORP. ALL RIGHTS RESERVED</p>
                        </p>
                        <ul class="list_sns">
                            <li><a href="https://instagram.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="../../img/sns/ico_instagram.webp" alt="마켓컬리 인스타그램 바로가기"></a></li>
                            <li><a href="https://www.facebook.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="../../img/sns/ico_fb.webp" alt="마켓컬리 페이스북 바로가기"></a></li>
                            <li><a href="http://blog.naver.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="../../img/sns/ico_blog.webp" alt="마켓컬리 네이버블로그 바로가기"></a></li>
                            <li><a href="https://m.post.naver.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="../../img/sns/ico_naverpost.webp" alt="마켓컬리 네이버포스트 바로가기"></a></li>
                            <li><a href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg" class="link_sns"
                                    target="_blank"><img src="../../img/sns/ico_youtube.webp" alt="마켓컬리 유튜브 바로가기"></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer_link page_aticle">
                    <div class="authentication">
                        <a href="#" class="mark">
                            <img src="../../img/sns/logo_isms.webp" alt="isms 로고" class="logo">
                            <p class="txt">[인증범위] 마켓컬리 쇼핑몰 서비스 개발 · 운영<br>[유효기간] 2019.04.01 ~ 2022.03.31</p>
                        </a>
                        <a href="#" class="mark">
                            <img src="../../img/sns/logo_eprivacyplus.webp" alt="eprivacy plus 로고" class="logo">
                            <p class="txt">개인정보보호 우수 웹사이트 ·<br>개인정보처리시스템 인증 (ePRIVACY PLUS)</p>
                        </a>
                        <a href="#" class="mark lguplus">
                            <img src="../../img/sns/logo_payments.webp" alt="payments 로고" class="logo">
                            <p class="txt">고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수
                                있습니다.</p>
                        </a>
                    </div>
                </div>
            </footer>
            <!-- footer 종료 -->
        </div>
        <!-- container 종료 -->

        <!-- quick list 시작 -->
        <a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 15px;">맨 위로가기</a> <!--  -->
        <script>
            // 스크롤을 위로 올리면 (top메뉴가 보이면) to_top이 아래로 사라지는 효과
            $(document).ready(function () {
                var pageTop = {
                    $target: $('#pageTop'),
                    $targetDefault: 0,
                    $scrollTop: 0,
                    $window: $(window),
                    $windowHeight: 0,
                    setTime: 500,
                    saveHeight: 0,
                    init: function () {
                    },
                    action: function () {
                        var $self = this;
                        $self.$windowHeight = parseInt($self.$window.height());
                        $self.$window.on('scroll', function () {
                            $self.$scrollTop = parseInt($self.$window.scrollTop());
                            if ($self.$scrollTop >= $self.$windowHeight) {
                                if (!$self.$target.hasClass('on')) {
                                    $self.position();
                                    $self.$target.addClass('on');
                                    $self.showAction();
                                }
                            } else {
                                if ($self.$target.hasClass('on')) {
                                    $self.position();
                                    $self.$target.removeClass('on');
                                    $self.hideAction();
                                }
                            }
                        });

                        $self.$target.on('click', function (e) {
                            e.preventDefault();
                            $self.topAction();
                        });
                    },
                    showAction: function () {
                        var $self = this;
                        $self.$target.stop().animate({
                            opacity: 1,
                            bottom: $self.saveHeight
                        }, $self.setTime);
                    },
                    hideAction: function () {
                        var $self = this;
                        $self.$target.stop().animate({
                            opacity: 0,
                            bottom: -$self.$target.height()
                        }, $self.setTime);
                    },
                    topAction: function () {
                        var $self = this;
                        $self.hideAction();
                        $('html,body').animate({
                            scrollTop: 0
                        }, $self.setTime);
                    },
                    position: function () {
                        var $self = this;
                        $self.saveHeight = 15;
                        if ($('#sectionView').length > 0) {
                            $self.saveHeight = 25;
                        }
                        if ($('#branch-banner-iframe').length > 0 && parseInt($('#branch-banner-iframe').css('bottom')) > 0) {
                            $('#footer').addClass('bnr_app');
                            $self.saveHeight += $('#branch-banner-iframe').height();
                        }
                    }
                }
                pageTop.action();
            });
        </script>
        <script>
            var bodyScroll = {
                winScrollTop: 0,
                body: $('body'),
                gnb: $('#gnb'),
                bg: $('#bgLoading'),
                bodyFixed: function () {
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
                        'top': -$self.winScrollTop
                    });
                },
                bodyDefault: function (type) {
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