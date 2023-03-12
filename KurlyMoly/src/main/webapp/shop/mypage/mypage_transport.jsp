<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.member.MemberDTO"%>
<%@ page import="com.kurly.member.MemberDAO"%>
<%@ page import="java.text.NumberFormat"%>
<jsp:useBean class="com.kurly.member.CouponDTO" id="coupon" />
<jsp:useBean class="com.kurly.member.CouponDAO" id="dao" />
<jsp:useBean class="com.kurly.member.MemberDTO" id="member" />
<jsp:useBean class="com.kurly.member.MemberDAO" id="daoM" />
<jsp:useBean class="com.kurly.member.PointDAO" id="daoP" />
<jsp:useBean class="com.kurly.member.PointDTO" id="point" />

<%
request.setCharacterEncoding("utf-8");

int idxI = 0;
int useridx = 0;
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
	idxI = Integer.parseInt(idx);
}

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "";
String sql2 = "";
String url = "jdbc:mysql://localhost:3306/kurlymoly";
String uid = "root";
String upw = "1234";

Integer cp_idx = 0; // 
Integer cp_memidx = (Integer.parseInt(idx)); // 멤버idx      로그인 해서 idx를 받아와야함
Integer cp_isused = 0; // 사용, 미사용 1, 0
int total = dao.count(cp_memidx);

Integer po_idx = 0;
Integer po_memidx = (Integer.parseInt(idx));
String po_type = "";
int po_points = 0;
String po_duedate = "";
int po_sumpoints = 0;
int po_duepoints = 0;
int sum = daoP.sum(po_memidx);
int sum2 = daoP.sum2(po_memidx);
int totalPoint = sum - sum2;
int sum_duepoint = daoP.sum_duepoint(po_memidx);

String da_receiver = "";
String da_tel = "";
String da_address = "";
String da_deliverytype = "";

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
</style>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

</head>

<body>
	<!-- container 시작 -->
	<div id="container">
		<%@ include file="../include/header.jsp"%>

		<!--main 시작-->
		<div id="main">
			<div id="qnb" class="quick-navigation"
				style="top: 516px; z-index: 500;">
				<div class="bnr_qnb" id="brn_Quick">
					<a href="../board/delivery.jsp"><img class="thumb"
						src="../../img/sidebar/bnr_quick_20190403.webp"></a>
				</div>

				<div class="side_menu">
					<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a> <a
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
											<a href="../../event_lovers.jsp" class="total_gd">전체등급 보기</a>
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
												<a href="./mypage_coupon.jsp" class="info"> <%=total%> 개
													<img src="../../img/mypage/ico_arrow_56x56.webp" alt="">
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
										<li class="on"><a href="./mypage_transport.jsp">배송지
												관리</a></li>
										<li><a href="./mypage_Zzim.jsp">찜한 상품</a></li>
										<li><a href="./mypage_review.jsp">상품 후기</a></li>
										<li><a href="./mypage_emoney.jsp">적립금</a></li>
										<li><a href="./mypage_coupon.jsp">쿠폰</a></li>
										<li><a href="./mypage_editinfo.jsp">개인 정보 수정</a></li>
									</ul>
								</div>
								<a href="../mypage/mypage_qna_register.jsp" class="link_inquire">
									<span class="emph">도움이 필요하신가요 ?</span>
									<p>1:1 문의하기</p>
								</a>
							</div>
							<!--=============================== viewOrderList 시작=================================-->
							<div id="viewOrderList" class="page_section">
								<div class="head_aticle">
									<h2 class="tit">
										<span class="tit_t">배송지 관리</span> <span class="tit_sub">배송지에
											따라 상품 정보가 달라질 수 있습니다.</span>
									</h2>
								</div>
								<div id="table_list" class="type_sel">
									<table id="trans_list">
										<thead>
											<tr>
												<th class="tit_select">선택</th>
												<th class="tit_address">주소</th>
												<th class="tit_receive">받으실 분</th>
												<th class="tit_hp">연락처</th>
												<th class="tit_t_type">배송유형</th>
												<th class="tit_edit">수정</th>
											</tr>
										</thead>
										<tbody id="addr_list">

											<%
											try {
												Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
												conn = DriverManager.getConnection(url, uid, upw);

												if (conn != null) {
													sql = "SELECT * FROM tb_daddress WHERE da_memidx=?";
													pstmt = conn.prepareStatement(sql);
													pstmt.setInt(1, idxI);
													rs = pstmt.executeQuery();

													while (rs.next()) {

												da_receiver = rs.getString("da_receiver");
												da_tel = rs.getString("da_tel");
												da_address = rs.getString("da_address");
												da_deliverytype = rs.getString("da_deliverytype");
											%>

											<tr>
												<td class="select type_radio"><label class="checkbox">
														<input id="ch_box_input" type="radio" name="addr_NO"
														checked> <span class="icon"></span> <span
														class="screen_out">선택란</span>
												</label></td>
												<td class="address">
													<p class="addr"><%=da_address%>
													</p>
												</td>
												<td class="name"><%=da_receiver%></td>
												<td class="phone"><%=da_tel%></td>
												<td class="tp_how"><span class="transport regular"><%=da_deliverytype%></span>

												</td>
												<td>
													<button type="button" class="icon edit"
														onclick="
                                                            window.open
                                                            ('mypage_trans_pop.jsp?idx=<%=idxI%>&address=<%=da_address%>&phone=<%=da_tel%>&name=<%=da_receiver%>', 'pop', 'width=500, height=500, scrollbars=no')">
														수정하기</button>
												</td>

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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('input[name="addr_NO"]').on('click', function() {
				alert('배송지 선택이 완료되었습니다.')
			})
		</script>
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