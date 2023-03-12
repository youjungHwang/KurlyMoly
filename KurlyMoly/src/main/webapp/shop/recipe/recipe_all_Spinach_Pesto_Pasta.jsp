<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 레시피 - 상세페이지 - 시금치 페트토 파스타 페이지 -->
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
                    <div id="qnb" class="quick-navigation">
                        <div class="bnr_qnb" id="brn_Quick">
                            <a href="./delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
                        </div>
                        <script>
                            var brnQuick = {
                                nowTime: '1614533726294',
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
                            <a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
                            <a href="./recipe_all.jsp" class="link_menu">레시피</a>
                        </div>
                    </div>

                    <!-- 레시피 - 전체보기 - 시금치 페스토 파스타 시작 -->
                    <div class="tit_page">
                        <h2 class="tit">레시피</h2>
                    </div>
                    <div class="layout-wrapper">
                        <table width="100%" align="center">
                            <tbody>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <table class="boardView" width="100%">
                                                            <tbody>
                                                                <tr>
                                                                    <th scope="row" style="border:none;">제목</th>
                                                                    <td>시금치 페스토 파스타</td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row">작성자</th>
                                                                    <td>
                                                                        MarketKurly
                                                                    </td>
                                                                </tr>
                                                                <tr class="etcArea">
                                                                    <td colspan="2">
                                                                        <ul>
                                                                            <li class="date">
                                                                                <strong class="th">작성일</strong> <span class="td">2020-11-17</span>
                                                                            </li>
                                                                            <li class="hit">
                                                                                <strong class="th">조회수</strong> <span class="td">247824</span>
                                                                            </li>
                                                                        </ul>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="200" valign="top" id="contents" class="view_recipe">
                                                        <table width="100%" style="table-layout:fixed" class="goods_wrap">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top">
                                                                        <div class="goods_recipe">
                                                                            <h3>
                                                                                <span class="recipe_tit">Kurly’s Recipe</span>
                                                                                <small class="recipe_product">시금치 페스토 파스타</small>
                                                                            </h3>
                                                                            <div class="context">
                                                                                <div class="pic">
                                                                                    <img src="//img-cf.kurly.com/shop/data/board/recipe/r/d276dcedfe48cc9c">
                                                                                </div>
                                                                                <p class="words">
                                                                                    <strong class="recipe_item_tit">재료</strong>
                                                                                    시금치 150g, 잣 50g, 아몬드 50g, 소금 1작은술,
                                                                                    올리브 오일 120mL, 그라나 파다노 90g, 통마늘 1알,
                                                                                    리가토니 120g, 방울토마토 4개, 부라타 치즈 120g
                                                                                </p>
                                                                                <p class="words">
                                                                                    <strong class="recipe_item_tit">RECIPE</strong>
                                                                                    1. 시금치의 억센 뿌리와 밑동 부분을 제거해 준비한다. <br>
                                                                                    2. 손질한 시금치, 잣, 아몬드, 소금, 올리브 오일을 블렌더에
                                                                                    넣고, 그라나 파다노 치즈 80g을 곱게 갈아 넣는다. <br>
                                                                                    3. ②를 한 번 갈아준 뒤, 통마늘 1알을 넣고 다시 한 번
                                                                                    갈아준다. <br>
                                                                                    4. ③의 내용물을 골고루 섞어 따로 담은 후, 그 위에 올리브
                                                                                    오일을 살짝 뿌려 페스토를 완성한다. <br>
                                                                                    5. 끓는 물에 소금을 넣고, 분량의 리가토니를 약 14분간
                                                                                    삶는다. <br>
                                                                                    6. 삶은 리가토니의 물기를 완전히 제거하고, 방울토마토를 1/2
                                                                                    크기로 자른다. <br>
                                                                                    7. 미리 만들어 둔 시금치 페스토를 2~3큰술 정도 덜어 ⑥과
                                                                                    골고루 버무린다. <br>
                                                                                    8. ⑦에 부라타 치즈를 올리고, 남은 그라나 파다노 치즈로
                                                                                    장식해 완성한다.
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table width="100%" style="table-layout:fixed; border-top:1px solid #795c90; height:80px;">
                            <tbody>
                                <tr>
                                    <td align="center" style="padding-top:10px;">
                                        <table width="100%">
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                    <td align="right">
                                                        <a href="./recipe_all.jsp"><span class="bhs_button yb" style="float:none;">목록</span></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
                            <ul>
                                <li class="prev ">
                                    <strong>이전글</strong><a href="#"></a><a href="view.php?id=recipe&amp;no=386">황태양념구이</a>
                                </li>
                                <li class="next ">
                                    <strong>다음글</strong><a href="../../shop/recipe/recipe_all_ Rucola Pizza.html"></a><a href="./recipe_all_Rucola_Pizza.jsp">플랫 브레드 루꼴라 피자</a>
                                </li>
                            </ul>
                        </div>
                        <p>
                            <br><textarea id="examC_387" style="display:none;width:100%;height:300px">시금치 150g, 잣 50g, 아몬드 50g, 소금 1작은술, 올리브 오일 120mL, 그라나 파다노 90g, 통마늘 1알, 리가토니 120g, 방울토마토 4개, 부라타 치즈 120g</textarea>
                        </p>
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

    <!-- 레시피 상세보기 페이지 카트 부분 -->
    <div id="cartPut">
        <div class="cart_option cartList cart_type3" style="opacity: 1;">
            <div class="inner_option"><button type="button" class="btn_close1">레이어닫기</button>
                <div class="in_option">
                    <div class="list_goods">
                        <ul class="list list_nopackage">
                            <li class="on">
                            	<span class="btn_position"><button type="button" class="btn_del"><span class="txt">삭제하기</span></button></span>
								<span class="name"> [사브로소] 엑스트라버진 올리브 오일</span>
                                <div class="option">
                                	<span class="count">
                                		<button type="button" class="btn down on">수량내리기</button>
										<input type="number" readonly="readonly" onfocus="this.blur()" class="inp">
										<button type="button" class="btn up on">수량올리기</button>
									</span>
									<span class="price"> <span class="dc_price">13,900원</span></span>
								</div>
                            </li>
                        </ul>
                    </div>
                    <div class="total">
                        <div class="price"><strong class="tit">합계</strong>
                            <span class="sum"><span class="num">13,900</span> <span class="won">원</span></span>
                        </div>
                        <p class="txt_point"><span class="ico">적립</span> <span class="no_login"><span>로그인 후, 적립혜택 제공</span></span></p>
                    </div>
                </div>
                <div class="group_btn off layer_btn2">
                    <span class="btn_type2"><button type="button" class="txt_type">취소</button></span>
					<span class="btn_type1"><button type="button" class="txt_type">장바구니 담기</button></span>
                </div>
            </div>
        </div>
        <div class="cart_option cart_type3 notify_option">
            <div class="inner_option"><strong class="tit">재입고 알림 신청</strong>
                <p class="name_deal">[사브로소] 엑스트라버진 올리브 오일</p>
                <p class="notice"><span class="ico">·</span>상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.</p>
                <div class="group_btn layer_btn2"><span class="btn_type2"><button type="button" class="txt_type">취소</button></span> <span class="btn_type1"><button type="button" class="txt_type">신청하기</button></span></div>
            </div>
        </div>
        <div class="cart_option cart_result cart_type3">
            <div class="inner_option"><button type="button" class="btn_close1">pc레이어닫기</button>
                <p class="success">상품 구매를 위한 <span class="bar"></span>배송지를 설정해주세요</p>
                <div class="group_btn layer_btn2"><span class="btn_type2"><button type="button" class="txt_type">취소</button></span> <span class="btn_type1"><button type="button" class="txt_type"><span class="ico_search"></span>주소 검색</button></span></div>
            </div>
        </div>
        <form name="frmBuyNow" method="post" action="/shop/order/order.php"><input type="hidden" name="mode" value="addItem"> <input type="hidden" name="goodsno" value=""></form>
        <form name="frmWishlist" method="post"></form>
    </div>

    <script>
        $(function () {
            $('.btn_type2').click(function () {
                $('#cartPut').css("display", "none");
            });
        });

        $(function () {
            $('.btn_cart').click(function () {
                $('#cartPut').css("display", "block");
            });
        });
    </script>

    <script src="../../script/common_filter.js"></script>
    <script src="../../script/cartput_v1.js"></script>

    <script>
        function cartLayerOpenAction(no, type) {
            var cartPutDefault = {
                'login': false,
                'no': no,
                'type': 'pc'
            }
            cartPutDefault.login = window.webStatus.isSession;
            if (cartPutDefault.login || typeof type === 'undefined') {
                bodyScroll.bodyFixed();
            }
            cartPut.userInfoGet(cartPutDefault, (typeof type !== 'undefind' && type === 'notify') ? type : false);
        }
    </script>
    <script src="../../script/customeEvent.js"></script>
</body>

</html>