<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
   Cookie[] cookies = request.getCookies(); 
   String userid = null; 
   
   if(cookies !=null) {
	   for(Cookie cookie : cookies){
		   if("userid".equals(cookie.getName())){
			   userid = cookie.getValue(); // admin
		   }
	   }
   }
   %>
   
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="./script/script.js"></script>
    <script src="/common_js/kurlytracker/kurlytracker.js?ver=1.26.11"></script>
    <title>관리자 로그인</title>
</head>

<body>
    <div id="wrap">
        <!-- 상단 메뉴 시작 -->
        <header id="header">
            <div id="header_menu1" class="header_menu">
                <ul>
                    <li>
                        <a href="#"><img id="kurly_logo" src="../img/kurly.png" alt="컬리로고"></a>
                    </li>
                    <li>
                        <h2>관리자 센터</h2>
                    </li>
                </ul>
            </div>

        </header>
                <%
	if(userid == null){
%>
        <!--컨테이너 시작-->
        <div class="container_login clear">
            <!-- 내용 시작-->
            <div id="content_login">
            <div class="section_login">
                <h3 class="tit_login">관리자 로그인</h3>

                <div class="write_form">
                    <div class="write_view login_view">
                        <form method="post" name="form" id="form" onsubmit="return checkReCaptcha();"
                            action="admin_login_ok.jsp">
                            <input type="hidden" name="returnUrl"
                                value="https://www.kurly.com/shop/main/index.php?utm_campaign=home&amp;utm_medium=2102&amp;utm_source=1049&amp;utm_content=pc_brand&amp;utm_term=SA_naverBRmain_text">
                            <input type="hidden" name="return_url" value="">
                            <input type="hidden" name="close" value="">
                            <input type="text" name = "userid" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
                            <input type="password" name = "userpw" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
                            <div class="checkbox_save">
                                <label class="label_checkbox checked">
                                    <input type="checkbox" id="chk_security" name="chk_security" value="y" checked="checked"
                                        onchange="
                                        if(this.checked){$(this).parent().addClass('checked')
                                    }else{$(this).parent().removeClass('checked')} ">
                                    보안접속
                                </label>
        
                                <div class="login_search">
                                    <a href="./find_id.html" class="link">아이디 찾기</a>
                                    <span class="bar"></span>
                                    <a href="./find_pwd.html" class="link">비밀번호 찾기</a>
                                </div>
                            </div>
                            <button type="submit" class="btn_type1"><span class="txt_type">로그인</span></button>
                        </form>
                        
                    </div>
                </div>
            </div>

            <script>
                window.onload = function () { document.form.m_id.focus(); }

                function checkReCaptcha() {
                    var $captcha = $("input[name=captcha]");
                    if ($captcha.length > 0) {
                        if (!$captcha.val()) {
                            alert("인증번호를 입력해 주세요");
                            $captcha.focus();
                            return false;
                        }
                    } else {
                        return true;
                    }
                }

                // KM-1483 Amplitude
                KurlyTracker.setScreenName('login').setTabName('my_kurly');
            </script>
        </div>
    </div>
</div>
<!-- 본문 종료 -->
 <%
 	}else{
  %>
 	<script>
	location.href="admin_dashboard.jsp";
</script>

 <% 
 } 
 %>
 
 
 
</body>

</html>