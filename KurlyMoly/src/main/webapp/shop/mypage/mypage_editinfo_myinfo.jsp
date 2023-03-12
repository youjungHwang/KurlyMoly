<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.member.MemberDTO"%>
<%@ page import="com.kurly.member.MemberDAO"%>
<jsp:useBean class="com.kurly.member.CouponDTO" id="coupon" />
<jsp:useBean class="com.kurly.member.CouponDAO" id="dao" />
<jsp:useBean class="com.kurly.member.MemberDTO" id="member" />
<jsp:useBean class="com.kurly.member.MemberDAO" id="daoM" />
<jsp:useBean class="com.kurly.member.PointDAO" id="daoP" />
<jsp:useBean class="com.kurly.member.PointDTO" id="point" />

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

String sql = "";
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

String m_userid = (String) session.getAttribute("m_id");
String m_password = ""; // 비밀번호
String m_name = ""; // 이름
String m_email = ""; // 이메일
String m_tel = ""; // 전화번호
String m_birth = ""; // 생년월일
String m_gender = ""; // 성별
String m_sex = "";

String m_year = "";
String m_month = "";
String m_day = "";
try {
	Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
	conn = DriverManager.getConnection(url, uid, upw);
	if (conn != null) {
		sql = "select * from tb_member where m_userid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_userid);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			m_name = rs.getString("m_name");
			m_email = rs.getString("m_email");
			m_tel = rs.getString("m_tel");
			m_birth = rs.getString("m_birth");
			m_gender = rs.getString("m_gender");
			m_year = m_birth.substring(0, 4);
			m_month = m_birth.substring(4, 6);
			m_day = m_birth.substring(6, 8);
			m_sex = m_gender;
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}
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
			<!-- 본문 시작 -->
			<div id="content">
				<div id="qnb" class="quick-navigation"
					style="top: 516px; z-index: 500;">
					<div class="bnr_qnb" id="brn_Quick">
						<a href="../board/delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
					</div>

					<div class="side_menu">
						<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
						<a href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
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
												<span class="screen_out">등급</span>
												<span class="ico_grade class0">
													<span class="ineer_grade"><span class="in_grade"> 일반</span></span>
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
												<a href="" class="total_gd">전체등급 보기</a>
											</div>
										</div>
										<ul class="list_mypage">
											<li class="user_point">
												<div class="link">
													<div class="tit">적립금</div>
													<a href="" class="info"> <%=totalPoint%> 원 <img
														src="../../img/mypage/ico_arrow_56x56.webp" alt="">
														<span class="date"> 소멸 예정 <%=sum_duepoint%>원
													</span>
													</a>
												</div>
											</li>
											<li class="user_coupon">
												<div class="link">
													<div class="tit">쿠폰</div>
													<a href="" class="info"> <%=total%> 개 <img
														src="../../img/mypage/ico_arrow_56x56.webp" alt="">
													</a>
												</div>
											</li>
											<li class="user_kurlypass">
												<div class="link">
													<div class="tit">컬리패스</div>
													<a href="" class="info">알아보기 <img
														src="../../img/mypage/ico_arrow_56x56.webp" alt="">
													</a>
												</div>
											</li>
										</ul>
									</div>
									<a href="" alt="이벤트 페이지로 이동" class="bnr_event"> <img
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
											<li><a href="./mypage_emoney.jsp">적립금</a></li>
											<li><a href="./mypage_coupon.jsp">쿠폰</a></li>
											<li class="on"><a href="./mypage_editinfo.jsp">개인 정보 수정</a></li>
										</ul>
									</div>
									<a href="" class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span>
										<p>1:1 문의하기</p>
									</a>
								</div>
								<!--=========================================== 적립금 시작 =================================-->
								<div class="page_section section_point">
									<div class="head_aticle">
										<h2 class="tit">개인 정보 수정</h2>
									</div>
									<div class="type_form member_join member_mod">
										<form name="frmMember" method="POST" id="form" action="mypage_editinfo_myinfo_ok.jsp">

											<table class="tbl_comm">
												<tbody>
													<tr class="fst">
														<th>아이디 <span class="ico"> * <span class="screen_out">필수항목</span>
														</span>
														</th>
														<td><input type="text" value="<%=m_userid%>" readonly
															class="inp_read"></td>

													</tr>
													<tr>
														<th>현재 비밀번호</th>
														<td><input type="password" name="originalPassword"
															id="originalPassword"
															onblur="checkCurrentPassword(this);return;"> <input
															type="hidden" name="originalPasswordCheck" value="1">
															<p class="txt_guide square">
																<span class="txt txt_case4 bad">현재 비밀번호를 확인해주세요</span>
															</p></td>
													</tr>
													<tr class="member_pwd">
														<th>새 비밀번호</th>
														<td><input type="password" name="newPassword"
															id="newPassword" label="새 비밀번호" option="regPass"
															maxlength="16" class="reg_pw"> <input
															type="hidden" name="newPasswordCheck" value="0">
															<p class="txt_guide square">
																<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span> 
																<span class="txt txt_case1">10자 이상 입력</span>
																<span class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며,2개 이상 조합</span> 
																<span class="txt txt_case3">동일한 숫자 3개이상 연속 사용 불가</span>
															</p></td>
													</tr>
													<tr class="member_pwd">
														<th>새 비밀번호 확인</th>
														<td><input type="password" name="confirmPassword"
															id="confirmPassword" label="새 비밀번호" option="regPass"
															maxlength="16" class="confirm_pw">
															<p class="txt_guide square">
																<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
															</p></td>
													</tr>
													<tr>
														<th>이름 <span class="ico">* <span
																class="screen_out">필수항목</span>
														</span>
														</th>
														<td><input type="text" name="name"
															value="<%=m_name%>" label="이름" placeholder="이름을 입력해주세요">
														</td>
													</tr>
													<tr>
														<th>이메일 <span class="ico">* <span
																class="screen_out">필수항목</span>
														</span>
														</th>
														<td><input type="text" name="email"
															value="<%=m_email%>" label="이메일"
															data-email="<%=m_email%>" size="30" required=""
															option="regEmail" placeholder="예: marketkurly@kurly.com"
															nblur="chkEmailChange($(this))"><!--  <input
															type="hidden" name="chk_email" required=""
															label="이메일중복체크" value="1"> <a
															href="javascript:void(0)" onclick="chkEmail()"
															class="btn default"style="width: 120px !important; display: inline-block;">중복확인</a></td> -->
													</tr>
													<tr class="field_phone">
														<th>휴대폰 <span class="ico"></span>
														</th>
														<td>
															<div class="phone_num">
																<input type="text" value="<%=m_tel%>" pattern="[0-9]*"
																	name="mobileInp" placeholder="숫자만 입력해주세요" class="inp"
																	readonly="readonly" style="display: inline-block;">
																<input type="hidden" name="mobile[]" id="mobie0"
																	value="010" required option="regNum" label="휴대폰">
																<input type="hidden" name="mobile[]" id="mobie1"
																	value="7777" required option="regNum" label="휴대폰">
																<input type="hidden" name="mobile[]" id="mobie2"
																	value="8888" required option="regNum" label="휴대폰">
																<button id="btn_cert" class="btn default" type="button"
																	style="width: 120px !important; display: inline-block;" onclick="alert('인증 확인 되었습니다.')">다른
																	번호 인증</button>
															</div>
															<div id="codeNum" class="code_num"></div>
															<p class="txt_guide">인증번호가 오지 않는다면, 통신사 스팸 차단 서비스 혹은
																휴대폰 번호 차단 여부를 확인해주세요. (마켓컬리 1644-1107)</p>
														</td> 
													</tr>
													<tr class="select_sex">
														<th>성별</th>
														<input id="sex" type="hidden" value=<%=m_sex%>>
														<td><label class> <input id='s_m'
																type="radio" name="sex" value="남자"> <span
																class="ico"></span> 남자

														</label> <label class> <input id='s_w' type="radio"
																name="sex" value="여자"> <span class="ico"></span>
																여자

														</label> <label class> <input id='s_n' type="radio"
																name="sex" value="n"> <span class="ico"></span>
																선택안함 <script>
																
																	$(document)
																			.ready(
																					function() {

																						if ($(
																								'#sex')
																								.val() == '남자') {
																							$(
																									'#s_m')
																									.prop(
																											"checked",
																											true);
																						} else if ($(
																								'#sex')
																								.val() == '여자') {
																							$(
																									'#s_w')
																									.prop(
																											"checked",
																											true);
																						} else {
																							$(
																									'#s_n')
																									.prop(
																											"checked",
																											true);
																						}

																					});
																</script> <script src="../../script/pw_validate.js"></script> <script
																	src="../../script/delivery_address.js"></script> <script
																	type="text/javascript">
																	  $(document).ready(function() {
																	    $('input[name=name]').on('keyup keydown blur', function(){
																	      preventSpecialChars($(this), 'write');
																	    });
																	
																	    $("#formSubmit .btn_submit").click(function(){
																	      $("input[type='text']").each(function(){
																	        var input_txt = $(this).val();
																	        var input_trim_txt = input_txt.replace(/(^\s*)|(\s*$)/gi, "");
																	        $(this).val(input_trim_txt);
																	      })
																	    });
																	
																	    // PRDPJ-159 장차석 : 사용자 아이디와 추처인 아이디 중복 안되도록 처리
																	    var $nameRecommid = $('[name=recommid]');
																	    var $nameMId = $('[name=m_id]');
																	    $($nameRecommid , $nameMId).blur(function(){
																	      if ($.trim($nameMId.val()) !== '' && $.trim($nameRecommid.val()) !== '' &&
																	        ($nameRecommid.val() === $nameMId.attr('data-id') || $nameRecommid.val() === $nameMId.val())) {
																	        $nameRecommid.val('');
																	        alert('추천인 아이디에는 본인 아이디를 입력할 수 없습니다.');
																	      }
																	    });
																	
																	    //개인정보처리방침
																	    function getAgreement() {
																	      jQuery.ajax({
																	        url: "/shop/service/private.php",
																	        cache: false,
																	        dataType: "html",
																	        type: "GET",
																	        contentType: 'text/html; charset=euc-kr',
																	        success: function(data) {
																	          jQuery(".agreement_box").html( jQuery(data).find('.hundred'));
																	        }
																	      });
																	    }
																	    getAgreement();
																	
																	    // 레이어 열기,닫기
																	    $('.check_view .btn_link').on('click',function(e){
																	      e.preventDefault();
																	      var $layer1 = $(this).is('.btn_agreement');
																	      var $layer2 = $(this).is('.btn_essential');
																	      var $layer3 = $(this).is('.btn_choice');
																	      var bgDimd = $('.bg_dim');
																	      var $target = $(this).parents('.reg_agree').find('.layer');
																	
																	      var $agreement = $(this).parents('.reg_agree').find('.layer_agreement');
																	      var $essential = $(this).parents('.reg_agree').find('.layer_essential');
																	      var $choice = $(this).parents('.reg_agree').find('.layer_choice');
																	      var topResult = null;
																	
																	      if($layer1 == true){
																	        bgDimd.show();
																	        $agreement.show();
																	        $essential.hide();
																	        $choice.hide();
																	        topResult = $agreement;
																	      }else if($layer2 == true){
																	        bgDimd.show();
																	        $essential.show();
																	        $agreement.hide();
																	        $choice.hide();
																	        topResult = $essential;
																	      }else if($layer3 == true){
																	        bgDimd.show();
																	        $choice.show();
																	        $essential.hide();
																	        $agreement.hide();
																	        topResult = $choice;
																	      }
																	      topResult.css({
																	        'margin-top':-topResult.height() / 2
																	      });
																	    });
																	    $('.reg_agree .btn_ok,.reg_agree .btn_close').on('click',function(e){
																	      e.preventDefault();
																	      $(this).parents('.layer').hide();
																	      $('.bg_dim').hide();
																	    });
																	
																	    // 이용약관전체동의
																	    var agree = $('.reg_agree');
																	    $('.check_agree input[name = agree_allcheck]').change(function(){
																	      if($(this).is(':checked') === true){
																	        $('.check_agree').addClass('checked')
																	        agree.find('input[type=checkbox]').attr('checked','checked');
																	        agree.find('input[type=checkbox]').prop('checked','checked');
																	        agree.find('input[type=checkbox]').val('y');
																	        $('#consentHidden').val('y');
																	      }else{
																	        $('.check_agree').removeClass('checked')
																	        agree.find('input[type=checkbox]').attr('checked','');
																	        agree.find('input[type=checkbox]').prop('checked','');
																	        agree.find('input[type=checkbox]').val('n');
																	        $('#consentHidden').val('n');
																	      }
																	    });
																	    $('.reg_agree').find('input[type=checkbox]').change(function(){
																	      if($(this).is(':checked')){
																	        $(this).parent().addClass('checked');
																	        $(this).attr('checked','checked');
																	        $(this).prop('checked','checked');
																	        $(this).val('y');
																	        if($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('y');
																	      }else{
																	        $(this).parent().removeClass('checked');
																	        $(this).attr('checked','');
																	        $(this).prop('checked','');
																	        $(this).val('n');
																	        if($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('n');
																	      }
																	      $('.reg_agree').find('input[type=checkbox]').each(function(){
																	        if($(this).is(':checked') === false){
																	          $('.label_all_check').removeClass('checked');
																	          return false;
																	        }
																	      });
																	      if($(this).attr('name') === 'marketing'){
																	        if($(this).is(':checked')){
																	          $('.email_sms').find('.check_agree').addClass('checked');
																	          $('.email_sms').find('input').attr('checked','checked');
																	          $('.email_sms').find('input').prop('checked','checked');
																	          $('.email_sms').find('input').val('y');
																	        }else{
																	          $('.email_sms').find('.check_agree').removeClass('checked');
																	          $('.email_sms').find('input').attr('checked','');
																	          $('.email_sms').find('input').prop('checked','');
																	          $('.email_sms').find('input').val('n');
																	        }
																	      }
																	      if($(this).attr('name') === 'mailling' || $(this).attr('name') === 'sms'){
																	        var emailSmsCount = 0;
																	        $(this).parents('.email_sms').find('input').each(function(){
																	          if($(this).is(':checked')) emailSmsCount++;
																	        });
																	        if(emailSmsCount === 2){
																	          $('input[name=marketing]').parent().addClass('checked');
																	          $('input[name=marketing]').attr('checked','checked');
																	          $('input[name=marketing]').prop('checked','checked');
																	        }else{
																	          $('input[name=marketing]').parent().removeClass('checked');
																	          $('input[name=marketing]').attr('checked','');
																	          $('input[name=marketing]').prop('checked','');
																	        }
																	      }
																	
																	      // 전체동의
																	      if($('.reg_agree').find('.checked').length >= 7){
																	        $('.check_agree input[name = agree_allcheck]').parent().addClass('checked');
																	        $('.check_agree input[name = agree_allcheck]').prop('checked','checked');
																	      }else{
																	        $('.check_agree input[name = agree_allcheck]').parent().removeClass('checked');
																	        $('.check_agree input[name = agree_allcheck]').prop('checked','');
																	      }
																	    });
																	
																	    function inputFocus() {
																	      $('#form input').focus(function () {
																	        var element = $(this);
																	        if (element.offset().top - $(window).scrollTop() < 80)
																	        {
																	          $('html, body').animate({
																	            scrollTop: element.offset().top - 80
																	          }, 0);
																	        }
																	      });
																	    }
																	    inputFocus();
																	
																	
																	    // 글자 갯수확인 + 문장조합확인
																	    var checkType1 = false;// 갯수
																	    var checkType2 = false;// 문자
																	    var checkType3 = false;// 문자만
																	    function check_confirm(characterReg, minNum){
																	      if(characterReg.length < minNum){
																	        checkType1 = false;
																	      }else{
																	        checkType1 = true;
																	      }
																	
																	      var checkNumber = characterReg.search(/[0-9]/g); // 숫자
																	      var checkEnglish = characterReg.search(/[a-zA-Z]/ig); // 대소문자
																	      var checkSpecial = characterReg.search(/[~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 특수문자
																	      var checkAscii = characterReg.search(/[^a-zA-Z0-9~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 아스키 특수문자
																	
																	      if(checkNumber >= 0 && checkEnglish >= 0 && checkAscii === -1) {
																	        checkType2 = true;
																	        checkType3 = true;
																	        if(checkSpecial !== -1) checkType3 = false;
																	      }else if(checkNumber >= 0 && checkSpecial !== -1 && checkAscii === -1){
																	        checkType2 = true;
																	        checkType3 = false;
																	      }else if(checkEnglish >= 0 && checkSpecial !== -1 && checkAscii === -1) {
																	        checkType2 = true;
																	        checkType3 = false;
																	      }else if( checkEnglish >= 0 && checkSpecial === -1 && checkAscii === -1) {
																	        checkType3 = true;
																	        if (checkNumber === -1) checkType2 = false;
																	      }else{
																	        checkType2 = false;
																	        checkType3 = false;
																	      }
																	    }
																	
																	
																	    // 아이디검증
																	    var saveId;
																	    $('[name=m_id]').on('focus',function(){
																	      saveId = $(this).val();
																	      $(this).parent().find('.txt_guide').show();
																	    });
																	    $('[name=m_id]').on('keyup', function(){
																	      var $target = $(this).parent().find('.txt_guide');
																	      var $chkVal =  $(this).val();
																	      var $numMin = 6;
																	      if(saveId !== $chkVal) class_change($target.eq(1),'bad');// 중복확인후 수정될때
																	      check_confirm($chkVal,$numMin);
																	      if(checkType1 === true && checkType3 === true){
																	        class_change($target.find('.txt_case1'), 'good');
																	        $(this).attr('data-validator',"true");
																	      }else{
																	        class_change($target.find('.txt_case1'),'bad');
																	        $(this).attr('data-validator',"false");
																	      }
																	    });
																	
																	    // 비밀번호검증
																	    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('focus',function(){
																	      $(this).parent().find('.txt_guide').show();
																	    });
																	    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('blur', function () {
																	      if ($(this).parent().find('.txt').hasClass('bad') || $.trim($(this).val()) === "" ){
																	        if (!$(this).hasClass('bad')) $(this).addClass('bad');
																	      } else {
																	        if ($(this).hasClass('bad')) $(this).removeClass('bad')
																	      }
																	    });
																	    $('input[name=password2], [name=confirmPassword]').on('keyup', function(){
																	      var $target = $(this).parent().find('.txt_guide');
																	
																	      if( ( $("[name=password]").val() === $('[name=password2]').val() && $.trim($("[name=password]").val()) != "") || ( $("[name=newPassword]").val() === $('[name=confirmPassword]').val() && $.trim($("[name=newPassword]").val()) != "") ) {
																	        class_change($target.find('.txt_case1'),'good');
																	      }else{
																	        class_change($target.find('.txt_case1'),'bad');
																	      }
																	    });
																	
																	    $('input[name=password], [name=newPassword]').on('keyup', function(e){
																	      var $target = $(this).parent().find('.txt_guide');
																	      var $chkVal =  $(this).val();
																	      var $numMin = 10;
																	
																	      check_confirm($chkVal,$numMin);
																	
																	      if(checkType1 === false && checkType2 === false){
																	        class_change($target.find('.txt_case1'),'bad');
																	        class_change($target.find('.txt_case2'),'bad');
																	      }
																	      if(checkType1 === true && checkType2 === false){
																	        class_change($target.find('.txt_case1'),'good');
																	        class_change($target.find('.txt_case2'),'bad');
																	      }
																	      if(checkType1 === false && checkType2 === true){
																	        class_change($target.find('.txt_case1'),'bad');
																	        class_change($target.find('.txt_case2'),'good');
																	      }
																	      if(checkType1 === true && checkType2 === true){
																	        class_change($target.find('.txt_case1'),'good');
																	        class_change($target.find('.txt_case2'),'good');
																	      }
																	
																	      var hasThreeOrMoreConsecutiveNumbers = pwValidate.hasThreeOrMoreConsecutiveNumbers($chkVal)
																	      if (hasThreeOrMoreConsecutiveNumbers) {
																	        class_change($target.find('.txt_case3'),'bad');
																	      } else {
																	        class_change($target.find('.txt_case3'),'good');
																	      }
																	
																	      if($(this).attr('id') == 'newPassword'){
																	        if($('[name=originalPassword]').val() == $('[name=newPassword]').val() ){
																	          class_change($target.find('.txt_case4'),'bad');
																	        }else{
																	          class_change($target.find('.txt_case4'),'good');
																	        }
																	        $('[name=confirmPassword]').trigger('keyup');
																	        var newPasswordCheckNum = 0;
																	        $target.find('.txt').each(function(){
																	          if($(this).hasClass('good')) newPasswordCheckNum++;
																	          $('[name=newPasswordCheck]').val(newPasswordCheckNum);
																	        });
																	      }else{
																	        $('[name=password2]').trigger('keyup');
																	      }
																	    });
																	
																	    $("#selectRecommend label").on('click', function (e) {
																	      var target = $(e.target)
																	      var wrapper = target.closest('.group_radio')
																	
																	      var inputOptions = wrapper.find('label')
																	      var targetInput = target.closest('.radio_wrapper').find('label')
																	
																	      var selectOptionId = targetInput.find('input').attr('id')
																	      var inputWrapper = wrapper.siblings('.input_wrapper')
																	      var textBox = inputWrapper.find('input')
																	      var defaultMessage = {
																	        'recommendId': '추천인 아이디를 입력해주세요.',
																	        'eventName': '참여 이벤트명을 입력해주세요.'
																	      }
																	      var placeholderMessage = defaultMessage[selectOptionId]
																	
																	      // 라디오버튼 토글
																	      inputOptions.not(targetInput).removeClass('checked')
																	      targetInput.addClass('checked')
																	
																	      // 기존 텍스트 리셋
																	      textBox.val("")
																	
																	      // placeholder 텍스트 변경
																	      textBox.attr('placeholder', placeholderMessage)
																	
																	      // input name, value값 변경
																	      var nameOptions = {
																	        'recommendId': 'recommid',
																	        'eventName': 'ex2'
																	      }
																	      textBox.attr('id', nameOptions[selectOptionId])
																	      inputWrapper.addClass('selected')
																	    })
																	  });
																	
																	  // 클래스변경
																	  function class_change(obj,state){
																	    if(state === 'good') {
																	      if (obj.hasClass('bad')) obj.removeClass('bad');
																	      obj.addClass('good');
																	    }else{
																	      if(obj.hasClass('good')) obj.removeClass('good');
																	      obj.addClass('bad');
																	    }
																	  }
																	
																	  // 중복확인
																	  function chkId()
																	  {
																	    var alertMsg = "아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다";
																	    var $target = $("[name='m_id']").parent().find('.txt_case2');
																	    var id_txt = $("[name='m_id']").val();
																	    var id_trim_txt = id_txt.replace(/(^\s*)|(\s*$)/gi, "");
																	    $("input[name='m_id']").val(id_trim_txt);
																	    var form = document.frmMember;
																	    if ($("input[name='m_id']").val() === "") {
																	      alert("아이디를 입력해 주세요.");
																	      return;
																	    }
																	    if($("input[name='m_id']").val().length < 6){alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다");return;}
																	    if (!chkText(form.m_id,form.m_id.value,"아이디를 입력해주세요")) return;
																	    var idPattern = /^[a-zA-Z0-9]{1}[^"']{3,15}$/; // chkPatten 메소드에서 가져옴
																	    var isValidId = eval(idPattern);
																	    if (!isValidId.test(form.m_id.value)) {
																	      alert(alertMsg);
																	      return;
																	    }
																	    var $idValidator = $("[name='m_id']").attr('data-validator');
																	    if($idValidator === "false"){
																	      $("[name=chk_id]").val('');
																	      alert(alertMsg);
																	      if($target.hasClass('good')) $target.removeClass('good');
																	      $target.addClass('bad');
																	    }else{
																	      ifrmHidden.location.href = "indb.php?mode=chkId&m_id=" + form.m_id.value;
																	    }
																	  }
																	  function chkId2(num){
																	    var $target = $("[name='m_id']").parent().find('.txt_case2');
																	    var id_txt = $("[name='m_id']").val();
																	    if(num == 1){
																	      if($target.hasClass('bad')) $target.removeClass('bad');
																	      $target.addClass('good');
																	      $("[name='m_id']").attr('data-id',id_txt);
																	    }else{
																	      if($target.hasClass('good')) $target.removeClass('good');
																	      $target.addClass('bad');
																	    }
																	  }
																	
																	  //
																	  function chkEmailChange($target){
																	    if($target.val() === $target.data('email') && $target.val().trim() !== ''){
																	      $('[name=email]').val('1');
																	    }else{
																	      $('[name=email]').val('0');
																	    }
																	  }
																	  // 이메일 중복확인
																	  function chkEmail()
																	  {
																	    var email_txt = $("input[name='email']").val();
																	    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
																	    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
																	    $("input[name='email']").val(trim_txt)
																	    if ($("input[name='email']").val() === "") {
																	      alert("이메일 주소를 입력해 주세요.");
																	      $('[name=chk_email]').val('0');
																	      return false;
																	    }
																	    if(email_regex.test(trim_txt) === false) {
																	      alert("잘못된 이메일 형식입니다.");
																	      $('[name=chk_email]').val('0');
																	      return false;
																	    }
																	
																	    var form = document.frmMember;
																	    if (!chkText(form.email,form.email.value,"이메일을 입력해주세요")){
																	      $('[name=chk_email]').val('0');
																	      return;
																	    }
																	    if (!chkPatten(form.email,form.email.getAttribute('option'),"정상적인 이메일 주소를 입력해주세요.")){
																	      $('[name=chk_email]').val('0');
																	      return;
																	    }
																	
																	    $('[name=chk_email]').val('1');
																	
																	    var chkUrl = "indb.php?mode=chkEmail&email=" + form.email.value + "&m_id=";
																	    chkUrl += form.m_id.value; // KM-1564 가입시는 id체킹 필요없음
																	    ifrmHidden.location.href = chkUrl;
																	  }
																	
																	  $("input[name='mobileInp']").change(function() {
																	    $("input[name='check_mobile']").val("0");
																	  });
																	
																	  // 생년월일 입력시 폼 포커스 이벤트
																	  $('.birth_day input').focus(function(){
																	    $(this).parent().addClass('on');
																	  }).keyup(function(){
																	    var inputText = $(this).val();
																	    var number = $(this).val().replace(/[^0-9]/g,'');
																	    $(this).val(number);
																	  }).blur(function(){
																	    $(this).parent().removeClass('on');
																	    // KM-1261 회원가입 14세 인증
																	    birthCheckAction.validatorText();
																	  });
																	
																	
																	  // 현재 비밀번호 확인
																	  function checkCurrentPassword(el) {
																	    var currentPassword = $(el).val();
																	    var errorMessage = $(el).parent().find(".txt_guide");
																	    if (currentPassword.trim() === "") {
																	      errorMessage.hide();
																	      $('[name=originalPasswordCheck]').val('1');
																	      return false;
																	    }
																	    var req = {password:currentPassword};
																	    kurlyApi({
																	      method:'post',
																	      // url:'/v1/users/check/password',
																	      url:'/v3/auth/check-password',
																	      data:req
																	    }).then(function (response) {
																	      if(response.status === 204){
																	        errorMessage.hide();
																	        $('[name=originalPasswordCheck]').val('1');
																	        return true;
																	      }else{
																	        errorMessage.show();
																	        $('[name=originalPasswordCheck]').val('0');
																	        return false;
																	      }
																	    }.bind(this)).catch(function(err){
																	      errorMessage.show();
																	      $('[name=originalPasswordCheck]').val('0');
																	      return false;
																	    });
																	  }
																	
																	  function chkForm2(f) {
																	    if($('[name=originalPasswordCheck]').val() === '0'){
																	      alert('현재 비밀번호를 확인해주세요', function(){
																	        $('[name=originalPassword]').focus();
																	      });
																	      return false;
																	    }
																	
																	    if($('#originalPassword').val() != "" || $('#newPassword').val() != "" || $('#confirmPassword').val() != ""){
																	      if($('[name=newPasswordCheck]').val() < 4){
																	        alert('새 비밀번호를 확인해주세요', function(){
																	          $("[name=newPassword]").focus();
																	        });
																	        return false;
																	      }
																	      if($('#confirmPassword').val() != $('#newPassword').val()){
																	        alert('새 비밀번호 확인을 확인해주세요', function(){
																	          $('#confirmPassword').focus();
																	        });
																	        return false;
																	      }
																	    }
																	
																	    if($('[name=chk_email]').val() !== '1'){
																	      alert('이메일 중복확인을 확인해주세요', function(){
																	        $('[name=email]').focus();
																	      });
																	      return false;
																	    }
																	
																	    if(! preventSpecialChars($('input[name=name]'), 'result')){
																	      return false;
																	    }
																	
																	    if ($("input[name='check_mobile']").val() !== "1")
																	    {
																	      alert("휴대폰 인증을 완료해 주세요.", function () {
																	        $('#btn_cert').focus();
																	      });
																	      return false;
																	    }
																	
																	
																	    var email_txt = $("input[name='email']").val();
																	    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
																	    var email_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
																	    $("input[name='email']").val(trim_txt)
																	    if(email_regex.test(trim_txt) === false) {
																	      alert('잘못된 이메일 형식입니다.', function () {
																	        $('input[name=email]').focus();
																	      });
																	      return false;
																	    }
																	
																	    // KM-1261 회원가입 14세 인증
																	    if(! birthCheckAction.validatorForm()){
																	      return false;
																	    }
																	
																	    if (chkForm(f) === false) {
																	      return false;
																	    }
																	    return true;
																	  }
																	
																	  $(document).ready(function() {
																	    // 추천인 자동 설정
																	    var recommRegExp = new RegExp("recommid=([^&]+)", "i");
																	    var match = location.search.match(recommRegExp);
																	    if(match !== null && match.length === 2) {
																	      $('#labelRecomm').click();
																	      $('input[name=recommid]').val("");
																	    }
																	  });
																	
															
															  // KM-1483 Amplitude
													</script>
														</label></td>
													</tr>
													<tr class="birth field_birth">
														<th>생년월일</th>
														<td>
															<div class="birth_day">
																<input type="text" name="birth_year" id="birth_year"
																	pattern="[0-9]*" value="<%=m_year%>" label="생년월일"
																	size="4" maxlength="4" placeholder="YYYY"> <span
																	class="bar"></span> <input type="text"
																	name="birth_month" id="birth_month" pattern="[0-9]*"
																	value="<%=m_month%>" label="생년월일" size="2"
																	maxlength="2" placeholder="MM"> <span
																	class="bar"></span> <input type="text" name="birth_day"
																	id="birth_day" pattern="[0-9]*" value="<%=m_day%>"
																	label="생년월일" size="2" maxlength="2" placeholder="DD">
															</div>
															<!-- <p class="txt_guide">
																<span class="txt bad"> 태어난 일을 정확하게 입력해주세요 </span>
															</p> -->
														</td>
													</tr>
													<tr>
														<th>선택약관 동의</th>
														<td class="reg_agree">
															<div class="check_view">
																<input type="hidden" name="consent[1]"
																	id="consentHidden" value="n"> <label
																	class="label_block check_agree"> <input
																	type="checkbox" name="hiddenCheck" value="n"
																	checked="checked"> <span class="ico"></span>
																	개인정보 수집·이용 동의 <span class="sub">(선택)</span>
																</label> <a href="#none" class="link btn_link btn_choice">약관보기
																</a>
															</div>
															<div class="layer layer_choice"
																style="display: none; margin-top: -151.5px;">
																<div class="inner_layer">
																	<div class="in_layer">
																		<h4 class="tit_layer">
																			개인정보 수집·이용 동의 <span class="sub">(선택)</span>
																		</h4>
																		<div class="box_tbl">
																			<table>
																				<caption class="screen_out">개인정보의 수집 및
																					이용목적</caption>
																				<thead>
																					<tr>
																						<th scope="row" class="tit1">수집 목적</th>
																						<th scope="row" class="tit2">수집 항목</th>
																						<th scope="row" class="tit3">보유 기간</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td>맞춤형 회원 서비스 제공</td>
																						<td>성별, 생년월일</td>
																						<td class="emph">회원 탈퇴 <br> 즉시 파기
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<p class="txt_service">동의를 거부하시는 경우에도 서비스는 이용하실 수
																			있습니다.</p>
																	</div>
																	<button type="button" class="btn_ok">
																		<span class="txt_type">확인</span>
																	</button>
																	<button type="button" class="btn_close">
																		<span class="screen_out">레이어 닫기</span>
																	</button>
																</div>
															</div>
														</td>
													</tr>

													<tr style="display: none"></tr>
													<tr class="reg_agree">
														<th>이용약관동의 <span class="ico">* <span
																class="screen_out">필수항목</span>
														</span>
														</th>
														<td style="border-top: 1px solid #333;">
															<div class="bg_dim"></div> <!-- 약관 보기용 회색배경 -->
															<div class="check_view">
																<label class="label_block check_agree"> <input
																	type="checkbox" name="marketing" value="n"
																	checked="checked"> <span class="ico"></span>
																	무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
																</label>
																<div class="check_event email_sms">
																	<label class="label_block check_agree"> <input
																		type="checkbox" name="sms" value="n" checked="checked">
																		<span class="ico"></span> SMS
																	</label> <label class="label_block check_agree"> <input
																		type="checkbox" name="mailing" value="n"
																		checked="checked"> <span class="ico"></span>
																		이메일
																	</label>
																</div>
															</div>
															<div class="layer layer_choice"
																style="display: none; margin-top: -153.5px;">
																<div class="inner_layer">
																	<div class="in_layer">
																		<h4 class="tit_layer">
																			개인정보 수집·이용 동의 <span class="sub">(선택)</span>
																		</h4>
																		<div class="box_tbl">
																			<table cellpadding="0" cellspacing="0" width="100%">
																				<caption class="screen_out">개인정보의 수집 및
																					이용목적</caption>
																				<thead>
																					<tr>
																						<th scope="row" class="tit1">수집 목적</th>
																						<th scope="row" class="tit2">수집 항목</th>
																						<th scope="row" class="tit3">보유 기간</th>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td>맞춤형 회원 서비스 제공</td>
																						<td>성별, 생년월일</td>
																						<td class="emph">회원 탈퇴<br> 즉시 파기
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																		<p class="txt_service">동의를 거부하시는 경우에도 서비스는 이용하실 수
																			있습니다.</p>
																	</div>
																	<button type="button" class="btn_ok">
																		<span class="txt_type">확인</span>
																	</button>
																	<button type="button" class="btn_close">
																		<span class="screen_out">레이어 닫기</span>
																	</button>
																</div>
															</div>
														</td>
													</tr>
												</tbody>

											</table>
											<div id="formsubmit" class="form_footer">

												<a href="../../shop/mypage/mypage_editinfo_hack.jsp"
													class="btn default"
													style="width: 120px !important; display: inline-block;">탈퇴하기</a>
												<button type="submit" class="btn active"
													style="width: 120px !important; display: inline-block;">회원정보수정</button>
											</div>
										</form>
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
		<div class="footerLine"></div>
		<footer id="footer">
			<div class="inner_footer">
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
							<a href="../mypage/mypage_qna_register.html" class="tit">1:1
								문의</a>
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
						<li><a class="link"
							href="https://marketkurly.recruiter.co.kr/appsite/company/index"
							target="_blank">인재채용</a></li>
						<li><a class="link" href="#">이용약관</a></li>
						<li><a class="link" href="#">개인정보처리방침</a></li>
						<li><a class="link" href="#">이용안내</a></li>
					</ul>
					<p>
						법인명 (상호) : 주식회사 컬리 <span class="bar">|</span> 사업자등록번호 :
						261-81-23567 <a
							href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2618123567&apv_perm_no="
							class="link" target="_blank">사업자정보 확인</a><br> 통신판매업 : 제
						2018-서울강남-01646 호 <span class="bar">|</span> 개인정보보호책임자 : 이원준<br>
						주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F <span class="bar">|</span> 대표이사
						: 김슬아<br> 입점문의 : <a
							href="https://forms.gle/oKMAe1SaicqMX3SC9" target="_blank"
							class="link">입점문의하기</a> <span class="bar">|</span> 제휴문의 : <a
							href="mailto:business@kurlycorp.com" class="link">business@kurlycorp.com</a><br>
						채용문의 : <a href="mailto:recruit@kurlycorp.com" class="link">recruit@kurlycorp.com</a><br>
						팩스: 070 - 7500 - 6098 <span class="bar">|</span> 이메일 : <a
							href="mailto:help@kurlycorp.com" class="link">help@kurlycorp.com</a>
					<p class="copy">© KURLY CORP. ALL RIGHTS RESERVED</p>
					</p>
					<ul class="list_sns">
						<li><a href="https://instagram.com/marketkurly"
							class="link_sns" target="_blank"><img
								src="../../img/sns/ico_instagram.webp" alt="마켓컬리 인스타그램 바로가기"></a></li>
						<li><a href="https://www.facebook.com/marketkurly"
							class="link_sns" target="_blank"><img
								src="../../img/sns/ico_fb.webp" alt="마켓컬리 페이스북 바로가기"></a></li>
						<li><a href="http://blog.naver.com/marketkurly"
							class="link_sns" target="_blank"><img
								src="../../img/sns/ico_blog.webp" alt="마켓컬리 네이버블로그 바로가기"></a></li>
						<li><a href="https://m.post.naver.com/marketkurly"
							class="link_sns" target="_blank"><img
								src="../../img/sns/ico_naverpost.webp" alt="마켓컬리 네이버포스트 바로가기"></a></li>
						<li><a
							href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg"
							class="link_sns" target="_blank"><img
								src="../../img/sns/ico_youtube.webp" alt="마켓컬리 유튜브 바로가기"></a></li>
					</ul>
				</div>
			</div>
			<div class="footer_link">
				<div class="authentication">
					<a href="#" class="mark"> <img
						src="../../img/sns/logo_isms.webp" alt="isms 로고" class="logo">
						<p class="txt">
							[인증범위] 마켓컬리 쇼핑몰 서비스 개발 · 운영<br>[유효기간] 2019.04.01 ~
							2022.03.31
						</p>
					</a> <a href="#" class="mark"> <img
						src="../../img/sns/logo_eprivacyplus.webp" alt="eprivacy plus 로고"
						class="logo">
						<p class="txt">
							개인정보보호 우수 웹사이트 ·<br>개인정보처리시스템 인증 (ePRIVACY PLUS)
						</p>
					</a> <a href="#" class="mark lguplus"> <img
						src="../../img/sns/logo_payments.webp" alt="payments 로고"
						class="logo">
						<p class="txt">
							고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>토스 페이먼츠 구매안전(에스크로)
							서비스를 이용하실 수 있습니다.
						</p>
					</a>
				</div>
			</div>
		</footer>
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