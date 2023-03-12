<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 회원 탈퇴 페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <link href="../../css/jsScript.css" rel="stylesheet" type="text/css">

    <script src="../../script/script.js"></script>
    <script src="../../script/MJscript.js"></script>
    
    <style>
        h4 {
            margin-block-end: 0em;
        }

        .member_join {
            padding-bottom: 0px;
        }
    </style>
</head>

<body>
	<!-- container 시작 -->
	<div id="container">
		<%@ include file="../include/header.jsp"%>
		<!-- main 시작 -->
        <div id="main">
            <!-- 본문 시작 -->
            <div id="content">
                <div id="qnb" class="quick-navigation"
					style="top: 516px; z-index: 500;">
					<div class="bnr_qnb" id="brn_Quick">
						<a href="../board/delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
					</div>

					<div class="side_menu">
						<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a> <a
							href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
					</div>
				</div>

                <!--=============================== mypage_회원 탈퇴안내 시작 =================================-->
                <div class="page_aticle">
                    <div class="type_form member_join member_hack">
                        <div class="field_head">
                            <h3 class="tit">회원탈퇴안내</h3>
                            <p class="sub"></p>
                        </div>
                        <form method="post" action="hack_ok.jsp" onsubmit="return chk_hackfm( this );" id="form">
                            <input type="hidden" name="act" value="Y">
                            <table class="tbl_comm">
                                <tbody>
                                    <tr>
                                        <th>
                                            회원탈퇴안내
                                        </th>
                                        <td class="info">
                                            고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극
                                            반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
                                            <strong class="emph">아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</strong>
                                            1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보
                                            보호정책에따라 관리 됩니다.<br>
                                            2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.<br>
                                            3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.<br>
                                            4. 회원 탈퇴 시 컬리패스 해지는 별도로 고객행복센터(1644-1107)를 통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가
                                            되지 않습니다.
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            비밀번호 확인
                                        </th>
                                        <td>
                                            <input type="password" name="password" size="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>무엇이 불편하였나요?</th>
                                        <td>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="01">
                                                <span class="ico"></span>고객서비스(상담,포장 등) 불만
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="02">
                                                <span class="ico"></span>배송불만
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="03">
                                                <span class="ico"></span>교환/환불/반품 불만
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="04">
                                                <span class="ico"></span>방문 빈도가 낮음
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="05">
                                                <span class="ico"></span>상품가격 불만
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="06">
                                                <span class="ico"></span>개인 정보유출 우려
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="07">
                                                <span class="ico"></span>쇼핑몰의 신뢰도 불만
                                            </label>
                                            <label class="label_block">
                                                <input type="checkbox" name="outComplain" value="08">
                                                <span class="ico"></span>쇼핑 기능 불만
                                            </label>
                                            <textarea name="outComplain_text" rows="8" class="box"
                                                placeholder="고객님의 진심어린 충고 부탁드립니다."></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div id="formSubmit" class="form_footer">
                                <button type="button" onclick="history.back();" class="btn default">취소</button>
                                <button type="submit" class="btn active">탈퇴</button>
                            </div>
                        </form>
                    </div>
                    <script>
                        /*-------------------------------------
                         탈퇴신청 체크
                        -------------------------------------*/
                        function chk_hackfm(fobj) {

                            if (fobj.password.value == '') {
                                alert('비밀번호를 입력하여 주십시요.');
                                fobj.password.focus();
                                return false;
                            }

                            var outComp = fobj["outComplain[]"].length;
                            var cont = fobj.outComplain_text;
                            var ckS = 0;

                            for (i = 0; i < outComp; i++) {

                                if (fobj["outComplain[]"][i].checked == true) break;
                                else ckS++;
                            }

                            if (ckS == outComp) {

                                alert('서비스불편사항을 1개이상 체크하여 주십시요. \n\n 해당사항은 개선사항에 반영되어집니다.');
                                return false;
                            }

                            if (!confirm('회원탈퇴를 하시면 회원님의 모든 데이타( 개인정보, 포인트 등 )가 삭제 되어집니다. \n 그래도 회원을 탈퇴하시겠습니까?')) {
                                return false;
                            }

                            return true;
                        }

                        // KM-1483 Amplitude
                        KurlyTracker.setScreenName('leave');
                    </script>
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