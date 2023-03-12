<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 레시피 - 간단요리 페이지 -->
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

					<style>
						#lnbMenu li a:hover, #lnbMenu li .on {
							border-bottom: 1px solid #5F0080
						}
					</style>

					<div class="page_aticle">
						<div id="lnbMenu" class="lnb_menu">
							<div class="inner_lnb">
								<div class="ico_cate">
									<span class="tit">레시피</span>
								</div>
								<ul class="list">
									<li><a class="" id="no_anchor" href="./recipe_all.jsp">전체보기</a></li>
									<li><a class="" href="./recipe_everyday.jsp">매일밥상</a></li>
									<li><a class="" href="./recipe_special.jsp">특별한날</a></li>
									<li><a class="on" href="./recipe_simple.jsp">간단요리</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="layout-wrapper">
						<div id="recipe" class="wrap">
							<table width="100%" align="center">
								<tbody>
									<tr>
										<td>
											<form name="frmList" action="/shop/board/list.php?&amp;" onsubmit="return chkFormList(this)">
												<input type="hidden" name="id" value="recipe">
												<table width="100%" id="recipe_table">
													<tbody>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/bd8917e6a932cfc1" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">메밀 갈레트</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/db2a19d45389999f" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">햄버거</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/4d928cd02774ca3f" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">아메리칸 타코</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/a4597cbaff69ae1a" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">루바브 믹스베리 잼</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/aad44132777eb4dd" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">베이비케일 &amp; 베이비시금치 샐러드</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/cccaf15ab7ecb99d" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">토마토 가지롤</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/b20fa898382c80eb" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">오믈렛 니수와즈</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/be1aec4b35af684c" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">부타동</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/9ecefbe5d5c2d8dc" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">굴소스 오징어 볶음</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/d66be0098a23be67" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">오리 고추장 주물럭</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/6e478c2157fcc675" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">할라피뇨 모둠 피클</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item">
																			<a href="#">
																				<img src="//img-cf.kurly.com/shop/data/board/recipe/r/87ecb3ca11317433" width="480" height="480" onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">파인애플 볶음밥</p>
																			</a>
																		</li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr"></tr>
													</tbody>
												</table>
												<!-- <div class="layout-pagination">
													<div class="pagediv">
														<a href="list.php?id=recipe&amp;page=1" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a>
														<a href="list.php?id=recipe&amp;page=1" class="layout-pagination-button layout-pagination-prev-page page_btnborder">이전 페이지로 가기</a>
														<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
														<a href="list.php?id=recipe&amp;page=2" class="layout-pagination-button layout-pagination-number">2</a>
														<a href="list.php?id=recipe&amp;page=3" class="layout-pagination-button layout-pagination-number">3</a>
														<a href="list.php?id=recipe&amp;page=4" class="layout-pagination-button layout-pagination-number">4</a>
														<a href="list.php?id=recipe&amp;page=5" class="layout-pagination-button layout-pagination-number">5</a>
														<a href="list.php?id=recipe&amp;page=6" class="layout-pagination-button layout-pagination-number">6</a>
														<a href="list.php?id=recipe&amp;page=7" class="layout-pagination-button layout-pagination-number">7</a>
														<a href="list.php?id=recipe&amp;page=8" class="layout-pagination-button layout-pagination-number">8</a>
														<a href="list.php?id=recipe&amp;page=9" class="layout-pagination-button layout-pagination-number">9</a>
														<a href="list.php?id=recipe&amp;page=10" class="layout-pagination-button layout-pagination-number">10</a>
														<a href="list.php?id=recipe&amp;page=2" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
														<a href="list.php?id=recipe&amp;page=30" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
													</div>
												</div> -->
												<table width="100%">
													<tbody>
														<tr>
															<td align="right">
																<table class="xans-board-search xans-board-search2">
																	<tbody>
																		<tr>
																			<!-- <td class="input_txt"><img src="../../img/EtcImage/ico_function.gif">검색어</td>
																			<td class="stxt" style="text-align: left"><input
																				type="checkbox" name="search[name]">이름 <input
																				type="checkbox" name="search[subject]">제목 <input
																				type="checkbox" name="search[contents]">내용 <input
																				type="checkbox" name="search[tag]">태그 &nbsp;
																			</td> -->
																			<td class="input_txt">&nbsp;</td>
																			<td>
																				<div class="search_bt">
																					<a href="javascript:document.frmList.submit()"><img src="../../img/EtcImage/search.webp" align="absmiddle"></a> <input type="text" name="search[word]" value="" required="">
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>
													</tbody>
												</table>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<script>
                        // KM-1483 Amplitude
                        KurlyTracker.setScreenName('recipe_list')
                    </script>
					<!-- 레시피 - 간단요리 종료 -->
				</div>
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