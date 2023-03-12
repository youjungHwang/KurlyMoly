<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("srch_name");
	String email = request.getParameter("srch_mail");
	
	String mUserid = ""; // 아이디
	
	// DB 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mysql://localhost:3306/kurlymoly";
	String uid = "root";
	String upw = "1234";
	
	try {
		Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
		conn = DriverManager.getConnection(url, uid, upw);
		if (conn != null) {
			sql = "SELECT m_idx, m_userid FROM tb_member WHERE m_name=? AND m_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 아이디 찾기 성공
				mUserid = rs.getString("m_userid");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

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
							<a href="../board/delivery.jsp" id="brnQuickObj"><img
								class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"
								alt="퀄리티있게 샛별배송"></a>
						</div>

						<script>
                            var brnQuick = {
                                nowTime: '1615472599247',
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
							<a href="../../event_lovers.jsp" class="link_menu ">등급별 혜택</a> <a
								href="../recipe/recipe_all.jsp" class="link_menu ">레시피</a>
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
							<img class="thumb"
								src="https://res.kurly.com/pc/service/member/1908/img_id_find_succsess_v2.png"
								alt="아이디찾기완료">
							<p class="desc">
								고객님의<br>아이디 찾기가 완료되었습니다!
							</p>
							<p class="info">아이디 : <%=mUserid%></p>
							<a href="./login.jsp" class="btn_type1"><span
								class="txt_type">로그인 하기</span></a>
						</div>
					</div>
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