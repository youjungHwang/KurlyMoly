<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.product.ProductDAO"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	request.setCharacterEncoding("UTF-8");
	ArrayList<Integer> product = (ArrayList<Integer>)session.getAttribute("productList"); // 상품번호를 가져와 제품 정보 띄우기
	ProductDAO pDAO = new ProductDAO();
	ArrayList list = new ArrayList<>();
	
	String goodsTitle = ""; // 상품명
	String goodsSubTitle = ""; // 상품설명 (회색글씨)
	String userAddress = ""; // 배송지
	int goodsPrice = 0; // 상품금액(정가)
	int discPrice = 0; // 상품할인금액
	int count = 0; // 제품수량
	int quickPrice = 2500; // 배송비
	int freeQuick = 40000; // 4만원 이상 주문 시 무료배송 (계산식)
	int totalPrice = 0; // 최종결제금액
	int reservePrice = 0; // 적립금 (계산식)
	
	// DB 연결
//   Connection conn = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;

//	String sql = "";
//	String url = "jdbc:mysql://localhost:3306/kurlymoly";
//	String uid = "root";
//	String upw = "1234";
	
	if(product != null) {
		for (int i = 0; i < product.size(); i++) {
			list.add(pDAO.cartProduct(product.get(i)));
		}
	}
	
	pageContext.setAttribute("proList", list);
	
	System.out.println(list);
	
//	goodsTitle = (String)session.getAttribute("goodsTitle"); // 전 페이지에서 상품명을 받아옴
	
//	if(goodsTitle != null && !goodsTitle.equals("")){
//		String noProduct = "";
//	} else {  }
%> --%>

<%
	ArrayList<ProductDTO> list = new ArrayList<>();
	ProductDTO dto = new ProductDTO();
	
	dto.setpDiscprice(1000);
	dto.setpTitle("식빵");
	dto.setpPrice(20000);
	list.add(dto);
	
	pageContext.setAttribute("list", list);
%>

<!-- 장바구니 페이지 N -->
<!DOCTYPE html>
<html lang="en">
<!--layerDSR 하기-->

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
    <div id="wrap" class="#">
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
            </header>
            <!--header 끝-->
            <div class="tit_page">
                <h2 class="tit">장바구니</h2>
            </div>

            <!-- main 시작 -->
            <div id="main">
                <!-- 본문 시작 -->
                <div id="content" style="padding-bottom: 120px;">
                    <div id="qnb" class="quick-navigation" style>
                        <!--quick메뉴-->
                        <div class="bnr_qnb" id="brnQuick"><a href="../board/delivery.html" id="brnQuickObj">
                                <!--href사이드퀵메뉴공지사항-->
                                <img class="thumb"
                                    src="https://res.kurly.com/pc/service/main/1904/bnr_quick_20190403.png"
                                    alt="퀄리티있게 샛별배송">
                            </a>
                        </div>
                        <div class="side_menu">
                            <!--사이드퀵메뉴-->
                            <a href="../../event_lovers.html" class="link_menu ">등급별 혜택</a>
                            <a href="#" class="link_menu ">레시피</a>
                        </div>
                    </div>
                    <h3 class="screen_out">장바구니 상품 목록</h3>
                    <!--form태그 시작-->
                    <form name="regform" id="regform" method="post" action="goods_cart_ok.jsp"> <!-- ★@@★★@@★ 나희 -->
                        <div id="cartItemList" class="only_pc" style="min-height: 624px;">
                            <div class="">
                                <div class="cart_item ">
                                    <div class="cart_select">
                                        <div class="inner_select">
                                            <label class="check"><input type="checkbox" name="checkAll" checked=""><span class="ico"></span>전체선택 (3/3)</label> <!-- ★@@★★@@★ 나희. 전체선택(0/0)에 들어갈 갯수 받아오는 변수 필요 -->
                                            <a href="#none" class="btn_delete">선택삭제</a> <!-- ★@@★★@@★ 나희. 삭제 버튼을 눌렀을때 제품 리스트를 초기화하고 div 상에서 삭제하는 기능 필요 -->
                                        </div>
                                    </div>
                                    <div class="box frozen">
                                        <!-- <div class="tit_box">
                                            <h4 class="tit"><span class="inner_tit"><span class="ico"></span>냉동 상품</span></h4>
                                            <button type="button" class="btn_dropup ">접기 / 펼치기</button>
                                        </div> -->
                                        <ul class="list ">
                                        
									<c:choose>
                                       	<c:when test="${List ne null}">
                                        	<c:forEach var="cartProd" items="${list}">
                                            <li>
                                                <div class="item">
                                                    <label class="check" for="chkItemb5b99fb0-5257-48e2-9dd0-20145d7051c0">
                                                        <input type="checkbox" id="chkItemb5b99fb0-5257-48e2-9dd0-20145d7051c0" name="chkItem" data-item-id="b5b99fb0-5257-48e2-9dd0-20145d7051c0" data-item-no="27444" data-item-parent-no="27449" checked="">
                                                        <span class="ico"></span>
                                                    </label>
                                                    <div class="name">
                                                        <div class="inner_name">
                                                            <a href="#" class="package ">${cartProd.getpTitle()}</a>
                                                            <a href="#" class="product ">${cartProd.getpSubtitle()}</a>
                                                            <div class="info"></div>
                                                        </div>
                                                    </div>
                                                    <div class="goods">
                                                        <a href="#" class="thumb " style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
                                                        <div class="price">
                                                            <div class="in_price">
                                                                <span class="selling">${cartProd.getpPrice() - cartProd.getpDiscprice()}<span class="won">원</span></span>
                                                                <p class="noti"></p>
                                                            </div>
                                                            <div class="stamper count">
                                                                <button type="button" class="btn minus off" data-item-id="b5b99fb0-5257-48e2-9dd0-20145d7051c0" data-item-no="27444" data-opt="decrease">감소</button>
                                                                <input type="text" id="stepperCounter" class="num" readonly="" value="1">
                                                                <button type="button" class="btn plus" data-item-id="b5b99fb0-5257-48e2-9dd0-20145d7051c0" data-item-no="27444" data-opt="increase">추가</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn_delete" data- item-id="b5b99fb0-5257-48e2-9dd0-20145d7051c0" data-item-no="27444" data-type="frozen">상품 삭제</button>
                                                </div>
                                            </li>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
	                                        <div class="empty">
												<div class="inner_empty">
													<span class="bg"></span>
													<p class="txt">장바구니에 담긴 상품이 없습니다</p>
												</div>
											</div>
										</c:otherwise>
                                    </c:choose>

											<!-- <li>
                                                <div class="item">
                                                    <label class="check"
                                                        for="chkItemfa2bc8ac-7b9d-4b57-b498-d855268f970e">
                                                        <input type="checkbox"
                                                            id="chkItemfa2bc8ac-7b9d-4b57-b498-d855268f970e"
                                                            name="chkItem"
                                                            data-item-id="fa2bc8ac-7b9d-4b57-b498-d855268f970e"
                                                            data-item-no="27447" data-item-parent-no="27449" checked="">
                                                        <span class="ico"></span>
                                                    </label>
                                                    <div class="name">
                                                        <div class="inner_name">
                                                            <a href="#" class="package ">[남향푸드또띠아] 고구마 치즈 브리또</a>
                                                            <a href="#" class="product ">[남향푸드또띠아] 간편 간식 브리또 10종</a>
                                                            <div class="info"></div>
                                                        </div>
                                                    </div>
                                                    <div class="goods">
                                                        <a href="#" class="thumb "
                                                            style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
                                                        <div class="price">
                                                            <div class="in_price"><span class="selling">2,900<span
                                                                        class="won">원</span></span>
                                                                <p class="noti"></p>
                                                            </div>
                                                            <div class="stamper count">
                                                                <button type="button" class="btn minus off"
                                                                    data-item-id="fa2bc8ac-7b9d-4b57-b498-d855268f970e"
                                                                    data-item-no="27447" data-opt="decrease">감소</button>
                                                                <input type="text" id="stepperCounter" class="num"
                                                                    readonly="" value="1">
                                                                <button type="button" class="btn plus"
                                                                    data-item-id="fa2bc8ac-7b9d-4b57-b498-d855268f970e"
                                                                    data-item-no="27447" data-opt="increase">추가</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn_delete"
                                                        data-item-id="fa2bc8ac-7b9d-4b57-b498-d855268f970e"
                                                        data-item-no="27447" data-type="frozen">상품 삭제</button>
                                                </div>
                                            </li>
                                            
                                            <li>
                                                <div class="item">
                                                    <label class="check"
                                                        for="chkItem4dd04650-c98c-4356-b845-ca0ed27a96c8">
                                                        <input type="checkbox"
                                                            id="chkItem4dd04650-c98c-4356-b845-ca0ed27a96c8"
                                                            name="chkItem"
                                                            -item-id="4dd04650-c98c-4356-b845-ca0ed27a96c8"
                                                            data-item-no="27448" data-item-parent-no="27449" checked="">
                                                        <span class="ico"></span>
                                                    </label>
                                                    <div class="name">
                                                        <div class="inner_name">
                                                            <a href="#" class="package ">[남향푸드또띠아] 핫 치킨 브리또</a>
                                                            <a href="#" class="product ">[남향푸드또띠아] 간편 간식 브리또 10종</a>
                                                            <div class="info"></div>
                                                        </div>
                                                    </div>
                                                    <div class="goods"><a href="#" class="thumb "
                                                            style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
                                                        <div class="price">
                                                            <div class="in_price"><span class="selling">2,900<span
                                                                        class="won">원</span></span>
                                                                <p class="noti"></p>
                                                            </div>
                                                            <div class="stamper count">
                                                                <button type="button" class="btn minus off"
                                                                    data-item-id="4dd04650-c98c-4356-b845-ca0ed27a96c8"
                                                                    data-item-no="27448" data-opt="decrease">감소</button>
                                                                <input type="text" id="stepperCounter" class="num"
                                                                    readonly="" value="1">
                                                                <button type="button" class="btn plus"
                                                                    data-item-id="4dd04650-c98c-4356-b845-ca0ed27a96c8"
                                                                    data-item-no="27448" data-opt="increase">추가</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn_delete"
                                                        data-item-id="4dd04650-c98c-4356-b845-ca0ed27a96c8"
                                                        data-item-no="27448" data-type="frozen">상품 삭제</button>
                                                </div>
                                            </li> -->
                                            
                                        </ul>
                                    </div>
                                    <div class="cart_select">
                                        <div class="inner_select">
                                            <label class="check"><input type="checkbox" name="checkAll" checked=""><span class="ico"></span>전체선택 (3/3)</label>
                                            <a href="#none" class="btn_delete">선택삭제</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart_result">
                                    <div class="inner_result">
                                        <div class="cart_delivery">
                                            <h3 class="tit">배송지</h3>
                                            <div class="address">
                                                <p class="addr">서울특별시 강남구 역삼동 736-7</p><span class="delivery star">샛별배송</span><a href="#" class="btn default">배송지 변경</a>
                                            </div>
                                        </div>
                                        <div class="amount_view">
                                            <dl class="amount">
                                                <dt class="tit">상품금액</dt>
                                                <dd class="price"><span class="num">8,700</span><span class="won">원</span></dd>
                                            </dl>
                                            <dl class="amount">
                                                <dt class="tit">상품할인금액</dt>
                                                <dd class="price"><span class="num">0</span><span class="won">원</span>
                                                </dd>
                                            </dl>
                                            <dl class="amount">
                                                <dt class="tit">배송비</dt>
                                                <dd class="price"><span class="num">0</span><span class="won">원</span>
                                                </dd>
                                            </dl>
                                            <p class="free_limit">9,000원 추가주문 시, <strong>무료배송</strong></p>
                                            <dl class="amount lst">
                                                <dt class="tit">결제예정금액</dt>
                                                <dd class="price"><span class="num">8,700</span><span class="won">원</span></dd>
                                            </dl>
                                            <div class="reserve"><span class="bage">적립</span>구매 시 <span class="emph">435원 적립</span></div>
                                        </div>
                                        <div class="btn_submit">
                                            <button type="submit" class="btn active">주문하기</button>
                                        </div>
                                        <div class="notice">
                                            <span class="txt">
                                                <span class="ico">·</span>
                                                쿠폰/적립금은 주문서에서 사용 가능합니다
                                            </span>
                                            <span class="txt">
                                                <span class="ico">·</span>
                                                ‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.
                                            </span>
                                            <span class="txt">
                                                <span class="ico">·</span>
                                                ‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <form id="viewCart" name="frmCart" method="post" action="/shop/order/order.php">
                        <input type="hidden" name="mode" value="setOrder">
                    </form>
                </div>
            </div>

            <div id="layerDSR" style="display: none;">
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
                                <a href="../../shop/mypage/mypage_qna_register.html" class="tit">1:1 문의</a>
                            </h3>
                            <dl class="list">
                                <dt>24시간 접수 가능</dt>
                                <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="company">
                        <ul class="list">
                            <li><a class="link" href="../../shop/service/about_kurly.html">컬리소개</a></li>
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