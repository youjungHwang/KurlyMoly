<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.member.MemberDTO"%>
<jsp:useBean id="mdaoMain" class="com.kurly.member.MemberDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String userid = null;
	if (session.getAttribute("m_id") != null) {
		userid = (String) session.getAttribute("m_id");
	}
	
	String m_zipcodeA, m_address1A, m_address2A, addressA = null;

	//접속한 회원 정보 가져오기
	List<MemberDTO> useridinfoMain = new ArrayList<MemberDTO>();
	useridinfoMain = mdaoMain.useridinfo(userid);
	System.out.println(useridinfoMain);
	
	for (int i = 0; i < useridinfoMain.size(); i++) {
		// useridinfo = mdao.useridinfo(userid);
		
		m_zipcodeA = useridinfoMain.get(i).getmZipcode();
		m_address1A = useridinfoMain.get(i).getmAddress1();
		m_address2A = useridinfoMain.get(i).getmAddress2();
		addressA = m_zipcodeA + " " + m_address1A + " " + m_address2A;
	}
%>

<header id="header">
	<div class="bnr_header" id="top-message">
		<!-- 100원 행사 안내 배너 -->
		<a href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_210224" id="eventLanding">지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png" class="bnr_arr">
			<div class="bnr_top">
				<div class="inner_top_close">
					<button id="top-message-close" class="btn_top_bnr">가입하고 혜택받기</button>
				</div>
			</div>
		</a>
		<script>
			// PROM-476 장차석 : GA) 이벤트 트래킹
			$('#eventLanding').on(
				'click',
				function() {
					ga('send', 'event', 'click', 'general_header_sighup',
						location.href);
					});
		</script>
	</div>

	<div id="userMenu">
		<ul class="menuLeft list_menu">
			<li><a href="../board/delivery.jsp" class="bnr_delivery"><img src="../../img/delivery_190819.webp" alt="서울, 경기, 인천 샛별배송, 수도권 이외 지역 택배배송"></a></li>
		</ul>
		<ul class="menuRight list_menu">
			<%
			if (userid == null) {
			%>
			<li class="menu none_sub menu_join"><a href="../member/join.jsp" class="link_menu">회원가입</a></li>
			<li class="menu none_sub menu_login"><a href="../member/login.jsp" class="link_menu">로그인</a></li>

			<%
			} else {
			%>
			<li class="menu menu_user" style="width: 120px;"><a class="link_menu grade_comm"><span class="ico_grade grade0">일반</span>
				<span class="txt"><span class="name"><%=session.getAttribute("m_name")%></span><span class="sir">님</span></span></a>
				<ul class="sub" style="left: 20px;">
					<li><a href="../mypage/mypage_main.jsp">주문 내역</a></li>
					<li><a href="../mypage/mypage_transport.jsp">배송지 관리</a></li>
					<li><a href="../mypage/mypage_Zzim.jsp">찜한 상품</a></li>
					<li><a href="../mypage/mypage_review.jsp">상품 후기</a></li>
					<li><a href="../mypage/mypage_emoney.jsp">적립금</a></li>
					<li><a href="../mypage/mypage_coupon.jsp">쿠폰</a></li>
					<li><a href="../mypage/mypage_editinfo.jsp">개인 정보 수정</a></li>
					<li><a href="../member/logout.jsp">로그아웃</a></li>
				</ul></li>
			<%
			}
			%>
			<li class="menu lst"><a href="../board/notice.jsp" class="link_menu cos">고객센터</a>
				<ul class="sub">
					<li><a href="../board/notice.jsp">공지사항</a></li>
					<li><a href="../board/faq.jsp">자주하는 질문</a></li>
					<li><a href="../mypage/mypage_qna.jsp">1:1 문의</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div id="headerLogo">
		<!-- 메인로고 -->
		<h1 class="logo">
			<a href="../../index.jsp" class="link_main"><img src="../../img/logo_x2.webp" alt="마켓컬리 로고" style="display: block;"></a>
		</h1>
	</div>

	<div id="gnb">
		<div id="gnbMenu" class="gnb_kurly gnbMenu">
			<div class="inner_gnbkurly">
				<div class="gnb_main">
					<!-- 메뉴들 전체를 감싸는 div -->
					<ul class="gnb">
						<li class="menu1"><a><span class="ico"></span><span style="float: left; font-weight: 500;">전체 카테고리</span></a></li>
						<li class="menu2"><a href="../goods/goods_list_new.jsp"><span class="txt">신상품</span></a></li>
						<li class="menu3"><a href="../goods/goods_list_best.jsp"><span class="txt">베스트</span></a></li>
						<li class="menu4"><a href="../goods/goods_list_sales.jsp"><span class="txt">알뜰쇼핑</span></a></li>
						<li class="menu5"><a href="../goods/event_list.jsp"><span class="txt">금주혜택</span></a></li>
					</ul>
					<div id="sideSearch" class="gnb_search">
						<!-- 검색창 들어가는 부분 -->
						<form action="../goods/goods_search.jsp">
							<input type="text" name="sword" id="sword" class="inp_search">
							<input type="image" src="../../img/ico_search_x2.webp" class="btn_search">
							<div class="init">
								<button id="searchInit" class="btn_delete">검색어 삭제하기</button>
							</div>
						</form>
					</div>
					<div class="location_set">
						<!-- 배송지 설정 -->
						<!-- no_address 밑에 address 클래스 div 추가 , 주소찾기, 배송지수정 추가 -->
						<button type="button" class="btn_location">배송지 설정하기</button>
						<div class="layer_location">
							<%
							if (userid == null || userid == "") {
							%>
							<div class="no_address" style="display: block;">
								<!-- 로그인이 안된 상태일때 커서를 올리면 나오는창, 회원가입 대신에 주소검색 을 넣으면 href="javascript:void(0)", onclick="sample6_execDaumPostcode()" 을 넣어줘야 한다.  -->
								<span class="emph">배송지를 등록</span>하고<br>구매 가능한 상품을 확인하세요!
								<div>
									<button type="button" class="btn default login" onclick="location.href='../member/login.jsp'">로그인</button>
									<button type="button" class="btn active searchAddress"
										onclick="location.href='../member/join.jsp'">
										<!-- <span class="ico"> -->
										</span>
										<!-- 주소검색  -->
										회원가입
									</button>
								</div>
							</div>

							<input type="hidden" id="sample6_address" placeholder="주소">
							<br> <input type="hidden" id="sample6_detailAddress"
								placeholder="상세주소"> <input type="hidden"
								id="sample6_extraAddress" placeholder="참고항목">

							<%
							} else {
							%>
							<!-- 로그인이 되었을 때 커서를 올리면 나오는 창, 배송지 변경 -> 배송지 관리 로 수정   onclick="showPopup()" 이 들어가면배송지 수정창이나온다 -->

							<div class="address" style="display: block;">
								<p class="addr"><%=addressA%></p>
								<span class="delivery regular">샛별배송</span> <a
									href="../mypage/mypage_transport.jsp"
									class="btn default modifyAddress">배송지 관리</a>
							</div>

							<%
							}
							%>

						</div>
					</div>
					<div class="cart_count">
						<div class="inner_cartcount">
							<a href="../goods/goods_cart.jsp" class="btn_cart"> <span class="screen_out">장바구니</span> <span id="cart_item_count" class="num realtime_cartcount"></span></a>
						</div>
						<div id="addMsgCart" class="msg_cart">
							<span class="point"></span>
							<div class="inner_msgcart">
								<img src="#" class="thumb">
								<!-- 장바구니에 들어간 상품 이미지 -->
								<p id="msgReaddedItem" class="desc">
									<span class="tit">제품 타이틀</span> <span class="txt">장바구니에 상품을 담았습니다. <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span></span>
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="gnb_sub">
					<div class="inner_sub">
						<ul class="gnb_menu" style="height: auto;" data-default="219" data-min="219" data-max="731">
							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=001">
									<span class="ico">
										<img src="../../img/mainMenu/icon_veggies_inactive_pc@2x.1586324570.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_veggies_active_pc@2x.1586324570.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"><span class="txt">채소</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=01"><span class="name">고구마·감자·당근</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=02"><span class="name">시금치·쌈채소·나물</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=03"><span class="name">브로콜리·파프리카·양배추</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=04"><span class="name">양파·대파·마늘·배추</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=05"><span class="name">오이·호박·고추</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=06"><span class="name">냉동·이색·간편채소</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=001&category2=07"><span class="name">콩나물·버섯</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=002">
									<span class="ico">
										<img src="../../img/mainMenu/icon_fruit_inactive_pc@2x.1568684150.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_fruit_active_pc@2x.1568684150.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"><span class="txt">과일·견과·쌀</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=01"><span class="name">제철과일</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=02"><span class="name">국산과일</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=03"><span class="name">수입과일</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=04"><span class="name">간편과일</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=05"><span class="name">냉동·건과일</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=06"><span class="name">견과류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=002&category2=07"><span class="name">쌀·잡곡</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=003">
									<span class="ico">
										<img src="../../img/mainMenu/icon_seafood_inactive_pc@2x.1568684352.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_seafood_active_pc@2x.1568684353.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">수산·해산·건어물</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=01"><span class="name">제철수산</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=02"><span class="name">생선류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=03"><span class="name">굴비·반건류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=04"><span class="name">오징어·낙지·문어</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=05"><span class="name">새우·게·랍스터</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=06"><span class="name">해산물·조개류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=07"><span class="name">수산가공품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=08"><span class="name">김·미역·해조류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=003&category2=09"><span class="name">건어물·다시팩</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=004">
									<span class="ico">
										<img src="../../img/mainMenu/icon_meat_inactive_pc@2x.1568684452.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_meat_active_pc@2x.1568684452.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">정육·계란</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=01"><span class="name">국내산 소고기</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=02"><span class="name">수입산 소고기</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=03"><span class="name">돼지고기</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=04"><span class="name">계란류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=05"><span class="name">닭·오리고기</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=06"><span class="name">양념육·돈까스</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=004&category2=07"><span class="name">양고기</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=005">
									<span class="ico">
										<img src="../../img/mainMenu/icon_side_inactive_pc@2x.1572243579.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_side_active_pc@2x.1572243579.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">국·반찬·메인요리</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=005&category2=01"><span class="name">국·탕·찌개</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=005&category2=02"><span class="name">밀키트·메인요리</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=005&category2=03"><span class="name">밑반찬</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=005&category2=04"><span class="name">김치·젓갈·장류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=005&category2=05"><span class="name">두부·어묵·부침개</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=005&category2=06"><span class="name">베이컨·햄·통조림</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=006">
									<span class="ico">
										<img src="../../img/mainMenu/icon_convenient_inactive_pc@2x.1572243542.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_convenient_active_pc@2x.1572243543.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">샐러드·간편식</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=01"><span class="name">샐러드·닭가슴살</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=02"><span class="name">도시락·밥류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=03"><span class="name">파스타·면류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=04"><span class="name">떡볶이·튀김·순대</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=05"><span class="name">피자·핫도그·만두</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=06"><span class="name">폭립·떡갈비·안주</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=07"><span class="name">죽·스프·카레</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=006&category2=08"><span class="name">선식·시리얼</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=007">
									<span class="ico">
										<img src="../../img/mainMenu/icon_sauce_inactive_pc@2x.1572243594.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_sauce_active_pc@2x.1572243594.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">면·양념·오일</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=007&category2=01"><span class="name">파스타·면류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=007&category2=02"><span class="name">식초·소스·드레싱</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=007&category2=03"><span class="name">양념·액젓·장류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=007&category2=04"><span class="name">식용유·참기름·오일</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=007&category2=05"><span class="name">소금·설탕·향신료</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=007&category2=06"><span class="name">밀가루·가루·믹스</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=008">
									<span class="ico">
										<img src="../../img/mainMenu/icon_snacks_inactive_pc@2x.1572243615.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_snacks_active_pc@2x.1572243616.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">생수·음료·우유·커피</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=008&category2=01"><span class="name">생수·탄산수</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=008&category2=02"><span class="name">음료·주스</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=008&category2=03"><span class="name">우유·두유·요거트</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=008&category2=04"><span class="name">커피</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=008&category2=05"><span class="name">차</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=009">
									<span class="ico">
										<img src="../../img/mainMenu/icon_cookie_inactive_pc.1610074008.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_cookie_active_pc.1610074008.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">간식·과자·떡</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=009&category2=01"><span class="name">과자·스낵·쿠키</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=009&category2=02"><span class="name">초콜릿·젤리·캔디</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=009&category2=03"><span class="name">떡·한과</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=009&category2=04"><span class="name">아이스크림</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=010">
									<span class="ico">
										<img src="../../img/mainMenu/icon_deli_inactive_pc@2x.1568687352.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_deli_active_pc@2x.1568687352.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">베이커리·치즈·델리</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=010&category2=01"><span class="name">식빵·빵류</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=010&category2=02"><span class="name">잼·버터·스프레드</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=010&category2=03"><span class="name">케이크·파이·디저트</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=010&category2=04"><span class="name">치즈</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=010&category2=05"><span class="name">델리</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=010&category2=06"><span class="name">올리브·피클</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=011">
									<span class="ico">
										<img src="../../img/mainMenu/icon_health_inactive_pc@2x.1574645922.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_health_active_pc@2x.1574645923.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">건강식품</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=01"><span class="name">영양제</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=02"><span class="name">유산균</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=03"><span class="name">홍삼·인삼·꿀</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=04"><span class="name">건강즙·건강음료</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=05"><span class="name">건강분말·건강환</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=06"><span class="name">다이어트·이너뷰티</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=011&category2=07"><span class="name">유아동</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=012">
									<span class="ico">
										<img src="../../img/mainMenu/icon_living_inactive_pc@2x.1588814089.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_living_active_pc@2x.1588814090.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">생활용품·리빙</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=012&category2=01"><span class="name">휴지·티슈</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=012&category2=02"><span class="name">여성·위생용품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=012&category2=03"><span class="name">세제·청소용품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=012&category2=04"><span class="name">화훼·인테리어소품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=012&category2=05"><span class="name">의약외품·마스크</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=012&category2=06"><span class="name">생활잡화·문구</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=013">
									<span class="ico">
										<img src="../../img/mainMenu/icon_beauty_inactive_pc@2x.1588750188.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_beauty_active_pc@2x.1588750188.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">뷰티·바디케어</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=013&category2=01"><span class="name">스킨케어</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=013&category2=02"><span class="name">구강·면도</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=013&category2=03"><span class="name">바디·제모</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=013&category2=04"><span class="name">헤어케어</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=013&category2=05"><span class="name">미용기기·소품</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=014">
									<span class="ico">
										<img src="../../img/mainMenu/icon_kitchen_inactive_pc@2x.1574646457.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_kitchen_active_pc@2x.1574646458.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">주방용품</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=014&category2=01"><span class="name">주방소모품·잡화</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=014&category2=02"><span class="name">주방·조리도구</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=014&category2=03"><span class="name">냄비·팬·솥</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=014&category2=04"><span class="name">보관용기·텀블러</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=014&category2=05"><span class="name">식기·테이블웨어</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=014&category2=06"><span class="name">컵·잔·커피도구</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=015">
									<span class="ico">
										<img src="../../img/mainMenu/icon_electronic__inactive_pc@2x.1574417978.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_electronic__active_pc@2x.1574417978.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">가전제품</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=015&category2=01"><span class="name">주방가전</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=015&category2=02"><span class="name">생활가전</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=015&category2=03"><span class="name">계절가전</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=016">
									<span class="ico">
										<img src="../../img/mainMenu/icon_kids_inactive_pc@2x.1568687537.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_kids_active_pc@2x.1568687537.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">베이비·키즈</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=01"><span class="name">분유·간편 이유식</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=02"><span class="name">이유식 재료</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=03"><span class="name">간식·음식·음료</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=04"><span class="name">건강식품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=05"><span class="name">이유·수유용품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=06"><span class="name">기저귀·물티슈</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=07"><span class="name">세제·위생용품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=08"><span class="name">스킨·구강케어</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=016&category2=09"><span class="name">완구·잡화류</span></a></li>
								</ul>
							</li>

							<li>
								<a class="menu" href="../goods/goods_list.jsp?category1=017">
									<span class="ico">
										<img src="../../img/mainMenu/icon_pet_inactive_pc@2x.1587442293.png" alt="카테고리 아이콘 off" class="ico_off">
										<img src="../../img/mainMenu/icon_pet_active_pc@2x.1587442294.png" alt="카테고리 아이콘 on" class="ico_on">
									</span>
									<span class="tit"> <span class="txt">반려동물</span></span>
								</a>
								<ul class="sub_menu" style="display: none;">
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=01"><span class="name">강아지 간식</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=02"><span class="name">강아지 주식</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=03"><span class="name">고양이 간식</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=04"><span class="name">고양이 주식</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=05"><span class="name">반려동물 용품</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=06"><span class="name">배변·위생</span></a></li>
									<li><a class="sub" href="../goods/goods_list.jsp?category1=017&category2=07"><span class="name">소용량·샘플</span></a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>