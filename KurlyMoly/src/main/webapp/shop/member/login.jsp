<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 로그인 N -->
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
				<div id="content">
					<div id="main">
						<div id="content" style="padding-bottom: 60px;">
							<div class="section_login">
								<h3 class="tit_login">로그인</h3>
								<div class="write_form">
									<div class="write_view login_view">
										<form method="post" name="form" id="form"
											onsubmit="return checkReCaptcha();" action="./login_ok.jsp">
											<input type="hidden" name="returnUrl" value="https://www.kurly.com/shop/main/index.php?utm_campaign=home&amp;utm_medium=2102&amp;utm_source=1049&amp;utm_content=pc_brand&amp;utm_term=SA_naverBRmain_text">
											<input type="hidden" name="return_url" value="">
											<input type="hidden" name="close" value="">
											<input type="text" name="m_id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
											<input type="password" name="password" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
											<div class="checkbox_save">
												<label class="label_checkbox checked">
													<input type="checkbox" id="chk_security" name="chk_security" value="y" checked="checked" onchange="if( this.checked){$(this).parent().addClass('checked')}else{$(this).parent().removeClass('checked')} ">
													보안접속
												</label>

												<div class="login_search">
													<a href="./find_id.jsp" class="link">아이디 찾기</a>
													<span class="bar"></span>
													<a href="./find_pwd.jsp" class="link">비밀번호 찾기</a>
												</div>
											</div>
											<button type="submit" class="btn_type1">
												<span class="txt_type">로그인</span>
											</button>
										</form>
										<a href="./join.jsp" class="btn_type2 btn_member"><span class="txt_type">회원가입</span></a>
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
                            </script>
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

		<!-- quick list 시작 -->
		<a href="#top" id="pageTop" class="on"
			style="opacity: 1; bottom: 15px;">맨 위로가기</a>
		<!--  -->
		<script>
            // 스크롤을 위로 올리면 (top메뉴가 보이면) to_top이 아래로 사라지는 효과
            $(document).ready(function () {
                var pageTop = {
                    $target: $('#pageTop'),
                    $targetDefault: 0,
                    $scrollTop: 0,
                    $window: $(window),
                    $windowHeight: 0,
                    setTime: 500,
                    saveHeight: 0,
                    init: function () {
                    },
                    action: function () {
                        var $self = this;
                        $self.$windowHeight = parseInt($self.$window.height());
                        $self.$window.on('scroll', function () {
                            $self.$scrollTop = parseInt($self.$window.scrollTop());
                            if ($self.$scrollTop >= $self.$windowHeight) {
                                if (!$self.$target.hasClass('on')) {
                                    $self.position();
                                    $self.$target.addClass('on');
                                    $self.showAction();
                                }
                            } else {
                                if ($self.$target.hasClass('on')) {
                                    $self.position();
                                    $self.$target.removeClass('on');
                                    $self.hideAction();
                                }
                            }
                        });

                        $self.$target.on('click', function (e) {
                            e.preventDefault();
                            $self.topAction();
                        });
                    },
                    showAction: function () {
                        var $self = this;
                        $self.$target.stop().animate({
                            opacity: 1,
                            bottom: $self.saveHeight
                        }, $self.setTime);
                    },
                    hideAction: function () {
                        var $self = this;
                        $self.$target.stop().animate({
                            opacity: 0,
                            bottom: -$self.$target.height()
                        }, $self.setTime);
                    },
                    topAction: function () {
                        var $self = this;
                        $self.hideAction();
                        $('html,body').animate({
                            scrollTop: 0
                        }, $self.setTime);
                    },
                    position: function () {
                        var $self = this;
                        $self.saveHeight = 15;
                        if ($('#sectionView').length > 0) {
                            $self.saveHeight = 25;
                        }
                        if ($('#branch-banner-iframe').length > 0 && parseInt($('#branch-banner-iframe').css('bottom')) > 0) {
                            $('#footer').addClass('bnr_app');
                            $self.saveHeight += $('#branch-banner-iframe').height();
                        }
                    }
                }
                pageTop.action();
            });
        </script>
		<script>
            var bodyScroll = {
                winScrollTop: 0,
                body: $('body'),
                gnb: $('#gnb'),
                bg: $('#bgLoading'),
                bodyFixed: function () {
                    var $self = this;
                    var gnbCheck = false;
                    $self.gnb = $('#gnb');
                    if ($self.gnb.hasClass('gnb_stop')) {
                        gnbCheck = true;
                    }
                    $self.body = $('body');
                    $self.bg = $('#bgLoading');
                    $self.winScrollTop = $(window).scrollTop();
                    $self.bg.show();
                    $self.body.addClass('noBody').css({
                        'top': -$self.winScrollTop
                    });
                },
                bodyDefault: function (type) {
                    var $self = this;
                    $self.body.removeClass('noBody').removeAttr('style');
                    $self.bg.hide();
                    if (type === undefined) {
                        window.scrollTo(0, $self.winScrollTop);
                    }
                }
            }
        </script>
		<!-- quick list 끝 -->
	</div>
</body>

</html>