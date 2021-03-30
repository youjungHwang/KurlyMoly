<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 주문서 (결제페이지) N -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="../../script/script.js"></script>
    <script src="../../script/MJscript.js"></script>
    <script src="/common_js/kurlytracker/kurlytracker.js?ver=1.26.11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>

<body>
    <!--wrap 시작-->
    <div id="wrap" class>
        <div id="pos_scroll"></div>
        <!-- container 시작 -->
        <div id="container">
            <!-- header 시작 -->
            <header id="header">
                <div class="bnr_header" id="top-message">
                    <a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_210224"
                        id="eventLanding">지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img
                            src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png" class="bnr_arr">
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
                            <a href="../../shop/board/delivery.html" class="bnr_delivery"><img
                                    src="../../img/delivery_190819.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송"></a>
                        </li>
                    </ul>
                    <ul class="menuRight list_menu">
                        <li class="menu none_sub menu_join">
                            <a href="../../shop/member/join.html" class="link_menu">회원가입</a>
                        </li>
                        <li class="menu none_sub menu_login">
                            <a href="../../shop/member/login.html" class="link_menu">로그인</a>
                        </li>
                        <li class="menu lst">
                            <a href="../../shop/board/notice.html" class="link_menu cos">고객센터</a>
                            <ul class="sub">
                                <li>
                                    <a href="../../shop/board/notice.html">공지사항</a>
                                </li>
                                <li>
                                    <a href="../../shop/board/faq.html">자주하는 질문</a>
                                </li>
                                <li>
                                    <a href="../../shop/mypage/mypage_qna.html">1:1 문의</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div id="headerLogo">
                    <h1 class="logo"><a href="../../index.html" class="link_main"><img src="../../img/logo_x2.webp"
                                alt="마켓컬리 로고" style="display: block;"></a></h1>
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
                                        <a href="../../shop/goods/new_goods_list.html"><span class="txt">신상품</span></a>
                                    </li>
                                    <li class="menu3">
                                        <a href="../../shop/goods/best_goods_list.html"><span class="txt">베스트</span></a>
                                    </li>
                                    <li class="menu4">
                                        <a href="../../shop/goods/sale_goods_list.html"><span
                                                class="txt">알뜰쇼핑</span></a>
                                    </li>
                                    <li class="menu5">
                                        <a href="../../shop/goods/event_list.html"><span class="txt">금주혜택</span></a>
                                    </li>
                                </ul>
                                <div id="sideSearch" class="gnb_search">
                                    <form action="../../shop/goods/goods_search.html">
                                        <input type="text" name="sword" id="sword" class="inp_search">
                                        <input type="image" src="../../img/ico_search_x2.webp" class="btn_search">
                                        <div class="init">
                                            <button id="searchInit" class="btn_delete">검색어 삭제하기</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="location_set">
                                    <button type="button" class="btn_location"
                                        style="background: url('../../img/ico_delivery_setting_none.png') no-repeat 50% 50%;">배송지
                                        설정하기</button>
                                </div>
                                <div class="cart_count">
                                    <div class="inner_cartcount">
                                        <a href="../../shop/goods/goods_cart.html" class="btn_cart">
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

                            <div class="gnb_sub" style="display: none; width: 219px;">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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
                                            <ul class="sub_menu">
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

                <div class="tit_page">
                    <h2 class="tit">주문서</h2>
                </div>
            </header>
            <!--header 끝-->

            <!--main 시작-->
            <div id="main">
                <div id="content" style="padding-bottom: 120px;">
                    <div id="qnb" class="quick-navigation">
                        <div class="bnr_qnb" id="brn_Quick">
                            <a href="../board/delivery.html"><img class="thumb"
                                    src="../../img/sidebar/bnr_quick_20190403.webp"></a>
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
                            <a href="../../event_lovers.html" class="link_menu">등급별 혜택</a>
                            <a href="#" class="link_menu">레시피</a>
                        </div>
                    </div>

                    <div class="user_form">
                        <h2 class="tit_section fst">주문상품</h2>
                        <div id="itemList" class="page_aticle order_goodslist">
                            <div class="info_product"><a class="btn" href="#none"><span class="screen_out">펼침 /
                                        닫힘</span></a>
                                <div class="short_info">[남향푸드또띠아] 콤비네이션 피자 브리또외 <span class="num">3개</span>상품을 주문합니다.
                                </div>
                            </div>
                            <ul class="list_product">
                                <li>
                                    <div class="thumb"><img
                                            src="https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg"
                                            alt="상품이미지"></div>
                                    <div class="name">
                                        <div class="inner_name">[남향푸드또띠아] 콤비네이션 피자 브리또<strong class="package">[남향푸드또띠아]
                                                간편 간식 브리또
                                                10종</strong></div>
                                    </div>
                                    <div class="ea">2개</div>
                                    <div class="info_price"><span class="num"><span class="price">5,800원</span></span>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img
                                            src="https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg"
                                            alt="상품이미지"></div>
                                    <div class="name">
                                        <div class="inner_name">[남향푸드또띠아] 고구마 치즈 브리또<strong class="package">[남향푸드또띠아] 간편
                                                간식 브리또
                                                10종</strong></div>
                                    </div>
                                    <div class="ea">1개</div>
                                    <div class="info_price"><span class="num"><span class="price">2,900원</span></span>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img
                                            src="https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg"
                                            alt="상품이미지"></div>
                                    <div class="name">
                                        <div class="inner_name">[남향푸드또띠아] 핫 치킨 브리또<strong class="package">[남향푸드또띠아] 간편
                                                간식 브리또
                                                10종</strong></div>
                                    </div>
                                    <div class="ea">1개</div>
                                    <div class="info_price"><span class="num"><span class="price">2,900원</span></span>
                                    </div>
                                </li>
                                <li>
                                    <div class="thumb"><img
                                            src="https://img-cf.kurly.com/shop/data/goods/1613703533277i0.jpg"
                                            alt="상품이미지"></div>
                                    <div class="name">
                                        <div class="inner_name">[KF365] 햇 감자 1kg</div>
                                    </div>
                                    <div class="ea">1개</div>
                                    <div class="info_price"><span class="num"><span class="price">5,690원</span><span
                                                class="cost">5,990원</span></span></div>
                                </li>
                            </ul>
                        </div>
                        <form id="form" name="frmOrder" action="/checkout/settle.php" method="post"
                            onsubmit="return chkForm2(this)" class="order_view" novalidate="">

                            <input type="hidden" name="platform" value="desktop">
                            <input type="hidden" id="order_method" name="order_method" value="cart">
                            <input type="hidden" name="fallback_on_delivery_fail_method" value="2">
                            <input type="hidden" name="save_payment_method" value="true">
                            <input type="hidden" name="settlement_price" value="0">
                            <input type="hidden" name="settlekind_option" value="">
                            <div id="apply_coupon"></div>
                            <input type="hidden" name="apr_coupon_data" value="">

                            <h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
                            <div class="order_section data_orderer">
                                <table class="goodsinfo_table ">
                                    <tbody>
                                        <tr class="fst">
                                            <th>보내는 분</th>
                                            <td>김사과<input type="hidden" name="orderer_name" value="김사과"></td>
                                        </tr>
                                        <tr>
                                            <th>휴대폰</th>
                                            <td>01012345678<input type="hidden" name="orderer_phone"
                                                    value="01012345678"></td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td><input type="hidden" id="email" name="orderer_email"
                                                    value="apple@gmail.com" option="regEmail">apple@gmail.com
                                                <p class="txt_guide">
                                                    <span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
                                                    <span class="txt txt_case2">정보 변경은 <span class="txt_desc">마이컬리 &gt;
                                                            개인정보
                                                            수정</span> 메뉴에서 가능합니다.</span>
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <input type="hidden" name="zonecode" id="zonecode" value="06227">
                            <input type="hidden" name="zipcode[]" id="zipcode0" value="">
                            <input type="hidden" name="zipcode[]" id="zipcode1" value="">
                            <input type="hidden" name="address" id="address" value="서울 강남구 테헤란로 146">
                            <input type="hidden" name="road_address" id="road_address" value="서울 강남구 테헤란로 146">
                            <input type="hidden" name="address_sub" id="address_sub" value="1004호">

                            <input type="hidden" name="deliPoli" id="deliPoli" value="0">
                            <input type="hidden" name="deliveryType" id="deliveryType" value="direct">

                            <input type="hidden" id="means_inp" name="means" value="부재시 문앞">

                            <input type="hidden" id="addressBookNo" name="addressbook_no" value="7910522">
                            <h2 class="tit_section" id="divAddressWrapper">
                                배송 정보
                                <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
                            </h2>

                            <div class="address_info">
                                <a href="#none" id="btnLayerInfo" class="desc">배송지 변경 안내</a>
                                <div class="layer_info" id="layerInfo">
                                    <strong class="emph">장바구니, 홈</strong>에서
                                    <br>
                                    배송지를 변경할 수 있어요.
                                </div>
                            </div>

                            <div class="order_section order_address" id="dataDelivery">
                                <h3 href="#none" class="section_crux">
                                    배송지
                                </h3>
                                <div class="section_full">
                                    <span class="address" id="divDestination" style>
                                        <span class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span>
                                        <span class="addr" id="addrInfo">서울 강남구 테헤란로 146</span>
                                        <span class="tag" id="addrTags">
                                            <span class="badge star" id="addrBadge">샛별배송</span>
                                        </span>
                                    </span>
                                </div>
                            </div>

                            <div class="order_section order_reception" id="divReception" style>
                                <h3 class="section_crux">
                                    상세 정보
                                </h3>
                                <div class="section_full">

                                    <div class="receiving" id="receiverInfo">김사과, 010-1234-5678</div>
                                    <div class="way" id="wayPlace">
                                        <span class="place" id="areaInfo">문 앞</span>

                                        <span class="txt" id="meanType">공동현관 비밀번호</span>



                                        <div class="message" id="deliveryMessage" style>
                                            <span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
                                            <span class="txt" id="deliveryMessageDetail">배송 직후</span>
                                        </div>
                                    </div>
                                    <button type="button" id="btnUpdateSubAddress" data-address-no=""
                                        class="btn default">수정</button>

                                </div>
                            </div>
                            <div id="divFrozen" class="order_section order_pack">
                                <h3 class="section_crux">
                                    냉동상품 포장*
                                </h3>
                                <div class="section_full">
                                    <input type="hidden" name="isFrozenPack" value="">
                                    <label class="label_radio checked">
                                        <input type="radio" name="frozen_product_packing_option" value="0"
                                            checked="checked">
                                        <span class="ico"></span>
                                        종이박스 포장 (기본)
                                    </label>
                                    <label class="label_radio"><input type="radio" name="frozen_product_packing_option"
                                            value="1">
                                        <span class="ico"></span>
                                        스티로폼 박스 포장
                                    </label>
                                </div>
                            </div>

                            <div id="bnrOrder" class="bnr_order" style="display: block;">
                                <a href="#layerShow" class="btn_layershow"><img
                                        src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper.png"
                                        alt="All Paper Challenge"></a>
                                <p class="screen_out">사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기</p>
                            </div>

                            <div class="tax_absolute">
                                <div class="inner_sticky" id="sticky" style="top: 0px;">
                                    <h2 class="tit_section">결제금액</h2>
                                    <div id="orderitem_money_info">
                                        <dl class="amount fst">
                                            <dt class="tit">주문금액</dt>
                                            <dd class="price"><span id="productsTotalPrice">17,290</span> 원</dd>
                                        </dl>
                                        <dl class="amount sub">
                                            <dt class="tit">상품금액</dt>
                                            <dd class="price"><span id="paper_goodsprice">17,590</span> 원</dd>
                                        </dl>
                                        <dl class="amount sub">
                                            <dt class="tit">상품할인금액</dt>
                                            <dd class="price sales_area">
                                                <span class="pm_sign normal" style="display: inline;">-</span>
                                                <span id="special_discount_amount" class="normal">300</span>
                                                원
                                            </dd>
                                            <dd id="paper_sale" class="screen_out">300</dd>
                                        </dl>
                                        <dl class="amount">
                                            <dt class="tit">배송비</dt>
                                            <dd class="price delivery_area">
                                                <div id="paper_delivery_msg1" style="display: none;">
                                                    <span class="pm_sign" style="display: none;">+</span>
                                                    <span id="paper_delivery" class="">0</span>
                                                    <span id="paper_delivery2" style="display:none">0</span>
                                                    원
                                                </div>
                                                <div id="paper_delivery_msg2" style="display: block;">0 원</div>
                                                <div id="paper_delivery_msg_extra" class="small" style="display:none;">
                                                </div>
                                                <span id="free_delivery_coupon_msg" class="screen_out">미적용</span>
                                                <input type="hidden" name="free_delivery" value="0">
                                            </dd>
                                        </dl>
                                        <dl class="amount">
                                            <dt class="tit">쿠폰할인금액</dt>
                                            <dd class="price coupon_area">
                                                <span class="pm_sign" style="display: none;">-</span>
                                                <span id="apr_coupon_data">0</span>
                                                원
                                                <input type="hidden" name="coupon" size="12" value="0" readonly="">
                                            </dd>
                                        </dl>
                                        <dl class="amount">
                                            <dt class="tit">적립금사용</dt>
                                            <dd class="price">
                                                <span class="num pay_sum" id="paper_reserves">0 원</span>
                                                <input type="hidden" name="coupon_emoney" size="12" value="0"
                                                    readonly="">
                                            </dd>
                                        </dl>
                                        <dl class="amount lst">
                                            <dt class="tit">최종결제금액</dt>
                                            <dd class="price">
                                                <span id="paper_settlement">17,290</span>
                                                <span class="won">원</span>
                                            </dd>
                                        </dl>
                                        <p class="reserve" style="display: block;">
                                            <span class="ico">적립</span> 구매 시 <span class="emph"><span
                                                    id="expectAmount">865</span> 원
                                                (<span class="ratio">5</span>%) 적립</span>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="data_payment">
                                <div class="tbl_left">
                                    <h2 class="tit_section">쿠폰 / 적립금</h2>

                                    <div class="tbl_line">
                                        <table class="goodsinfo_table">
                                            <tbody>
                                                <tr>
                                                    <th>쿠폰 적용</th>
                                                    <td>
                                                        <div class="view_popselbox" style="width: 553px;">
                                                            <div id="popselboxView" class="select_box">
                                                                사용 가능 쿠폰 <span id="useCoupon">1</span>개 / 전체 <span
                                                                    id="haveCoupon">3</span>개
                                                            </div>
                                                            <div id="popSelbox" class="layer_coupon">
                                                                <ul id="addpopSelList" class="list">
                                                                    <li class="fst checked ">
                                                                        <div class="inner_item">
                                                                            <span class="txt_tit default">쿠폰 적용 안
                                                                                함</span>
                                                                        </div>
                                                                    </li>
                                                                    <li style="pointer-events: none;">
                                                                        <div class="inner_item">
                                                                            <div class="item_row">
                                                                                <div class="item_td left">
                                                                                    <span
                                                                                        class="txt_apr coupon_na">사용불가</span><span
                                                                                        class="txt_is_dc"
                                                                                        style="display: none;">원
                                                                                        할인</span>
                                                                                </div>
                                                                                <div class="item_td">
                                                                                    <span
                                                                                        class="txt_tit coupon_na">[농할갑시다]봄제철20%(최대1만원,~3/15
                                                                                        11시)</span>
                                                                                    <span class="txt_desc coupon_na">봄제철
                                                                                        (나물·딸기) 특가전 20%
                                                                                        쿠폰 (최대 1만원, ~3/15 오전
                                                                                        11시까지)</span>
                                                                                    <span
                                                                                        class="txt_expire coupon_na">유효기간
                                                                                        2021-03-15
                                                                                        까지</span>
                                                                                    <div id="apply_delivery_coupon"
                                                                                        class="is_delivery_coupon"
                                                                                        style="display: none;">0</div>
                                                                                    <div class="txt_apply_coupon"
                                                                                        style="display: none;">481842008
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li style="pointer-events: none;">
                                                                        <div class="inner_item">
                                                                            <div class="item_row">
                                                                                <div class="item_td left">
                                                                                    <span
                                                                                        class="txt_apr coupon_na">사용불가</span><span
                                                                                        class="txt_is_dc"
                                                                                        style="display: none;">원
                                                                                        할인</span>
                                                                                </div>
                                                                                <div class="item_td">
                                                                                    <span
                                                                                        class="txt_tit coupon_na">[대한민국수산대전]봄설레임전
                                                                                        1주차
                                                                                        20%(최대1만원)</span>
                                                                                    <span
                                                                                        class="txt_desc coupon_na">봄설레임전
                                                                                        1주차 20% 할인쿠폰
                                                                                        (최대 1만원, ~3/15 오전 11시까지)</span>
                                                                                    <span
                                                                                        class="txt_expire coupon_na">유효기간
                                                                                        2021-03-15
                                                                                        까지</span>
                                                                                    <div id="apply_delivery_coupon"
                                                                                        class="is_delivery_coupon"
                                                                                        style="display: none;">0</div>
                                                                                    <div class="txt_apply_coupon"
                                                                                        style="display: none;">486819129
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="inner_item">
                                                                            <div class="item_row">
                                                                                <div class="item_td left">
                                                                                    <span
                                                                                        class="txt_apr">1,138</span><span
                                                                                        class="txt_is_dc">원 할인</span>
                                                                                </div>
                                                                                <div class="item_td">
                                                                                    <span class="txt_tit">[농할갑시다]우리 한우
                                                                                        20%(최대
                                                                                        1만원,~3/18)</span>
                                                                                    <span class="txt_desc">농할쿠폰 스티커 부착
                                                                                        상품 20% 할인 (최대
                                                                                        1만원. ~3/18 오전 11시까지)</span>
                                                                                    <span class="txt_expire">유효기간
                                                                                        2021-03-18 까지</span>
                                                                                    <div id="apply_delivery_coupon"
                                                                                        class="is_delivery_coupon"
                                                                                        style="display: none;">0</div>
                                                                                    <div class="txt_apply_coupon"
                                                                                        style="display: none;">495843326
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                                <div class="coupon_list_default" style="display: none;">
                                                                    <li class="fst checked ">
                                                                        <div class="inner_item">
                                                                            <span class="txt_tit default">쿠폰 적용 안
                                                                                함</span>
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                                <div id="listItem" style="display:none">
                                                                    <div class="inner_item">
                                                                        <div class="item_row">
                                                                            <div class="item_td left">
                                                                                <span class="txt_apr"></span>
                                                                            </div>
                                                                            <div class="item_td">
                                                                                <span class="txt_tit"></span>
                                                                                <span class="txt_desc"></span>
                                                                                <span class="txt_expire"></span>
                                                                                <div id="apply_delivery_coupon"
                                                                                    class="is_delivery_coupon"
                                                                                    style="display: none;">
                                                                                </div>
                                                                                <div class="txt_apply_coupon"
                                                                                    style="display: none;">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <button id="popSelboxCancel" type="button"
                                                                    class="btn btn_cancel screen_out">취소</button>
                                                                <button id="popSelboxSelect" type="button"
                                                                    class="btn btn_conf screen_out">확인</button>
                                                                <button id="popSelboxClose" type="button"
                                                                    class="btn_close screen_out">닫기</button>
                                                            </div>
                                                        </div>
                                                        <div id="notavailableMsg" class="txt_notavailable"
                                                            style="display: none;"></div>
                                                        <p class="txt_inquiry">
                                                            <a href="#none" class="link" id="happyTalk">쿠폰사용문의(카카오톡)</a>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr class="emoney_use ">
                                                    <th class="no_emoney">
                                                        적립금 적용
                                                        <input type="hidden" value="0" name="checkEmoney">
                                                    </th>
                                                    <td>
                                                        <div id="ondealCheck">
                                                            <div class="emoney_reg">
                                                                <input type="text" name="using_point" id="emoney"
                                                                    class="number_only" value="" placeholder="0"
                                                                    pattern="[0-9]*" inputmode="decimal"
                                                                    onblur="chk_emoney(this);"
                                                                    onkeyup="debounceCalcuSettle();"
                                                                    onkeydown="if (event.keyCode == 13) {return false}">
                                                                <div class="check">
                                                                    <label class="emoney_chkbox">
                                                                        <input type="checkbox" name="">
                                                                        <span class="txt_checkbox">모두사용</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <p class="possess">
                                                                보유 적립금 : <strong class="emph">1,000</strong>원
                                                                <input type="hidden" name="emoney_max" value="1954">
                                                            </p>
                                                            <ul class="list_notice">
                                                                <li>· 보유 적립금 1천원 이상부터 사용가능</li>
                                                                <li>· 적립금 내역: 마이컬리 &gt; 적립금</li>
                                                            </ul>
                                                        </div>
                                                        <p id="msgNomoney"></p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="data_method">
                                <h2 class="tit_section" id="titFocusMethod">결제수단</h2>

                                <input type="hidden" name="escrow" value="N">
                                <table class="goodsinfo_table tbl_left">
                                    <tbody>
                                        <tr>
                                            <th>일반결제</th>
                                            <td class="noline" style="position:relative">
                                                <label class="label_radio checked" id="settlekindCard"
                                                    onclick="option_pay_standard('');" style="padding-bottom:4px;">
                                                    <input type="radio" name="settlekind" value="c"
                                                        onclick="input_escrow(this,'N');" checked="checked">
                                                    신용카드
                                                </label>
                                            </td>
                                        </tr>

                                        <tr class="card_detail">
                                            <th></th>
                                            <td>
                                                <div id="cardSelect">
                                                    <div>
                                                        <div class="card_select">
                                                            <div class="select_box"><strong class="tit">카드를
                                                                    선택해주세요</strong>
                                                                <select name="lguplus_card_code" class="list">
                                                                    <option disabled="disabled" value="">카드를 선택해주세요
                                                                    </option>
                                                                    <option value="61">현대 (무이자)</option>
                                                                    <option value="41">신한</option>
                                                                    <option value="31">비씨</option>
                                                                    <option value="11">KB국민</option>
                                                                    <option value="51">삼성</option>
                                                                    <option value="36">씨티</option>
                                                                    <option value="71">롯데</option>
                                                                    <option value="21">하나(외환)</option>
                                                                    <option value="91">NH채움</option>
                                                                    <option value="33">우리</option>
                                                                    <option value="34">수협</option>
                                                                    <option value="46">광주</option>
                                                                    <option value="35">전북</option>
                                                                    <option value="42">제주</option>
                                                                    <option value="62">신협체크</option>
                                                                    <option value="38">MG새마을체크</option>
                                                                    <option value="39">저축은행체크</option>
                                                                    <option value="37">우체국카드</option>
                                                                    <option value="30">KDB산업은행</option>
                                                                    <option value="15">카카오뱅크</option>
                                                                </select>
                                                            </div>
                                                            <div class="select_box"><strong class="tit off">할부기간을
                                                                    선택해주세요</strong>
                                                            </div>
                                                        </div>
                                                        <div class="card_event">
                                                            <div></div>
                                                            <div class="inner_card">
                                                                <div><strong class="emph">· 무이자할부 유의사항</strong>
                                                                    은행계열/체크/기프트/선불/법인/개인사업자 기업카드는 제외</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th> CHAI 결제</th>
                                            <td>
                                                <label class="label_radio" id="cardBenefitChai">
                                                    <input type="radio" name="settlekind" value="chai"
                                                        onclick="input_escrow(this,'N')">
                                                    <img src="https://res.kurly.com/pc/service/order/2001/logo_chi_x2.png"
                                                        height="18" alt="Chai 결제">
                                                    <img class="img_benefit"
                                                        src="https://res.kurly.com/pc/service/order/2101/bubble_chai_0301.png"
                                                        height="20">
                                                    <div class="info_benefit"><span class="info">·3/1 0시 ~ 3/31 24시, 차이
                                                            ID당 1회<br>·매
                                                            결제 1.5% 차이머니 캐시백</span></div>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th> 토스 결제</th>
                                            <td>
                                                <label class="label_radio" id="cardBenefitToss">
                                                    <input type="radio" name="settlekind" value="toss"
                                                        onclick="input_escrow(this,'N')">
                                                    <img src="https://res.kurly.com/pc/service/order/1912/toss-logo-signature.svg"
                                                        height="18" alt="토스 결제">
                                                    <img class="img_benefit"
                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII="
                                                        height="20">
                                                    <div class="info_benefit"></div>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>네이버페이 결제</th>
                                            <td class="noline">
                                                <label class="label_radio" id="cardBenefitNaverpay">
                                                    <input type="radio" name="settlekind" value="n"
                                                        onclick="input_escrow(this,'N');">
                                                    <img src="../../img/goodscart/ico_naverpay_v3.webp" height="20"
                                                        alt="네이버 페이 로고">
                                                    <img class="img_benefit"
                                                        src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII="
                                                        height="20">
                                                    <div class="info_benefit"></div>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>PAYCO 결제</th>
                                            <td>
                                                <label class="label_radio" id="cardBenefitPayco">
                                                    <input type="radio" name="settlekind" value="t"
                                                        onclick="input_escrow(this,'N');check_naverNcashUseAble();">

                                                    <img src="https://static-bill.nhnent.com/payco/checkout/img/v2/btn_checkout2.png"
                                                        alt="PAYCO 간편결제" height="18">
                                                    <img class="img_benefit"
                                                        src="https://res.kurly.com/pc/service/order/2101/bubble_payco_0303.png"
                                                        height="20">
                                                    <div class="info_benefit"><span class="info">·03/09 0시 ~ 04/30 24시,
                                                            결제 건당 최대
                                                            1,000원<br>·기본 2% + 추가 3% 페이코 포인트 적립</span></div>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>스마일페이 결제</th>
                                            <td>
                                                <label class="label_radio" id="cardBenefitSmilepay">
                                                    <input type="radio" name="settlekind" value="s"
                                                        onclick="input_escrow(this,'N')">
                                                    <img src="../../img/goodscart/ico_smilepay_v2.webp" alt="스마일페이"
                                                        height="18">
                                                    <img class="img_benefit"
                                                        src="../../img/goodscart/bubble_smilepay_0315.webp" height="20">
                                                    <div class="info_benefit"></div>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>휴대폰 결제</th>
                                            <td>
                                                <label class="label_radio">
                                                    <input type="radio" name="settlekind" value="h"
                                                        onclick="input_escrow(this,'N')">
                                                    휴대폰
                                                </label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="txt_notice" colspan="2">
                                                <ul>
                                                    <li>※ 페이코, 네이버페이, 토스, 차이 결제는 결제 시 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</li>
                                                    <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를
                                                        이용하실 수
                                                        있습니다.</li>
                                                    <li>※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수 있습니다. <a
                                                            href="/shop/board/view.php?id=notice&amp;no=207"
                                                            target="_blank">공지
                                                            보러가기</a></li>
                                                    <li id="coupon_typinfo" style="display:none">※ 무통장입금에서만 사용가능한 쿠폰을
                                                        선택하였습니다. 다른 결제
                                                        수단을 선택하시려면 쿠폰을 제거 하여 주십시오.</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" name="undeliver_way" value="2">

                                <div id="cash" style="display:none;">
                                    <h2 class="tit_section">현금영수증발급</h2>
                                    <table class="goodsinfo_table">
                                        <tbody>
                                            <tr>
                                                <th>현금영수증</th>
                                                <td>
                                                    <label class="label_radio">
                                                        <input type="radio" name="cashreceipt" value="Y"
                                                            onclick="cash_required()">
                                                        신청
                                                    </label>
                                                    <label class="label_radio checked">
                                                        <input type="radio" name="cashreceipt" value="N"
                                                            onclick="cash_required()" checked="">
                                                        신청안함
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>발행용도</th>
                                                <td>
                                                    <label class="label_radio checked">
                                                        <input type="radio" name="cashuseopt" value="0"
                                                            onclick="setUseopt()" checked="">
                                                        소득공제용
                                                    </label>
                                                    <label class="label_radio">
                                                        <input type="radio" name="cashuseopt" value="1"
                                                            onclick="setUseopt()">
                                                        지출증빙용
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span id="cert_0" style="display:block;">휴대폰번호</span>
                                                    <span id="cert_1" style="display:none;">사업자번호</span>
                                                </th>
                                                <td style="padding-top:14px;">
                                                    <input type="text" name="cashcertno" value="" option="regNum"
                                                        class="line" placeholder="- 생략">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div style="clear:both;"></div>
                            <h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
                            <div class="data_orderer">
                                <table class="goodsinfo_table">
                                    <tbody>
                                        <tr>
                                            <td class="reg_agree">
                                                <div class="bg_dim"></div>
                                                <div class="check type_form">
                                                    <label class="agree_check">
                                                        <input type="checkbox" name="ordAgree" value="y" required=""
                                                            fld_esssential="" label="결제 진행 필수 동의"
                                                            msgr="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다.">
                                                        <span class="ico"></span>
                                                        결제 진행 필수 동의
                                                    </label>
                                                    <ul class="list_agree">
                                                        <li>
                                                            <span class="subject">개인정보 수집 · 이용 및 위탁 동의 <span
                                                                    class="emph">(필수)</span></span>
                                                            <a href="#terms" class="link_terms">약관보기</a>
                                                        </li>
                                                        <li id="pgTerms" style="display: list-item;">
                                                            <span class="subject">결제대행 서비스 약관 동의 <span
                                                                    class="emph">(필수)</span></span>
                                                            <a href="#pgTerms" class="link_terms">약관보기</a>
                                                        </li>
                                                    </ul>
                                                    <div class="layer layer_agree">
                                                        <div class="choice_agree view_terms">
                                                            <div class="inner_layer">
                                                                <div class="in_layer" id="viewTerms"></div>
                                                                <button type="button" class="btn_ok">확인</button>
                                                                <button type="button" class="btn_close"><span
                                                                        class="screen_out">레이어
                                                                        닫기</span></button>
                                                            </div>
                                                        </div>
                                                        <div class="choice_agree view_pg">
                                                            <div class="inner_layer">
                                                                <div class="in_layer" id="viewPg"></div>
                                                                <button type="button" class="btn_ok">확인</button>
                                                                <button type="button" class="btn_close"><span
                                                                        class="screen_out">레이어
                                                                        닫기</span></button>
                                                            </div>
                                                        </div>

                                                        <div class="choice_agree view_layer">
                                                            <div class="inner_layer">
                                                                <div class="in_layer in_allpaper">
                                                                    <img src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper_big_v2.png"
                                                                        alt="샛별배송은 왜 종이 포장재를 사용할까요?">
                                                                    <p class="screen_out">
                                                                        샛별배송을 사용하는 것만으로도 지구를 위하는 일에 함께하실 수 있어요.
                                                                        신선함을 지키는 보냉력과 내구성은 그대로! 다른 어떤 소재보다도 재활용성이 우수하니까!
                                                                        폐기해도 빠르게 분해되니까!
                                                                    </p>
                                                                </div>
                                                                <button type="button" class="btn_ok">확인</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div id="paymentMethodResult">
                                <input type="hidden" name="payment_method" value="">
                            </div>
                            <input type="submit" value="결제하기" class="btn_payment">
                        </form>
                        <ul class="notice_order">
                            <li>직접 주문취소는 <span class="emph">‘입금확인’</span> 상태에서만 가능합니다.</li>
                            <li>미성년자가 결제 시 법정대리인이 거래를 취소할 수 있습니다.</li>
                            <li class="emph">상품 미 배송시, 결제수단으로 환불됩니다.</li>
                        </ul>
                        <div id="dynamic"></div>
                    </div>
                    <div class="bg_loading" id="bgLoading" style="display: none;">
                        <div class="loading_show"></div>
                    </div>
                </div>
            </div>
        </div>

        <!--DSR 시작-->
        <div id="layerDSR">
            <div class="bg_dim"></div>
            <div class="in_layer">
                <div class="inner_layer layer_star">
                    <strong class="dsr_result">샛별배송 지역입니다.</strong>
                    <div class="ani">
                        <img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_kurly.png"
                            src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="샛별배송 이미지">
                    </div>
                    <p class="dsr_desc">
                        <strong class="emph">오늘 밤 11시 전</strong>까지 주문시<br>
                        <strong class="emph">다음날 아침 7시</strong> 이전 도착합니다!
                    </p>
                    <p class="dsr_notice">샛별배송은 휴무 없이 매일 배송 합니다</p>
                </div>
                <div class="inner_layer layer_normal">
                    <strong class="dsr_result">택배배송 지역입니다.</strong>
                    <div class="ani">
                        <img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_car.png"
                            src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="택배배송 이미지">
                    </div>
                    <p class="dsr_desc">
                        <strong class="emph">밤 8시 전</strong>까지 주문시<br>
                        <strong class="emph">다음날</strong> 도착합니다!
                    </p>
                    <p class="dsr_notice">일요일은 배송 휴무로 토요일에는 주문 불가</p>
                </div>
                <div class="inner_layer layer_none">
                    <strong class="dsr_result">배송 불가 지역입니다.</strong>
                    <div class="ani">
                        <img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_none.png"
                            src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="배송불가 이미지">
                    </div>
                    <p class="dsr_desc">
                        <strong class="emph">도로명 주소</strong>로 검색하셨다면,<br>
                        <strong class="emph">지번 주소(구 주소)</strong>로 다시 시도해 주세요.
                    </p>
                    <p class="dsr_notice">배송지역을 확장하도록 노력하겠습니다!</p>
                </div>
                <div class="layer_btn1">
                    <button type="button" class="btn_close"
                        onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();">확인</button>
                </div>
                <button type="button" class="layer_close"
                    onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();"></button>
            </div>
        </div>
        <!--DSR끝-->

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
                                target="_blank"><img src="../../img/sns/ico_youtube.webp" alt="마켓컬리 유튜브 바로가기"></a></li>
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