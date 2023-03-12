<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 아이디 찾기 N -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link href="../../css/style.css" rel="stylesheet" type="text/css">
	<link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
	<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
	
	<script src="../../script/script.js"></script>
	<script src="../../script/MJscript.js"></script>
</head>

<body>
	<div id="wrap" class="">
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="../include/header.jsp"%>
			<!-- main 시작 -->
			<div id="main">
				<!-- 본문 시작 -->
				<div id="content" style="padding-bottom: 120px;">
					<div id="qnb" class="quick-navigation" style="top: 70px;">
						<div class="bnr_qnb" id="brnQuick">
							<a href="../board/delivery.jsp" id="brnQuickObj"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp" alt="퀄리티있게 샛별배송"></a>
						</div>

						<div class="side_menu">
							<a href="../../event_lovers.jsp" class="link_menu ">등급별 혜택</a>
							<a href="../recipe/recipe_all.jsp" class="link_menu ">레시피</a>
						</div>
					</div>

					<script>
                        function goIDCheckIpin() {
                            var fm;
                            fm = document.getElementById("form");
                            var popupWindow = window.open("", "popupCertKey", "width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no");
                            return;
                        }

                        function gohpauthDream() { //휴대폰본인인증
                            var protocol = location.protocol;
                            var callbackUrl = "https://www.kurly.com/shop/member/hpauthDream/hpauthDream_Result.php";
                            ifrmHpauth.location.href = protocol + "//hpauthdream.godo.co.kr/module/NEW_hpauthDream_Main.php?callType=findid&shopUrl=" + callbackUrl + "&cpid=";
                            return;
                        }
                    </script>

					<div class="section_login">
						<h3 class="tit_login">아이디 찾기</h3>
						<div class="write_form find_view">
							<form id="form" name="fm" method="post" action="find_id_ok.jsp" onsubmit="return chkForm(this);">
								<input type="hidden" name="act" value="Y">
								<input type="hidden" name="rncheck" value="none">
								<input type="hidden" name="dupeinfo" value="">
								<strong class="tit_label">이름</strong> <input type="text" name="srch_name" tabindex="2" size="29" required="required" placeholder="고객님의 이름을 입력해주세요">
								<strong class="tit_label">이메일</strong> <input type="text" name="srch_mail" size="29" tabindex="5" required="required" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
								<button type="submit" class="btn_type1">
									<span class="txt_type">확인</span>
								</button>
							</form>
						</div>
					</div>
				</div>
				<!-- 본문 종료 -->
			</div>
			<!-- main 종료 -->

			<script>
				(function(theFrame) {
					theFrame.contentWindow.location.href = theFrame.src;
				}(document.getElementById("ifrmHidden")));
			</script>
			<script src="../../script/customeEvent.js"></script>
			<script>
				window.addEventListener(
								'load',
								function() {
									// KM-1238 branch
									(function(b, r, a, n, c, h, _, s, d, k) {
										if (!b[n] || !b[n]._q) {
											for (; s < _.length;)
												c(h, _[s++]);
											d = r.createElement(a);
											d.async = 1;
											d.src = "https://cdn.branch.io/branch-latest.min.js";
											k = r.getElementsByTagName(a)[0];
											k.parentNode.insertBefore(d, k);
											b[n] = h
										}
									})
											(
													window,
													document,
													"script",
													"branch",
													function(b, r) {
														b[r] = function() {
															b._q
																	.push([ r,
																			arguments ])
														}
													},
													{
														_q : [],
														_v : 1
													},
													"addListener applyCode autoAppIndex banner closeBanner closeJourney creditHistory credits data deepview deepviewCta first getCode init link logout redeem referrals removeListener sendSMS setBranchViewData setIdentity track validateCode trackCommerceEvent logEvent disableTracking"
															.split(" "), 0);
									var BRANCHKEY = 'key_live_meOgzIdffiVWvdquf7Orkacksxa2LneN';
									if (!webStatus.is_release_build) {
										BRANCHKEY = 'key_test_joIkrHgomhL3qaEreXL5QdigzEn6Ucd4';
									}
									branch.init(BRANCHKEY);
									branch.setIdentity(uuidCheck);
									branch.track("pageview");

									// branchReady
									var _eventBranchReady = new CustomEvent(
											"branchReady", {
												detail : { // 전달 할께 있으면 반드시 detail 오브젝트에 넣어야 함
													val : '1',
												}
											});
									document.dispatchEvent(_eventBranchReady);
									// END branchReady
								}, false);
			</script>
			<script type="text/javascript">
				window.NREUM || (NREUM = {});
				NREUM.info = {
					"beacon" : "bam.nr-data.net",
					"licenseKey" : "NRJS-5dec146893a58b07e31",
					"applicationID" : "602251426",
					"transactionName" : "MlZUZhdUXkoCAkBQDQscY0AMGkNRDBEbVAcIUVNASlNZVwc+XV1MFVtG",
					"queueTime" : 0,
					"applicationTime" : 48,
					"atts" : "HhFXEF9OTUQ=",
					"errorBeacon" : "bam.nr-data.net",
					"agent" : ""
				}
			</script>

			<!-- footer 시작 -->
			<%@ include file="../include/footer.jsp"%>
			<!-- footer 종료 -->
		</div>
		<!-- container 종료 -->
	</div>
</body>

</html>