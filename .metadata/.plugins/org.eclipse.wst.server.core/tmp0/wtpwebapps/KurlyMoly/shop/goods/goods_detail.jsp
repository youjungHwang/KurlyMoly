<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.product.ProductDAO"%>
<%@ page import="java.text.NumberFormat"%>

<%
	request.setCharacterEncoding("UTF-8");
	// String p_idx = request.getParameter("p_idx"); // goods_list.jsp에서 상품번호를 가져와 제품 정보 띄우기
	Integer p_idx = 1; // 전 페이지에서 idx에 대한 세션값을 받아와야 함
	String p_title = ""; // 타이틀
	String p_subtitle = ""; // 서브타이틀
	Integer p_price = 0; // 가격(정가)
	Integer p_discprice = 0; // 할인액
	double percent = 0.005; // 일반회원기준 할인가
	String p_deliveryType = ""; // 배송타입 : 샛별배송/일반배송
	String p_weight = ""; // 중량
	String p_origin = ""; // 원산지
	String p_mainImg = ""; // 메인이미지(파일명)

	// 리뷰관련
	Integer rv_idx = 0; // 리뷰번호
	Integer rv_productidx = 4; // 상품번호 (해당 번호를 조회 수 해당하는 리뷰만 보이게 한다)
	String rv_userid = ""; // 작성자 id
	Integer rv_stars = 0; // 별점
	String rv_title = ""; // 후기 제목
	String rv_content = ""; // 후기 내용
	Integer rv_helped = 0; // 도움이 돼요(1)/안돼요(0)
	String rv_regdate = ""; // 작성날짜
	
	// DB 연결
   	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "";
	String url = "jdbc:mysql://localhost:3306/kurlymoly";
	String uid = "root";
	String upw = "1234";
	
   	Connection conn2 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	String sql2 = "";
	String url2 = "jdbc:mysql://localhost:3306/kurlymoly";
	String uid2 = "root";
	String upw2 = "1234";

	try{
		Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
		conn = DriverManager.getConnection(url, uid, upw);
		if (conn != null) {
			sql = "SELECT * FROM tb_product WHERE p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				p_title = rs.getString("p_title");
				p_subtitle = rs.getString("p_subtitle");
				p_price = rs.getInt("p_price");
				p_discprice = rs.getInt("p_discprice");
				p_deliveryType = rs.getString("p_deliveryType");
				p_weight = rs.getString("p_weight");
				p_origin = rs.getString("p_origin");
				p_mainImg = rs.getString("p_mainImg");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정

	Integer totalPrice = p_price - p_discprice; // 총금액
	double p_point = (double)p_price * percent; // 정가(string) -> double
	Integer point = (int)p_point; // double형 -> int 형변환
%>

<!-- 제품 상세페이지 -->
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="../../common_js/kurlytracker/kurlytracker.js?ver=1.26.11"></script>
    <style>
        button {
            appearance: auto;
            -webkit-writing-mode: horizontal-tb !important;
            text-rendering: auto;
            color: -internal-light-dark(black, white);
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            text-shadow: none;
            display: inline-block;
            text-align: center;
            align-items: flex-start;
            cursor: default;
            background-color: -internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
            box-sizing: border-box;
            margin: 0em;
            font: 400 13.3333px Arial;
            padding: 1px 6px;
            border-width: 2px;
            border-style: outset;
            border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
            border-image: initial;
        }

        .xans-product-additional div.board .btnArea {
            text-align: right;
            width: 100%;
            display: table;
            border-top: 1px solid #522772;
        }

        .bhs_button {
            width: 150px;
            display: inline-block;
            line-height: 40px;
            text-align: center;
            background-color: #795b8f;
            border: 1px solid #5f0080;
            color: #fff;
            font-size: 15px;
            float: right;
            margin-left: 2px;
            font-size: 13px;
            margin: 20px 0;
        }
    </style>
</head>

<body>
    <div id="wrap" class="">
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
                    <h1 class="logo"><a href="../../index.jsp" class="link_main"><img src="../../img/logo_x2.webp"
                                alt="마켓컬리 로고" style="display: block;"></a></h1>
                </div>

                <div id="gnb">
                    <div id="gnbMenu" class="gnb_kurly gnbMenu">
                        <div class="inner_gnbkurly">
                            <div class="gnb_main">
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

                    <!-- 상품 대표이미지 및 장바구니 부분 시작 -->
                    <div class="section_view">
                        <div id="sectionView">
                            <div class="inner_view">
                            <form id="goodsData" name="goodsData" action="goodsAdd.jsp"> <!-- ★@@★★@@★ 나희 -->
                            	<input type="hidden" method="post" name="p_idx" value="<%=p_idx%>"> <!-- ★@@★★@@★ value 값 1을 세션에 저장하여 idx와 비교한 뒤 일치하면 제목, 가격 등을 가져온다 -->
                            </form>
                                <div class="thumb"
									<%if (p_mainImg != null && !p_mainImg.equals("")) {
										out.print("style='background-image: url(../../img/goods_detail/" + p_mainImg + ");'");
									}%>>
									<img src="../../img/goods_detail/Transparent.png" alt="상품 대표 이미지" class="bg">
								</div>
                                <p class="goods_name">
                                    <strong class="name"><%=p_title%></strong> <span class="short_desc"><%=p_subtitle%></span>
                                </p>
                                <p class="goods_price"><span class="position"><span class="dc"><span class="dc_price"><%=nf.format(p_price)%><span class="won">원</span></span></span></span>
                                    <span class="txt_benefit"><span class="ico_grade grade0">일반 0.5%</span> <span class="point">개당 <strong class="emph"><%=point%>원 적립</strong></span></span> <!-- ★@@★★@@★ 나희 -->
                                </p>
                                <div class="goods_info">
                                    <dl class="list fst">
                                        <dt class="tit">판매단위</dt>
                                        <dd class="desc">1봉지</dd>
                                    </dl>
                                    <dl class="list">
                                        <dt class="tit">중량/용량</dt>
                                        <dd class="desc"><%=p_weight%></dd>
                                    </dl>
                                    <dl class="list">
                                        <dt class="tit">배송구분</dt>
                                        <dd class="desc"><%=p_deliveryType%>/택배배송</dd>
                                    </dl>
                                    <dl class="list">
                                        <dt class="tit">원산지</dt>
                                        <dd class="desc"><%=p_origin%></dd>
                                    </dl>
                                    <dl class="list">
                                        <dt class="tit">포장타입</dt>
                                        <dd class="desc"> 냉장/종이포장 <strong class="emph">택배배송은 에코포장이 스티로폼으로 대체됩니다.</strong></dd>
                                    </dl>
                                    <dl class="list">
                                        <dt class="tit">참고사항</dt>
                                        <dd class="desc">해당 상품은 여러 협력업체에서 납품하고 있는 상품으로 수령 시, 상이한 협력업체의 상품을 받아보실 수 있습니다. 품질은 동일 기준으로 입고되고 있사오니 참고 부탁드립니다.</dd>
                                    </dl>
                                    <dl class="list">
                                        <dt class="tit">안내사항</dt>
                                        <dd class="desc">
                                            <span class="txt">식품 특성상 중량은 3% 내외의 차이가 발생할 수 있습니다.</span>
                                            <span class="txt">제철 적기에 따른 품질 균일화를 위해 수시로 산지를 변경하고 있습니다.</span>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        <div id="cartPut">
                            <div class="cart_option cartList cart_type2">
                                <div class="inner_option">
                                    <div class="in_option">
                                        <div class="list_goods">
                                            <div class="bar_open"><button type="button" class="btn_close"><span class="ico open">상품 선택</span></button></div>
                                            <ul class="list list_nopackage">
                                                <li class="on">
                                                    <!-- <span class="btn_position"><button type="button" class="btn_del"><span class="txt">삭제하기</span></button></span>
                                                    <span class="name">[새니테리엄] 위트빅스 멀티그레인</span> -->
                                                    <span class="tit_item">구매수량</span>
                                                    <div class="option">
                                                        <span class="count">
                                                            <button type="button" class="btn down on">수량내리기</button>
                                                            <input type="number" readonly="readonly" onfocus="this.blur()" class="inp">
                                                            <button type="button" class="btn up on">수량올리기</button>
                                                        </span>
                                                        <!-- <span class="price">
                                                            <span class="dc_price">9,980원</span>
                                                        </span> -->
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="total">
                                            <div class="price">
                                                <strong class="tit">총 상품금액 :</strong> <span class="sum"><span class="num"><%=nf.format(totalPrice)%></span><span class="won">원</span></span> <!-- ★@@★★@@★ 나희 -->
                                            </div>
											<p class="txt_point">
												<span class="ico">적립</span>
												<span class="point">구매 시<strong class="emph"> <%=point%>원 적립</strong></span> <!-- ★@@★★@@★ 나희. 0.5% 계산값 넣기 -->
											</p>
										</div>
                                    </div>
                                    <div class="group_btn off">
                                        <div in_option class="view_function">
                                            <button type="button" class="btn btn_save">늘 사는 것</button>
                                            <button type="button" class="btn btn_alarm">재입고 알림</button>
                                        </div>
                                        <span class="btn_type1"><button type="submit" form="goodsData" class="txt_type">장바구니 담기</button></span> <!-- ★@@★★@@★ 나희. onclick시 payment()실행 -->
                                    </div>
                                </div>
                            </div>

                            <!-- 스크롤 내렸을때 생기는 최하단 바로구매하기 div -->
                            <div class="cart_option cartList cart_type1" style="position: fixed; bottom: -262px;"> <!-- style="position: fixed; bottom: -262px;" << js 작성 시 이 내용을 추가해주면 됨 -->
                                <div class="inner_option">
                                    <div class="in_option">
                                        <div class="list_goods">
                                            <div class="bar_open">
                                                <button type="button" class="btn_close"><span class="ico open">상품 선택</span></button>
                                            </div>
                                            <ul class="list list_nopackage">
                                                <li class="on"><span class="btn_position"><button type="button" class="btn_del"><span class="txt">삭제하기</span></button></span> <span class="name">[새니테리엄] 위트빅스 멀티그레인</span>
													<div class="option">
														<span class="count"><button type="button" class="btn down on">수량내리기</button> <input type="number" readonly="readonly" onfocus="this.blur()" class="inp">
															<button type="button" class="btn up on">수량올리기</button></span> <span class="price"> <span class="dc_price">9,980원</span></span>
													</div>
												</li>
                                            </ul>
                                        </div>
                                        <div class="total">
                                            <div class="price">
                                                <strong class="tit">총 상품금액 :</strong>
                                                <span class="sum"><span class="num"><%=nf.format(totalPrice)%></span><span class="won">원</span></span> <!-- ★@@★★@@★ 나희 -->
                                            </div>
                                            <p class="txt_point">
                                                <span class="ico">적립</span>
                                                <span class="no_login"><span>로그인 후, 회원할인가와 적립혜택 제공</span></span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="group_btn">
                                        <div class="view_function">
                                            <button type="button" class="btn btn_save">늘 사는 것</button>
                                            <button type="button" class="btn btn_alarm">재입고 알림</button>
                                        </div>
                                        <span class="btn_type1"><button type="submit" form="goodsData" class="txt_type">장바구니 담기</button></span> <!-- ★@@★★@@★ 나희. onclick시 payment()실행 -->
                                    </div>
                                </div>
                            </div>

                            <div class="cart_option cart_type3 notify_option">
                                <div class="inner_option"><strong class="tit">재입고 알림 신청</strong>
                                    <p class="name_deal"><%=p_title%></p> <!-- ★@@★★@@★ 나희 -->
                                    <p class="notice"><span class="ico">·</span>상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.</p>
                                    <div class="group_btn layer_btn2">
                                        <span class="btn_type2"><button type="button" class="txt_type">취소</button></span>
                                        <span class="btn_type1"><button type="button" class="txt_type">신청하기</button></span>
                                    </div>
                                </div>
                            </div>
                            <div class="cart_option cart_result cart_type3">
                                <div class="inner_option">
                                    <button type="button" class="btn_close1">pc레이어닫기</button>
                                    <p class="success">상품 구매를 위한 <span class="bar"></span>배송지를 설정해주세요</p>
                                    <div class="group_btn layer_btn2">
                                        <span class="btn_type2"><button type="button" class="txt_type">취소</button></span>
                                        <span class="btn_type1"><button type="button" class="txt_type"><span class="ico_search"></span>주소 검색</button></span>
                                    </div>
                                </div>
                            </div>
                            <form name="frmBuyNow" method="post" action="./goods_cart.jsp">
	                            <input type="hidden" name="mode" value="addItem">
								<input type="hidden" name="goodsno" value="">
							</form> <!-- ★@@★★@@★ 나희 -->
                            <form name="frmWishlist" method="post"></form>
                        </div>
                    </div>
                    <!-- 상품 대표이미지 및 장바구니 부분 종료 -->

                    <!-- 상품상세 및 리뷰페이지 시작 -->
                    <div class="layout-wrapper goods-view-area">
                        <script src="/shop/data/skin/designgj/autoslider.js"></script>

                        <div class="goods-add-product">
                            <h3 class="goods-add-product-title">RELATED PRODUCT</h3>
                            <div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
                            <!-- 
                                <button class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로 슬라이드 이동</button>
                                <button class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로 슬라이드 이동</button> --> <!-- ★@@★★@@★ 나희 -->
                                <div class="goods-add-product-list-wrapper" style="height:320px">
                                    <ul class="goods-add-product-list __slide-mover">
<%
										try {
											Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
											conn = DriverManager.getConnection(url, uid, upw);
											if (conn != null) {
												sql = "SELECT * FROM tb_product ORDER BY p_idx=?";
												pstmt = conn.prepareStatement(sql);
												pstmt.setInt(1, p_idx);
												rs = pstmt.executeQuery();

												for (int i = 0; i <= 5; i++) {
													if (rs.next()) {
														p_idx = rs.getInt("p_idx");
														p_mainImg = rs.getString("p_mainImg");
														p_title = rs.getString("p_title");
														p_price = rs.getInt("p_price");
													}
%>
                                        <li class="goods-add-product-item __slide-item">
                                            <div class="goods-add-product-item-figure">
                                                <a href="#" target="_blank"><img src="<%if (p_mainImg != null && !p_mainImg.equals("")) {out.print("../../img/goods_detail/" + p_mainImg);}%>" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'"></a>
                                            </div>
                                            <div class="goods-add-product-item-content">
                                                <div class="goods-add-product-item-content-wrapper">
                                                    <p class="goods-add-product-item-name"><%=p_title%></p>
                                                    <p class="goods-add-product-item-price"><%=nf.format(p_price)%>원</p>
                                                </div>
                                            </div>
                                        </li>
<%
												}
											}
										} catch (Exception e) {
												e.printStackTrace();
										}
%>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
                            <ul class="goods-view-infomation-tab-group">
                                <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기<span class="count_review">(53840)</span></a></li>
                                <li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 498 )</span></a></li>
                            </ul>
                            <div class="goods-view-infomation-content __active" id="goods-description">

                                <div class="goods_wrap">
                                	<div>
                                		<img alt="제품 상세 설명이미지" src="../../img/goods_detail/detail1.PNG" style="width:100%;">
                                	</div>

                                	<!-- 
                                    <div class="goods_intro">
                                        <div class="pic">
                                            <img src="../../img/review_image/gv40000005913_1.jpg">
                                        </div>
                                        <div class="context last">
                                            <h3>
                                                <small>어떤 음식을 해도 맛있다</small>무농약 감자
                                            </h3>
                                            <p class="words">어떤 음식을 해도 맛있는 감자는 튀김, 전, 수프, 샐러드 등 수많은 방법으로 즐길 수 있지요. 냄비에
                                                통째로 넣어 푹 찌기만 해도 맛있고, 얇게 썰어서 버터와 꿀을 바르고 허브를 솔솔 뿌려 구우면 멋진 맥주 안주가 돼요. 우리의
                                                식탁에서 빼놓을 수 없는 중요한 식재료인 감자, 컬리의 꼼꼼한 손길로 골랐습니다. 건강한 땅에서 따뜻한 햇살을 듬뿍 받고 자란
                                                무농약 감자를 만나보세요. 80퍼센트의 수분, 18퍼센트의 전분, 비타민 C가 풍부한 무농약 감자는 달달하면서도 고소하고, 수분이
                                                많아 포실포실 부드럽습니다.</p>
                                        </div>
                                    </div>
                                    <div class="goods_desc">
                                        <div class="context">
                                            <div class="pic">
                                                <img src="../../img/review_image/gv40000005914_1.jpg">
                                            </div>
                                            <p class="words">
                                                <strong class="sub_tit">풍부한 영양분, 다양한 활용법</strong> 남아메리카 안데스 산맥이 원산지인 감자는
                                                잉카제국에서 주식으로 쓰던 채소입니다. 원래 야생종 감자는 아주 작은데, 이것을 몇천 년에 걸쳐 연구하며 알이 굵은 지금의 감자가
                                                됐다고도 하죠. 오랜 시간 동안 감자는 동서양의 대표적인 작물이자 영양 공급원으로 사랑받아 왔어요. 비타민 C가 풍부한 감자를
                                                프랑스인들은 '땅속의 사과'라고 불렀다고도 하는데요. 과일과 달리 감자의 비타민 C는 가열해도 거의 파괴되지 않는다고 해요.
                                            </p>
                                        </div>
                                        <div class="context last">
                                            <div class="pic">
                                                <img src="../../img/review_image/gv10000005916_1.jpg">
                                            </div>
                                            <p class="words">
                                                또한 감자에 함유된 전분 성분은 전이나 부침, 튀김 종류에 활용하면 더 바삭하고 고소한 요리를 완성할 수 있답니다. 플라스틱
                                                강판에 감자를 갈아 가라앉은 앙금과 걸러낸 감자 건더기를 섞어 소금으로 간하면 순식간에 쫄깃하면서도 고소한 감자전 반죽이
                                                완성되죠. 감자는 어떤 형태로 조리하는가에 따라서도 맛이 달라집니다. 얇게 채 썰어서 아삭한 식감을, 큼지막하게 잘라 부드럽고
                                                고소한 맛을 즐겨보세요.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="goods_tip">
                                        <h3><span>Kurly’s Tip</span></h3>
                                        <div class="tip_box">
                                            <div class="context last">
                                                <p class="words">
                                                    ・감자에 싹이 난다면 먹을 수 없다는 사실 아시죠? 햇빛을 받으면 감자는 싹을 틔우고 녹색으로 변하는데, 그때 독성 물질인
                                                    솔라닌이 생겨나요. 감자는 흙이 묻은 그대로, 바람이 잘 통하는 음지에 일주일 정도 보관하세요. <br>
                                                    ・감자와 함께 사과 한두 알을 보관하면 감자의 싹이 나는 것을 막을 수 있어요. 사과에서 나오는 ‘에틸렌’이라는 성분
                                                    덕분이죠.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    -->
                                </div>

                            </div>
                            <ul class="goods-view-infomation-tab-group">
                                <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor __active">상품이미지</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기<span class="count_review">(53840)</span></a></li>
                                <li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 498 )</span></a></li>
                            </ul>
                            <div class="goods-view-infomation-content" id="goods-image">
                                <div id="goods_pi">
                                    <p class="pic">
                                        <img src="../../img/goods_detail/detail1-2.jpg"> <!-- ★@@★★@@★ 나희 -->
                                    </p>
                                </div>
                            </div>
                            <ul class="goods-view-infomation-tab-group">
                                <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor __active">상세정보</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기<span class="count_review">(53840)</span></a></li>
                                <li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 498 )</span></a></li>
                            </ul>
                            <div class="goods-view-infomation-content" id="goods-infomation">
                                <table width="100%" border="0" cellpadding="0" cellspacing="1" class="extra-information">
                                    <tbody>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">상품명</th>
                                            <td>무농약 감자</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">유통기한</th>
                                            <td>농산물이므로 별도의 유통기한은 없으나 가급적 빨리 드시길 바랍니다.</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">포장단위</th>
                                            <td>600g</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">인증여부</th>
                                            <td>무농약 인증</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">생산자 /취급자</th>
                                            <td>뜰앤들 영농조합 / 해달친환경</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">관련법상 표기사항</th>
                                            <td>해당없음</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">원산지</th>
                                            <td>국내산</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">보관방법 및 취급방법</th>
                                            <td>냉장보관</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">상품유형</th>
                                            <td>농산물</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="goods-view-form-table-heading">소비자상담실 전화번호</th>
                                            <td>마켓컬리 고객행복센터 (1644-1107)</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="whykurly_area">
                                    <div class="row">
                                        <strong class="tit_whykurly">WHY KURLY</strong>
                                        <div id="why_kurly" class="txt_area">
                                            <div class="why-kurly">
                                                <div class="col">
                                                    <div class="icon"><img src="../../img/review_image/01_check.svg"></div>
                                                    <div class="info">
                                                        <div class="title">깐깐한 상품위원회</div>
                                                        <div class="desc">
                                                            <p>나와 내 가족이 먹고 쓸 상품을 고르는<br> 마음으로 매주 상품을 직접 먹어보고,<br> 경험해보고 성분, 맛, 안정성 등 다각도의<br> 기준을 통과한 상품만을 판매합니다.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="icon"><img src="../../img/review_image/02_only.svg"></div>
                                                    <div class="info">
                                                        <div class="title">차별화된 Kurly Only 상품</div>
                                                        <div class="desc">
                                                            <p>전국 각지와 해외의 훌륭한 생산자가<br> 믿고 선택하는 파트너, 마켓컬리.<br> 2천여 개가 넘는 컬리 단독 브랜드, 스펙의<br> Kurly Only 상품을 믿고 만나보세요.</p> <span class="etc">(온라인 기준 / 자사몰, 직구 제외)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="icon"><img src="../../img/review_image/03_cold.svg"></div>
                                                    <div class="info">
                                                        <div class="title">신선한 풀콜드체인 배송</div>
                                                        <div class="desc">
                                                            <p>온라인 업계 최초로 산지에서 문 앞까지<br> 상온, 냉장, 냉동 상품을 분리 포장 후<br> 최적의 온도를 유지하는 냉장 배송 시스템,<br> 풀콜드체인으로 상품을 신선하게 전해드립니다.</p>
                                                            <span class="etc">(샛별배송에 한함)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="icon"><img src="../../img/review_image/04_price.svg"></div>
                                                    <div class="info">
                                                        <div class="title">고객, 생산자를 위한 최선의 가격</div>
                                                        <div class="desc">
                                                            <p>매주 대형 마트와 주요 온라인 마트의 가격<br> 변동 상황을 확인해 신선식품은 품질을<br> 타협하지 않는 선에서 최선의 가격으로,<br> 가공식품은 언제나 합리적인 가격으로<br> 정기 조정합니다.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="icon"><img src="../../img/review_image/05_eco.svg"></div>
                                                    <div class="info">
                                                        <div class="title">환경을 생각하는 지속 가능한 유통</div>
                                                        <div class="desc">
                                                            <p>친환경 포장재부터 생산자가 상품에만<br> 집중할 수 있는 직매입 유통구조까지,<br> 지속 가능한 유통을 고민하며 컬리를 있게<br> 하는 모든 환경(생산자, 커뮤니티, 직원)이<br> 더 나아질 수 있도록 노력합니다.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="happy_center fst">
                                    <div class="happy">
                                        <h4 class="tit">고객행복센터</h4>
                                        <p class="sub">
                                            <span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span><span class="bar"></span>
                                            문제가 되는 부분을 사진으로 찍어<span class="bar"></span>
                                            아래 중 편하신 방법으로 접수해 주시면<span class="bar"></span>
                                            빠르게 도와드리겠습니다.
                                        </p>
                                    </div>
                                    <ul class="list">
                                        <li>
                                            <div class="tit">전화 문의 1644-1107</div>
                                            <div class="sub">오전 7시~오후 7시 (연중무휴)</div>
                                        </li>
                                        <li>
                                            <div class="tit">카카오톡 문의</div>
                                            <div class="sub">오전 7시~오후 7시 (연중무휴)</div>
                                            <div class="expend">
                                                카카오톡에서 ’마켓컬리’를 검색 후<br>
                                                대화창에 문의 및 불편사항을<br>
                                                남겨주세요.
                                            </div>
                                        </li>
                                        <li>
                                            <div class="tit">홈페이지 문의</div>
                                            <div class="sub">
                                                24시간 접수 가능<br>
                                                로그인 &gt; 마이컬리 &gt; 1:1 문의
                                            </div>
                                            <div class="expend">
                                                고객센터 운영 시간에 순차적으로 답변해드리겠습니다.
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="happy_center order on">
                                    <div class="happy unfold">
                                        <h4 class="tit">주문 취소 안내</h4>
                                        <ul class="sub">
                                            <li>
                                                <strong class="emph">[입금 확인] 단계</strong>
                                                마이컬리 &gt; 주문 내역 상세페이지에서 직접 취소하실 수 있습니다.
                                            </li>
                                            <li>
                                                <strong class="emph">[입금 확인] 이후 단계</strong>
                                                고객행복센터로 문의해주세요.
                                            </li>
                                            <li>
                                                <strong class="emph">결제 승인 취소 / 환불</strong>
                                                결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다.
                                            </li>
                                        </ul>
                                        <a data-child-id="orderCancel" href="#none" class="asked">
                                            <span class="txt" data-open="자세히 보기" data-close="닫기">닫기</span>
                                            <img src="../../img/review_image/pc_arrow_open@2x.webp" alt="아이콘" class="ico">
                                        </a>
                                    </div>

                                    <div class="happy_faq">
                                        <div id="orderCancel" class="questions hide"><strong class="subject">주문 취소 관련</strong>
                                            <ul class="list_questions">
                                                <li>[상품 준비 중] 이후 단계에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.</li>
                                                <li>비회원은 모바일 App / Web &gt; 마이컬리 &gt; 비회원 주문 조회 페이지에서 주문을 취소하실 수 있습니다.</li>
                                                <li>일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다. </li>
                                                <li>주문 상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매해 주세요. </li>
                                            </ul>
                                            <strong class="subject">결제 승인 취소 / 환불 관련</strong>
                                            <ul class="list_questions">
                                                <li>카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에 문의해주세요.</li>
                                                <li>결제 취소 시, 사용하신 적립금과 쿠폰도 모두 복원됩니다.</li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="happy_center lst on">
                                    <div class="happy unfold">
                                        <h4 class="tit">교환 및 환불 안내</h4>
                                        <p class="sub">고객님의 단순 변심으로 인한 반품은 어려울 수 있으니 양해 부탁드립니다.</p>
                                        <a data-child-id="refund" href="#none" class="asked">
                                            <span class="txt" data-open="자세히 보기" data-close="닫기">닫기</span>
                                            <img src="../../img/review_image/pc_arrow_open@2x.webp" alt="아이콘" class="ico">
                                        </a>
                                    </div>
                                    <div class="happy_faq">
                                        <span class="item">01. 받으신 상품에 문제가 있는 경우</span>
                                        <div id="refund1" class="questions hide">
                                            <p class="desc">상품이 표시·광고 내용과 다르거나 부패한 경우 등 상품에 문제가 있는 정도에 따라 <span class="bar_pc"></span>재배송, 일부 환불, 전액 환불해드립니다.</p><strong class="subject">신선 / 냉장 / 냉동 식품</strong>
                                            <p class="desc">상품을 받은 날부터 2일 이내에 상품 상태를 확인할 수 있는 사진을 첨부해 1:1 문의 게시판에 남겨주세요.</p>
                                            <strong class="subject">유통기한 30일 이상 식품<span class="bar"></span>(신선 / 냉장 / 냉동 제외) &amp; 기타 상품</strong>
                                            <p class="desc">상품을 받은 날부터 3개월 이내 또는 문제가 있다는 사실을 알았거나 알 수 있었던 날부터 30일 이내에
                                                <span class="bar_pc"></span>상품의 상태를 확인할 수 있는 사진을 첨부해 1:1 문의 게시판에 남겨주세요.</p>
                                            <p class="noti">※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가 부담합니다.</p>
                                        </div>
                                    </div>
                                    <div class="happy_faq">
                                        <span class="item">02. 단순 변심, 주문 착오의 경우</span>
                                        <div id="refund2" class="questions hide"><strong class="subject no_padding">신선 / 냉장 / 냉동 식품</strong>
                                            <p class="desc">재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다.
                                                <span class="bar_pc"></span>상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.
                                            </p><strong class="subject">유통기한 30일 이상 식품<span class="bar"></span>(신선 / 냉장 / 냉동 제외) &amp; 기타 상품</strong>
                                            <p class="desc">상품을 받은 날부터 7일 이내에 1:1 문의 게시판에 남겨주세요.</p>
                                            <p class="noti">※ 단순 변심으로 인한 교환 또는 환불의 경우 고객님께서 배송비 6,000원을 부담하셔야 합니다. <span class="bar_pc"></span>(주문 건 배송비를 결제하셨을 경우 3,000원)</p>
                                        </div>
                                    </div>
                                    <div class="happy_faq">
                                        <span class="item">03. 교환·반품이 불가한 경우</span>
                                        <div id="refund3" class="questions hide">
                                            <p class="desc">다음에 해당하는 교환·반품 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.</p>
                                            <ul class="list_questions">
                                                <li>소비자에게 책임 있는 사유로 상품이 멸실 또는 훼손된 경우 <span class="bar_pc"></span>(포장지 훼손으로 인해 재판매가 불가능한 상품의 경우, 단순 변심에 의한 반품이 어렵습니다.)</li>
                                                <li>일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다.</li>
                                                <li>소비자의 주문에 따라 개별적으로 생산되는 상품이 이미 제작 진행된 경우</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <ul class="goods-view-infomation-tab-group">
                                <li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor __active">고객후기 <span class="count_review">(53840)</span></a></li>

                                <!-- 고객후기 게시판 시작 -->
                                <li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span>( 498 )</span></a></li>
                            </ul>
                            <div class="goods-view-infomation-content" id="goods-review" data-load="0">
                                <div id="contents-wrapper" class="goods_board">
                                    <div class="xans-element- xans-product xans-product-additional detail_board  ">
                                        <div class="board">
                                            <span class="line"></span>
                                            <form name="frmList">
                                                <input type="hidden" name="sort" value="">
                                                <input type="hidden" name="page_num" value="">
                                                <input type="hidden" name="goodsno" value="26448">
                                                <div class="title_txt">
                                                    <h2>PRODUCT REVIEW</h2>
                                                    <div class="sort-wrap">
                                                        <ul class="list_type1 old">
                                                            <li><span class="ico"></span>
                                                                <p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
                                                            </li>
                                                            <li><span class="ico"></span>
                                                                <p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a href="#none"
                                                                        onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'" class="emph">1:1 문의</a>에 남겨주세요.</p>
                                                            </li>
                                                        </ul>
                                                        <div class="sort" style="bottom:-9px">
                                                            <select
                                                                onchange="this.form.sort.value=this.value;this.form.submit()">
                                                                <option value="1">최근등록순</option>
                                                                <option value="2">좋아요많은순</option>
                                                                <option value="3">조회많은순</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <table class="xans-board-listheader" width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <caption style="display:none">구매후기 제목</caption>
                                                    <colgroup>
                                                        <col style="width:70px;">
                                                        <col style="width:auto;">
                                                        <col style="width:77px;">
                                                        <col style="width:100px;">
                                                        <col style="width:100px;">
                                                        <col style="width:40px;">
                                                        <col style="width:80px;">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="col" class="input_txt">번호</th>
                                                            <th scope="col" class="input_txt">제목</th>
                                                            <th scope="col" class="input_txt" align="left">작성자</th>
                                                            <th scope="col" class="input_txt">별점<span class="screen_out"></span></th>
                                                            <th scope="col" class="input_txt">작성일</th>
                                                            <th scope="col" class="input_txt">도움</th>
                                                            <th scope="col" class="input_txt">조회</th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div class="tr_line on">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,'notice')">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="-1">
                                                                <input type="hidden" name="image" value="">
                                                                <input type="hidden" name="grade" value="0">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center">공지</td>
                                                                <td class="subject">
                                                                    <div>금주의 Best 후기 안내</div>
                                                                </td>
                                                                <td class="user_grade">Marketkurly </td>
                                                                <td class="user_grade grade_comm"></td>
                                                                <td class="time">2019-11-01</td>
                                                                <td>
                                                                    <span class="review-like-cnt" data-sno="6412655">0</span>
                                                                </td>
                                                                <td>
                                                                    <span class="review-hit-cnt" data-sno="6412655">285301</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="6412655" class="review_view" style="display: none;">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name"></strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                        </div>
                                                        <div class="goods-review-grp-btn">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tr_line">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,'notice')">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="0">
                                                                <input type="hidden" name="image" value="">
                                                                <input type="hidden" name="grade" value="0">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center">공지</td>
                                                                <td class="subject">
                                                                    <div>상품 후기 적립금 정책 안내</div>
                                                                </td>
                                                                <td class="user_grade">Marketkurly</td>
                                                                <td class="user_grade grade_comm"></td>
                                                                <td class="time">2019-11-01</td>
                                                                <td><span class="review-like-cnt" data-sno="6412546">0</span></td>
                                                                <td><span class="review-hit-cnt" data-sno="6412546">156941</span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="6412546" class="review_view" style="display: none;">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name"></strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                            [ 금주의 Best 후기 및 상품 후기 적립금 정책 변경 안내 ]
                                                            고객님 안녕하세요. 마켓컬리 입니다.
                                                            적립금 지급 정책을 안내드리니 컬리 이용에 참고 부탁드립니다.
                                                            ■ 적립금 지급 정책
                                                            1. 일반 후기 – 기존과 같이 작성 후 1~3일 내에 기본 적립금이 지급됩니다.
                                                            -글 후기 50원/건
                                                            -사진 후기 100원/건
                                                            *퍼플/더퍼플 러버스 고객님께는 더블 후기 적립금이 지급됩니다.
                                                            2. Best 후기 – Best 후기 적립금은 일주일 단위로 선정 및 지급됩니다.
                                                            1) 선정 건 수 – 일주일 최대 30건
                                                            2) 지급 일시 – 매주 수요일( 지급일이 공휴일의 경우 전 영업일)
                                                            3) 당첨 ID 및 그 주의 Best 후기는 후기 게시판 내 공지사항으로 등록됩니다.
                                                            3. 상품 후기 게시판(Product review) 적립금 지급 유의 사항
                                                            1) 실제 구매한 상품의 후기가 아닌 경우 Best 후기 당첨 시 제외 됩니다.
                                                            2) 구매 상품 외의 사진이 첨부된 경우 후기 적립금 정책으로 제공한 적립금이 취소 될 수 있습니다.
                                                        </div>
                                                        <div class="goods-review-grp-btn"></div>
                                                    </div>
                                                </div>
                                                <!-- 
                                                <div class="tr_line">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,false)">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="1">
                                                                <input type="hidden" name="image" value="">
                                                                <input type="hidden" name="grade" value="5">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center">53859</td>
                                                                <td class="subject">
                                                                    <div class="fst">상태좋아요 </div>
                                                                    <div class="snd">상태좋아요 </div>
                                                                </td>
                                                                <td class="user_grade">황*진</td>
                                                                <td class="user_grade grade_comm">
                                                                    <span class="ico_grade">★★★★★</span>
                                                                </td>
                                                                <td class="time">2021-03-11</td>
                                                                <td>
                                                                    <span class="review-like-cnt" data-sno="25449348">0</span>
                                                                </td>
                                                                <td>
                                                                    <span class="review-hit-cnt" data-sno="25449348">0</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="25449348" class="review_view">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name">[KF365] 햇 감자 1kg</strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                            햇감자라 좋아요 잘먹을께요
                                                        </div>
                                                        <div class="goods-review-grp-btn">
                                                            <button type="button" class="styled-button review-like-btn" data-sno="25449348" onclick="review_like('25449348',$(this));">도움이 돼요 <span class="num">0</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tr_line">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,false)">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="2">
                                                                <input type="hidden" name="image" value="">
                                                                <input type="hidden" name="grade" value="1">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center">53858</td>
                                                                <td class="subject">
                                                                    <div class="fst">강추 </div>
                                                                    <div class="snd">강추 </div>
                                                                </td>

                                                                <td class="user_grade">박*희</td>
                                                                <td class="user_grade grade_comm">
                                                                    <span class="ico_grade">★</span>
                                                                </td>
                                                                <td class="time">2021-03-11</td>
                                                                <td>
                                                                    <span class="review-like-cnt"
                                                                        data-sno="25448974">0</span>
                                                                </td>
                                                                <td>
                                                                    <span class="review-hit-cnt"
                                                                        data-sno="25448974">0</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="25448974" class="review_view">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name">[KF365] 햇 감자 1kg</strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                            감자 상태 좋고 너무 좋아요. 강추
                                                        </div>
                                                        <div class="goods-review-grp-btn">
                                                            <button type="button" class="styled-button review-like-btn" data-sno="25448974" onclick="review_like('25448974',$(this));">도움이 돼요 <span class="num">0</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tr_line">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,false)">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="3">
                                                                <input type="hidden" name="image" value="">
                                                                <input type="hidden" name="grade" value="0">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center">53857</td>
                                                                <td class="subject">
                                                                    <div class="fst">괜찮아요 </div>
                                                                    <div class="snd">괜찮아요 </div>
                                                                </td>
                                                                <td class="user_grade">김*정</td>
                                                                <td class="user_grade grade_comm">
                                                                    <span class="ico_grade">★</span>
                                                                </td>
                                                                <td class="time">2021-03-11</td>
                                                                <td>
                                                                    <span class="review-like-cnt"
                                                                        data-sno="25448880">0</span>
                                                                </td>
                                                                <td>
                                                                    <span class="review-hit-cnt"
                                                                        data-sno="25448880">0</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="25448880" class="review_view">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name">[KF365] 햇 감자 1kg</strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                            괜찮아요 <br>
                                                            카레에 잘 넣어 먹었어요
                                                        </div>
                                                        <div class="goods-review-grp-btn">
                                                            <button type="button" class="styled-button review-like-btn"
                                                                data-sno="25448880"
                                                                onclick="review_like('25448880',$(this));">도움이 돼요 <span
                                                                    class="num">0</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tr_line">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%"
                                                        cellpadding="0" cellspacing="0"
                                                        onclick="view_content(this,event,false)">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="4">
                                                                <input type="hidden" name="image" value="true">
                                                                <input type="hidden" name="grade" value="5">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center">53856</td>
                                                                <td class="subject">
                                                                    <div class="fst">신선식품은 <img src="../../img/review_image/ico_attach2.webp" alt="이미지가 첨부됨"></div>
                                                                    <div class="snd">신선식품은 <img src="../../img/review_image/ico_attach2.webp" alt="이미지가 첨부됨"></div>
                                                                </td>
                                                                <td class="user_grade">신*민</td>
                                                                <td class="user_grade grade_comm">
                                                                    <span class="ico_grade">★★★★★</span>
                                                                </td>
                                                                <td class="time">2021-03-11</td>
                                                                <td>
                                                                    <span class="review-like-cnt"
                                                                        data-sno="25448823">0</span>
                                                                </td>
                                                                <td>
                                                                    <span class="review-hit-cnt"
                                                                        data-sno="25448823">0</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="25448823" class="review_view">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name">[KF365] 햇 감자 1kg</strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                            컬리가 좋은거 같아요. 바나나 빼고 ㅠㅠ
                                                        </div>
                                                        <div class="goods-review-grp-btn">
                                                            <button type="button" class="styled-button review-like-btn"
                                                                data-sno="25448823"
                                                                onclick="review_like('25448823',$(this));">도움이 돼요 <span class="num">0</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                -->
<%										// ★@@★★@@★ 나희
									try {
										Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
										conn = DriverManager.getConnection(url, uid, upw);
										conn2 = DriverManager.getConnection(url, uid, upw);
										if (conn != null) {
											sql = "SELECT * FROM tb_review WHERE rv_productidx=?";
											pstmt = conn.prepareStatement(sql);
											pstmt.setInt(1, rv_productidx);
											rs = pstmt.executeQuery();
											
/* 											sql2 = "SELECT COUNT(*) FROM tb_review where rv_productidx=?";
											pstmt2 = conn2.prepareStatement(sql2);
											pstmt2.setInt(1, rv_productidx);
											rs2 = pstmt2.executeQuery();
											
											int idxCount = rs2.getInt("COUNT"); */

											for (int i = 0; i <= 6; i++) {
												if (rs.next()) {
													rv_idx = rs.getInt("rv_idx");
													rv_userid = rs.getString("rv_userid");
													rv_stars = rs.getInt("rv_stars");
													rv_title = rs.getString("rv_title");
													rv_content = rs.getString("rv_content");
													rv_helped = rs.getInt("rv_helped");
													rv_regdate = rs.getString("rv_regdate").substring(0, 10);
												}
%>
                                                <div class="tr_line on">
                                                    <table class="xans-board-listheaderd tbl_newtype1" width="100%" cellpadding="0" cellspacing="0" onclick="view_content(this,event,false)">
                                                        <caption style="display:none">구매후기 내용</caption>
                                                        <colgroup>
                                                            <col style="width:70px;">
                                                            <col style="width:auto;">
                                                            <col style="width:77px;">
                                                            <col style="width:100px;">
                                                            <col style="width:100px;">
                                                            <col style="width:40px;">
                                                            <col style="width:80px;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <input type="hidden" name="index" value="5">
                                                                <input type="hidden" name="image" value="">
                                                                <input type="hidden" name="grade" value="0">
                                                                <input type="hidden" name="best" value="false">
                                                                <input type="hidden" name="pNo" value="">

                                                                <td align="center"><%=rv_idx%></td>
                                                                <td class="subject">
                                                                    <div class="fst"><%=rv_title%></div>
                                                                    <div class="snd"><%=rv_title%></div>
                                                                </td>
                                                                <td class="user_grade"><%=rv_userid%></td>
                                                                <td class="user_grade grade_comm">
                                                                    <span class="ico_grade">
<%
																	if (rv_stars == 5) { out.print("★★★★★"); }
																	else if (rv_stars == 4.5) { out.print("★★★★a"); }
																	else if (rv_stars == 4) { out.print("★★★★"); }
																	else if (rv_stars == 3.5) { out.print("★★★a"); }
																	else if (rv_stars == 3) { out.print("★★★"); }
																	else if (rv_stars == 2.5) { out.print("★★a"); }
																	else if (rv_stars == 2) { out.print("★★"); }
																	else if (rv_stars == 1.5) { out.print("★a"); }
																	else { out.print("★"); }
%>
																	</span>
                                                                </td>
                                                                <td class="time"><%=rv_regdate%></td>
                                                                <td>
                                                                    <span class="review-like-cnt"
                                                                        data-sno="25665219"><%=rv_helped%></span>
                                                                </td>
                                                                <td>
                                                                    <span class="review-hit-cnt"
                                                                        data-sno="25665219">1</span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div data-sno="25665219" class="review_view"
                                                        style="display: block;">
                                                        <div class="inner_review">
                                                            <div class="name_purchase">
                                                                <strong class="name"><%=rv_title%></strong>
                                                                <p class="package"></p>
                                                            </div>
                                                            <div class="review_photo"></div>
                                                            <%=rv_content%>
                                                        </div>
                                                        <div class="goods-review-grp-btn">
                                                            <button type="button" class="styled-button review-like-btn" data-sno="25665219"
                                                                onclick="review_like('25665219',$(this));">도움이 돼요 <span class="num"><%=rv_helped%></span></button>
                                                        </div>
                                                    </div>
                                                </div>
<%
												}
											}
										} catch (Exception e) {
												e.printStackTrace();
										}
%>
                                            </form>
                                            <p class="btnArea after">
                                                <a href="#none" onclick="popup_register( 'add_review', '26448' )"><span
                                                        class="bhs_button"
                                                        style="line-height:30px; width:130px;">후기쓰기</span></a>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="board_pg_area">
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=1"
                                            class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로
                                            가기</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=1"
                                            class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
                                        <strong
                                            class="layout-pagination-button layout-pagination-number __active">1</strong>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=2"
                                            class="layout-pagination-button layout-pagination-number">2</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=3"
                                            class="layout-pagination-button layout-pagination-number">3</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=4"
                                            class="layout-pagination-button layout-pagination-number">4</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=5"
                                            class="layout-pagination-button layout-pagination-number">5</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=6"
                                            class="layout-pagination-button layout-pagination-number">6</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=7"
                                            class="layout-pagination-button layout-pagination-number">7</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=8"
                                            class="layout-pagination-button layout-pagination-number">8</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=9"
                                            class="layout-pagination-button layout-pagination-number">9</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=10"
                                            class="layout-pagination-button layout-pagination-number">10</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=2"
                                            class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
                                        <a href="/shop/goods/goods_review_list.php?goodsno=26448&amp;page=7695"
                                            class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
                                    </div>
                                </div>

                                <script
                                    type="text/javascript">window.NREUM || (NREUM = {}); NREUM.info = { "beacon": "bam.nr-data.net", "licenseKey": "NRJS-5dec146893a58b07e31", "applicationID": "602251426", "transactionName": "MlZUZhdUXkoCAkBQDQscY0AMGkNRDBEbXg0KV0UdAlpfXRA+RlwUDFZBbQlcQ01NEVxJ", "queueTime": 0, "applicationTime": 2328, "atts": "HhFXEF9OTUQ=", "errorBeacon": "bam.nr-data.net", "agent": "" }</script>

                            </div>
                            <!-- 고객후기 게시판 종료 -->
                            <ul class="goods-view-infomation-tab-group">
                                <li class="goods-view-infomation-tab"><a href="#goods-description"
                                        class="goods-view-infomation-tab-anchor ">상품설명</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-image"
                                        class="goods-view-infomation-tab-anchor">상품이미지</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-infomation"
                                        class="goods-view-infomation-tab-anchor">상세정보</a></li>
                                <li class="goods-view-infomation-tab"><a href="#goods-review"
                                        class="goods-view-infomation-tab-anchor">고객후기 <span
                                            class="count_review">(53840)</span></a></li>
                                <li class="goods-view-infomation-tab qna-show"><a href="#goods-qna"
                                        class="goods-view-infomation-tab-anchor __active">상품문의 <span>( 498 )</span></a>
                                </li>
                            </ul>
                            <div class="goods-view-infomation-content" id="goods-qna" data-load="0">

                                <head>
                                    <script type="text/javascript" src="/shop/lib/js/jquery-1.10.2.min.js"></script>
                                    <link rel="styleSheet" href="/shop/data/skin/designgj/normalize.css?ver=1.26.14">
                                    <link rel="styleSheet" href="/shop/data/skin/designgj/common.css?ver=1.26.14">
                                    <link rel="styleSheet" href="/shop/data/skin/designgj/section1.css?ver=1.26.14">
                                    <script id="qna_chk"></script>
                                    <script src="/shop/data/skin/designgj/common.js"></script>
                                    <script src="/shop/data/skin/designgj/polify.js"></script>
                                    <script type="text/javascript">
                                        function dynamicScript(url) {
                                            var script = document.createElement("script");
                                            script.type = "text/javascript";

                                            script.onload = script.onreadystatechange = function () {
                                                if (!script.readyState || script.readyState == "loaded" || script.readyState == "complete") {
                                                    script.onload = script.onreadystatechange = null;
                                                }
                                            }

                                            script.src = url;
                                            document.getElementsByTagName("head")[0].appendChild(script);
                                        }

                                        function popup_register(mode, goodsno, sno) {
                                            if (mode == 'del_qna') var win = window.open("goods_qna_del.php?mode=" + mode + "&sno=" + sno, "qna_register", "width=400,height=200");
                                            else parent.location.href = ("goods_qna_register.php?mode=" + mode + "&goodsno=" + goodsno + "&sno=" + sno);
                                        }

                                        var preContent;
                                        var IntervarId;

                                        function view_content(sno, type) {
                                            var obj = document.getElementById('content_id_' + sno);
                                            if (obj.style.display == "none") {
                                                dynamicScript("./goods_qna_chk.php?mode=view&sno=" + sno);
                                            } else {
                                                obj.style.display = "none";
                                            }
                                            preContent = obj;
                                            IntervarId = setTimeout('resizeFrame();', 100);

                                            // KM-1483 Amplitude 연동
                                            if (type === '0') {
                                                parent.KurlyTracker.setScreenName('product_inquiry_detail');
                                            }
                                        }

                                        function popup_pass(sno) {
                                            var win = window.open("goods_qna_pass.php?sno=" + sno, "qna_register", "width=400,height=200");
                                        }

                                        var count = 0
                                        var beforeWidth = 0
                                        var beforeHeight = 0
                                        // 상품문의는 iframe으로 되어 있어 내부 콘텐츠 size에 따라 iframe size 조절 필요.
                                        // 이미지가 늦게 로딩되는 경우가 있기 때문에 컨텐츠 size를 여러번 체크
                                        // 변경될 경우만 iframe resize함
                                        function resizeFrame() {
                                            var oBody = document.body;
                                            var tb_contents = document.getElementById("contents-wrapper");
                                            var i_height = tb_contents.offsetHeight;
                                            var i_width = tb_contents.offsetWidth;

                                            if (i_width === 0) {
                                                i_width = 100;
                                            }

                                            if (i_height === 0) {
                                                i_height = 100;
                                            }

                                            if (beforeHeight !== i_height) {
                                                parent.resizeFrameHeight('inqna', i_height);
                                                beforeHeight = i_height;
                                            }

                                            if (beforeWidth !== i_width) {
                                                parent.resizeFrameWidth('inqna', i_width);
                                                beforeWidth = i_width;
                                            }

                                            if (count > 3) {
                                                count = 0;
                                                return;
                                            }

                                            count++;
                                            setTimeout(resizeFrame, 500);
                                        }
                                    </script>
                                    <style>
                                        #contents {
                                            border-top: 1px solid #e3e3e3
                                        }

                                        .xans-product-additional img {
                                            max-width: 600px !important;
                                        }

                                        .subject {
                                            cursor: pointer
                                        }
                                    </style>

                                </head>
                                <div id="contents-wrapper">
                                    <div class="xans-element- xans-product xans-product-additional detail_board  ">
                                        <div class="board">
                                            <span class="line"></span>
                                            <div class="title_txt">
                                                <h2>PRODUCT Q&amp;A</h2>
                                                <ul class="list_type1 old">
                                                    <li><span class="ico"></span>
                                                        <p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이
                                                            담당 게시판으로 이동될 수 있습니다.</p>
                                                    </li>
                                                    <li><span class="ico"></span>
                                                        <p class="txt">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a
                                                                href="#none"
                                                                onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'"
                                                                class="emph">1:1 문의</a>에 남겨주세요.</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <table class="xans-board-listheader" width="100%" border="0" cellpadding="0"
                                                cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <th width="70" scope="col" class="input_txt">번호</th>
                                                        <th width="134" scope="col" class="input_txt">카테고리</th>
                                                        <th width="631" scope="col" class="input_txt">제목</th>
                                                        <th width="80" scope="col" class="input_txt">작성자</th>
                                                        <th width="80" scope="col" class="input_txt">작성일</th>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('15968', '1');">
                                                            <td width="70" align="center">공지</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left;">
                                                                <div style="padding:3px 0px 0px 20px;">
                                                                    <p class="subject">판매 (일시)중단 제품 안내 (21.3.12 업데이트)
                                                                    </p>
                                                                </div>
                                                            </td>
                                                            <td width="80">Marketkurly</td>
                                                            <td width="80" style="color:#939393">2017-02-01</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_15968" style="display:none"></div>
                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('455620', '0');">
                                                            <td width="70" align="center">189</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left;">
                                                                <div style="padding:3px 0px 0px 20px;">
                                                                    <p class="subject">&nbsp;<img
                                                                            src="../../img/review_image/ico_secret.png"
                                                                            class="ico_secret" alt="비밀글">배송문의</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">우*숙</td>
                                                            <td width="80" style="color:#939393">2021-02-22</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_455620" style="display:none"></div>
                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('456044', '0');">
                                                            <td width="70" align="center">188</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left">
                                                                <div
                                                                    style="background-image: url(/shop/data/skin/designgj/images/goods/ico_re.gif); background-repeat:no-repeat;background-position:left 3px;padding:3px 0px 0px 27px;">
                                                                    <p class="subject">안녕하세요, 마켓컬리입니다.</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">MarketKurly</td>
                                                            <td width="80" style="color:#939393">2021-02-22</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_456044" style="display:none"></div>
                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('451846', '0');">
                                                            <td width="70" align="center">187</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left;">
                                                                <div style="padding:3px 0px 0px 20px;">
                                                                    <p class="subject">&nbsp;<img
                                                                            src="../../img/review_image/ico_secret.png"
                                                                            class="ico_secret" alt="비밀글">이유식하려고 샀는데 감자
                                                                        상태가 안좋아요</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">김*나</td>
                                                            <td width="80" style="color:#939393">2021-02-17</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_451846" style="display:none"></div>
                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('452111', '0');" style="">
                                                            <td width="70" align="center">186</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left">
                                                                <div
                                                                    style="background-image: url(/shop/data/skin/designgj/images/goods/ico_re.gif); background-repeat:no-repeat;background-position:left 3px;padding:3px 0px 0px 27px;">
                                                                    <p class="subject">안녕하세요, 마켓컬리입니다. </p>
                                                                </div>
                                                            </td>
                                                            <td width="80">MarketKurly</td>
                                                            <td width="80" style="color:#939393">2021-02-17</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_452111" style="display:none"></div>
                                            <!-- <p class="btnArea after"> -->



                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('443414', '0');" style="">
                                                            <td width="70" align="center">185</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left;">
                                                                <div style="padding:3px 0px 0px 20px;">
                                                                    <p class="subject">&nbsp;<img
                                                                            src="../../img/review_image/ico_secret.png"
                                                                            class="ico_secret" alt="비밀글">감자상태가 안좋아요</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">조*희</td>
                                                            <td width="80" style="color:#939393">2021-02-04</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_443414" style="display:none"></div>

                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('444060', '0');" style="">
                                                            <td width="70" align="center">184</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left">
                                                                <div
                                                                    style="background-image: url(/shop/data/skin/designgj/images/goods/ico_re.gif); background-repeat:no-repeat;background-position:left 3px;padding:3px 0px 0px 27px;">
                                                                    <p class="subject">안녕하세요, 마켓컬리입니다.</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">MarketKurly</td>
                                                            <td width="80" style="color:#939393">2021-02-05</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div id="content_id_444060" style="display: block;">
                                                <style>
                                                    #contents .contents img {
                                                        display: block;
                                                        max-width: 600px
                                                    }
                                                </style>
                                                <div class="view">
                                                    <table id="contents" width="100%" onmouseover="this.style.background="#F7F7F7" onmouseout="this.style.background=" style="">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:16px 19px 12px;text-align:left;">
                                                                    <div style="line-height:30px;">
                                                                        <div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                Love food, Love life!</div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                <br>
                                                                            </div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                안녕하세요. 마켓컬리입니다.</div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                <br>
                                                                            </div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                죄송스럽지만 해당 내용은 고객센터로 문의 주시면 감사하겠습니다.
                                                                            </div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                <br>
                                                                            </div>
                                                                            <div
                                                                                style="color: rgb(72, 72, 72); font-family: tahoma; font-size: 12px; background-color: rgb(255, 255, 255);">
                                                                                <div>
                                                                                    <font color="#484848" face="tahoma">
                                                                                        앞으로도 마켓컬리에 지속적인 관심과 사랑 부탁드리며,
                                                                                    </font>
                                                                                </div>
                                                                                <div>
                                                                                    <font color="#484848" face="tahoma">
                                                                                        궁금하신 점 언제든지 남겨주시면 최선을 다해 답변드리도록
                                                                                        하겠습니다.</font>
                                                                                </div>
                                                                                <div>
                                                                                    <font color="#484848" face="tahoma">
                                                                                        감사합니다.</font>
                                                                                </div>
                                                                                <div>
                                                                                    <font color="#484848" face="tahoma">
                                                                                        <br>
                                                                                    </font>
                                                                                </div>
                                                                                <div>
                                                                                    <font color="#484848" face="tahoma">
                                                                                        마켓컬리 드림.</font>
                                                                                </div>
                                                                                <div>
                                                                                    <font color="#484848" face="tahoma">
                                                                                        <br>
                                                                                    </font>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <font class="editorArea" color="#484848">
                                                                            <font class="editorArea" color="#484848">
                                                                            </font>
                                                                        </font>
                                                                    </div>
                                                                    <div style="float:right; margin-top:20px;"></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('412609', '0');" style="">
                                                            <td width="70" align="center">178</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left;">
                                                                <div style="padding:3px 0px 0px 20px;">
                                                                    <p class="subject">고구마랑 감자 몇개가 속이상태가 너무 안좋아요</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">김*연</td>
                                                            <td width="80" style="color:#939393">2021-01-11</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div id="content_id_412609" style="display: block;">
                                                <style>
                                                    #contents .contents img {
                                                        display: block;
                                                        max-width: 600px
                                                    }
                                                </style>
                                                <div class="view">
                                                    <table id="contents" width="100%"
                                                        onmouseover="this.style.background=&quot;#F7F7F7&quot;"
                                                        onmouseout="this.style.background=&quot;&quot;" style="">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:16px 19px 12px;text-align:left;">
                                                                    <div style="line-height:30px;">고구마2개 감자2개가 까보니 속이 너무
                                                                        않좋습니다 상태안젛은 부분도려내니 반도 안되요 ㅜㅜ</div>
                                                                    <div style="float:right; margin-top:20px;"></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div>
                                                <table width="100%" class="xans-board-listheaderd">
                                                    <tbody>
                                                        <tr onmouseover="this.style.background='#F7F7F7'"
                                                            onmouseout="this.style.background=''"
                                                            onclick="view_content('434805', '0');" style="">
                                                            <td width="70" align="center">177</td>
                                                            <td width="134"></td>
                                                            <td class="image"
                                                                style="padding:16px 19px 12px; text-align:left">
                                                                <div
                                                                    style="background-image: url(/shop/data/skin/designgj/images/goods/ico_re.gif); background-repeat:no-repeat;background-position:left 3px;padding:3px 0px 0px 27px;">
                                                                    <p class="subject">안녕하세요, 마켓컬리입니다.</p>
                                                                </div>
                                                            </td>
                                                            <td width="80">MarketKurly</td>
                                                            <td width="80" style="color:#939393">2021-01-30</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div id="content_id_434805" style="display: block;">
                                                <style>
                                                    #contents .contents img {
                                                        display: block;
                                                        max-width: 600px
                                                    }
                                                </style>
                                                <div class="view">
                                                    <table id="contents" width="100%"
                                                        onmouseover="this.style.background=&quot;#F7F7F7&quot;"
                                                        onmouseout="this.style.background=&quot;&quot;">
                                                        <tbody>
                                                            <tr>
                                                                <td style="padding:16px 19px 12px;text-align:left;">
                                                                    <div style="line-height:30px;">Love food, Love
                                                                        life!<br><br>안녕하세요. 마켓컬리입니다.<br>믿고 찾아주신 상품에 불편을
                                                                        드려 정말 죄송합니다. <br><br>해당 부분 정확한 확인 어려워 고객센터로 문의
                                                                        주시면 빠르게 안내도움드릴 수 있도록 하겠습니다.<br><br>불편을 드려 정말 죄송할
                                                                        따름이며, 고객님께 늘 신선하고 최상의 상품을 불편 없이 전달드리기 위해 최선을 다하는
                                                                        컬리가 되겠습니다<br><br>혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른
                                                                        어려움이 있으실 경우<br>언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의
                                                                        부탁드립니다. <br><br>마켓컬리 드림.</div>
                                                                    <div style="float:right; margin-top:20px;"></div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <p class="btnArea after">
                                                <a href="javascript:;" onclick="popup_register( 'add_qna', '69' )"><span
                                                        class="bhs_button"
                                                        style="line-height:30px; width:130px;">상품문의</span></a>
                                            </p>
                                        </div>
                                    </div>
                                    <div style="clear:both;text-align:center;padding-bottom:15px;">
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=1"
                                            class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로
                                            가기</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=1"
                                            class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
                                        <strong
                                            class="layout-pagination-button layout-pagination-number __active">1</strong>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=2"
                                            class="layout-pagination-button layout-pagination-number">2</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=3"
                                            class="layout-pagination-button layout-pagination-number">3</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=4"
                                            class="layout-pagination-button layout-pagination-number">4</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=5"
                                            class="layout-pagination-button layout-pagination-number">5</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=6"
                                            class="layout-pagination-button layout-pagination-number">6</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=7"
                                            class="layout-pagination-button layout-pagination-number">7</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=8"
                                            class="layout-pagination-button layout-pagination-number">8</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=9"
                                            class="layout-pagination-button layout-pagination-number">9</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=10"
                                            class="layout-pagination-button layout-pagination-number">10</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=2"
                                            class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
                                        <a href="/shop/goods/goods_qna_list.php?goodsno=69&amp;page=38"
                                            class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 상품상세 및 리뷰페이지 종료 -->
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
        <a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 15px;">맨 위로가기</a>
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
            // 클릭인인경우(푸터에 있으나, 아직공용작업은 못함) => bgLoading 이부분 처리필요
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