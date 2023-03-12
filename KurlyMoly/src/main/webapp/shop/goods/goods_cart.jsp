<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.order.BasketDTO"%>

<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id="mdao_as" class="com.kurly.member.MemberDAO" />
<jsp:useBean id="bdao" class="com.kurly.order.BasketDAO" />
<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO" />
<%
	request.setCharacterEncoding("utf-8");
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정
	
	String userid_as = null; // header.jsp에 있는 변수명(userid)과 일치하여 오류발생함에 따라 변수명 수정 (★나희★)
	if (session.getAttribute("m_id") != null) {
	
		userid_as = (String) session.getAttribute("m_id");
	
		//접속한 회원 정보 가져오기.
		List<MemberDTO> userinfolist = new ArrayList<MemberDTO>();
		userinfolist = mdao_as.useridinfo(userid_as);
		System.out.println(userinfolist);
	
		// 접속한 회원 장바구니 가져오기.
		List<BasketDTO> basketlist = new ArrayList<BasketDTO>();
		basketlist = bdao.basketinfo(userid_as);
		System.out.println(basketlist);
	
		// 장바구니 상품 리스트 가져오기.
		List<ProductDTO> productlist = new ArrayList<ProductDTO>();
%>

<!-- 장바구니 페이지 N -->
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
	
	<script>
		function info_chk2(frm) {
			frm.action = './goods_cart_delete_all.jsp';
			frm.submit();
			return true;
		}
</script>



</head>

<body>
	<!--wrap 시작-->
	<div id="wrap" class="#">
		<div id="pos_scroll"></div>
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="../include/header.jsp"%>
			<!-- main 시작 -->

			<div class="tit_page">
				<h2 class="tit">장바구니</h2>
			</div>
			<div id="main">
				<!-- 본문 시작 -->
				<div id="content" style="padding-bottom: 120px;">
					<div id="qnb" class="quick-navigation" style>
						<!--quick메뉴-->
						<div class="bnr_qnb" id="brnQuick">
							<a href="../board/delivery.jsp" id="brnQuickObj"> <img class="thumb" src="https://res.kurly.com/pc/service/main/1904/bnr_quick_20190403.png" alt="퀄리티있게 샛별배송">
							</a>
						</div>
						<div class="side_menu">
							<!--사이드퀵메뉴-->
							<a href="../../event_lovers.jsp" class="link_menu ">등급별 혜택</a>
							<a href="../recipe/recipe_all.jsp" class="link_menu ">레시피</a>
						</div>
					</div>
					<h3 class="screen_out">장바구니 상품 목록</h3>
					<!--form태그 시작-->

					<form name="regform" id="regform" method="post" action="order.jsp">
						<div id="cartItemList" class="only_pc" style="min-height: 624px;">
							<div class="">
								<div class="cart_item ">
									<div class="cart_select">
										<div class="inner_select">
											<label class="check"><input type="checkbox" name="checkAll1" onclick="Allcheck1()" onchange="getCounting()" checked="checked"><span class="ico"></span>전체선택 (<span class="counting"><%=basketlist.size()%></span>/<%=basketlist.size()%>)</label>
											<button type="button" class="btn_delete" value='선택삭제' onclick='return info_chk2(this.form);' style="border: none; background-color: white;"> 선택삭제</button>
										</div>
									</div>
									<div class="box frozen">

										<%
											System.out.println("**************");
										%>
										<%
											System.out.println(basketlist.size());
										%>

										<%
											if (basketlist.size() == 0) {
										%>
										<div class="empty">
											<div class="inner_empty">
												<span class="bg"></span>
												<p class="txt">장바구니에 담긴 상품이 없습니다</p>
											</div>
										</div>
										<%
											}
										%>

										<ul class="list ">
											<%
											int subtotal_price_sum = 0;
											int subtotal_discprice_sum = 0;

											for (int i = 0; i < basketlist.size(); i++) {
												productlist = pdao.prodinfo(basketlist.get(i).getBkProdidx());
												int bk_prodidx = basketlist.get(i).getBkProdidx();
												String p_imgname = productlist.get(0).getImgname();
												String p_title = productlist.get(0).getTitle();
												String p_subtitle = productlist.get(0).getSubtitle();
												int p_idx = productlist.get(0).getIdx();
												int p_price = productlist.get(0).getPrice();
												int p_discprice = productlist.get(0).getDiscprice();

												int bk_quantity = basketlist.get(i).getBkQuantity();

												int subtotal_price = p_price * bk_quantity; //정가*수량 
												subtotal_price_sum = subtotal_price_sum + subtotal_price; //정가 *수량 누적 (상품금액)

												int subtotal_discprice = p_discprice * bk_quantity; // 할인가* 수량
												subtotal_discprice_sum = subtotal_discprice_sum + subtotal_discprice; //할인가 *수량(주문금액)
											%>
											<li>
												<div class="item">
													<label class="check"> <input type="checkbox"
														id="chkItem" name="chkItem" value=<%=bk_prodidx%>
														onclick="getCheck()" onchange="getCounting()"
														checked="checked"><span class="ico"></span>
													</label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package "><%=p_title%></a> <a href="#"
																class="product "><%=p_subtitle%></a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(../../img/goods_detail/<%=p_imgname%>);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling"><%=nf.format(subtotal_discprice)%><span
																	class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	onclick="location.href='./goods_cart_counting2.jsp?idx=<%=bk_prodidx%>&&num=<%=bk_quantity%>'">감소</button>
																<input type="text" id="stepperCounter" class="num"
																	readonly="" value="<%=bk_quantity%>">
																<button type="button" class="btn plus"
																	onclick="location.href='./goods_cart_counting.jsp?idx=<%=bk_prodidx%>&&num=<%=bk_quantity%>'">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete" onclick="location.href='./goods_cart_delete.jsp?idx=<%=p_idx%>'">상품 삭제</button>

												</div>
											</li>

											<%
											}
											%>

										</ul>
									</div>
									<div class="cart_select">
										<div class="inner_select">
											<label class="check"><input type="checkbox"
												name="checkAll2" onclick="Allcheck2()"
												onchange="getCounting()" checked="checked"><span
												class="ico"></span>전체선택 (<span class="counting"><%=basketlist.size()%></span>/<%=basketlist.size()%>)</label>
											<!-- 제품 선택시, 숫자 변경필요 -->

											<button type="button" class="btn_delete" value='선택삭제' onclick='return info_chk2(this.form);' style="border: none; background-color: white;"> 선택삭제</button>


										</div>
									</div>
								</div>
								<script>
									function getCounting() {
										const Boxchecked = document
												.querySelectorAll('input[name="chkItem"]:checked');
										var count = Boxchecked.length;
										$(".counting").text(count);
										if (count > 0) {
											$(".inner_result").css('display',
													'block')
											$(".inner_result2").css('display',
													'none')
										} else {
											$(".inner_result").css('display',
													'none')
											$(".inner_result2").css('display',
													'block')
										}

									}
								</script>


								<%
								String m_address1_as = userinfolist.get(0).getmAddress1();
								String m_address2_as = userinfolist.get(0).getmAddress2();

								int discount = subtotal_price_sum - subtotal_discprice_sum; // 상품금액 - 주문금액(상품 할인 금액) 
								int deliveryfee = 0; //기본 배송비 

								if (subtotal_discprice_sum < 44000 && subtotal_discprice_sum != 0) {
									deliveryfee = 3000;
								} // 44000원이상 무료배송 
								int finalprice = subtotal_discprice_sum + deliveryfee;
								int addpoint = (int) (subtotal_discprice_sum * 0.005);
								%>

								<div class="cart_result">
									<div class="inner_result"">
										<div class="cart_delivery">
											<h3 class="tit">배송지</h3>
											<div class="address">
												<p class="addr"><%=m_address1_as%> <%=m_address2_as%></p>
												<span class="delivery star">샛별배송</span><a href="../mypage/mypage_transport.jsp" class="btn default">배송지 변경</a>
												<!-- 지역별 배송구분/ 지우거나 그냥 두거나 -->
											</div>
										</div>
										<div class="amount_view">
											<dl class="amount">
												<dt class="tit">상품금액</dt>
												<dd class="price">
													<span class="num"><%=nf.format(subtotal_price_sum)%></span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">상품할인금액</dt>
												<dd class="price">
													<span class="num"><%=nf.format(discount)%></span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price">
													<span class="num"><%=nf.format(deliveryfee)%></span><span class="won">원</span>
												</dd>
											</dl>
											<%
												if (subtotal_discprice_sum < 44000 && subtotal_discprice_sum != 0) {
											%>
											<p class="free_limit"><%=nf.format(44000 - subtotal_discprice_sum)%>원 추가주문 시, <strong>무료배송</strong>
											</p>
											<%
												}
											%>
											<dl class="amount lst">
												<dt class="tit">결제예정금액</dt>
												<%
													if (basketlist.size() == 0) {
												%>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
												<%
													} else {
												%>
												<dd class="price">
													<span class="num"><%=nf.format(finalprice)%></span><span class="won">원</span>
												</dd>
												<%
													}
												%>

											</dl>
											<div class="reserve">
												<span class="bage">적립5%</span>구매 시 <span class="emph"><%=nf.format(addpoint)%>원 적립</span>
											</div>
										</div>
										<div class="btn_submit">
											<%
												if (basketlist.size() == 0) {
											%>
											<div class="btn active" style="background-color: gray; border: 1px solid darkgray;">주문할
												내역이 없습니다.</div>
											<%
												} else {
											%>
											<button type="submit" class="btn active">주문하기</button>
											<%
												}
											%>
										</div>
										<div class="notice">
											<span class="txt"> <span class="ico">·</span> 쿠폰/적립금은 주문서에서 사용 가능합니다
											</span> <span class="txt"> <span class="ico">·</span> ‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.
											</span> <span class="txt"> <span class="ico">·</span> ‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.
											</span>
										</div>
									</div>
									<div class="inner_result2" style="position: absolute; right: 0; top: 60px; width: 284px; background-color: #fff; display: none;">
										<div class="cart_delivery">
											<h3 class="tit">배송지</h3>
											<div class="address">
												<p class="addr"><%=m_address1_as%><%=m_address2_as%></p>
												<span class="delivery star">샛별배송</span><a href="../mypage/mypage_transport.jsp" class="btn default">배송지 변경</a>
												<!-- 지역별 배송구분/ 지우거나 그냥 두거나 -->
											</div>
										</div>
										<div class="amount_view">
											<dl class="amount">
												<dt class="tit">상품금액</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">상품할인금액</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
											</dl>

											<dl class="amount lst">
												<dt class="tit">결제예정금액</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>


											</dl>

										</div>
										<div class="btn_submit">

											<button type="button" class="btn active" style="background-color: #ddd; border-color: #ddd; cursor: default;">상품을 선택해주세요</button>

										</div>
										<div class="notice">
											<span class="txt"> <span class="ico">·</span> 쿠폰/적립금은 주문서에서 사용 가능합니다</span>
											<span class="txt"> <span class="ico">·</span> ‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
											<span class="txt"> <span class="ico">·</span> ‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</form>

					<form id="viewCart" name="frmCart" method="post" action="./order.jsp">
						<input type="hidden" name="mode" value="setOrder">
					</form>
				</div>
			</div>

			<div id="layerDSR" style="display: none;">
				<div class="bg_dim"></div>
				<div class="in_layer">
					<div class="inner_layer layer_star">
						<strong class="dsr_result">샛별배송 지역입니다.</strong>
						<div class="ani">
							<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_kurly.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="샛별배송 이미지">
						</div>
						<p class="dsr_desc">
							<strong class="emph">오늘 밤 11시 전</strong>까지 주문시<br> <strong class="emph">다음날 아침 7시</strong> 이전 도착합니다!
						</p>
						<p class="dsr_notice">샛별배송은 휴무 없이 매일 배송 합니다</p>
					</div>
					<div class="inner_layer layer_normal">
						<strong class="dsr_result">택배배송 지역입니다.</strong>
						<div class="ani">
							<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_car.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="택배배송 이미지">
						</div>
						<p class="dsr_desc">
							<strong class="emph">밤 8시 전</strong>까지 주문시<br> <strong class="emph">다음날</strong> 도착합니다!
						</p>
						<p class="dsr_notice">일요일은 배송 휴무로 토요일에는 주문 불가</p>
					</div>
					<div class="inner_layer layer_none">
						<strong class="dsr_result">배송 불가 지역입니다.</strong>
						<div class="ani">
							<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_none.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="배송불가 이미지">
						</div>
						<p class="dsr_desc">
							<strong class="emph">도로명 주소</strong>로 검색하셨다면,<br> <strong class="emph">지번 주소(구 주소)</strong>로 다시 시도해 주세요.
						</p>
						<p class="dsr_notice">배송지역을 확장하도록 노력하겠습니다!</p>
					</div>
					<div class="layer_btn1">
						<button type="button" class="btn_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();">확인</button>
					</div>
					<button type="button" class="layer_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();"></button>
				</div>
			</div>

			<!-- footer 시작 -->
			<%@ include file="../include/footer.jsp"%>
			<!-- footer 종료 -->
		</div>
		<!-- container 종료 -->

		<!-- quick list 시작 -->
		<a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 15px;">맨 위로가기</a>
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

<%
	} else {
%>
<script>
	alert('로그인 후 이용하세요');
	location.href = '../member/login.jsp';
</script>
<%
	}
%>