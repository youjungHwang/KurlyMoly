<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = null;
	if (session.getAttribute("m_id") != null) {
		userid = (String) session.getAttribute("m_id");
	}
%>

<!-- 메인페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>

    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <link href="./css/jsScript.css" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet"/>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="./script/script.js"></script>
    <script src="./script/MJscript.js"></script>
    <script src="/common_js/kurlytracker/kurlytracker.js?ver=1.26.11"></script>
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
                    <!-- 100원 행사 안내 배너 -->
                    <a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_210224"
                        id="eventLanding">지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png" class="bnr_arr">
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
                            <a href="./shop/board/delivery.html" class="bnr_delivery"><img src="./img/delivery_190819.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송"></a>
                        </li>
                    </ul>
                    <ul class="menuRight list_menu">
				<%
					if (userid == null) {
				%>
                        <li class="menu none_sub menu_join">
                            <a href="./shop/member/join.jsp" class="link_menu">회원가입</a>
                        </li>
                        <li class="menu none_sub menu_login">
                            <a href="./shop/member/login.jsp" class="link_menu">로그인</a>
                        </li>
                        
				<%
					} else {
				%>
						<li class="menu menu_user" style="width: 120px;">
							<a class="link_menu grade_comm"><span class="ico_grade grade0">일반</span> <span class="txt"><span class="name"><%=session.getAttribute("m_name")%></span><span class="sir">님</span></span></a>
							<ul class="sub" style="left: 20px;">
								<li><a href="./shop/mypage/mypage_main.html">주문 내역</a></li>
								<li><a href="./shop/mypage/mypage_transport.html">배송지 관리</a></li>
								<li><a href="./shop/mypage/mypage_Zzim.html">늘 사는 것</a></li>
								<li><a href="./shop/mypage/mypage_review.jsp">상품 후기</a></li>
								<li><a href="./shop/mypage/mypage_emoney.html">적립금</a></li>
								<li><a href="./shop/mypage/mypage_coupon.html">쿠폰</a></li>
								<li><a href="./shop/mypage/mypage_editinfo.html">개인 정보 수정</a></li>
								<li><a href="./shop/member/logout.jsp">로그아웃</a></li>
							</ul>
						</li>
				<%
					}
				%>
                        <li class="menu lst">
                            <a href="./shop/board/notice.html" class="link_menu cos">고객센터</a>
                            <ul class="sub">
                                <li>
                                    <a href="./shop/board/notice.html">공지사항</a>
                                </li>
                                <li>
                                    <a href="./shop/board/faq.html">자주하는 질문</a>
                                </li>
                                <li>
                                    <a href="./shop/mypage/mypage_qna.html">1:1 문의</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div id="headerLogo">
                    <!-- 메인로고 -->
                    <h1 class="logo"><a href="./index.jsp" class="link_main"><img src="./img/logo_x2.webp" alt="마켓컬리 로고" style="display: block;"></a></h1>
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
                                        <a href="./shop/goods/new_goods_list.html"><span class="txt">신상품</span></a>
                                    </li>
                                    <li class="menu3">
                                        <a href="./shop/goods/best_goods_list.html"><span class="txt">베스트</span></a>
                                    </li>
                                    <li class="menu4">
                                        <a href="./shop/goods/sale_goods_list.html"><span class="txt">알뜰쇼핑</span></a>
                                    </li>
                                    <li class="menu5">
                                        <a href="./shop/goods/event_list.html"><span class="txt">금주혜택</span></a>
                                    </li>
                                </ul>
                                <div id="sideSearch" class="gnb_search">
                                    <!-- 검색창 들어가는 부분 -->
                                    <form action="./shop/goods/goods_search.html">
                                        <!-- <form action="./shop/goods/goods_search.html" onsubmit="return searchTracking(this)"> -->
                                        <input type="text" name="sword" id="sword" class="inp_search"
                                            value="유명 맛집따라 서울 한 바퀴">
                                        <input type="image" src="./img/ico_search_x2.webp" class="btn_search">
                                        <div class="init">
                                            <button id="searchInit" class="btn_delete">검색어 삭제하기</button>
                                            <!-- 평소에는 숨어있고, 검색어가 입력되면 'X' 표시로 나타남 -->
                                        </div>
                                    </form>
                                </div>
                                <div class="location_set">
                                    <!-- 배송지 설정 -->
                                    <button type="button" class="btn_location">배송지 설정하기</button>
                                    <div class="layer_location">
                                        <div class="no_address">
                                            <!-- 등록된 주소가 없는 사람이 마우스를 가져다 댈 때 나타남 -->
                                            <span class="emph">배송지를 등록</span>하고<br>구매 가능한 상품을 확인하세요!
                                            <div>
                                                <button type="button" class="btn default login">로그인</button>
                                                <button type="button" class="btn active searchAddress">
                                                    <span class="ico"></span>주소검색
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart_count">
                                    <!-- 장바구니에 물건이 담겨질 때마다 액션 발생해야 함 -->
                                    <div class="inner_cartcount">
                                        <a href="./shop/goods/goods_cart.html" class="btn_cart">
                                            <span class="screen_out">장바구니</span>
                                            <span id="cart_item_count" class="num realtime_cartcount"></span>
                                        </a>
                                    </div>
                                    <div id="addMsgCart" class="msg_cart">
                                        <span class="point"></span> <!-- 장바구니에 1 숫자 뜨는 곳 -->
                                        <div class="inner_msgcart">
                                            <img src="#" class="thumb"> <!-- 장바구니에 들어간 상품 이미지 -->
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
                                <!-- js 적용시 - display:none→block, width:219px→438px -->
                                <!-- 마우스 오버 시 style="display: block; width: 438px;" -->
                                <div class="inner_sub">
                                    <ul class="gnb_menu" style="height: auto;" data-default="219" data-min="219"
                                        data-max="731">
                                        <!-- 카테고리 전체를 감싸는 div -->
                                        <li>
                                            <!-- 마우스 호버 시 클래스 .current가 생겨야 함 ★★★★★ -->
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="./img/mainMenu/icon_veggies_inactive_pc@2x.1586324570.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_veggies_active_pc@2x.1586324570.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">채소</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub"><span class="name">고구마·감자·당근</span></a></li>
                                                <!-- 마우스 호버 시 .current가 생겨야 함 ★★★★★ -->
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
                                                    <img src="./img/mainMenu/icon_fruit_inactive_pc@2x.1568684150.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_fruit_active_pc@2x.1568684150.png"
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
                                                    <img src="./img/mainMenu/icon_seafood_inactive_pc@2x.1568684352.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_seafood_active_pc@2x.1568684353.png"
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
                                                    <img src="./img/mainMenu/icon_meat_inactive_pc@2x.1568684452.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_meat_active_pc@2x.1568684452.png"
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
                                                    <img src="./img/mainMenu/icon_side_inactive_pc@2x.1572243579.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_side_active_pc@2x.1572243579.png"
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
                                                    <img src="./img/mainMenu/icon_convenient_inactive_pc@2x.1572243542.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_convenient_active_pc@2x.1572243543.png"
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
                                                    <img src="./img/mainMenu/icon_sauce_inactive_pc@2x.1572243594.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_sauce_active_pc@2x.1572243594.png"
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
                                                    <img src="./img/mainMenu/icon_snacks_inactive_pc@2x.1572243615.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_snacks_active_pc@2x.1572243616.png"
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
                                                    <img src="./img/mainMenu/icon_cookie_inactive_pc.1610074008.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_cookie_active_pc.1610074008.png"
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
                                            <a class="menu" href="./shop/goods/goods_list.jsp">
                                                <span class="ico">
                                                    <img src="./img/mainMenu/icon_deli_inactive_pc@2x.1568687352.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_deli_active_pc@2x.1568687352.png"
                                                        alt="카테고리 아이콘 on" class="ico_on">
                                                </span>
                                                <span class="tit">
                                                    <span class="txt">베이커리·치즈·델리</span>
                                                </span>
                                            </a>
                                            <ul class="sub_menu" style="display: none;">
                                                <li><a class="sub" href="./shop/goods/goods_list.html"><span class="name">식빵·빵류</span></a></li>
                                                <li><a class="sub" href="./shop/goods/goods_list.html"><span class="name">잼·버터·스프레드</span></a></li>
                                                <li><a class="sub" href="./shop/goods/goods_list.html"><span class="name">케이크·파이·디저트</span></a></li>
                                                <li><a class="sub" href="./shop/goods/goods_list.html"><span class="name">치즈</span></a></li>
                                                <li><a class="sub" href="./shop/goods/goods_list.html"><span class="name">델리</span></a></li>
                                                <li><a class="sub" href="./shop/goods/goods_list.html"><span class="name">올리브·피클</span></a></li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a class="menu">
                                                <span class="ico">
                                                    <img src="./img/mainMenu/icon_health_inactive_pc@2x.1574645922.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_health_active_pc@2x.1574645923.png"
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
                                                    <img src="./img/mainMenu/icon_living_inactive_pc@2x.1588814089.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_living_active_pc@2x.1588814090.png"
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
                                                    <img src="./img/mainMenu/icon_beauty_inactive_pc@2x.1588750188.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_beauty_active_pc@2x.1588750188.png"
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
                                                    <img src="./img/mainMenu/icon_kitchen_inactive_pc@2x.1574646457.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_kitchen_active_pc@2x.1574646458.png"
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
                                                    <img src="./img/mainMenu/icon_electronic__inactive_pc@2x.1574417978.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_electronic__active_pc@2x.1574417978.png"
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
                                                    <img src="./img/mainMenu/icon_kids_inactive_pc@2x.1568687537.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_kids_active_pc@2x.1568687537.png"
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
                                                    <img src="./img/mainMenu/icon_pet_inactive_pc@2x.1587442293.png"
                                                        alt="카테고리 아이콘 off" class="ico_off">
                                                    <img src="./img/mainMenu/icon_pet_active_pc@2x.1587442294.png"
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
                    <div id="qnb" class="quick-navigation" style="z-index: 500;">
                        <div class="bnr_qnb" id="brn_Quick">
                            <a href="./shop/board/delivery.html"><img class="thumb" src="./img/sidebar/bnr_quick_20190403.webp"></a>
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
                            <a href="./event_lovers.html" class="link_menu">등급별 혜택</a>
                            <a href="../recipe/recipe_all.html" class="link_menu">레시피</a>
                        </div>
                    </div>

                    <div id="kurlyMain" class="page_main" style="opacity: 1;">
                        <h2 class="screen_out">마켓컬리 메인</h2>
                        <div>
                            <div class="main_type1">
                                <!-- 이벤트 리스트 이미지 슬라이더 부분 -->
                                <div class="list_goods">
                                    <div class="bx_wrapper" style="max-width: 100%; margin: 0px auto;">
                                        <!-- ★★★★★★★★★★ HYJ 메인 롤링 ★★★★★★★★★★ -->
                                        <div class="bx_viewport swiper-container" style="width: 100%; overflow: hidden; position: relative; height: 370px;">
                                            <div data-section="main_banner" class="list swiper-wrapper" style="width: 1000%; position: relative;">
                                                <div data-index="8" style="float: left; list-style: none; position: relative; width: 10%;" class="bx-clone swiper-slide" data-name="main_banner">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1583112495.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="1" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;" data-name="main_banner">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1614935884.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="2" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1614910139.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="3" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1614758267.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="4" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1614909903.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="5" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1614679801.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="6" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1602809211.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="7" data-name="main_banner" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1596164134.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="8" class="swiper-slide" style="float: left; list-style: none; position: relative; width: 10%;" data-name="main_banner">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1583112495.webp'); background-size: cover;"></a>
                                                </div>
                                                <div data-index="1" style="float: left; list-style: none; position: relative; width: 10%;" class="bx-clone swiper-slide" data-name="main_banner">
                                                    <a href="#" class="thumb_goods" style="background-image: url('./img/mainSlide/pc_img_1614935884.webp'); background-size: cover;"></a>
                                                </div>
                                            </div>
                                            <div class="swiper-button-next"><img src="./img/mainSlide/ico_next1_x1.webp"></div>
                                            <div class="swiper-button-prev"><img src="./img/mainSlide/ico_prev1_x1.webp"></div>
                                        </div>
                                        <script>
                                            var swiper = new Swiper('.swiper-container', {
                                                navigation: {
                                                    nextEl: '.swiper-button-next',
                                                    prevEl: '.swiper-button-prev',
                                                },
                                            });
                                        </script>
                                        <!-- <script src="./script/swiper.min.js"></script> -->
                                        <script>
                                            $(function () {
                                                var swiper = new Swiper('.swiper-container', {
                                                    loop: true,
                                                    autoplay: 4000,
                                                    speed: 800,
                                                    autoplayDisableOnInteraction: true,
                                                    pagination: '.swiper-pagination',
                                                    paginationClickable: true
                                                });
                                            });
                                        </script>
                                        <!-- autoplayDisableOnInteraction 수정필요, swiper.min.js 추가함-->
                                        <!--★★★★★★★★★★ HYJ 메인 롤링 끝 ★★★★★★★★★★-->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit"><span class="name">이 상품 어때요?</span></h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper">

                                            <!--★★★★★★★★★★ HYJ 중간 롤링 ★★★★★★★★★★-->
                                            <div class="bx-viewport swiper-Container" style="width: 100%; overflow: hidden; position: relative; height: 506px;">
                                                <div data-title="이 상품 어때요?" data-section="today_recommendation" class="list swiper-wrapper">
                                                    
                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1502272106555l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name">
                                                                <a class="txt">[밤보네이처] 기저귀 12종 (박스)</a>
                                                            </span>
                                                            <span class="price">50,100원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1566362968250l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name">
                                                                <a class="txt">[우리밀] 백밀가루 & 옛밀가루</a>
                                                            </span>
                                                            <span class="price">3,600원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1607935549902l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name">
                                                                <a class="txt">[돈마루] 한돈 앞다리살 2종 (냉장)</a>
                                                            </span>
                                                            <span class="price">4,600원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1470879732522l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name">
                                                                <a class="txt">[오뗄두스] 구움과자 2종</a>
                                                            </span>
                                                            <span class="price">2,000원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1499933534502l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name">
                                                                <a class="txt">[산베네데토] 탄산수 500ml 1박스 (20개입)</a>
                                                            </span>
                                                            <span class="price"><span class="dc">25%</span>26,932원</span>
                                                            <span class="cost">35,910원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1501140243276l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[하타케나카] 녹차 소바</a></span>
                                                            <span class="price"><span class="dc">5%</span>5,605원</span>
                                                            <span class="cost">5,900원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1488966896887l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods"><span class="name"><a class="txt">[앤쿡] 컴팩트 고등어 &amp; 삼치(냉동)</a></span> <span class="price">15,900원</span></div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1499933534502l0.jpg " alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods"><span class="name"><a class="txt">[산베네데토] 탄산수 500ml</a></span> <span class="price"><span class="dc">25%</span>1,350원</span>
                                                        <span class="cost">1,800원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1477568051626l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods"><span class="name"><a class="txt">[그랑도르즈] 까망베르 2종</a></span> <span class="price">2,000원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1465956933846l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods"><span class="name"><a class="txt">무농약 양파 2종</a></span>
                                                        <span class="price">2,690원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1477568074666l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[김소영 아티장의 안단테] 그랑도르즈 베이크드 까망베르</a></span>
                                                            <span class="price"><span class="dc">5%</span>11,305원                            </span>
                                                            <span class="cost">11,900원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1488438873000_l.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[스토리스 오브 그릭] 엑스트라 버진 200ml  (2020-2021 햇올리브)</a></span>
                                                            <span class="price"><span class="dc">40%</span>33,000원                            </span>
                                                            <span class="cost">55,000원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1486717673706l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">친환경 콜라비 1개</a></span>
                                                            <span class="price">2,290원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1489978895649l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">친환경 비트 2~4입</a></span>
                                                            <span class="price">4,990원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1493707899386l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">산천농원 무농약 곶감 8입 (냉동)</a></span>
                                                            <span class="price">10,800원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1470304770782l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[인페르노] 아일랜드 하바네로 핫소스 4종</a></span>
                                                            <span class="price"><span class="dc">10%</span>7,110원</span>
                                                            <span class="cost">7,900원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1498628304465l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[바오담] 수제 팥앙금</a></span>
                                                            <span class="price"><span class="dc">20%</span>9,600원</span>
                                                            <span class="cost">12,000원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1527672401304l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[콜린스그린] 원데이 클렌즈 (1일)</a></span>
                                                            <span class="price"><span class="dc">20%</span>34,000원</span>
                                                            <span class="cost">42,500원</span>
                                                        </div>
                                                    </div>

                                                    <div class="swiper-slide">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/1613639022287l0.jpg" alt="상품이미지">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[콜린스그린] 밀싹주스</a></span>
                                                            <span class="price"><span class="dc">10%</span>8,550원</span>
                                                            <span class="cost">9,500원</span>
                                                        </div>
                                                    </div>           
                                                </div>
                                                <div class="bx-controls bx-has-controls-direction">
                                                    <div class="bx-controls-direction">
                                                        <a class="bx-next" href=""><img src="./img/mainSlide/btn_next_default.webp"></a>
                                                        <a class="bx-prev"><img src="./img/mainSlide/btn_prev_default.webp"></a>
                                                    </div>
                                                </div>
                                                <!-- <div class="swiper-button-next"><a><img src="./img/mainSlide/btn_next_default.webp"></a></div>
                                                <div class="swiper-button-prev"><img src="./img/mainSlide/btn_prev_default.webp"></div> -->
                                            </div>
                                            <script>
                                                var swiper = new Swiper('.swiper-Container', {

                                                    slidesPerView: 4, // 동시에 보여줄 슬라이드 갯수
                                                    spaceBetween: 30, // 슬라이드간 간격
                                                    slidesPerGroup: 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

                                                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                                                    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
                                                    loopFillGroupWithBlank: true,

                                                    loop: true, // 무한 반복

                                                    navigation: { // 네비게이션
                                                        nextEl: '.bx-next', // 다음 버튼 클래스명
                                                        prevEl: '.bx-prev' // 이번 버튼 클래스명
                                                    }
                                                });
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type3 bg">
                                <div class="main_event">
                                    <div class="tit_goods">
                                        <h3 class="tit"><a class="name"><span class="ico">이벤트 소식</span></a></h3>
                                    </div>
                                    <div class="list_goods">
                                        <ul data-title="이벤트 소식" data-section="event" class="list">
                                            <li data-index="1">
                                                <a class="thumb_goods">
                                                    <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                        style="background-image: url('./img/mainSlide/pc_img_1614676370.jpg');">
                                                </a>
                                                <div class="info_goods">
                                                    <div class="inner_info">
                                                        <span class="name"><a class="txt">쌍계명차 최대 20% 할인</a></span>
                                                        <span class="desc"><a class="txt">우리나라 전통차와 기호차</a></span>
                                                    </div>
                                                </div>
                                            </li>

                                            <li data-index="2">
                                                <a class="thumb_goods">
                                                    <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                        style="background-image: url('./img/mainSlide/pc_img_1614676376.jpg');">
                                                </a>
                                                <div class="info_goods">
                                                    <div class="inner_info">
                                                        <span class="name"><a class="txt">내추로 최대 20% 할인</a></span>
                                                        <span class="desc"><a class="txt">영국에서 온 건강한, 반려동물 주식</a></span>
                                                    </div>
                                                </div>
                                            </li>

                                            <li data-index="3">
                                                <a class="thumb_goods">
                                                    <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                        style="background-image: url('./img/mainSlide/pc_img_1614771399.jpg');">
                                                </a>
                                                <div class="info_goods">
                                                    <div class="inner_info">
                                                        <span class="name"><a class="txt">구욘 최대 20% 할인</a></span>
                                                        <span class="desc"><a class="txt">스페인 전통의 비스킷 전문 기업</a></span>
                                                    </div>
                                                </div>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit"><a class="name"><span class="ico">알뜰 상품</span></a></h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper">
                                            <div class="bx-viewport swiper-Container"
                                                style="width: 100%; overflow: hidden; position: relative; height: 506px;">
                                                <ul data-title="알뜰 상품" data-section="sale_goods" class="list swiper-wrapper "
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    
                                                    <li data-index="1" class="swiper-slide" data-name="sale_goods"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <span class="global_sticker">
                                                                    <span class="inner_sticker">
                                                                        <span class="bg_sticker" style="background-color: rgb(189, 118, 255); opacity: 0.9;"></span>
                                                                        <span class="txt_sticker">
                                                                            <span>
                                                                                <span class="emph_sticker">증정품</span>
                                                                            </span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1614246969638l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[코스알엑스] 원스텝 그린 히어로 카밍
                                                                        패드</a></span>
                                                                <span class="price"><span class="dc">32%</span>11,900원</span>
                                                                <span class="cost">17,500원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->

                                                    <li data-index="2" class="swiper-slide" data-name="sale_goods"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <span class="global_sticker">
                                                                    <span class="inner_sticker">
                                                                        <span class="bg_sticker" style="background-color: rgb(189, 118, 255); opacity: 0.9;"></span>
                                                                        <span class="txt_sticker">
                                                                            <span>
                                                                                <span class="emph_sticker">증정품</span>
                                                                            </span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1614755916420l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[코스알엑스] 풀핏 프로폴리스 라이트
                                                                        앰플</a></span>
                                                                <span class="price"><span class="dc">35%</span>15,275원</span>
                                                                <span class="cost">23,500원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->


                                                    <li data-index="3" class="swiper-slide" data-name="sale_goods"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1614157497166l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[미쟝센] 퍼펙트세럼 스타일링 샴푸
                                                                        680ml</a></span>
                                                                <span class="price"><span class="dc">10%</span>4,410원</span>
                                                                <span class="cost">4,900원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->

                                                    <li data-index="4" class="swiper-slide" data-name="sale_goods"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1614308475393l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[크라운] 화이트화임
                                                                        142g</a></span>
                                                                <span class="price"><span class="dc">20%</span>2,640원</span>
                                                                <span class="cost">3,300원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->

                                                    <li data-index="5" class="swiper-slide" data-name="sale_goods"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1614664479762l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[RMM] 버터 크로와상
                                                                        생지</a></span>
                                                                <span class="price"><span class="dc">10%</span>7,650원</span>
                                                                <span class="cost">8,500원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->

                                                    <li data-index="6" class="swiper-slide" data-name="sale_goods"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/161423424073l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[해태] 홈런볼 46g</a></span>
                                                                <span class="price"><span class="dc">30%</span>1,050원</span>
                                                                <span class="cost">1,500원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->

                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-next" href=""><img src="./img/mainSlide/btn_next_default.webp"></a>
                                                    <a class="bx-prev"><img src="./img/mainSlide/btn_prev_default.webp"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            var swiper = new Swiper('.swiper-Container', {

                                                slidesPerView: 4, // 동시에 보여줄 슬라이드 갯수
                                                spaceBetween: 30, // 슬라이드간 간격
                                                slidesPerGroup: 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

                                                // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                                                // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
                                                loopFillGroupWithBlank: true,

                                                loop: true, // 무한 반복

                                                navigation: { // 네비게이션
                                                    nextEl: '.bx-next', // 다음 버튼 클래스명
                                                    prevEl: '.bx-prev' // 이번 버튼 클래스명
                                                }
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>

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
                                                <li data-start="33" data-end="75"><a data-no="907" href="#none"
                                                        class="menu"> 채소 </a></li>
                                                <li data-start="100" data-end="196"><a data-no="908" href="#none"
                                                        class="menu"> 과일·견과·쌀 </a></li>
                                                <li data-start="221" data-end="343"><a data-no="909" href="#none"
                                                        class="menu"> 수산·해산·건어물 </a></li>
                                                <li data-start="369" data-end="444"><a data-no="910" href="#none"
                                                        class="menu"> 정육·계란 </a></li>
                                                <li data-start="468" data-end="590"><a data-no="911" href="#none"
                                                        class="menu"> 국·반찬·메인요리 </a></li>
                                                <li data-start="616" data-end="717"><a data-no="912" href="#none"
                                                        class="menu"> 샐러드·간편식 </a></li>
                                                <li data-start="742" data-end="838"><a data-no="913" href="#none"
                                                        class="menu"> 면·양념·오일 </a></li>
                                                <li data-start="863" data-end="1006"><a data-no="914" href="#none"
                                                        class="menu cut"> 생수·음료·우유·커피 </a></li>
                                                <li data-start="1031" data-end="1127"><a data-no="249" href="#none"
                                                        class="menu"> 간식·과자·떡 </a></li>
                                                <li data-start="1151" data-end="1286"><a data-no="915" href="#none"
                                                        class="menu"> 베이커리·치즈·델리 </a></li>
                                                <li data-start="1311" data-end="1379"><a data-no="032" href="#none"
                                                        class="menu"> 건강식품 </a></li>
                                                <li data-start="1404" data-end="1505"><a data-no="918" href="#none"
                                                        class="menu"> 생활용품·리빙 </a></li>
                                                <li data-start="1530" data-end="1631"><a data-no="012" href="#none"
                                                        class="menu on"> 뷰티·바디케어 </a></li>
                                                <li data-start="1656" data-end="1724"><a data-no="916" href="#none"
                                                        class="menu"> 주방용품 </a></li>
                                                <li data-start="1748" data-end="1816"><a data-no="085" href="#none"
                                                        class="menu"> 가전제품 </a></li>
                                                <li data-start="1842" data-end="1930"><a data-no="919" href="#none"
                                                        class="menu"> 베이비·키즈 </a></li>
                                                <li data-start="1954" data-end="2022"><a data-no="991" href="#none"
                                                        class="menu"> 반려동물 </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper">
                                            <div class="bx-viewport "
                                                style="width: 100%; overflow: hidden; position: relative; height: 462px;">
                                                <ul data-title="MD의 추천" data-section="md_choice" class="list"
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li data-index="1" class="" data-name="md_choice"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1610515968860l0.jpg');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[세라폼] 우드핸들 발각질
                                                                        제거기</a></span>
                                                                <span class="price">11,900원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->
                                                    <li data-index="2" class="" data-name="md_choice"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url('./img/mainSlide/1611646532347l0.webp');">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[닥터포헤어] 폴리젠 오리지널
                                                                        샴푸</a></span>
                                                                <span class="price"><span class="dc">50%</span>18,500원
                                                                </span>
                                                                <span class="cost">37,000원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->

                                                    <li data-index="3" class="" data-name="md_choice"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url(./img/mainSlide/1612249833315l0.webp);">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[야다] 선인장 바디 워시</a></span>
                                                                <span class="price"><span class="dc">30%</span>20,300원
                                                                </span>
                                                                <span class="cost">29,000원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->
                                                    <li data-index="4" class="" data-name="md_choice"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url(./img/mainSlide/1614661781845l0.jpg);">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[센텔리안24] 마데카크림 파워부스팅 포뮬러
                                                                        50ml+15ml 기획</a></span>
                                                                <span class="price"><span class="dc">45%</span>15,900원
                                                                </span>
                                                                <span class="cost">29,000원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->
                                                    <li data-index="5" class="" data-name="md_choice"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url(./img/mainSlide/1605499754647l0.jpg);">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[토리든] 다이브인 저분자 히알루론산
                                                                        세럼</a></span>
                                                                <span class="price"><span class="dc">30%</span>15,400원</span>
                                                                <span class="cost">22,000원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->
                                                    <li data-index="6" class="" data-name="md_choice"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <!-- <div class="swiper-slide"> -->
                                                            <a class="thumb_goods">
                                                                <img src="./img/mainSlide/blank.png" alt="상품이미지" class="thumb"
                                                                    style="background-image: url(./img/mainSlide/1605772528200l0.webp);">
                                                            </a>
                                                            <div class="info_goods">
                                                                <span class="name"><a class="txt">[제스젭] 베어 크림</a></span>
                                                                <span class="price"><span class="dc">10%</span>34,200원</span>
                                                                <span class="cost">38,000원</span>
                                                            </div>
                                                            </li>
                                                        <!-- </div> -->
                                                    </ul>
                                                </div>
                                                <div class="bx-controls bx-has-controls-direction">
                                                    <div class="bx-controls-direction">
                                                        <a class="bx-next" href=""><img src="./img/mainSlide/btn_next_default.webp"></a>
                                                        <a class="bx-prev"><img src="./img/mainSlide/btn_prev_default.webp"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- <script>
                                                var swiper = new Swiper('.swiper-Container', {
    
                                                    slidesPerView: 4, // 동시에 보여줄 슬라이드 갯수
                                                    spaceBetween: 30, // 슬라이드간 간격
                                                    slidesPerGroup: 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    
                                                    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
                                                    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
                                                    loopFillGroupWithBlank: true,
    
                                                    loop: true, // 무한 반복
    
                                                    navigation: { // 네비게이션
                                                        nextEl: '.bx-next', // 다음 버튼 클래스명
                                                        prevEl: '.bx-prev' // 이번 버튼 클래스명
                                                    }
                                                });
                                            </script> -->
                                        </div>
                                    </div>
                                    <div class="link_cate">
                                        <a class="link">
                                            <span class="ico">뷰티·바디케어 전체보기</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="bnr_main">
                                <a class="link"
                                    style="background-image: url(&quot;null&quot;); background-color: rgb(249, 234, 234);">
                                    <span class="inner_link">
                                        <strong class="tit" style="color: rgb(106, 38, 38);">장바구니 자랑하면 5천원의 행운이
                                            매일!</strong>
                                        <span class="txt" style="color: rgb(106, 38, 38);">매일 20분께 드리는 적립금 혜택!</span>
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit">
                                            <a class="name">
                                                <span class="ico">오늘의 신상품</span>
                                                <span class="tit_desc">매일 정오, 컬리의 새로운 상품을 만나보세요</span>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                            <div class="bx-viewport"
                                                style="width: 100%; overflow: hidden; position: relative; height: 507px;">
                                                <ul data-title="오늘의 신상품" data-section="today_new" class="list"
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li data-index="1" class="" data-name="today_new"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614841613919l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[밀크바오밥] 센서티브 샴푸 &amp;
                                                                    트리트먼트 다마스크로즈</a></span>
                                                            <span class="price"><span
                                                                    class="dc">15%</span>11,815원</span>
                                                            <span class="cost">13,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="2" class="" data-name="today_new"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <span class="global_sticker">
                                                                <span class="inner_sticker">
                                                                    <span class="bg_sticker"
                                                                        style="background-color: rgb(189, 118, 255); opacity: 0.9;"></span>
                                                                    <span class="txt_sticker">
                                                                        <span><span
                                                                                class="emph_sticker">증정품</span></span>
                                                                    </span>
                                                                </span>
                                                            </span>
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614841253715l0.webp);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[김정문알로에] 큐어 알로에 하이드로 젤리 크림
                                                                    100ml</a></span>
                                                            <span class="price"><span
                                                                    class="dc">40%</span>20,400원</span>
                                                            <span class="cost">34,000원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="3" class="cut" data-name="today_new"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614751289703l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[미쟝센] 퍼펙트 스타일링 세럼
                                                                    80ml</a></span>
                                                            <span class="price"><span class="dc">15%</span>5,525원</span>
                                                            <span class="cost">6,500원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="4" class="" data-name="today_new"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614841274705l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[밀크바오밥] 센서티브 샴푸 &amp;
                                                                    트리트먼트 화이트솝</a></span>
                                                            <span class="price"><span
                                                                    class="dc">15%</span>11,815원</span>
                                                            <span class="cost">13,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="5" class="" data-name="today_new"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1585704958459l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">수로미 감귤 800g</a></span>
                                                            <span class="price"><span class="dc">25%</span>7,425원</span>
                                                            <span class="cost">9,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="6" class="cut" data-name="today_new"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614840730547l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[깨끗한나라] 3겹 순수프리미엄 30m
                                                                    30롤</a></span>
                                                            <span class="price">15,400원</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction"><a class="bx-prev disabled"
                                                        href="">Prev</a><a class="bx-next" href="">Next</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2 bg" style="background-color: rgb(247, 247, 247);">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit">
                                            <a class="name"><span class="ico">지금 가장 핫한 상품</span></a>
                                        </h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                            <div class="bx-viewport"
                                                style="width: 100%; overflow: hidden; position: relative; height: 507px;">
                                                <ul data-title="지금 가장 핫한 상품" data-section="theme_goods_9" class="list"
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li data-index="1" class="" data-name="theme_goods_9"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1589257292941l0.webp);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[아우어 인절미] 진짜 티라미슈
                                                                    인절미</a></span>
                                                            <span class="price"><span class="dc">5%</span>14,155원</span>
                                                            <span class="cost">14,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="2" class="" data-name="theme_goods_9"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <span class="global_sticker">
                                                                <span class="inner_sticker">
                                                                    <span class="bg_sticker"
                                                                        style="background-color: rgb(189, 118, 255); opacity: 0.9;"></span>
                                                                    <span class="txt_sticker">
                                                                        <span>
                                                                            <span class="emph_sticker">닭가슴살쿠폰</span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                            </span>
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1530769556979l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Better me] 냉동 닭가슴살
                                                                    4종</a></span>
                                                            <span class="price">1,700원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="3" class="cut" data-name="theme_goods_9"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1596086818826l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[바른정찬] 바로 비벼먹는 나물
                                                                    4종</a></span>
                                                            <span class="price"><span class="dc">10%</span>2,520원</span>
                                                            <span class="cost">2,800원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="4" class="" data-name="theme_goods_9"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1610338712850l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[청오]유기농 발아 참깨로 만든 발아
                                                                    참기름2종</a></span>
                                                            <span class="price"><span class="dc">10%</span>8,010원</span>
                                                            <span class="cost">8,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="5" class="" data-name="theme_goods_9"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <span class="global_sticker">
                                                                <span class="inner_sticker">
                                                                    <span class="bg_sticker"
                                                                        style="background-color: rgb(189, 118, 255); opacity: 0.9;"></span>
                                                                    <span class="txt_sticker">
                                                                        <span>
                                                                            <span class="emph_sticker">도시락쿠폰</span>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                            </span>
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614734137579l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[마이비밀] 다이어트 도시락
                                                                    7종</a></span>
                                                            <span class="price">4,200원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="6" class="cut" data-name="theme_goods_9"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1560142449136l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[아임웰] 그릴드 단호박</a></span>
                                                            <span class="price"><span class="dc">10%</span>1,575원</span>
                                                            <span class="cost">1,750원</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev disabled" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit">
                                            <a class="name">
                                                <span class="ico">마감세일</span>
                                                <span class="tit_desc">마감세일</span>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                            <div class="bx-viewport"
                                                style="width: 100%; overflow: hidden; position: relative; height: 507px;">
                                                <ul data-title="마감세일" data-section="deadline_sales" class="list"
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li data-index="1" class=""
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1574407950705l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Clean Eating] 친환경 샐러드
                                                                    2종</a></span>
                                                            <span class="price"><span class="dc">35%</span>2,990원
                                                            </span>
                                                            <span class="cost">4,600원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="2" class=""
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1594797142715l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[누리웰] 동물복지 백색 유정 초란
                                                                    10구</a></span>
                                                            <span class="price"><span class="dc">35%</span>3,705원
                                                            </span>
                                                            <span class="cost">5,700원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="3" class="cut"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1585704958459l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">수로미 감귤 800g</a></span>
                                                            <span class="price"><span class="dc">25%</span>7,425원
                                                            </span>
                                                            <span class="cost">9,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="4" class=""
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614156521326l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[몽슈슈] 후르츠롤 2종</a></span>
                                                            <span class="price"><span class="dc">10%</span>22,500원
                                                            </span>
                                                            <span class="cost">25,000원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="5" class=""
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1613364190240l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[진가네반찬] 두부강된장</a></span>
                                                            <span class="price"><span class="dc">15%</span>4,420원
                                                            </span>
                                                            <span class="cost">5,200원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="6" class="cut"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614061318929l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[시즈널마켓] 뉴욕식 핫도그
                                                                    5종</a></span>
                                                            <span class="price"><span class="dc">30%</span>2,520원
                                                            </span>
                                                            <span class="cost">3,600원</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev disabled" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2 bg" style="background-color: rgb(247, 247, 247);">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit">
                                            <a class="name">
                                                <span class="ico">늘 기분 좋은 가격</span>
                                                <span class="tit_desc">가격부터 늘 기분 좋은 컬리 장바구니 필수템</span>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                            <div class="bx-viewport"
                                                style="width: 100%; overflow: hidden; position: relative; height: 507px;">
                                                <ul data-title="늘 기분 좋은 가격" data-section="theme_goods_11" class="list"
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li data-index="1" class="" data-name="theme_goods_11"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1610086506164l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[연세우유 x 마켓컬리]
                                                                    전용목장우유</a></span>
                                                            <span class="price">1,980원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="2" class="" data-name="theme_goods_11"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1600317575153l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">맛타리 버섯 200g</a></span>
                                                            <span class="price">1,000원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="3" class="cut" data-name="theme_goods_11"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1613703343712l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[KF365] 밤고구마
                                                                    800g/봉</a></span>
                                                            <span class="price">4,590원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="4" class="" data-name="theme_goods_11"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1602653472226l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[KF365] 볶음조림용 멸치
                                                                    500g</a></span>
                                                            <span class="price">15,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="5" class="" data-name="theme_goods_11"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1613703436357l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[KF365] 깐마늘
                                                                    200g</a></span>
                                                            <span class="price">2,000원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="6" class="cut" data-name="theme_goods_11"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1604391981496l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[KF365] 제주토막갈치
                                                                    3종(냉동)</a></span>
                                                            <span class="price">14,900원</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev disabled" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type2">
                                <div class="product_list">
                                    <div class="tit_goods">
                                        <h3 class="tit">
                                            <a class="name"><span class="ico">컬리가 만든 상품</span></a>
                                        </h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                            <div class="bx-viewport"
                                                style="width: 100%; overflow: hidden; position: relative; height: 507px;">
                                                <ul data-title="컬리가 만든 상품" data-section="theme_goods_12" class="list"
                                                    style="width: 815%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li data-index="1" class="" data-name="theme_goods_12"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1610532035693l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Kurly's] 시그니처 물티슈
                                                                    2종</a></span>
                                                            <span class="price"><span class="dc">7%</span>1,720원 </span>
                                                            <span class="cost">1,850원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="2" class="" data-name="theme_goods_12"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1610619267363l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Kurly's] 해양심층수
                                                                    2종(12병/20병)</a></span>
                                                            <span class="price">5,900원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="3" class="cut" data-name="theme_goods_12"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1614067420817l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Kurly's] 바삭하게 구운
                                                                    김밥김</a></span>
                                                            <span class="price"><span class="dc">10%</span>2,250원
                                                            </span>
                                                            <span class="cost">2,500원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="4" class="" data-name="theme_goods_12"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1604972609179l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Kurly's] 올데이 칫솔 스타터
                                                                    세트</a></span>
                                                            <span class="price"><span class="dc">15%</span>4,335원
                                                            </span>
                                                            <span class="cost">5,100원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="5" class="" data-name="theme_goods_12"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1610691817296l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Kurly's] 한돈 떡갈비
                                                                    (120g*2입)</a></span>
                                                            <span class="price"><span class="dc">10%</span>4,320원</span>
                                                            <span class="cost">4,800원</span>
                                                        </div>
                                                    </li>
                                                    <li data-index="6" class="cut" data-name="theme_goods_12"
                                                        style="float: left; list-style: none; position: relative; width: 249px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/1571824073516l0.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <span class="name"><a class="txt">[Kurly's] 시저샐러드</a></span>
                                                            <span class="price"><span class="dc">5%</span>6,555원 </span>
                                                            <span class="cost">6,900원</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev disabled" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="main_type3">
                                <div class="main_recipe">
                                    <div class="tit_goods">
                                        <h3 class="tit">
                                            <a class="name"><span class="ico">컬리의 레시피</span></a>
                                        </h3>
                                    </div>
                                    <div class="list_goods">
                                        <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                            <div class="bx-viewport"
                                                style="width: 100%; overflow: hidden; position: relative; height: 303px;">
                                                <ul data-title="컬리의 레시피" data-section="kurly_recipe" class="list"
                                                    style="width: 715%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                    <li
                                                        style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/main_v2_a269923987b05291.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <div class="inner_info"><span class="name"><a class="txt">메밀
                                                                        갈레트</a></span></div>
                                                        </div>
                                                    </li>
                                                    <li
                                                        style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/main_v2_6341580e2dae2d31.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <div class="inner_info"><span class="name"><a class="txt">플랫
                                                                        브레드 루꼴라 피자</a></span></div>
                                                        </div>
                                                    </li>
                                                    <li
                                                        style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/main_v2_70707728dc9e7eab.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <div class="inner_info"><span class="name"><a
                                                                        class="txt">시금치 페스토 파스타</a></span></div>
                                                        </div>
                                                    </li>
                                                    <li
                                                        style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/main_v2_7a5597e725b03e2d.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <div class="inner_info"><span class="name"><a
                                                                        class="txt">황태양념구이</a></span></div>
                                                        </div>
                                                    </li>
                                                    <li
                                                        style="float: left; list-style: none; position: relative; width: 338px; margin-right: 18px;">
                                                        <a class="thumb_goods">
                                                            <img src="./img/mainSlide/blank.png" alt="상품이미지"
                                                                class="thumb"
                                                                style="background-image: url(./img/mainSlide/main_v2_8c159e9c2e3bfb34.jpg);">
                                                        </a>
                                                        <div class="info_goods">
                                                            <div class="inner_info"><span class="name"><a
                                                                        class="txt">도다리 양념구이</a></span></div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- <div class="bx-controls bx-has-controls-direction">
                                                <div class="bx-controls-direction">
                                                    <a class="bx-prev disabled" href="">Prev</a>
                                                    <a class="bx-next" href="">Next</a>
                                                </div>
                                            </div> -->
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
                                <div class="list_goods">
                                    <div class="bx-wrapper" style="max-width: 1050px; margin: 0px auto;">
                                        <div class="bx-viewport"
                                            style="width: 100%; overflow: hidden; position: relative; height: 175px;">
                                            <ul data-title="인스타그램 고객 후기" data-section="instagram" class="list"
                                                style="width: 2715%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
                                                <li data-index="1" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/156375236_744821476468447_4087172593722258612_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="2" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/155456815_1398800410459351_6780887602414016090_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="3" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/150784848_1393446994349602_1401250154172282106_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="4" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/153049675_788852455083675_6031104269567675303_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="5" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/153163120_1536664699865697_712758804955381070_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="6" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/150342697_705553070117671_505551291555992922_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="7" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/148464448_1871380143012554_4787561268067230435_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="8" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/146717917_1133595607155564_6927575805678431077_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="9" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/145829497_429910031618977_2686700364585205332_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="10" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/145699202_173277657764348_7186325738012278752_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="11" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/145166627_690796704929009_3137692220607683881_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="12" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/138612535_1002060843651200_8038603372875075827_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="13" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/137535263_288737882673797_5133712456374454917_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="14" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/137225553_774188450120787_6930718593709013243_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="15" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/136366996_192615215904205_8306368317716846058_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="16" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/135353939_2979344559018503_6638205904339600026_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="17" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/135855569_1106024176515262_7522184421204961221_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="18" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/133740249_1081468305645551_7425631588608142276_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="19" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/133794738_431775864614286_3979166985680235825_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="20" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/132014374_874243333323044_334545707376363984_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="21" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/131992660_3453712921407975_3537333884386915309_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="22" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/131300330_426265792076878_8415232806622742688_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="23" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/131276883_834147770758904_1061547541056682891_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="24" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/130524946_388830355790279_2119235762455725959_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                                <li data-index="25" data-name="instagram"
                                                    style="float: left; list-style: none; position: relative; width: 175px;">
                                                    <a target="_blank" class="thumb_goods">
                                                        <img src="./img/insta/130527127_1510988522425735_7992170002968224868_n.jpg"
                                                            alt="상품이미지" class="thumb">
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="bx-controls bx-has-controls-direction">
                                            <div class="bx-controls-direction">
                                                <a class="bx-prev disabled" href="">Prev</a>
                                                <a class="bx-next" href="">Next</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bnr">
                                    <span class="txt">더 많은 고객 후기가 궁금하다면?</span>
                                    <a href="https://www.instagram.com/marketkurly_regram/"
                                        target="_blank">@marketkurly_regram</a>
                                </div>
                            </div>
                        </div>

                        <div>
                            <div class="bnr_main">
                                <a class="link" style="background-image: url(./img/mainSlide/pc_img_1568875999.webp);">
                                    <span class="inner_link">
                                        <img src="./img/mainSlide/pc_img_1568875999.webp"
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
                                <a href="./shop/mypage/mypage_qna_register.html" class="tit">1:1 문의</a>
                            </h3>
                            <dl class="list">
                                <dt>24시간 접수 가능</dt>
                                <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="company">
                        <ul class="list">
                            <li><a class="link" href="./shop/service/about_kurly.html">컬리소개</a></li>
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
                                        src="./img/sns/ico_instagram.webp" alt="마켓컬리 인스타그램 바로가기"></a></li>
                            <li><a href="https://www.facebook.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="./img/sns/ico_fb.webp" alt="마켓컬리 페이스북 바로가기"></a></li>
                            <li><a href="http://blog.naver.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="./img/sns/ico_blog.webp" alt="마켓컬리 네이버블로그 바로가기"></a></li>
                            <li><a href="https://m.post.naver.com/marketkurly" class="link_sns" target="_blank"><img
                                        src="./img/sns/ico_naverpost.webp" alt="마켓컬리 네이버포스트 바로가기"></a></li>
                            <li><a href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg" class="link_sns"
                                    target="_blank"><img src="./img/sns/ico_youtube.webp" alt="마켓컬리 유튜브 바로가기"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer_link page_aticle">
                    <div class="authentication">
                        <a href="#" class="mark">
                            <img src="./img/sns/logo_isms.webp" alt="isms 로고" class="logo">
                            <p class="txt">[인증범위] 마켓컬리 쇼핑몰 서비스 개발 · 운영<br>[유효기간] 2019.04.01 ~ 2022.03.31</p>
                        </a>
                        <a href="#" class="mark">
                            <img src="./img/sns/logo_eprivacyplus.webp" alt="eprivacy plus 로고" class="logo">
                            <p class="txt">개인정보보호 우수 웹사이트 ·<br>개인정보처리시스템 인증 (ePRIVACY PLUS)</p>
                        </a>
                        <a href="#" class="mark lguplus">
                            <img src="./img/sns/logo_payments.webp" alt="payments 로고" class="logo">
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