<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.product.ProductDAO"%>

<%@ page import="com.kurly.review.ReviewDTO"%>
<%@ page import="com.kurly.review.ReviewDAO"%>

<%@ page import="com.kurly.inquiry.PinquiryDTO"%>
<%@ page import="com.kurly.inquiry.PinquiryDAO"%>

<jsp:useBean id="dao" class="com.kurly.product.ProductDAO" />
<jsp:useBean id="dao1" class="com.kurly.review.ReviewDAO" />
<jsp:useBean id="dao2" class="com.kurly.inquiry.PinquiryDAO" />

<%
request.setCharacterEncoding("UTF-8");

int p_idx = 0;
if (request.getParameter("p_idx") == null || request.getParameter("p_idx") == "") {
	p_idx = 1;
} else {
	p_idx = Integer.parseInt(request.getParameter("p_idx"));
}

// 고객후기, 상품문의 게시글 
List<ReviewDTO> list = new ArrayList<>();
list = dao1.selectReview();

List<PinquiryDTO> list2 = new ArrayList<>();
list2 = dao2.selectPinquiry();

String p_title = ""; // 타이틀
String p_subtitle = ""; // 서브타이틀
String p_category1 = ""; // 카테고리1
int p_price = 0; // 가격(정가)
int p_discprice = 0; // 할인'된' 금액
double percent = 0.005; // 일반회원기준 할인가
String p_deliveryType = ""; // 배송타입 : 샛별배송/일반배송
String p_packingType = ""; // 배송타입 : 샛별배송/일반배송
String p_salesunit = ""; // 판매단위
String p_weight = ""; // 중량
String p_origin = ""; // 원산지
String p_mainImg = ""; // 메인이미지(파일명)
String p_description = ""; // 설명
String p_detailimgname = ""; // 상세통이미지(파일명)

// 리뷰관련
int rv_idx = 0; // 리뷰번호
int rv_productidx = Integer.parseInt(request.getParameter("p_idx")); // 상품번호 (해당 번호를 조회 수 해당하는 리뷰만 보이게 한다)
String rv_userid = ""; // 작성자 id
String rv_title = ""; // 후기 제목
String rv_content = ""; // 후기 내용
String rv_imgname = ""; // 리뷰 이미지
int rv_helped = 0; // 도움이 돼요(1)/안돼요(0)
String rv_regdate = ""; // 작성날짜

// 문의글 관련
int piq_idx = 0; // 리뷰번호
int piq_prodidx = Integer.parseInt(request.getParameter("p_idx")); // 상품번호 (해당 번호를 조회 수 해당하는 리뷰만 보이게 한다)
String piq_userid = ""; // 작성자 id
String piq_issecret = ""; // 비밀글여부(일반/비밀)
String piq_title = ""; // 문의글 제목
String piq_content = ""; // 문의글 내용
String piq_inquirydate = ""; // 문의글 작성일시
String piq_reply = ""; // 답변
String piq_replydate = ""; // 답변일시
String piq_isreply = ""; // 답변여부

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
		sql = "SELECT * FROM tb_product WHERE p_idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, p_idx);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			p_title = rs.getString("p_title");
			p_subtitle = rs.getString("p_subtitle");
			p_category1 = rs.getString("p_category1");
			p_price = rs.getInt("p_price");
			p_discprice = rs.getInt("p_discprice");
			p_deliveryType = rs.getString("p_deliveryType");
			p_packingType = rs.getString("p_packingType");
			p_salesunit = rs.getString("p_salesunit");
			p_weight = rs.getString("p_weight");
			p_origin = rs.getString("p_origin");
			p_mainImg = rs.getString("p_imgname");
			p_description = rs.getString("p_description");
			p_detailimgname = rs.getString("p_detailimgname");
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}

// 계산식 관련
NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정

int p_count = 1; // 수량
int totalPrice = p_discprice * p_count; // 수량에 따른 총금액
double p_point = (double) p_discprice * percent; // 정가(string) -> double
int point = (int) p_point; // double형 -> int 형변환

double Percent = 100 - ((double) p_discprice / (double) p_price * 100); // 할인률(%)
int discPercent = Integer.parseInt(String.valueOf(Math.round(Percent))); // double -> int 형변환
%>

<!-- 제품 상세페이지 -->
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
button {
	appearance: auto;
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: center;
	align-items: flex-start;
	cursor: default;
	background-color: -internal-light-dark(rgb(239, 239, 239),
		rgb(59, 59, 59));
	box-sizing: border-box;
	margin: 0em;
	font: 400 13.3333px Arial;
	padding: 1px 6px;
	border-width: 2px;
	border-style: outset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
}

.xans-product-additional div.board .btnArea {
	text-align: right;
	width: 100%;
	display: table;
	border-top: 1px solid #522772;
}

.bhs_button {
	width: 150px;
	display: inline-block;
	line-height: 40px;
	text-align: center;
	background-color: #795b8f;
	border: 1px solid #5f0080;
	color: #fff;
	font-size: 15px;
	float: right;
	margin-left: 2px;
	font-size: 13px;
	margin: 20px 0;
}

#gnb.gnb_stop {
	position: fixed;
	z-index: 300;
	left: 0;
	top: 0;
	width: 100%;
}

.cart_option.cartList.cart_type1 {
	opacity: 0;
}

.cart_option.cartList.cart_type1.sticky {
	opacity: 1 !important;
}

.divHeight {
	bottom: 0px;
}

#showDiv {
	position: fixed;
	bottom: 0px;
}

#hidDiv {
	position: fixed;
	bottom: -262px;
}

#contents .contents img {
	display: block;
	max-width: 600px;
}

.goods_board .review_view.on {
	display: block;
}

#contents {
	border-top: 1px solid #e3e3e3;
}

.xans-product-additional img {
	max-width: 600px !important;
}

.subject {
	cursor: pointer;
}
</style>
<script>
		// 스크롤을 일정구간 아래까지 내리면 div이 생기면서 장바구니에 담을 수 있는 박스가 추가됨
    	$(function(){
    		var lastScroll = 0;
    		$(window).scroll(function(event){
    			var scroll = $(this).scrollTop();
    			if (scroll > 150) {
    				// 이벤트를 적용시킬 스크롤 높이
    				$('#gnb').addClass("gnb_stop");
    			} else {
    				$('#gnb').removeClass("gnb_stop");
    			}
    			
    			if (scroll > 600) {
    				$('.cart_option.cartList.cart_type1').addClass("sticky");
    			} else {
    				$('.cart_option.cartList.cart_type1').removeClass("sticky");
    			}
    			lastScroll = scroll;
    		});
    	});
		
		//장바구니일정구간 올라오는 박스 클릭하기
		$(document).ready(function(){
			$('.btnClick').click(function(){
				if($('.cart_type1 > .inner_option').is(":visible")){
					$('.cart_type1 > .inner_option').css("display","none");	
				}else{
					$('.cart_type1 > .inner_option').css("display","block");
				}
			});
		});
		//고객후기 클릭열고닫기
		$(document).ready(function(){
			$('.xans-board-listheaderd').click(function(){
				if($(this).siblings('.review_view').is(":visible")){
					$(this).siblings('.review_view').css("display","none");
				}else{
					$(this).siblings('.review_view').css("display","block");
				}
			});
		});
		//상품문의 클릭열고닫기
		$(document).ready(function(){
			$('.view').click(function(){
				if($(this).next('#content_id').is(":visible")){
					$(this).next('#content_id').css("display","none");
				}else{
					$(this).next('#content_id').css("display","block");
				}
			}); 
		});
		// 고객행복센터 관련 열고닫기
		
        
    
</script>
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
							<a href="../board/delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
						</div>

						<div class="side_menu">
							<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
							<a href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
						</div>
					</div>

					<!-- 상품 대표이미지 및 장바구니 부분 시작 -->
					<div class="section_view">
						<div id="sectionView">
							<div class="inner_view">
								<div class="thumb"
									<%if (p_mainImg != null && !p_mainImg.equals("")) {
											out.print("style='background-image: url(../../img/goods_detail/" + p_mainImg + ");'");
										}%>>
									<img src="../../img/goods_detail/Transparent.png"
										alt="상품 대표 이미지" class="bg">
								</div>
								<p class="goods_name">
									<strong class="name" name="title"><%=p_title%></strong>
									<span class="short_desc" name="subTitle"><%=p_subtitle%></span>
								</p>
								<p class="goods_price">
									<span class="position">
										<span class="dc">
											<span class="dc_price" name="dc_price"><%=nf.format(p_discprice)%><span class="won">원</span></span>
											<span class="dc_percent"><%=discPercent%><span class="per">%</span></span>
										</span>
										<a class="original_price"><span class="price"><%=nf.format(p_price)%><span class="won">원</span></span></a>
									</span>
									<span class="txt_benefit">
										<span class="ico_grade grade0">일반 0.5%</span>
										<span class="point">개당 <strong class="emph"><%=point%>원 적립</strong></span>
									</span>
								</p>
								<div class="goods_info">
									<dl class="list fst">
										<dt class="tit">판매단위</dt>
										<dd class="desc"><%=p_salesunit%></dd>
									</dl>
									<dl class="list">
										<dt class="tit">중량/용량</dt>
										<dd class="desc"><%=p_weight%></dd>
									</dl>
									<dl class="list">
										<dt class="tit">배송구분</dt>
										<dd class="desc"><%=p_deliveryType%></dd>
									</dl>
									<dl class="list">
										<dt class="tit">원산지</dt>
										<dd class="desc"><%=p_origin%></dd>
									</dl>
									<dl class="list">
										<dt class="tit">포장타입</dt>
										<dd class="desc"><%=p_packingType%><strong class="emph">택배배송은 에코포장이 스티로폼으로 대체됩니다.</strong></dd>
									</dl>
									<dl class="list">
										<dt class="tit">참고사항</dt>
										<dd class="desc">해당 상품은 여러 협력업체에서 납품하고 있는 상품으로 수령 시, 상이한 협력업체의 상품을 받아보실 수 있습니다. 품질은 동일 기준으로 입고되고 있사오니 참고 부탁드립니다.</dd>
									</dl>
									<dl class="list">
										<dt class="tit">안내사항</dt>
										<dd class="desc">
											<span class="txt"><%=p_description%></span>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<div id="cartPut" style="display: block;">
							<div class="cart_option cartList cart_type2">
								<div class="inner_option">
									<div class="in_option">
										<form id="goodsData" name="goodsData" action="./goodsAdd.jsp">
											<input type="hidden" method="post" name="p_idx" value="<%=p_idx%>">

											<div class="list_goods">
												<div class="bar_open" style="display: none; cursor: pointer;">
													<button type="button" class="btn_close">
														<span class="ico open">상품 선택</span>
													</button>
												</div>
												<ul class="list list_nopackage">
													<li class="on">
														<span class="btn_position">
															<button type="button" class="btn_del">
																<span class="txt">삭제하기</span>
															</button>
														</span>
														<span class="name"><%=p_title%></span>
														<span class="tit_item">구매수량</span>
														<div class="option">
															<span class="count">
																<button type="button" class="btn down on" id="downBtn" style="cursor: pointer;" >수량내리기</button>
																<input type="number" readonly="readonly" onfocus="this.blur()" class="inp" name="goodsCount" value="<%=p_count%>">
																<button type="button" class="btn up on" id="upBtn" style="cursor: pointer;">수량올리기</button>
															</span>
															<span class="price"> <span class="dc_price"><%=nf.format(totalPrice)%></span></span>
														</div>
													</li>
												</ul>
											</div>
										</form>
										<div class="total">
											<div class="price">
												<strong class="tit">총 상품금액 :</strong> <span class="sum"><span class="num" id="p_price"><%=nf.format(totalPrice)%></span><span class="won">원</span></span>
											</div>
											<p class="txt_point">
												<span class="ico">적립</span> <span class="point">구매 시<strong class="emph"> <%=point%>원 적립</strong></span>
											</p>
										</div>
									</div>
									<div class="group_btn off">
										<div in_option class="view_function">
											<button type="button" class="btn btn_save" style="cursor: pointer;" onclick="location.href='./goods_zzim_ok.jsp?p_idx=<%=p_idx%>';">찜 하기</button>
											<button type="button" class="btn btn_alarm" style="cursor: pointer;">재입고 알림</button>
										</div>
										<span class="btn_type1"><button type="submit" form="goodsData" class="txt_type" style="cursor: pointer;">장바구니 담기</button></span>
									</div>
								</div>
							</div>

							<!-- 스크롤 내렸을때 생기는 최하단 바로구매하기 div -->
							<div class="cart_option cartList cart_type1 openDiv">
								<div class="bar_open">
									<button type="button" class="btn_close btnClick">
										<span class="ico open">상품 선택</span>
									</button>
								</div>
								<div class="inner_option" style="display: none;">
									<div class="in_option">
										<div class="list_goods">
											<ul class="list list_nopackage">
												<li class="on">
													<span class="btn_position">
														<button type="button" class="btn_del">
															<span class="txt">삭제하기</span>
														</button>
													</span> <span class="name"><%=p_title%></span>
													<div class="option">
														<span class="count">
															<button type="button" class="btn down on" id="downBtn" style="cursor: pointer;">수량내리기</button>
															<input type="number" readonly="readonly" onfocus="this.blur()" class="inp" value="<%=p_count%>">
															<button type="button" class="btn up on" id="upBtn" style="cursor: pointer;">수량올리기</button>
														</span>
														<span class="price"><span class="dc_price" id="sub_price" ><%=nf.format(totalPrice)%>원</span></span>
													</div>
												</li>
											</ul>
										</div>

										<div class="total">
											<div class="price">
												<strong class="tit">총 상품금액 :</strong>
												<span class="sum"><span class="num" id="sub_price2"><%=nf.format(totalPrice)%></span><span class="won">원</span></span>
											</div>
											<p class="txt_point">
												<span class="ico">적립</span> <span class="no_login"><span>로그인 후, 회원할인가와 적립혜택 제공</span></span>
											</p>
										</div>
									</div>
									<div class="group_btn">
										<div class="view_function">
											<button type="button" class="btn btn_save"
												style="cursor: pointer;"
												onclick="location.href='./goods_zzim_ok.jsp?p_idx=<%=p_idx%>';">찜
												하기</button>
											<button type="button" class="btn btn_alarm"
												style="cursor: pointer;">재입고 알림</button>
										</div>
										<span class="btn_type1"><input type="submit"
											form="goodsData" class="txt_type" value="장바구니 담기"
											style="cursor: pointer;"></span>
									</div>
								</div>
							</div>

							<script> //  수량  버튼 스크립트
                                       $(document).ready(function(){ 
												
	                                            var num = $('.inp').val(); 
	                                            var price =  $('#p_price').text();
	
	                                             $('#downBtn.btn').on('click', function(){ 
	                                               num--;
	                                               $('.inp').val(num);     
	                                               $('#p_price').text((num)*<%=totalPrice%>);
	                                               $('#sub_price').text((num)*<%=totalPrice%>);
	                                               $('#sub_price2').text((num)*<%=totalPrice%>);
	                                               $('#pro_amount').val($('.inp').val(num));
	                                                 if(num<0){ 
	                                                            num=0;
	                                                            $('.inp').val(num);  
	                                                            $('#p_price').text((num)*<%=totalPrice%>);
	                                                            $('#sub_price').text((num)*<%=totalPrice%>);
	                                                            $('#sub_price2').text((num)*<%=totalPrice%>);
	                                                            $('#pro_amount').val($('.inp').val(num));
	                                                         }

	                                            	 })
                                                   $('#upBtn.btn').on('click', function(){ 
                                                     num++;
                                                    $('.inp').val(num);   
                                                    $('#p_price').text((num)*<%=totalPrice%>)
                                                    $('#sub_price').text((num)*<%=totalPrice%>)
                                                    $('#sub_price2').text((num)*<%=totalPrice%>)
                                                    $('#pro_amount').val($('.inp').val(num));
                                                    if(num<0){ 
                                                       num=0;
                                                       $('.inp').val(num);  
                                                       $('#p_price').text((num)*<%=totalPrice%>);
                                                       $('#sub_price').text((num)*<%=totalPrice%>)
                                                       $('#sub_price2').text((num)*<%=totalPrice%>)
                                                       $('#pro_amount').val($('.inp').val(num));
                                                    }
                                              })

	                                        })
                       	</script>

							<div class="cart_option cart_type3 notify_option">
								<div class="inner_option">
									<strong class="tit">재입고 알림 신청</strong>
									<p class="name_deal"><%=p_title%></p>
									<p class="notice">
										<span class="ico">·</span>상품이 입고되면 앱 푸시 또는 알림톡으로 알려 드립니다.
									</p>
									<div class="group_btn layer_btn2">
										<span class="btn_type2"><button type="button"
												class="txt_type">취소</button></span> <span class="btn_type1"><button
												type="button" class="txt_type">신청하기</button></span>
									</div>
								</div>
							</div>
							<div class="cart_option cart_result cart_type3"
								style="display: none;">
								<div class="inner_option">
									<button type="button" class="btn_close1">pc레이어닫기</button>
									<p class="success">
										상품 구매를 위한 <span class="bar"></span>배송지를 설정해주세요
									</p>
									<div class="group_btn layer_btn2">
										<span class="btn_type2"><button type="button"
												class="txt_type">취소</button></span> <span class="btn_type1"><button
												type="button" class="txt_type">
												<span class="ico_search"></span>주소 검색
											</button></span>
									</div>
								</div>
							</div>
							<form name="frmBuyNow" method="post" action="./goods_cart.jsp">
								<input type="hidden" name="mode" value="addItem"> <input
									type="hidden" name="goodsno" value="">
							</form>
							<form name="frmWishlist" method="post"></form>
						</div>
					</div>
					<!-- 상품 대표이미지 및 장바구니 부분 종료 -->

					<!-- 상품상세 및 리뷰페이지 시작 -->
					<div class="layout-wrapper goods-view-area">
						<script src="/shop/data/skin/designgj/autoslider.js"></script>

						<div class="goods-add-product">
							<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
							<div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
								<div class="goods-add-product-list-wrapper" style="height: 320px">
									<ul class="goods-add-product-list __slide-mover">
										<%
										try {
											Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
											conn = DriverManager.getConnection(url, uid, upw);
											if (conn != null) {
												sql = "select * from tb_product where p_category1=?";
												pstmt = conn.prepareStatement(sql);
												pstmt.setString(1, p_category1);
												rs = pstmt.executeQuery();

												for (int i = 0; i <= 5; i++) {
											if (rs.next()) {
												p_idx = rs.getInt("p_idx");
												p_mainImg = rs.getString("p_imgname");
												p_title = rs.getString("p_title");
												p_price = rs.getInt("p_price");
											}
										%>
										<li class="goods-add-product-item __slide-item">
											<div class="goods-add-product-item-figure">
												<a href="./goods_detail.jsp?p_idx=<%=p_idx%>" target="_blank"><img src="<%if (p_mainImg != null && !p_mainImg.equals("")) {
														out.print("../../img/goods_detail/" + p_mainImg);
													}%>" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'"></a>
											</div>
											<div class="goods-add-product-item-content">
												<div class="goods-add-product-item-content-wrapper">
													<p class="goods-add-product-item-name"><%=p_title%></p>
													<p class="goods-add-product-item-price"><%=nf.format(p_price)%>원
													</p>
												</div>
											</div>
										</li>
										<%
										}
										}
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</ul>
								</div>
							</div>
						</div>

						<div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
							<ul class="goods-view-infomation-tab-group">
								<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor __active" name="goods-description">상품설명</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기<span class="count_review"></span></a></li>
								<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span></span>
								</a></li>
							</ul>
							<div class="goods-view-infomation-content __active"
								id="goods-description">

								<div class="goods_wrap">
									<div>
										<img alt="제품 상세 설명이미지"
											src="../../img/goods_detail/<%=p_detailimgname%>"
											style="width: 100%;">
									</div>
								</div>

							</div>

							<ul class="goods-view-infomation-tab-group">
								<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor __active">상세정보</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기<span class="count_review"></span></a></li>
								<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span></span></a></li>
							</ul>
							<div class="goods-view-infomation-content" id="goods-infomation">
								<table width="100%" border="0" cellpadding="0" cellspacing="1"
									class="extra-information">
									<tbody>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">상품명</th>
											<td>무농약 감자</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">유통기한</th>
											<td>농산물이므로 별도의 유통기한은 없으나 가급적 빨리 드시길 바랍니다.</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">포장단위</th>
											<td>600g</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">인증여부</th>
											<td>무농약 인증</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">생산자
												/취급자</th>
											<td>뜰앤들 영농조합 / 해달친환경</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">관련법상
												표기사항</th>
											<td>해당없음</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">원산지</th>
											<td>국내산</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">보관방법
												및 취급방법</th>
											<td>냉장보관</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">상품유형</th>
											<td>농산물</td>
										</tr>
										<tr>
											<th scope="row" class="goods-view-form-table-heading">소비자상담실
												전화번호</th>
											<td>마켓컬리 고객행복센터 (1644-1107)</td>
										</tr>
									</tbody>
								</table>

								<div class="whykurly_area">
									<div class="row">
										<strong class="tit_whykurly">WHY KURLY</strong>
										<div id="why_kurly" class="txt_area">
											<div class="why-kurly">
												<div class="col">
													<div class="icon">
														<img src="../../img/review_image/01_check.svg">
													</div>
													<div class="info">
														<div class="title">깐깐한 상품위원회</div>
														<div class="desc">
															<p>
																나와 내 가족이 먹고 쓸 상품을 고르는<br> 마음으로 매주 상품을 직접 먹어보고,<br>
																경험해보고 성분, 맛, 안정성 등 다각도의<br> 기준을 통과한 상품만을 판매합니다.
															</p>
														</div>
													</div>
												</div>
												<div class="col">
													<div class="icon">
														<img src="../../img/review_image/02_only.svg">
													</div>
													<div class="info">
														<div class="title">차별화된 Kurly Only 상품</div>
														<div class="desc">
															<p>
																전국 각지와 해외의 훌륭한 생산자가<br> 믿고 선택하는 파트너, 마켓컬리.<br>
																2천여 개가 넘는 컬리 단독 브랜드, 스펙의<br> Kurly Only 상품을 믿고
																만나보세요.
															</p>
															<span class="etc">(온라인 기준 / 자사몰, 직구 제외)</span>
														</div>
													</div>
												</div>
												<div class="col">
													<div class="icon">
														<img src="../../img/review_image/03_cold.svg">
													</div>
													<div class="info">
														<div class="title">신선한 풀콜드체인 배송</div>
														<div class="desc">
															<p>
																온라인 업계 최초로 산지에서 문 앞까지<br> 상온, 냉장, 냉동 상품을 분리 포장 후<br>
																최적의 온도를 유지하는 냉장 배송 시스템,<br> 풀콜드체인으로 상품을 신선하게
																전해드립니다.
															</p>
															<span class="etc">(샛별배송에 한함)</span>
														</div>
													</div>
												</div>
												<div class="col">
													<div class="icon">
														<img src="../../img/review_image/04_price.svg">
													</div>
													<div class="info">
														<div class="title">고객, 생산자를 위한 최선의 가격</div>
														<div class="desc">
															<p>
																매주 대형 마트와 주요 온라인 마트의 가격<br> 변동 상황을 확인해 신선식품은 품질을<br>
																타협하지 않는 선에서 최선의 가격으로,<br> 가공식품은 언제나 합리적인 가격으로<br>
																정기 조정합니다.
															</p>
														</div>
													</div>
												</div>
												<div class="col">
													<div class="icon">
														<img src="../../img/review_image/05_eco.svg">
													</div>
													<div class="info">
														<div class="title">환경을 생각하는 지속 가능한 유통</div>
														<div class="desc">
															<p>
																친환경 포장재부터 생산자가 상품에만<br> 집중할 수 있는 직매입 유통구조까지,<br>
																지속 가능한 유통을 고민하며 컬리를 있게<br> 하는 모든 환경(생산자, 커뮤니티, 직원)이<br>
																더 나아질 수 있도록 노력합니다.
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="happy_center fst">
									<div class="happy">
										<h4 class="tit">고객행복센터</h4>
										<p class="sub">
											<span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span><span
												class="bar"></span> 문제가 되는 부분을 사진으로 찍어<span class="bar"></span>
											아래 중 편하신 방법으로 접수해 주시면<span class="bar"></span> 빠르게 도와드리겠습니다.
										</p>
									</div>
									<ul class="list">
										<li>
											<div class="tit">전화 문의 1644-1107</div>
											<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
										</li>
										<li>
											<div class="tit">카카오톡 문의</div>
											<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
											<div class="expend">
												카카오톡에서 ’마켓컬리’를 검색 후<br> 대화창에 문의 및 불편사항을<br> 남겨주세요.
											</div>
										</li>
										<li>
											<div class="tit">홈페이지 문의</div>
											<div class="sub">
												24시간 접수 가능<br> 로그인 &gt; 마이컬리 &gt; 1:1 문의
											</div>
											<div class="expend">고객센터 운영 시간에 순차적으로 답변해드리겠습니다.</div>
										</li>
									</ul>
								</div>
								<div class="happy_center order on">
									<div class="happy unfold">
										<h4 class="tit">주문 취소 안내</h4>
										<ul class="sub">
											<li><strong class="emph">[입금 확인] 단계</strong> 마이컬리 &gt;
												주문 내역 상세페이지에서 직접 취소하실 수 있습니다.</li>
											<li><strong class="emph">[입금 확인] 이후 단계</strong> 고객행복센터로
												문의해주세요.</li>
											<li><strong class="emph">결제 승인 취소 / 환불</strong> 결제 수단에
												따라 영업일 기준 3~7일 내에 처리해드립니다.</li>
										</ul>
										<a data-child-id="orderCancel" href="#none" class="asked" id="asd">
											<span class="txt" data-open="자세히 보기" data-close="닫기">닫기</span>
											<img src="../../img/review_image/pc_arrow_open@2x.webp"
											alt="아이콘" class="ico">
										</a>
									</div>

									<div class="happy_faq">
										<div id="orderCancel" class="questions hide">
											<strong class="subject">주문 취소 관련</strong>
											<ul class="list_questions">
												<li>[상품 준비 중] 이후 단계에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.</li>
												<li>비회원은 모바일 App / Web &gt; 마이컬리 &gt; 비회원 주문 조회 페이지에서
													주문을 취소하실 수 있습니다.</li>
												<li>일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다.</li>
												<li>주문 상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매해 주세요.</li>
											</ul>
											<strong class="subject">결제 승인 취소 / 환불 관련</strong>
											<ul class="list_questions">
												<li>카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에 문의해주세요.</li>
												<li>결제 취소 시, 사용하신 적립금과 쿠폰도 모두 복원됩니다.</li>
											</ul>
										</div>
									</div>

								</div>
								<div class="happy_center lst on">
									<div class="happy unfold">
										<h4 class="tit">교환 및 환불 안내</h4>
										<p class="sub">고객님의 단순 변심으로 인한 반품은 어려울 수 있으니 양해 부탁드립니다.</p>
										<a data-child-id="refund" href="#none" class="asked"> <span
											class="txt" data-open="자세히 보기" data-close="닫기">닫기</span> <img
											src="../../img/review_image/pc_arrow_open@2x.webp" alt="아이콘"
											class="ico">
										</a>
									</div>
									<div class="happy_faq">
										<span class="item">01. 받으신 상품에 문제가 있는 경우</span>
										<div id="refund1" class="questions hide">
											<p class="desc">
												상품이 표시·광고 내용과 다르거나 부패한 경우 등 상품에 문제가 있는 정도에 따라 <span
													class="bar_pc"></span>재배송, 일부 환불, 전액 환불해드립니다.
											</p>
											<strong class="subject">신선 / 냉장 / 냉동 식품</strong>
											<p class="desc">상품을 받은 날부터 2일 이내에 상품 상태를 확인할 수 있는 사진을 첨부해
												1:1 문의 게시판에 남겨주세요.</p>
											<strong class="subject">유통기한 30일 이상 식품<span
												class="bar"></span>(신선 / 냉장 / 냉동 제외) &amp; 기타 상품
											</strong>
											<p class="desc">
												상품을 받은 날부터 3개월 이내 또는 문제가 있다는 사실을 알았거나 알 수 있었던 날부터 30일 이내에 <span
													class="bar_pc"></span>상품의 상태를 확인할 수 있는 사진을 첨부해 1:1 문의 게시판에
												남겨주세요.
											</p>
											<p class="noti">※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가 부담합니다.</p>
										</div>
									</div>
									<div class="happy_faq">
										<span class="item">02. 단순 변심, 주문 착오의 경우</span>
										<div id="refund2" class="questions hide">
											<strong class="subject no_padding">신선 / 냉장 / 냉동 식품</strong>
											<p class="desc">
												재판매가 불가한 상품의 특성상, 단순 변심, 주문 착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다. <span
													class="bar_pc"></span>상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은
												상품도 다르게 느끼실 수 있습니다.
											</p>
											<strong class="subject">유통기한 30일 이상 식품<span
												class="bar"></span>(신선 / 냉장 / 냉동 제외) &amp; 기타 상품
											</strong>
											<p class="desc">상품을 받은 날부터 7일 이내에 1:1 문의 게시판에 남겨주세요.</p>
											<p class="noti">
												※ 단순 변심으로 인한 교환 또는 환불의 경우 고객님께서 배송비 6,000원을 부담하셔야 합니다. <span
													class="bar_pc"></span>(주문 건 배송비를 결제하셨을 경우 3,000원)
											</p>
										</div>
									</div>
									<div class="happy_faq">
										<span class="item">03. 교환·반품이 불가한 경우</span>
										<div id="refund3" class="questions hide">
											<p class="desc">다음에 해당하는 교환·반품 신청은 처리가 어려울 수 있으니 양해
												부탁드립니다.</p>
											<ul class="list_questions">
												<li>소비자에게 책임 있는 사유로 상품이 멸실 또는 훼손된 경우 <span
													class="bar_pc"></span>(포장지 훼손으로 인해 재판매가 불가능한 상품의 경우, 단순 변심에
													의한 반품이 어렵습니다.)
												</li>
												<li>일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다.</li>
												<li>소비자의 주문에 따라 개별적으로 생산되는 상품이 이미 제작 진행된 경우</li>
											</ul>
										</div>
									</div>
								</div>
<script >

$('.asked').on('click', function(){ 
    
    $(this).parent().parent().toggleClass('on');
    if($(this).parent().parent().hasClass('on')){ 
        $(this).children('.txt').text('닫기')
    }else{
        $(this).children('.txt').text('자세히 보기')
    }
})
</script>


							</div>
							<ul class="goods-view-infomation-tab-group">
								<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor __active">고객후기 <span class="count_review"></span></a></li>
								<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">상품문의 <span></span></a></li>
								<!-- 고객후기 게시판 시작 -->
							</ul>
							<div class="goods-view-infomation-content" id="goods-review"
								data-load="0">
								<div id="contents-wrapper" class="goods_board">
									<div
										class="xans-element- xans-product xans-product-additional detail_board  ">
										<div class="board">
											<span class="line"></span>
											<form name="frmList">
												<input type="hidden" name="sort" value=""> <input
													type="hidden" name="page_num" value=""> <input
													type="hidden" name="goodsno" value="26448">
												<div class="title_txt">
													<h2>PRODUCT REVIEW</h2>
													<div class="sort-wrap">
														<ul class="list_type1 old">
															<li><span class="ico"></span>
																<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른
																	글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p></li>
															<li><span class="ico"></span>
																<p class="txt">
																	배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a href="#none"
																		onclick="window.parent.location.href = '../mypage/mypage_qna_register.html'"
																		class="emph">1:1 문의</a>에 남겨주세요.
																</p></li>
														</ul>

													</div>
												</div>

												<table class="xans-board-listheader" width="100%" border="0"
													cellpadding="0" cellspacing="0">
													<caption style="display: none">구매후기 제목</caption>
													<colgroup>
														<col style="width: 100px;">
														<col style="width: auto;">
														<col style="width: 100px;">
														<col style="width: 100px;">
													</colgroup>
													<tbody>
														<tr>
															<th scope="col" class="input_txt">번호</th>
															<th scope="col" class="input_txt">제목</th>
															<th scope="col" class="input_txt" align="center">작성자</th>
															<th scope="col" class="input_txt">작성일</th>
														</tr>
													</tbody>
												</table>
												<div class="tr_line on">
													<table class="xans-board-listheaderd tbl_newtype1"
														width="100%" cellpadding="0" cellspacing="0"
														onclick="view_content(this,event,'notice')">
														<caption style="display: none">구매후기 내용</caption>
														<colgroup>
															<col style="width: 100px;">
															<col style="width: auto;">
															<col style="width: 100px;">
															<col style="width: 100px;">
														</colgroup>
														<tbody>
															<tr>
																<input type="hidden" name="index" value="-1">
																<input type="hidden" name="image" value="">
																<input type="hidden" name="grade" value="0">
																<input type="hidden" name="best" value="false">
																<input type="hidden" name="pNo" value="">

																<td align="center">공지</td>
																<td class="subject">
																	<div>금주의 Best 후기 안내</div>
																</td>
																<td class="user_grade" style="text-align:center;">Marketkurly</td>
																<td class="time">2019-11-01</td>
															</tr>
														</tbody>
													</table>
													<div data-sno="6412655" class="review_view"
														style="display: none;">
														<div class="inner_review">
															<div class="name_purchase">
																<strong class="name"></strong>
																<p class="package"></p>
															</div>
															<div class="review_photo"></div>
														</div>
														<div class="goods-review-grp-btn"></div>
													</div>
												</div>
												<div class="tr_line">
													<table class="xans-board-listheaderd tbl_newtype1"
														width="100%" cellpadding="0" cellspacing="0"
														onclick="view_content(this,event,'notice')">
														<caption style="display: none">구매후기 내용</caption>
														<colgroup>
															<col style="width: 100px;"> <!-- 번호 -->
															<col style="width: auto;"> <!-- 제목 -->
															<col style="width: 100px;"> <!-- 작성자 -->
															<col style="width: 100px;"> <!-- 작성일 -->
														</colgroup>
														<tbody>
															<tr>
																<input type="hidden" name="index" value="0">
																<input type="hidden" name="image" value="">
																<input type="hidden" name="grade" value="0">
																<input type="hidden" name="best" value="false">
																<input type="hidden" name="pNo" value="">

																<td align="center">공지</td>
																<td class="subject">
																	<div>상품 후기 적립금 정책 안내</div>
																</td>
																<td class="user_grade" style="text-align:center;">Marketkurly</td>
																<td class="time">2019-11-01</td>
															</tr>
														</tbody>
													</table>
													<div data-sno="6412546" class="review_view"
														style="display: none;">
														<div class="inner_review">
															<div class="name_purchase">
																<strong class="name"></strong>
																<p class="package"></p>
															</div>
															<div class="review_photo"></div>
															[ 금주의 Best 후기 및 상품 후기 적립금 정책 변경 안내 ] 고객님 안녕하세요. 마켓컬리 입니다.
															적립금 지급 정책을 안내드리니 컬리 이용에 참고 부탁드립니다. ■ 적립금 지급 정책 1. 일반 후기 –
															기존과 같이 작성 후 1~3일 내에 기본 적립금이 지급됩니다. -글 후기 50원/건 -사진 후기
															100원/건 *퍼플/더퍼플 러버스 고객님께는 더블 후기 적립금이 지급됩니다. 2. Best 후기 –
															Best 후기 적립금은 일주일 단위로 선정 및 지급됩니다. 1) 선정 건 수 – 일주일 최대 30건
															2) 지급 일시 – 매주 수요일( 지급일이 공휴일의 경우 전 영업일) 3) 당첨 ID 및 그 주의
															Best 후기는 후기 게시판 내 공지사항으로 등록됩니다. 3. 상품 후기 게시판(Product
															review) 적립금 지급 유의 사항 1) 실제 구매한 상품의 후기가 아닌 경우 Best 후기 당첨 시
															제외 됩니다. 2) 구매 상품 외의 사진이 첨부된 경우 후기 적립금 정책으로 제공한 적립금이 취소 될
															수 있습니다.
														</div>
														<div class="goods-review-grp-btn"></div>
													</div>
												</div>
												<%    
												// 페이징 작업
												int totalCount = 0; // 전체 글 개수
												int pagePerCount = 5; // 페이지당 글 개수 ** 10개씩 보기
												int start = 0; // 시작 글번호

												String pageSize = request.getParameter("pageSize");
												if (pageSize == null) {
													pagePerCount = 5;
												} else {
													pagePerCount = Integer.parseInt(pageSize);
												}

												String pageNum = request.getParameter("pageNum");
												if (pageNum != null && !pageNum.equals("")) {
													start = (Integer.parseInt(pageNum) - 1) * pagePerCount;
												} else {
													pageNum = "1";
													start = 0;
												}

												// DB연결2 : 리뷰
												Connection conn2 = null;
												PreparedStatement pstmt2 = null;
												ResultSet rs2 = null;

												String sql2 = "";
												String url2 = "jdbc:mysql://localhost:3306/kurlymoly";
												String uid2 = "root";
												String upw2 = "1234";

												try {
													Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
													conn2 = DriverManager.getConnection(url2, uid2, upw2);
													if (conn2 != null) {
														sql2 = "select * from tb_review WHERE rv_productidx = ?";
														pstmt2 = conn2.prepareStatement(sql2);
														pstmt2.setInt(1, rv_productidx);
														rs2 = pstmt2.executeQuery();

														for (int i = 0; i < pagePerCount; i++) {
															if (rs2.next()) {
																rv_idx = rs2.getInt("rv_idx");
																rv_userid = rs2.getString("rv_userid");
																rv_title = rs2.getString("rv_title");
																rv_content = rs2.getString("rv_content");
																rv_imgname = rs2.getString("rv_imgname");
																rv_helped = rs2.getInt("rv_helped");
																rv_regdate = rs2.getString("rv_regdate");
															
													// for (ReviewDTO review : list) {
												%>


												<div class="tr_line ">
													<table class="xans-board-listheaderd tbl_newtype1"
														width="100%" cellpadding="0" cellspacing="0">
														<caption style="display: none">구매후기 내용</caption>
														<colgroup>
															<col style="width: 100px;">
															<col style="width: auto;">
															<col style="width: 100px;">
															<col style="width: 100px;">
														</colgroup>
														<tbody>
															<tr>
																<input type="hidden" name="index" value="5">
																<input type="hidden" name="image" value="">
																<input type="hidden" name="grade" value="0">
																<input type="hidden" name="best" value="false">
																<input type="hidden" name="pNo" value="">

																<td align="center"><%=rv_idx%></td>
																<td class="subject">
																	<div class="fst"><%=rv_title%></div>
																	<div class="snd"><%=rv_title%></div>
																</td>
																<td class="user_grade" style="text-align:center;"><%=rv_userid%></td>

																<td class="time"><%=rv_regdate.substring(0, 10)%></td>
															</tr>
														</tbody>
													</table>
													<div data-sno="25665219" class="review_view">
														<div class="inner_review">
															<div class="name_purchase">
																<strong class="name"><%=rv_title%></strong>
																<p class="package"></p>
															</div>
															<div class="review_photo"></div>
															<img src="../../img/review_image/<%=rv_imgname%>" alt="상품 이미지" style="width:250px;"><br>
															<%=rv_content%>
														</div>
														<%-- <div class="goods-review-grp-btn">
															<button type="button" class="styled-button review-like-btn" data-sno="25665219" onclick="review_like('25665219',$(this));"> 도움이 돼요 <span class="num"><%=rv_helped%></span></button>
														</div> --%>
													</div>
												</div>
												<%
															
															}
														}
													}
												} catch (Exception e) {
												e.printStackTrace();
												}
												%>

											</form>

											<p class="btnArea after">
												<a href="#none" onclick="location.href='../mypage/mypage_write_review.jsp?p_idx=<%=p_idx%>'"><span class="bhs_button" style="line-height: 30px; width: 130px;">후기쓰기</span></a>
											</p>
										</div>
									</div>

									<script>
													function chageLangSelect(){
													   	var langSelect = document.getElementById("id-lang");
													    
													   	// select element에서 선택된 option의 value가 저장된다.
													   	var selectValue = langSelect.options[langSelect.selectedIndex].value;
													
													   	// select element에서 선택된 option의 text가 저장된다.
													   	var selectText = langSelect.options[langSelect.selectedIndex].text;
													   	window.console.log(selectValue);
													   	var pageNumJs = <%=pageNum%>;
													   	location.href="./admin_membercheck.jsp?pageNum=" + pageNumJs + "&pageSize=" + selectValue;
													}
												</script>

									<script>

		                                    $('.tr_line').on('click',function(){ 
		                                        
		                                        $(this).toggleClass('on');
		                                        $(this).children('.review_view').toggleClass('on');
		
		                                    })
                               		 </script>

									<div class="board_pg_area">
										<%
										int pageNums = 0;
										if (totalCount % pagePerCount == 0) {
											pageNums = (totalCount / pagePerCount);
										} else {
											pageNums = (totalCount / pagePerCount) + 1;
										}
										%>
										<a href="#" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
										<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
										
										<%
										for (int i = 1; i <= pageNums; i++) {
											out.print("<a href='./goods_detail.jsp?pageNum=" + i
											+ "' class='layout-pagination-button layout-pagination-number'>" + i + "</a>");
										}
										%> 


										<a href="#" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>

									</div>
								</div>

								<script type="text/javascript">window.NREUM || (NREUM = {}); NREUM.info = { "beacon": "bam.nr-data.net", "licenseKey": "NRJS-5dec146893a58b07e31", "applicationID": "602251426", "transactionName": "MlZUZhdUXkoCAkBQDQscY0AMGkNRDBEbXg0KV0UdAlpfXRA+RlwUDFZBbQlcQ01NEVxJ", "queueTime": 0, "applicationTime": 2328, "atts": "HhFXEF9OTUQ=", "errorBeacon": "bam.nr-data.net", "agent": "" }</script>

							</div>
							<!-- 고객후기 게시판 종료 -->
							<ul class="goods-view-infomation-tab-group">
								<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor ">상품설명</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-image" class="goods-view-infomation-tab-anchor">상품이미지</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
								<li class="goods-view-infomation-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">고객후기 <span class="count_review"></span></a></li>
								<li class="goods-view-infomation-tab qna-show"><a href="#goods_qna_register.jsp" class="goods-view-infomation-tab-anchor __active">상품문의 <span></span></a></li>
							</ul>
							<div class="goods-view-infomation-content" id="goods-qna"
								data-load="0">

								<head>
									<script type="text/javascript" src="/shop/lib/js/jquery-1.10.2.min.js"></script>
									<link rel="styleSheet"
										href="/shop/data/skin/designgj/normalize.css?ver=1.26.14">
									<link rel="styleSheet"
										href="/shop/data/skin/designgj/common.css?ver=1.26.14">
									<link rel="styleSheet"
										href="/shop/data/skin/designgj/section1.css?ver=1.26.14">
									<script id="qna_chk"></script>
									<script src="/shop/data/skin/designgj/common.js"></script>
									<script src="/shop/data/skin/designgj/polify.js"></script>
									<script type="text/javascript">
                                        function dynamicScript(url) {
                                            var script = document.createElement("script");
                                            script.type = "text/javascript";

                                            script.onload = script.onreadystatechange = function () {
                                                if (!script.readyState || script.readyState == "loaded" || script.readyState == "complete") {
                                                    script.onload = script.onreadystatechange = null;
                                                }
                                            }

                                            script.src = url;
                                            document.getElementsByTagName("head")[0].appendChild(script);
                                        }

                                        function popup_register(mode, goodsno, sno) {
                                            if (mode == 'del_qna') var win = window.open("goods_qna_del.php?mode=" + mode + "&sno=" + sno, "qna_register", "width=400,height=200");
                                            else parent.location.href = ("goods_qna_register.php?mode=" + mode + "&goodsno=" + goodsno + "&sno=" + sno);
                                        }

                                        var preContent;
                                        var IntervarId;

                                        function view_content(sno, type) {
                                            var obj = document.getElementById('content_id_' + sno);
                                            if (obj.style.display == "none") {
                                                dynamicScript("./goods_qna_chk.php?mode=view&sno=" + sno);
                                            } else {
                                                obj.style.display = "none";
                                            }
                                            preContent = obj;
                                            IntervarId = setTimeout('resizeFrame();', 100);

                                            // KM-1483 Amplitude 연동
                                            if (type === '0') {
                                                parent.KurlyTracker.setScreenName('product_inquiry_detail');
                                            }
                                        }

                                        function popup_pass(sno) {
                                            var win = window.open("goods_qna_pass.php?sno=" + sno, "qna_register", "width=400,height=200");
                                        }

                                        var count = 0
                                        var beforeWidth = 0
                                        var beforeHeight = 0
                                        // 상품문의는 iframe으로 되어 있어 내부 콘텐츠 size에 따라 iframe size 조절 필요.
                                        // 이미지가 늦게 로딩되는 경우가 있기 때문에 컨텐츠 size를 여러번 체크
                                        // 변경될 경우만 iframe resize함
                                        function resizeFrame() {
                                            var oBody = document.body;
                                            var tb_contents = document.getElementById("contents-wrapper");
                                            var i_height = tb_contents.offsetHeight;
                                            var i_width = tb_contents.offsetWidth;

                                            if (i_width === 0) {
                                                i_width = 100;
                                            }

                                            if (i_height === 0) {
                                                i_height = 100;
                                            }

                                            if (beforeHeight !== i_height) {
                                                parent.resizeFrameHeight('inqna', i_height);
                                                beforeHeight = i_height;
                                            }

                                            if (beforeWidth !== i_width) {
                                                parent.resizeFrameWidth('inqna', i_width);
                                                beforeWidth = i_width;
                                            }

                                            if (count > 3) {
                                                count = 0;
                                                return;
                                            }

                                            count++;
                                            setTimeout(resizeFrame, 500);
                                        }
                                    </script>
								</head>
								<div id="contents-wrapper">
									<div class="xans-element- xans-product xans-product-additional detail_board  ">
										<div class="board">
											<span class="line"></span>
											<div class="title_txt">
												<h2>PRODUCT Q&amp;A</h2>
												<ul class="list_type1 old">
													<li><span class="ico"></span>
														<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은
															사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p></li>
													<li><span class="ico"></span>
														<p class="txt">
															배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a href="#none"
																onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'"
																class="emph">1:1 문의</a>에 남겨주세요.
														</p></li>
												</ul>
											</div>
											<table class="xans-board-listheader" width="100%" border="0"
												cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<th width="100" scope="col" class="input_txt">번호</th>
														<th width="auto" scope="col" class="input_txt">제목</th>
														<th width="100" scope="col" class="input_txt">작성자</th>
														<th width="100" scope="col" class="input_txt">작성일</th>
													</tr>
												</tbody>
											</table>
											<div>
												<table width="100%" class="xans-board-listheaderd">
													<tbody>
														<tr onmouseover="this.style.background='#F7F7F7'" onmouseout="this.style.background=''" onclick="view_content('15968', '1');">
															<td width="100" align="center">공지</td>
															<td class="image" style="padding: 16px 19px 12px; text-align: left;">
																<div style="padding: 3px 0px 0px 20px;">
																	<p class="subject">판매 (일시)중단 제품 안내 (21.3.12 업데이트)</p>
																</div>
															</td>
															<td width="100">Marketkurly</td>
															<td width="100" style="color: #939393">2017-02-01</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div id="content_id" style="display: none;"></div>
											<%
											// DB연결3 : 문의
											Connection conn3 = null;
											PreparedStatement pstmt3 = null;
											ResultSet rs3 = null;

											String sql3 = "";
											String url3 = "jdbc:mysql://localhost:3306/kurlymoly";
											String uid3 = "root";
											String upw3 = "1234";

											try {
												Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
												conn3 = DriverManager.getConnection(url3, uid3, upw3);
												if (conn3 != null) {
													sql3 = "select * from tb_pinquiry WHERE piq_prodidx = ?";
													pstmt3 = conn3.prepareStatement(sql3);
													pstmt3.setInt(1, piq_prodidx);
													rs3 = pstmt3.executeQuery();

													while (rs3.next()) {
														piq_idx = rs3.getInt("piq_idx");
														piq_userid = rs3.getString("piq_userid");
														piq_issecret = rs3.getString("piq_issecret");
														piq_title = rs3.getString("piq_title");
														piq_content = rs3.getString("piq_content");
														piq_inquirydate = rs3.getString("piq_inquirydate");
														piq_reply = rs3.getString("piq_reply");
														piq_replydate = rs3.getString("piq_replydate");
														piq_isreply = rs3.getString("piq_isreply");
														
											%>

											<div class="view">
												<table width="100%" class="xans-board-listheaderd">
													<tbody>
														<tr onmouseover="this.style.background='#F7F7F7'" onmouseout="this.style.background=''" onclick="view_content('412609', '0');" style="">
															<td width="100" align="center"><%=piq_idx%></td>
															<td class="image" style="padding: 16px 19px 12px; text-align: left;">
																<div style="padding: 3px 0px 0px 20px;">
																	<p class="subject"><%=piq_title%></p>
																</div>
															</td>
															<td width="100"><%=piq_userid%></td>
															<td width="100" style="color: #939393"><%=piq_inquirydate.substring(0, 10)%></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div id="content_id" style="display: none;">
												<div class="view">
													<table id="contents" width="100%" onmouseover="this.style.background=&quot;#F7F7F7&quot;" onmouseout="this.style.background=&quot;&quot;" style="">
														<tbody>
															<tr>
																<td style="padding: 16px 19px 12px; text-align: left;">
																	<div style="line-height: 30px;"><%=piq_content%></div>
																	<div style="float: right; margin-top: 20px;"></div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<%
													}
												}
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>

											<p class="btnArea after">
												<a href="javascript:;" onclick="location.href='../mypage/mypage_qna_register.jsp'"><span class="bhs_button" style="line-height: 30px; width: 130px;">상품문의</span></a>
											</p>
										</div>
									</div>
									<div style="clear: both; text-align: center; padding-bottom: 15px;">
										<%
										pageNums = 0;
										if (totalCount % pagePerCount == 0) {
											pageNums = (totalCount / pagePerCount);
										} else {
											pageNums = (totalCount / pagePerCount) + 1;
										}
										%>
										<a href="#" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
										<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
<%-- 										<%
										for (int i = 1; i <= pageNums; i++) {
											out.print("<a href='./goods_detail.jsp?pageNum=" + i + "' class='layout-pagination-button layout-pagination-number'>" + i + "</a>");
										}
										%> --%>

										<a href="#" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 상품상세 및 리뷰페이지 종료 -->
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