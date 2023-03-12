<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 컬리소개 페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link href="../../css/style.css" rel="stylesheet" type="text/css">
	<link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
	<link href="../../css/etc.css" rel="stylesheet" type="text/css">

	<script src="../../script/script.js"></script>
	<script src="../../script/MJscript.js"></script>
	<style>
		#content {
			padding-bottom: 120px;
		}
		
		.skin_checkbox input[type=radio], input[type=checkbox] {
			opacity: 1 !important;
		}
		
		.xans-myshop-couponserial th {
			line-height: 1em;
		}

		.async-hide {
			opacity: 0 !important
		}
	</style>
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

					<div class="introduce_kurly">
						
						<div class="intro_kurly" id="parallaxEvent">
							<div class="banner bg_thumb" style="background-position: 50% -100px;"></div>
							<div class="info_box">
								<h3 class="tit_intro">마켓컬리의 시작</h3>
								<p class="intro_text">
									이 세상에는 참 다양한 푸드마켓이 있습니다. 하지만 우리와 꼭 맞는 마음을 가진 푸드마켓을 찾기란 쉽지
									않았습니다. ‘그렇다면 우리가 직접 만들어보면 어떨까?’ 2015년 마켓컬리는 그렇게 시작되었습니다.<br>
									<br> 맛있는 음식이 삶의 가장 큰 즐거움이라 믿는 사람들이 뜻을 합쳤죠. 컬리의 팀원들은 이미 팀을
									꾸리기 전부터 좋은 재료를 위해서라면 해외 직구, 백화점, 동네 마트, 재래 시장, 더 나아가 전국 방방곡곡의
									산지를 찾아 다니며 품질과 가격을 비교하던 깐깐한 소비자였습니다. 이렇게 찾아낸 훌륭한 생산자와 최상의 먹거리들을
									나와 내 가족만 알고 있기에는 너무 아쉬웠습니다. <br>
									<br> 비싼 식자재만이 좋은 음식일 것이라고 막연하게 생각하고 있는 소비자에게는 진짜 맛을 소개해드리고
									싶었고, 뚝심 하나로 산골 오지에서 수십 년간 묵묵히 장을 담그는 명인, 시들어서 버릴지언정 무농약을 고집하는
									농부에게는 안정적인 판매 활로를 찾아드리고 싶었습니다. 생산자와 소비자, 판매자까지 모두 행복하고 맛있는 삶을 살
									수 있도록 컬리는 오늘도 열심히 발로 뛰며 고민합니다.
								</p>
							</div>
							<div class="banner2 bg_thumb" style="background-position: 50% -100px;"></div>
							<div class="info_box">
								<h3 class="tit_intro">컬리의 믿음, 그리고 지켜야 할 가치</h3>
								<p class="intro_text">
									시작은 단순했지만 고민은 깊었습니다. 직원이 아닌 한 사람의 고객으로서도 오래도록 사랑할 수 있는 서비스를
									만들고자 했기에, 상품을 검토할 때 ‘잘 팔릴까’ 보다는 ‘내가 사고 싶은지’를 먼저 물었고, ‘많이 팔릴지’
									보다는 ‘많이 팔려야 마땅한지’를 고민했고, 단기적으로 이익을 추구하기보다는 장기적으로 생산자와 소비자 모두에게
									옳은 일을 하기 위해 치열하게 고민하고 노력해왔습니다.<br>
									<br> 그 과정에서 컬리가 꼭 지키고자 했던 가치들을 공유합니다. 이 가치들은 지금까지 그래왔듯
									앞으로도 컬리가 성장하는 과정에서 방향을 잃지 않도록 길을 밝혀주는 등대의 역할을 해줄 것이며, 동시에 컬리의
									파트너인 생산자, 소비자, 그리고 주주 여러분께 드리는 약속이기도 합니다.
								</p>
							</div>
							<div class="kurly_more_menu">
								<ul class="list_menu">
									<li><img src="../../img/EtcImage/intro_cont1_v2.jpg"
										class="img_thumb" width="364px" height="200px">
										<div class="kurly_menu_info">
											<h4 class="tit_menu">1. 나와 내 가족이 사고 싶은 상품을 판매합니다.</h4>
											<p class="menu_info">컬리는 미각적, 심미적으로 만족감을 주면서 사람의 몸에 이로운
												상품이 우리의 삶까지 변화시킬 수 있다고 믿습니다. 내가 먹고 쓰는 것이 곧 ‘나’이니까요. 안정성, 맛,
												상업성 등 여러 면에서 만족스러울 만한, 최상의 상품을 고르기 위해 직접 먹어보고 사용해보며 여러 차례에
												걸쳐 꼼꼼하게 검증합니다.</p>
										</div></li>
									<li><img src="../../img/EtcImage/intro_cont2.jpg" class="img_thumb" width="364px" height="200px">
										<div class="kurly_menu_info">
											<h4 class="tit_menu">2. 물류 혁신을 통해 최상의 품질로 전해드립니다.</h4>
											<p class="menu_info">오늘 주문하면 내일 아침 도착하는 샛별배송은 물류의 혁신이
												없었다면 불가능한 일이었죠. 샛별배송을 포함한 Kurly Fresh Solution은 산지에서 식탁까지의
												시간을 줄이고, 온도를 제어해 상품의 가치를 극대화합니다. 좋은 상품을 가장 좋은 상태로 고객님께 전해드리는
												것. 컬리가 배송 시간부터 포장재까지 물류의 모든 것을 혁신한 이유이자, 컬리의 물류가 가지는 가치입니다.
											</p>
										</div></li>
									<li><img src="../../img/EtcImage/intro_cont3.jpg" class="img_thumb" width="364px" height="200px">
										<div class="kurly_menu_info">
											<h4 class="tit_menu">3. 같은 품질에서 최선의 가격을 제공합니다.</h4>
											<p class="menu_info">소비자에게는 품질만큼 가격도 좋은 상품의 기준이 됩니다. 하지만
												생산자가 배제된 최저가 정책은 정답이 될 수 없습니다. 컬리가 업계 최초로 도입한 100% 생산자 직거래 및
												매입 방식은 유통 중 발생하던 재고 손실을 최소화해 동일 품질의 상품을 가장 낮은 가격에 판매할 수 있도록
												해줍니다.</p>
										</div></li>
									<li><img src="../../img/EtcImage/intro_cont4.jpg" class="img_thumb" width="364px" height="200px">
										<div class="kurly_menu_info">
											<h4 class="tit_menu">4. 고객의 행복을 먼저 생각합니다.</h4>
											<p class="menu_info">컬리는 오늘의 만족을 넘어 고객님의 삶 속에서 행복을 드리는
												서비스로 남기를 바랍니다. 그래서 오늘의 회사를 위한 일보다 장기적으로 소비자에게 옳은 일을 합니다.
												고객만족보장제도는 고객님의 현재는 물론 미래까지도 세심하게 케어하고 싶은 컬리의 의지입니다.</p>
										</div></li>
									<li><img src="../../img/EtcImage/intro_cont5.webp" class="img_thumb" width="364px" height="200px">
										<div class="kurly_menu_info">
											<h4 class="tit_menu">5. 지속 가능한 유통을 실현해 나갑니다.</h4>
											<p class="menu_info">좋은 먹거리는 깨끗한 환경에서, 좋은 상품은 생산자에게 합리적인
												유통 구조에서 시작되기에 마켓컬리는 환경, 상품, 사람의 선순환을 이루는 지속 가능한 유통을 고민합니다.
												지속 가능한 상품 선정부터 생산자와의 동반 성장, 친환경 포장재 개발, 사회에 대한 기여까지 장기적으로
												소비자와 생산자 모두에게 옳은 일을 하기 위해 노력합니다.</p>
										</div></li>
									<li><img src="../../img/EtcImage/intro_cont6.jpg" class="img_thumb" width="364px" height="200px">
										<div class="kurly_menu_info">
											<h4 class="tit_menu">6. 함께 변화를 주도하고 새로운 기회를 만듭니다.</h4>
											<p class="menu_info">컬리는 최고의 인재들이 모여 산업을 바꾸고 이를 통해 가치를
												창출하는 것이 기업의 존재 이유임을 믿습니다. 오늘의 작은 문제들을 넘겨보지 않고, 주도적으로 문제를
												해결해나가며 컬리와 함께 의미있는 변화를 이끌어나갈 당신을 기다립니다.</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- 컬리소개 종료 -->

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
		<a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 15px;">맨 위로가기</a>
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
            // 클릭인인경우(푸터에 있으나, 아직공용작업은 못함) => bgLoading 이부분 처리필요
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