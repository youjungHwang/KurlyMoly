<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("srch_name");
	String id = request.getParameter("srch_id");
	String email = request.getParameter("srch_mail");
	
	String mUserid = ""; // 아이디
	String mPassword = ""; // 비밀번호
	
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
			sql = "SELECT m_idx, m_password FROM tb_member WHERE m_name=? AND m_userid=? AND m_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 비밀번호 찾기 성공
				mPassword = rs.getString("m_password");
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

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
							<a href="../board/delivery.html" id="brnQuickObj"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp" alt="퀄리티있게 샛별배송"></a>
						</div>
						
						<div class="side_menu">
							<a href="../../event_lovers.html" class="link_menu ">등급별 혜택</a>
							<a href="../recipe/recipe_all.html" class="link_menu ">레시피</a>
						</div>
					</div>

					<div class="section_login">
						<h3 class="tit_login">비밀번호 찾기</h3>
						<div class="layer_parent">
							<div id="certPopLayer">
								<div id="certFrameLayer">
									<iframe id="certFrame" name="certFrame" src="about:blank" scrolling="no" frameborder="0"></iframe>
								</div>
								<div id="certPopLayerBG"></div>
							</div>
						</div>
						<div class="write_form find_view">
							<form name="certForm" method="post" action="">
								<input type="hidden" name="token" value="84de5ab68edca723cfd9de45e398afd741bc3c724e47456defc3f023721e1bc8">
								<input type="hidden" name="m_id" value="<%=id%>"> <input type="hidden" name="otp" value=""> <img class="thumb" src="../../img/login/img_pw_find_email.webp" alt="이메일 찾기">
								<p class="desc">이메일로 인증 완료후<br>비밀번호를 재발급 받으세요!</p>
								<p class="info">입력하신 (<%=email%>)으로 인증번호가 발송되며, 인증 후 비밀번호가 재발급됩니다. 전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</p>
								<a href="#none" class="btn_type1" style="cursor: pointer;"><span class="txt_type">인증번호 받기</span></a>
							</form>
						</div>
					</div>

					<script>
                        // member > find_pwd_ok.html의 인증번호 받기 버튼 클릭시 alert창 뜸
                        $('.section_login .btn_type1').on('click', function (e) {
                            alert('인증번호가 고객님의 메일주소로 전송되었습니다.');
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