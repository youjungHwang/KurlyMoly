<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 비밀번호 찾기 N -->
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

					<div class="section_login">
						<h3 class="tit_login">비밀번호 찾기</h3>
						<div class="write_form find_view">
							<form method="post" id="form" name="fm" action="find_pwd_ok.jsp" onsubmit="return chkForm(this);">
								<input type="hidden" name="act" value="Y">
								<input type="hidden" name="rncheck" value="none">
								<input type="hidden" name="dupeinfo" value="">
								<strong class="tit_label">이름</strong> <input name="srch_name" type="text" size="29" required="" label="이름" tabindex="2">
								<strong class="tit_label">아이디</strong> <input name="srch_id" value="" type="text" size="29" required="" label="아이디" tabindex="2">
								<p></p>
								<strong class="tit_label">이메일</strong> <input name="srch_mail" type="text" size="29" required="" label="메일주소" tabindex="5">
								<p></p>
								<button type="submit" class="btn_type1">
									<span class="txt_type">찾기</span>
								</button>
							</form>
						</div>
					</div>

					<script>
                        $(".section_login input[type='submit']").click(function () {
                            $("input[type='text']").each(function () {
                                var input_txt = $(this).val();
                                var input_trim_txt = input_txt.replace(/(^\s*)|(\s*$)/gi, "");
                                $(this).val(input_trim_txt);
                            })
                        });
                    </script>
				</div>
				<!-- 본문 종료 -->
			</div>
			<!-- main 종료 -->

			<!-- footer 시작 -->
			<%@ include file="../include/footer.jsp"%>
			<!-- footer 종료 -->
		</div>
		<!-- container 종료 -->
	</div>
</body>

</html>