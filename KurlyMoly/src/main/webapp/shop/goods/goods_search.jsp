<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.kurly.product.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id="dao" class="com.kurly.product.ProductDAO" />

<%
	request.setCharacterEncoding("UTF-8");

	String sword = "";
	List<ProductDTO> categoryList = new ArrayList<ProductDTO>();
	
	if (request.getParameter("sword") == null || request.getParameter("sword") == "") {
		categoryList = dao.selectList();
	
	} else {
		sword = request.getParameter("sword");
		categoryList = dao.searchList(sword);
	}
%>

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
</head>

<body>
	<div id="wrap" class="">
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="../include/header.jsp"%>
			<!-- main 시작 -->
			<div id="goods_main">
				<div id="qnb" class="quick-navigation"
					style="top: 325px; right: 20px;">
					<div class="bnr_qnb" id="brn_Quick">
						<a href="../board/delivery.html"><img class="thumb"
							src="../../img/sidebar/bnr_quick_20190403.webp"></a>
					</div>

					<div class="side_menu">
						<a href="../../event_lovers.html" class="link_menu">등급별 혜택</a> <a
							href="#" class="link_menu">레시피</a>
					</div>
				</div>
				<!-- 본문 시작 -->
				<div id="content">
					<!--page_article 시작-->
					<div class="page_article">
						<!--세부 카테고리 바 시작-->
						<style>
#fm_search #searchtitle {
	text-align: center;
	font-size: 30px;
	font-weight: 900;
	margin: 60px 0;
}

#fm_search #searchsubtitle {
	float: left;
	width: 200px;
	line-height: 100px;
	font-size: 15px;
	font-weight: bolder;
	padding-left: 20px;
}

#fm_search #searchtext {
	float: left;
	width: 600px;
	line-height: 100px;
}

#fm_search #searchbtn {
	float: left;
	width: 200px;
	line-height: 100px;
}

#fm_search input[type="text"], input[type="submit"] {
	width: 95%;
	height: 45px; /* 높이 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 여백 설정 */
	border: 1px solid #ccc;
	font-size: 14px;
}

#fm_search input[type="submit"] {
	background-color: #5f0080;
	color: #fff;
}

#fm_search .hr1 {
	background-color: #5f0080;
	width: 100%;
	height: 2px;
	margin: 60px 0 0 0;
}

#fm_search .hr2 {
	clear: both;
	background-color: #5f0080;
	width: 100%;
	height: 1px;
	margin: 60px 0;
}

#fm_search .hr3 {
	background-color: gray;
	width: 100%;
	height: 1px;
}

#fm_search p {
	font-size: 12px;
	padding: 10px;
}
</style>


						<form id="fm_search" method="post" action="./goods_search.jsp"
							onsubmit="return searchTracking(this)">
							<div>
								<h1 id="searchtitle">상품검색</h1>

								<div class="hr1"></div>
								<div>
									<div id="searchsubtitle">검색 조건</div>
									<div id="searchtext">
										<input type="text" name="sword" placeholder="<%=sword%>">
									</div>
									<div id="searchbtn">
										<input type="submit" value="검색하기" class="seachsubmit">
									</div>

								</div>
								<div class="hr2"></div>
							</div>

							<p>
								총
								<%=categoryList.size()%>개의 상품이 검색되었습니다.
							</p>
							<div class="hr3"></div>
						</form>
						<!--세부 카테고리 바 종료-->
						<!--상품리스트 시작-->
						<div id="goodsList" class="page_section section_goodslist">

							<!--상품 배치 시작-->
							<div id="goodsList_inner">
								<div id="goodsList_inner_box">
									<ul class="goodsList_list">
										<%
											for (int i = 0; i < categoryList.size(); i++) {

											int p_idx = categoryList.get(i).getIdx();
											String p_category2 = categoryList.get(i).getCategory1();
											String p_imgname = categoryList.get(i).getImgname();
											String p_brand = categoryList.get(i).getBrand();
											String p_title = categoryList.get(i).getTitle();
											String p_subtitle = categoryList.get(i).getSubtitle();
											int p_price = categoryList.get(i).getPrice();
											int p_discprice = categoryList.get(i).getDiscprice();

											int percent = (p_price - p_discprice) / p_price;
										%>

										<li>
											<div class="item">
												<div class="product_part">
													<div class="product_photo">
														<a href="./goods_detail.jsp?p_idx=<%=p_idx%>"><img
															src="../../img/goods_detail/<%=p_imgname%>"></img></a>
													</div>
													<!--찜기능 버튼-->
													<div class="wish_btn wish0 turn_off">
														<input type="button"> <img
															src="../../img/goods_list/wish0.png" alt="찜기능off">
														</input>
													</div>
													<div class="wish_btn wish1 turn_on">
														<input type="button"> <img
															src="../../img/goods_list/wish1.png" alt="찜기능on"> </input>
													</div>
													<!--장바구니 버튼-->
													<div class="chart_btn">
														<input type="button" class="chart_click_btn"> <a
															href=""><img src="../../img/goods_list/ico_cart.svg"
															alt="장바구니"></a> </input>
													</div>
												</div>


												<div class="product_info">
													<div class="name"><%=p_title%></div>
													<span id="cost"> <c:if test="${percent gt 1 }">
															<!-- 가격 할인 있을때만, 상품 할인퍼센트 표시  -->
															<span class="sale"><%=percent%></span>
														</c:if> <span class="cost"><%=p_discprice%>원</span> <c:if
															test="${percent gt 1}">
															<div class="before_sale"><%=p_price%>원
															</div>
														</c:if>
													</span>
													<p class="smalltip"><%=p_subtitle%></p>
													<c:if test="${ p_category2 eq 'KurlyOnly'}">
														<!--  Kurly Only 태그 표시  -->
														<div class="tag">
															<p class="limit_tag">Kurly Only</p>
														</div>
													</c:if>
												</div>
											</div>
										</li>
										<%
											}
										%>
									</ul>
								</div>
							</div>
							<!--상품 배치 종료-->

						</div>
						<!--상품리스트 종료-->
					</div>
					<!--page_article 종료-->


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
			$(document)
					.ready(
							function() {
								var pageTop = {
									$target : $('#pageTop'),
									$targetDefault : 0,
									$scrollTop : 0,
									$window : $(window),
									$windowHeight : 0,
									setTime : 500,
									saveHeight : 0,
									init : function() {
									},
									action : function() {
										var $self = this;
										$self.$windowHeight = parseInt($self.$window
												.height());
										$self.$window
												.on(
														'scroll',
														function() {
															$self.$scrollTop = parseInt($self.$window
																	.scrollTop());
															if ($self.$scrollTop >= $self.$windowHeight) {
																if (!$self.$target
																		.hasClass('on')) {
																	$self
																			.position();
																	$self.$target
																			.addClass('on');
																	$self
																			.showAction();
																}
															} else {
																if ($self.$target
																		.hasClass('on')) {
																	$self
																			.position();
																	$self.$target
																			.removeClass('on');
																	$self
																			.hideAction();
																}
															}
														});

										$self.$target.on('click', function(e) {
											e.preventDefault();
											$self.topAction();
										});
									},
									showAction : function() {
										var $self = this;
										$self.$target.stop().animate({
											opacity : 1,
											bottom : $self.saveHeight
										}, $self.setTime);
									},
									hideAction : function() {
										var $self = this;
										$self.$target.stop().animate({
											opacity : 0,
											bottom : -$self.$target.height()
										}, $self.setTime);
									},
									topAction : function() {
										var $self = this;
										$self.hideAction();
										$('html,body').animate({
											scrollTop : 0
										}, $self.setTime);
									},
									position : function() {
										var $self = this;
										$self.saveHeight = 15;
										if ($('#sectionView').length > 0) {
											$self.saveHeight = 25;
										}
										if ($('#branch-banner-iframe').length > 0
												&& parseInt($(
														'#branch-banner-iframe')
														.css('bottom')) > 0) {
											$('#footer').addClass('bnr_app');
											$self.saveHeight += $(
													'#branch-banner-iframe')
													.height();
										}
									}
								}
								pageTop.action();
							});
		</script>
		<script>
			var bodyScroll = {
				winScrollTop : 0,
				body : $('body'),
				gnb : $('#gnb'),
				bg : $('#bgLoading'),
				bodyFixed : function() {
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
						'top' : -$self.winScrollTop
					});
				},
				bodyDefault : function(type) {
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