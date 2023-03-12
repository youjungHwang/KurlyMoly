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

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Connection conn2 = null;
PreparedStatement pstmt2 = null;
ResultSet rs2 = null;

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

Integer l_prodidx = 0;

String p_title = "";
Integer p_price = 0;
String p_imgname = "";

String m_userid = (String) session.getAttribute("m_id");
String m_password = ""; // 비밀번호
String m_name = ""; // 이름

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
<script>
                                                    $('.btn_posi').on('click',function () {
                                                        $('.bg_loading').css("display","block")
                                                        $('.cartList').css("opacity","1")
                                                    })
                                                </script>
<script> 
                                                        // 찜목록에 아무것도 없을 때
                                                        $(document).ready(function() {
                                                            const forLength 
                                                            = document.querySelectorAll('input[name="check[]"]');
                                                            if(forLength.length != 0){
                                                                $('.noData').css("display" , "none")
                                                            }
                                                        })
                                                    </script>


<script>
                                                            // 삭제버튼 스크립트
                                                        $(document).ready(function(){
                                                            $('.solo').on('click', function(e){
                                                            $(this).parentsUntil("tbody").remove()

                                                            const forLength 
                                                            = document.querySelectorAll('input[name="check[]"]');
                                                            if(forLength.length != 0){
                                                                $('.noData').css("display" , "none")
                                                            }
                                                        })
                                                        })
                                                </script>



<script>
                                                        function checkSelectAll()  {
                                                        // 전체 체크박스
                                                        const checkboxes 
                                                            = document.querySelectorAll('input[name="check[]"]');
                                                        // 선택된 체크박스
                                                        const checked 
                                                            = document.querySelectorAll('input[name="check[]"]:checked');
                                                        // select all 체크박스
                                                        const selectAll 
                                                            = document.querySelector('input[name="selectall"]');

                                                        if(checkboxes.length === checked.length)  {
                                                            selectAll.checked = true;
                                                            
                                                        }else {
                                                            selectAll.checked = false;
                                                            
                                                        }

                                                        }
                                                        function checkAll(selectAll)  {
                                                        const checkboxes 
                                                            = document.getElementsByName('check[]');
                                                        checkboxes.forEach((checkbox) => {
                                                            checkbox.checked = selectAll.checked
                                                        })
                                                        }
                                                </script>


</head>

<body>
	<!-- container 시작 -->
	<div id="container">
		<%@ include file="../include/header.jsp"%>

		<!--main 시작-->
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
											<li class="on"><a href="./mypage_Zzim.jsp">찜한 상품</a></li>
											<li><a href="./mypage_review.jsp">상품 후기</a></li>
											<li><a href="./mypage_emoney.jsp">적립금</a></li>
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
								<div id="viewOrderList" class="page_section">
									<div class="head_aticle">
										<h2 class="tit">
											<span class="tit_t">찜한 상품</span> <span class="tit_sub">늘
												사는 것으로 등록하신 상품 목록 입니다</span>
										</h2>
									</div>
									<form name="Zzimlist" method="POST" action="Zzim_del_all.jsp">

										<input type="hidden" name="mode">
										<table id="Z_list" onchange="">
											<thead>
												<tr>
													<th><label class="label_check all_check"> <input
															type="checkbox" name="selectall" class="icon_check"
															onclick="checkAll(this)" onchange=""> <i
															class="check_ico th_ico"></i>
													</label></th>
													<th><span class="screen_out">상품이미지</span></th>
													<th>상품정보</th>
													<th>선택</th>
												</tr>
											</thead>
											<tbody>

												<%
												try {
													Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
													conn = DriverManager.getConnection(url, uid, upw);
													if (conn != null) {
														sql = "select * from tb_like where l_userid=?";
														pstmt = conn.prepareStatement(sql);
														pstmt.setString(1, userid);
														rs = pstmt.executeQuery();
														while (rs.next()) {
													l_prodidx = rs.getInt("l_prodidx");

													try {
														Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
														conn2 = DriverManager.getConnection(url, uid, upw);

														if (conn2 != null) {
															sql2 = "SELECT * FROM tb_product WHERE p_idx=?";
															pstmt2 = conn2.prepareStatement(sql2);
															pstmt2.setInt(1, l_prodidx);
															rs2 = pstmt2.executeQuery();

															while (rs2.next()) {

																p_title = rs2.getString("p_title");
																p_price = rs2.getInt("p_price");
																p_imgname = rs2.getString("p_imgname");
												%>



												<tr class="DEL">

													<td><label class="label_check"> <input
															type="checkbox" name="check[]" class="icon_check"
															onclick='checkSelectAll()' value="<%=l_prodidx%>">
															<i class="check_ico"></i>
													</label></td>
													<td class="thumb"><a
														href="../goods/goods_detail.jsp?p_idx=<%=l_prodidx%>"><img
															src="../../img/goods_detail/<%=p_imgname%> " width="126"
															alt=""></a></td>
													<td class="info">
														<div class="name">
															<a href="../goods/goods_detail.jsp?p_idx=<%=l_prodidx%>"><%=p_title%></a>
														</div>
														<dl>
															<dt class="screen_out">상품가격</dt>
															<dd><%=nf.format(p_price)%>
																원
															</dd>
														</dl>
													</td>
													<td>
														<div class="group_btn">
															<!-- 온클릭안쪽은 일단 비워둠 -->
															<button type="button"
																onclick="location.href='./Zzim_addcart.jsp?idx=<%=l_prodidx%>'"
																class="btn btn_posi">장바구니 담기</button>
															<button type="button"
																onclick="location.href='./Zzim_del.jsp?idx=<%=l_prodidx%>'"
																class="btn btn_nega">삭제</button>
														</div>
													</td>
												</tr>
												<%
												}
												}
												} catch (Exception e) {
												e.printStackTrace();
												}

												}
												}
												} catch (Exception e) {
												e.printStackTrace();
												}
												%>
												<tr style="display: table-row;" class="noData">
													<td class="no_data" colspan="4">늘 사는 상품 내역이 없습니다.</td>
												</tr>
											</tbody>
										</table>
										<div class="group_btn  bot_btn">
											<div class="inner_groupbtn">
												<button type="submit" class="btn btn_nega Zzim">찜한
													상품 비우기</button>

												<span class="space"></span>
											</div>
										</div>

										<div class="layout_page" style="display: none;">
											<div class="page_div">
												<a href="#viewOrderList" class="lay-pg-btn lay-pg-first">처음</a><a
													href="#viewOrderList" class="lay-pg-btn lay-pg-prev">이전</a><span><strong
													class="lay-pg-btn lay-pg-number __active">1</strong></span><a
													href="#viewOrderList" class="lay-pg-btn lay-pg-next">다음</a><a
													href="#viewOrderList" class="lay-pg-btn lay-pg-last">맨끝</a>
											</div>
										</div>
									</form>
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