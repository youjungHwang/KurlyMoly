<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ page import="com.kurly.member.MemberDTO"%>
<%@ page import="com.kurly.member.MemberDAO"%>

<jsp:useBean class="com.kurly.member.CouponDTO" id="coupon" />
<jsp:useBean class="com.kurly.member.CouponDAO" id="dao" />
<jsp:useBean class="com.kurly.member.MemberDTO" id="member" />
<jsp:useBean class="com.kurly.member.MemberDAO" id="daoM" />
<jsp:useBean class="com.kurly.member.PointDAO" id="daoP" />
<jsp:useBean class="com.kurly.member.PointDTO" id="point" />
<jsp:useBean class="com.kurly.product.ProductDTO" id="product" />
<jsp:useBean class="com.kurly.product.ProductDAO" id="daoPro" />

<%
	request.setCharacterEncoding("utf-8");
	
	if (session.getAttribute("m_id") == null) {
%>
<!-- 로그인이 되어있지 않으면 로그인을 실행하라며 해당 페이지로 돌아감 -->
<script>
	alert('로그인 후 이용하세요');
	location.href = '../member/login.jsp';
</script>
<%
	} else {
	
	String idx = null;
	if (session.getAttribute("m_idx") != null) {
		idx = (String) session.getAttribute("m_idx");
	
	}
	
	String sql = "";
	String sql2 = "";
	String url = "jdbc:mysql://localhost:3306/kurlymoly";
	String uid = "root";
	String upw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn2 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	Integer cp_idx = 0; // 
	Integer cp_memidx = (Integer.parseInt(idx)); // 멤버idx      로그인 해서 idx를 받아와야함
	Integer cp_isused = 0; // 사용, 미사용 1, 0
	int total = dao.count(cp_memidx);
	
	Integer po_idx = 0;
	Integer po_memidx = (Integer.parseInt(idx));
	String po_type = "";
	String po_details = "";
	String po_regdate = "";
	int po_points = 0;
	String po_duedate = "";
	int po_sumpoints = 0;
	int po_duepoints = 0;
	int sum = daoP.sum(po_memidx);
	int sum2 = daoP.sum2(po_memidx);
	int totalPoint = sum - sum2;
	int sum_duepoint = daoP.sum_duepoint(po_memidx);
	
	// 계산식 관련
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정

%>

<!-- 정보수정페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
<link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
<link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script src="../../script/script.js"></script>
<script src="../../script/MJscript.js"></script>
<script src="../../script/kurlytracker.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style>
h4 {
	margin-block-end: 0em;
}

.member_join {
	padding-bottom: 0px;
}

#Z_list .check_ico {
	background: #fff url(../../img/mypage/ico_checkbox_off.webp) no-repeat 0
		2px;
	display: block !important;
	width: 25px;
	height: 25px;
}
</style>

</head>

<body>
	<!-- container 시작 -->
	<div id="container">
		<!-- header 시작 -->
		<%@ include file="../include/header.jsp"%>

		<!-- main 시작 -->
		<div id="main">
			<!-- 본문 시작 -->
			<div id="content">
				<div id="qnb" class="quick-navigation"
					style="top: 516px; z-index: 500;">
					<div class="bnr_qnb" id="brn_Quick">
						<a href="../board/delivery.html"><img class="thumb"
							src="../../img/sidebar/bnr_quick_20190403.webp"></a>
					</div>

					<div class="side_menu">
						<a href="../../event_lovers.html" class="link_menu">등급별 혜택</a> <a
							href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
					</div>
				</div>

				<!--=============================== mypage_main 시작=================================-->
				<div id="mypage_main">
					<div id="content">
						<div id="content_back">
							<div id="myPageTop" class="mypage_top">
								<h2 class="screen_out">마이 페이지</h2>
								<div class="mypagetop_user">
									<div class="inner_mypagetop">
										<div class="grade_user">
											<div class="grade">
												<span class="screen_out">등급</span> <span
													class="ico_grade class0"> <span class="ineer_grade">
														<span class="in_grade"> 일반 </span>
												</span>
												</span>
												<div class="grade_bonus">
													<div class="user">
														<strong class="name"><%=session.getAttribute("m_name")%></strong>
														<span class="txt">님</span>
													</div>
													<div class="bonus">
														<strong class="tit">첫구매 우대 -</strong> 적립 5%
													</div>
													<div class="bonus">
														<strong class="tit">첫구매 우대 -</strong> 20,000원 이상 무료 배송
													</div>
												</div>
											</div>
											<div class="next">
												<a href="../../event_lovers.jsp" class="total_gd">전체등급
													보기</a>
											</div>
										</div>
										<ul class="list_mypage">
											<li class="user_point">
												<div class="link">
													<div class="tit">적립금</div>
													<a href="./mypage_emoney.jsp" class="info"> <%=nf.format(totalPoint)%>
														원 <img src="../../img/mypage/ico_arrow_56x56.webp" alt="">
														<span class="date"> 소멸 예정 <%=nf.format(sum_duepoint)%>원
													</span>
													</a>
												</div>
											</li>
											<li class="user_coupon">
												<div class="link">
													<div class="tit">쿠폰</div>
													<a href="./mypage_coupon.jsp" class="info"> <%=total%>
														개 <img src="../../img/mypage/ico_arrow_56x56.webp" alt="">
													</a>
												</div>
											</li>
											<li class="user_kurlypass">
												<div class="link">
													<div class="tit">컬리패스</div>
													<a href="../../event_lovers.jsp"
														class="info">알아보기 <img
														src="../../img/mypage/ico_arrow_56x56.webp" alt="">
													</a>
												</div>
											</li>
										</ul>
									</div>
									<a href="../../event_friend.jsp" alt="이벤트 페이지로 이동"
										class="bnr_event"> <img
										src="../../img/mypage/eventfront.png" alt="이벤트페이지">
									</a>
								</div>
							</div>

							<div class="page_aticle aticle_type2 clear">
								<div id="snb" class="snb_mypage">
									<h2 class="tit_snb">마이컬리</h2>
									<div class="inner_snb">
										<ul class="list_menu">
											<li><a href="./mypage_main.jsp">주문 내역</a></li>
											<li><a href="./mypage_transport.jsp">배송지 관리</a></li>
											<li><a href="./mypage_Zzim.jsp">찜한 상품</a></li>
											<li><a href="./mypage_review.jsp">상품 후기</a></li>
											<li class="on"><a href="./mypage_emoney.jsp">적립금</a></li>
											<li><a href="./mypage_coupon.jsp">쿠폰</a></li>
											<li><a href="./mypage_editinfo.jsp">개인 정보 수정</a></li>
										</ul>
									</div>
									<a href="../mypage/mypage_qna_register.jsp"
										class="link_inquire"> <span class="emph">도움이 필요하신가요
											?</span>
										<p>1:1 문의하기</p>
									</a>
								</div>
								<!--=========================================== 적립금 시작 =================================-->

								<div class="page_section section_point">
									<div class="head_aticle">
										<h2 class="tit">
											적립금 <span class="tit_sub">보유하고 계신 적립금의 내역을 한 눈에 확인 하실
												수 있습니다.</span>
										</h2>
									</div>
									<div id="viewPointList">
										<div class="point_header">
											<div class="point_view">
												<h3 class="tit">현재 적립금</h3>
												<strong class="point"> <%=nf.format(totalPoint)%> <span
													class="won">원</span>
												</strong>
											</div>
											<span class="disappear"> <span class="subject no_day">
													소멸예정 적립금 </span> <span class="num"> <%=nf.format(sum_duepoint)%>
													원
											</span>
											</span>
										</div>

										<table class="tbl tbl_type1">
											<caption style="display: none;">적립 사용 내역 상세보기</caption>
											<colgroup>
												<col style="width: 120px;">
												<col style="width: auto;">
												<col style="width: 122px;">
												<col style="width: 140px;">
											</colgroup>
											<thead>
												<tr>
													<th>날짜</th>
													<th class="info">내용</th>
													<th>유효기간</th>
													<th>금액</th>
												</tr>
											</thead>
											<tbody>
												<%
												try {
													Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
													conn = DriverManager.getConnection(url, uid, upw);
													if (conn != null) {
														sql = "select * from tb_point where po_memidx=? and po_type=?";
														pstmt = conn.prepareStatement(sql);
														pstmt.setString(1, idx);
														pstmt.setString(2, "적립");
														rs = pstmt.executeQuery();
														while (rs.next()) {
															po_memidx = rs.getInt("po_memidx");
															po_details = rs.getString("po_details");
															po_duedate = rs.getString("po_duedate").substring(0, 10);
															po_regdate = rs.getString("po_regdate").substring(0, 10);
															po_points = rs.getInt("po_points");
												%>
												<tr>
													<td><%=po_regdate%></td>
													<td class="info"><a class="link"><%=po_details%></a>
													</td>
													<td><span><%=po_duedate%></span></td>
													<td class="point"><span>+</span><%=nf.format(po_points)%>
														원</td>
												</tr>
												<%
												}
												Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
												conn2 = DriverManager.getConnection(url, uid, upw);
												sql2 = "select * from tb_point where po_memidx=? and po_type=?";
												pstmt2 = conn2.prepareStatement(sql);
												pstmt2.setString(1, idx);
												pstmt2.setString(2, "사용");
												rs2 = pstmt2.executeQuery();
												while (rs2.next()) {
												po_memidx = rs2.getInt("po_memidx");
												po_details = rs2.getString("po_details");
												po_duedate = rs2.getString("po_duedate").substring(0, 10);
												po_regdate = rs2.getString("po_regdate").substring(0, 10);
												po_points = rs2.getInt("po_points");
												%>
												<tr>
													<td><%=po_regdate%></td>
													<td class="info"><a class="link"><%=po_details%></a>
													</td>
													<td><span></span></td>
													<td class="point" style="color: #e3e3e3;"><span>-</span><%=nf.format(po_points)%>
														원( 사용됨)</td>
												</tr>
												<%
												}
												}

												} catch (Exception e) {
												e.printStackTrace();
												}
												%>
											</tbody>

										</table>

										<div class="layout_page" style="display: none;">
											<div class="page_div">
												<a href="#viewOrderList" class="lay-pg-btn lay-pg-first">처음</a><a
													href="#viewOrderList" class="lay-pg-btn lay-pg-prev">이전</a><span><strong
													class="lay-pg-btn lay-pg-number __active">1</strong></span><a
													href="#viewOrderList" class="lay-pg-btn lay-pg-next">다음</a><a
													href="#viewOrderList" class="lay-pg-btn lay-pg-last">맨끝</a>
											</div>
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
		<%@ include file="../include/footer.jsp"%>
		<!-- footer 종료 -->
	</div>
	<!-- container 종료 -->

	<!-- quick list 시작 -->
	<a href="#top" id="pageTop" class="on">맨 위로가기</a>
	<!-- quick list 끝 -->
</body>

</html>
<%
}
%>