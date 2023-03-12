<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ page import="com.kurly.product.ProductDTO"%>
<%@ page import="com.kurly.order.BasketDTO"%>
<%@ page import="com.kurly.member.MemberDTO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id="mdao" class="com.kurly.member.MemberDAO" />
<jsp:useBean id="bdao" class="com.kurly.order.BasketDAO" />
<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO" />

<%
request.setCharacterEncoding("utf-8");
NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷(0,000) 지정을 위한 변수 설정

String userid_as = null; // header.jsp에 있는 변수명(userid)과 일치하여 오류발생함에 따라 변수명 수정 (★나희★)
if (session.getAttribute("m_id") != null) {
	userid_as = (String) session.getAttribute("m_id");
}

//접속한 회원 정보 가져오기
List<MemberDTO> userinfolist = new ArrayList<MemberDTO>();
userinfolist = mdao.useridinfo(userid_as);
System.out.println(userinfolist);

// 접속한 회원 장바구니 가져오기
List<BasketDTO> basketlist = new ArrayList<BasketDTO>();
basketlist = bdao.basketinfo(userid_as);
System.out.println(basketlist);

// 장바구니 상품 리스트 가져오기
List<ProductDTO> productlist = new ArrayList<ProductDTO>();

if (basketlist.size() == 0) {
%>
<!-- 장바구니 상품이 없으면 장바구니 페이지로 돌아감 -->
<script>
	alert('결제예정 상품이 없습니다.');
	location.href = './goods_cart.jsp';
</script>
<%
} else {
%>

<!-- 주문서 (결제페이지) N -->
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
<script src="../../script/MJscript.js?ver=1.4"></script>

</head>

<body>
	<!--wrap 시작-->
	<div id="wrap">
		<div id="pos_scroll"></div>
		<!-- container 시작 -->
		<div id="container">
			<%@ include file="../include/header.jsp"%>

			<!--main 시작-->
			<div id="main">
				<div id="content" style="padding-bottom: 120px;">
					<div id="qnb" class="quick-navigation">
						<div class="bnr_qnb" id="brn_Quick">
							<a href="../board/delivery.html"><img class="thumb"
								src="../../img/sidebar/bnr_quick_20190403.webp"></a>
						</div>

						<div class="side_menu">
							<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a> <a
								href="../../shop/recipe/recipe_all.jsp" class="link_menu">레시피</a>
						</div>
					</div>
					<!-- <style type="text/css"> -->
					
					<!-- <script src="https://res.kurly.com/js/vue/lodash_v2.min.js"></script>
                                                        <script> -->
					<div class="user_form">
						<!-- <script id="delivery"></script>-->
						<h2 class="tit_section fst">주문상품</h2>
						<div id="itemList" class="page_aticle order_goodslist">

							<%
							// ★추가
							productlist = pdao.prodinfo(basketlist.get(0).getBkProdidx());
							String p_title1 = productlist.get(0).getTitle();
							
							
							
							
							if(basketlist.size()==1){
								%>
								<div class="info_product">
								<a class="btn" href="#none"><span class="screen_out">펼침
										/ 닫힘</span></a>
								<div class="short_info"><%=p_title1%> 상품을 주문합니다. </div>
							</div>
							
							
								<%
								
							}else{
								%>
								<div class="info_product">
								<a class="btn" href="#none"><span class="screen_out">펼침
										/ 닫힘</span></a>
								<div class="short_info"><%=p_title1%>외 <span class="num"><%=basketlist.size() - 1%>개</span>상품을
									주문합니다.
								</div>
							</div>
								<%
							}
							%>

							<ul class="list_product">
								<!--  class="list_product" -->
								<%
								// ★추가
								int subtotal_price_sum = 0;
								int subtotal_discprice_sum = 0;

								for (int i = 0; i < basketlist.size(); i++) {

									productlist = pdao.prodinfo(basketlist.get(i).getBkProdidx());

									String p_imgname = productlist.get(0).getImgname();
									String p_title = productlist.get(0).getTitle();

									int p_price = productlist.get(0).getPrice();
									int p_discprice = productlist.get(0).getDiscprice();

									int bk_quantity = basketlist.get(i).getBkQuantity();

									int subtotal_price = p_price * bk_quantity; // 정가 * 수량 
									subtotal_price_sum = subtotal_price_sum + subtotal_price; // 정가 * 수량 누적 (상품금액)

									int subtotal_discprice = p_discprice * bk_quantity; // 할인가 * 수량
									subtotal_discprice_sum = subtotal_discprice_sum + subtotal_discprice; // 할인가 *수량 (주문금액)
								%>


								<li>
									<div class="thumb">
										<img src="../../img/goods_detail/<%=p_imgname%>" alt="상품이미지">
									</div>
									<div class="name">
										<div class="inner_name"><%=p_title%></div>
									</div>
									<div class="ea"><%=bk_quantity%>개
									</div>
									<div class="info_price">
										<span class="num"><span class="price"><%=nf.format(subtotal_discprice)%>원</span></span>
									</div>
								</li>

								<%
								}
								%>

							</ul>
						</div>

						<form id="form" name="frmOrder" action="order_ok.jsp"
							method="post" class="order_view">
							<!--  onsubmit="return chkForm2(this)" 이메일 중복확인 오류가 나서 제외함 -->
							<input type="hidden" name="oUserid" value="<%=userid_as%>">

							<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
							<div class="order_section data_orderer">
								<table class="goodsinfo_table ">
									<tbody>

										<%
										String m_name = userinfolist.get(0).getmName();
										String m_tel = userinfolist.get(0).getmTel();
										String m_email = userinfolist.get(0).getmEmail();
										String m_zipcode = userinfolist.get(0).getmZipcode();
										String m_address1 = userinfolist.get(0).getmAddress1();
										String m_address2 = userinfolist.get(0).getmAddress2();
										%>


										<tr class="fst">
											<th>보내는 분</th>
											<td><%=m_name%><input type="hidden" name="oOrderer"
												value="<%=m_name%>"></td>
											<!-- 주문자명  -->
										</tr>
										<tr>
											<th>휴대폰</th>
											<td><%=m_tel%><input type="hidden" name="oOrdererTel"
												value="<%=m_tel%>"></td>
											<!-- 주문자 전화번호 DBx -->
										</tr>
										<tr>
											<th>이메일</th>
											<td><%=m_email%><input type="hidden" id="email"
												name="orderer_email" value="<%=m_email%>" option="regEmail">
												<!-- 주문자 이메일 DBx -->
												<p class="txt_guide">
													<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
													<span class="txt txt_case2">정보 변경은 <span
														class="txt_desc">마이컬리 &gt; 개인정보 수정</span> 메뉴에서 가능합니다.
													</span>
												</p></td>
										</tr>
									</tbody>
								</table>
							</div>

							<input type="hidden" name="oZipcode" id="zonecode"
								value="<%=m_zipcode%>">
							<!-- 우편번호  -->

							<input type="hidden" name="oAddress1" id="address"
								value="<%=m_address1%>">
							<!-- 주소1  -->
							<input type="hidden" name="oAddress2" id="road_address"
								value="<%=m_address2%>">
							<!-- 주소2  -->
							<input type="hidden" name="oAddress3" id="address_sub" value="">
							<!-- 주소3  -->
							<input type="hidden" name="oAddress4" id="address_sub"
								value="문 앞">
							<!-- 수령장소  -->


							<h2 class="tit_section" id="divAddressWrapper">
								배송 정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
							</h2>

							<div class="address_info">
								<a href="#none" id="btnLayerInfo" class="desc">배송지 변경 안내</a>
								<div class="layer_info" id="layerInfo">
									<strong class="emph">장바구니, 홈</strong>에서<br>배송지를 변경할 수 있어요.
								</div>
							</div>


							<div class="order_section order_address" id="dataDelivery">
								<h3 href="#none" class="section_crux">배송지</h3>
								<div class="section_full">
									<span class="address" id="divDestination" style> <span
										class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span>
										<span class="addr" id="addrInfo"><%=m_address1%><%=m_address2%></span>
										<span class="tag" id="addrTags"> <span
											class="badge star" id="addrBadge">샛별배송</span> <!-- 지역별 배송구분/ 지우거나 그냥 두거나 -->
									</span>
									</span>
								</div>
							</div>

							<div class="order_section order_reception" id="divReception">
								<h3 class="section_crux">상세 정보</h3>
								<div class="section_full">
									<div class="receiving" id="receiverInfo"><%=m_name%>,
										<%=m_tel%></div>
									<div class="way" id="wayPlace">
										<span class="place" id="areaInfo">문 앞</span>
										<!-- 배송장소,배송완료메지시/ 지우거나 그냥 두거나 -->

										<span class="txt" id="meanType">공동현관 비밀번호</span>

										<div class="message" id="deliveryMessage">
											<span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
											<span class="txt" id="deliveryMessageDetail">배송 직후</span>
										</div>
									</div>
									<!-- <button type="button" id="btnUpdateSubAddress"
										data-address-no="" class="btn default">수정</button> -->

								</div>
							</div>
							<div id="divFrozen" class="order_section order_pack">
								<h3 class="section_crux">냉동상품 포장*</h3>
								<div class="section_full">
									<input type="hidden" name="isFrozenPack" value=""> <label
										class="label_radio"> <input type="radio"
										name="frozen_product_packing_option" value="0"
										checked="checked"> <span class="ico"></span> 종이박스 포장
										(기본)
									</label> <label class="label_radio"><input type="radio"
										name="frozen_product_packing_option" value="1"> <span
										class="ico"></span> 스티로폼 박스 포장 </label>
								</div>
							</div>

							<div id="bnrOrder" class="bnr_order" style="display: block;">
								<a href="#layerShow" class="btn_layershow"><img
									src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper.png"
									alt="All Paper Challenge"></a>
								<p class="screen_out">사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기</p>
							</div>
							<%
							int discount = subtotal_price_sum - subtotal_discprice_sum; // 상품금액 - 주문금액(상품 할인 금액) 
							int usecoupon = 0;
							int usepoint = 0;
							int deliveryfee = 0; //44000원이상 or 0원 시  배송비 0원 	
							if (subtotal_discprice_sum < 44000 && subtotal_discprice_sum != 0) {
								deliveryfee = 3000;
							} //44000원미만 배송비 3000원
							int finalprice = subtotal_discprice_sum + deliveryfee; // finalprice delieveryfee if 문과 순서변경 
							int addpoint = (int) (subtotal_discprice_sum * 0.005); // 적립금 0.5% =0.005 로 수정
							%>
							<input type="hidden" name="oProdamount"
								value="<%=subtotal_price_sum%>">
							<!-- 상품금액 -->
							<input type="hidden" name="oDiscount" value="<%=discount%>">
							<!-- 상품할인금액 -->
							<input type="hidden" name="oUsecoupon" value="<%=usecoupon%>">
							<!-- 쿠폰할인금액 -->
							<input type="hidden" name="oUsepoint" value="<%=usepoint%>">
							<!--적립금사용액-->
							<input type="hidden" name="oDeliveryfee"
								value="<%=deliveryfee%> ">
							<!-- 배송비 -->
							<input type="hidden" name="oAmountpaid" value="<%=finalprice%>">
							<!-- 결제금액 -->
							<input type="hidden" name="oAddpoint" value="<%=addpoint%>">
							<!-- 적립예정금액 -->





							<div class="tax_absolute">
								<div class="inner_sticky" id="sticky" style="top: 0px;">
									<h2 class="tit_section">결제금액</h2>
									<div id="orderitem_money_info">
										<dl class="amount fst">
											<dt class="tit">주문금액</dt>
											<dd class="price">
												<span id="productsTotalPrice"><%=nf.format(subtotal_discprice_sum)%></span>
												원
											</dd>
										</dl>
										<dl class="amount sub">
											<dt class="tit">상품금액</dt>
											<dd class="price">
												<span id="paper_goodsprice"><%=nf.format(subtotal_price_sum)%></span>
												원
											</dd>
										</dl>
										<dl class="amount sub">
											<dt class="tit">상품할인금액</dt>
											<dd class="price sales_area">
												<span class="pm_sign normal" style="display: inline;">-</span>
												<span id="special_discount_amount" class="normal"><%=nf.format(discount)%></span>
												원
											</dd>
											<dd id="paper_sale" class="screen_out">300</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">배송비</dt>
											<dd class="price delivery_area">
												<div id="paper_delivery_msg1" style="display: none;">
													<span class="pm_sign" style="display: none;">+</span> <span
														id="paper_delivery" class="">0</span> <span
														id="paper_delivery2" style="display: none">0</span> 원
												</div>
												<div id="paper_delivery_msg2" style="display: block;"><%=nf.format(deliveryfee)%>
													원
												</div>
												<div id="paper_delivery_msg_extra" class="small"
													style="display: none;"></div>
												<span id="free_delivery_coupon_msg" class="screen_out">미적용</span>
												<input type="hidden" name="free_delivery" value="0">
											</dd>
										</dl>
										<dl class="amount">
											<!-- 쿠폰 / 적립금은 미적용 -->
											<dt class="tit">쿠폰할인금액</dt>
											<dd class="price coupon_area">
												<span class="pm_sign" style="display: none;">-</span> <span
													id="apr_coupon_data">0</span> 원 <input type="hidden"
													name="coupon" size="12" value="0" readonly="">
											</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">적립금사용</dt>
											<dd class="price">
												<span class="num pay_sum" id="paper_reserves">0 원</span> <input
													type="hidden" name="coupon_emoney" size="12" value="0"
													readonly="">
											</dd>
										</dl>
										<dl class="amount lst">
											<dt class="tit">최종결제금액</dt>
											<dd class="price">
												<span id="paper_settlement"><%=nf.format(finalprice)%></span>
												<span class="won">원</span>
											</dd>
										</dl>
										<p class="reserve" style="display: block;">
											<span class="ico">적립</span> 구매 시 <span class="emph"><span
												id="expectAmount"><%=nf.format(addpoint)%></span> 원 (<span
												class="ratio">0.5</span>%) 적립</span>
										</p>
									</div>
								</div>
							</div>

							<div class="data_payment">
								<div class="tbl_left">
									<h2 class="tit_section">쿠폰 / 적립금</h2>

									<div class="tbl_line">
										<table class="goodsinfo_table">
											<tbody>
												<tr>
													<th>쿠폰 적용</th>
													<td>
														<div class="view_popselbox" style="width: 553px;">
															<!-- <div id="popselboxView" class="select_box"> -->
															
																<select name="oPaidtype1" class="list" style="width:553px; height:50px;">
																	<option value="">쿠폰을 선택해 주세요</option>
																	<option value="ACO123">[대한민국순산대전] 수산인의 날/ 5,000원 할인쿠폰</option>
																	<option value="ACO456">[농활갑시다]토마토 기획전/ 5.000원 할인쿠폰</option>
																</select>

															<!-- 
																사용 가능 쿠폰 <span id="useCoupon">0</span>개 / 전체 <span
																	id="haveCoupon">0</span>개
															</div>
															<div id="popSelbox" class="layer_coupon">
																<ul id="addpopSelList" class="list">
																	<li class="fst checked ">
																		<div class="inner_item">
																			<span class="txt_tit default">쿠폰 적용 안 함</span>
																		</div>
																	</li>
																	<li style="pointer-events: none;">
																		<div class="inner_item">
																			<div class="item_row">
																				<div class="item_td left">
																					<span class="txt_apr coupon_na">사용불가</span><span
																						class="txt_is_dc" style="display: none;">원
																						할인</span>
																				</div>
																				<div class="item_td">
																					<span class="txt_tit coupon_na">[농할갑시다]봄제철20%(최대1만원,~3/15
																						11시)</span> <span class="txt_desc coupon_na">봄제철
																						(나물·딸기) 특가전 20% 쿠폰 (최대 1만원, ~3/15 오전 11시까지)</span> <span
																						class="txt_expire coupon_na">유효기간
																						2021-03-15 까지</span>
																					<div id="apply_delivery_coupon"
																						class="is_delivery_coupon" style="display: none;">0</div>
																					<div class="txt_apply_coupon"
																						style="display: none;">481842008</div>
																				</div>
																			</div>
																		</div>
																	</li>
																	<li style="pointer-events: none;">
																		<div class="inner_item">
																			<div class="item_row">
																				<div class="item_td left">
																					<span class="txt_apr coupon_na">사용불가</span><span
																						class="txt_is_dc" style="display: none;">원
																						할인</span>
																				</div>
																				<div class="item_td">
																					<span class="txt_tit coupon_na">[대한민국수산대전]봄설레임전
																						1주차 20%(최대1만원)</span> <span class="txt_desc coupon_na">봄설레임전
																						1주차 20% 할인쿠폰 (최대 1만원, ~3/15 오전 11시까지)</span> <span
																						class="txt_expire coupon_na">유효기간
																						2021-03-15 까지</span>
																					<div id="apply_delivery_coupon"
																						class="is_delivery_coupon" style="display: none;">0</div>
																					<div class="txt_apply_coupon"
																						style="display: none;">486819129</div>
																				</div>
																			</div>
																		</div>
																	</li> -->
																	<!-- <li>
																		<div class="inner_item">
																			<div class="item_row">
																				<div class="item_td left">
																					<span class="txt_apr">1,138</span><span
																						class="txt_is_dc">원 할인</span>
																				</div>
																				<div class="item_td">
																					<span class="txt_tit">[농할갑시다]우리 한우 20%(최대
																						1만원,~3/18)</span> <span class="txt_desc">농할쿠폰 스티커
																						부착 상품 20% 할인 (최대 1만원. ~3/18 오전 11시까지)</span> <span
																						class="txt_expire">유효기간 2021-03-18 까지</span>
																					<div id="apply_delivery_coupon"
																						class="is_delivery_coupon" style="display: none;">0</div>
																					<div class="txt_apply_coupon"
																						style="display: none;">495843326</div>
																				</div>
																			</div>
																		</div>
																	</li> -->
														<!-- 		</ul> -->
																<!-- <div class="coupon_list_default" style="display: none;">
																	<li class="fst checked ">
																		<div class="inner_item">
																			<span class="txt_tit default">쿠폰 적용 안 함</span>
																		</div>
																	</li>
																</div>
																<div id="listItem" style="display: none">
																	<div class="inner_item">
																		<div class="item_row">
																			<div class="item_td left">
																				<span class="txt_apr"></span>
																			</div>
																			<div class="item_td">
																				<span class="txt_tit"></span> <span class="txt_desc"></span>
																				<span class="txt_expire"></span>
																				<div id="apply_delivery_coupon"
																					class="is_delivery_coupon" style="display: none;">
																				</div>
																				<div class="txt_apply_coupon" style="display: none;">
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<button id="popSelboxCancel" type="button"
																	class="btn btn_cancel screen_out">취소</button>
																<button id="popSelboxSelect" type="button"
																	class="btn btn_conf screen_out">확인</button>
																<button id="popSelboxClose" type="button"
																	class="btn_close screen_out">닫기</button>
															</div> -->
														<!-- </div>
														<div id="notavailableMsg" class="txt_notavailable"
															style="display: none;"></div>
														<p class="txt_inquiry">
															<a href="#none" class="link" id="happyTalk">쿠폰사용문의(카카오톡)</a>
														</p> -->
													</td>
												</tr>
												<tr class="emoney_use ">
													<th class="no_emoney">적립금 적용 <input type="hidden"
														value="0" name="checkEmoney">
													</th>
													<td>
														<div id="ondealCheck">
															<div class="emoney_reg">
																<input type="text" name="using_point" id="emoney"
																	class="number_only" value="" placeholder="0"
																	pattern="[0-9]*" inputmode="decimal"
																	onblur="chk_emoney(this);"
																	onkeyup="debounceCalcuSettle();"
																	onkeydown="if (event.keyCode == 13) {return false}">
																<div class="check">
																	<label class="emoney_chkbox"> <input
																		type="checkbox" name=""> <span
																		class="txt_checkbox">모두사용</span>
																	</label>
																</div>
															</div>
															<p class="possess">
																보유 적립금 : <strong class="emph">0</strong>원 <input
																	type="hidden" name="emoney_max" value="1954">
															</p>
															<ul class="list_notice">
																<li>· 보유 적립금 1천원 이상부터 사용가능</li>
																<li>· 적립금 내역: 마이컬리 &gt; 적립금</li>
															</ul>
														</div>
														<p id="msgNomoney"></p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>




						<div class="data_method">
								<h2 class="tit_section" id="titFocusMethod">결제수단</h2>

								<input type="hidden" name="escrow" value="N">
								<table class="goodsinfo_table tbl_left">
									
									<tbody>
                                            <tr>
                                                <th>일반결제</th>
                                                <td class="noline" style="position:relative">
                                                    <label class="label_radio" id="settlekindCard"
                                                        onclick="option_pay_standard('');" style="padding-bottom:4px;">
                                                        <input type="radio" name="oPaidtype" value="신용카드" > <!-- 결제방식선택 oPaidtype--> 
                                                        신용카드
                                                    </label>
                                                </td>
                                            </tr>
                
                                            <tr class="card_detail">
                                                <th></th>
                                                <td>
                                                    <div id="cardSelect">
                                                        <div>
                                                            <div class="card_select">
                                                               
                                                                    <select name="oPaidtype1"class="list" style= "width: 200px; height:50px;">     
                                                                        <option value="">카드를 선택해주세요</option>
                                                                        <option value="61">현대(무이자)</option>
                                                                        <option value="41">신한</option>
                                                                        <option value="31">비씨</option>
                                                                        <option value="11">KB국민</option>
                                                                        <option value="51">삼성</option>
                                                                        <option value="36">씨티</option>
                                                                        <option value="71">롯데</option>
                                                                        <option value="21">하나(외환)</option>
                                                                        <option value="91">NH채움</option>
                                                                        <option value="33">우리</option>
                                                                        <option value="34">수협</option>
                                                                        <option value="46">광주</option>
                                                                        <option value="35">전북</option>
                                                                        <option value="42">제주</option>
                                                                        <option value="62">신협체크</option>
                                                                        <option value="38">MG새마을체크</option>
                                                                        <option value="39">저축은행체크</option>
                                                                        <option value="37">우체국카드</option>
                                                                        <option value="30">KDB산업은행</option>
                                                                        <option value="15">카카오뱅크</option>
                                                                    </select>
                                                                
                                                            </div>
                                                            <div class="card_event">
                                                                <div></div>
                                                                <div class="inner_card">
                                                                    <div><strong class="emph">· 무이자할부 유의사항</strong>
                                                                        은행계열/체크/기프트/선불/법인/개인사업자 기업카드는 제외</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                
                                            <tr>
                                                <th> CHAI 결제</th>
                                                <td>
                                                    <label class="label_radio" id="cardBenefitChai">
                                                        <input type="radio" name="oPaidtype" value="chai">  <!-- 결제방식선택 oPaidtype /onclick="input_escrow(this,'N')"--> 
                                                        <img src="https://res.kurly.com/pc/service/order/2001/logo_chi_x2.png" height="18" alt="Chai 결제">
                                                        <img class="img_benefit" src="https://res.kurly.com/pc/service/order/2101/bubble_chai_0301.png" height="20">
                                                        <div class="info_benefit"><span class="info">·3/1 0시 ~ 3/31 24시, 차이 ID당 1회<br>·매 결제 1.5% 차이머니 캐시백</span></div>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th> 토스 결제</th>
                                                <td>
                                                    <label class="label_radio" id="cardBenefitToss">
                                                        <input type="radio" name="oPaidtype" value="toss" > <!-- 결제방식선택 oPaidtype--> 
                                                        <img src="https://res.kurly.com/pc/service/order/1912/toss-logo-signature.svg" height="18" alt="토스 결제">
                                                        <img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
                                                        <div class="info_benefit"></div>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>네이버페이 결제</th>
                                                <td class="noline">
                                                    <label class="label_radio" id="cardBenefitNaverpay">
                                                        <input type="radio" name="oPaidtype" value="n" > <!-- 결제방식선택 oPaidtype--> 
                                                        <img src="../../img/goodscart/ico_naverpay_v3.webp" height="20" alt="네이버 페이 로고">
                                                        <img class="img_benefit" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP4zwAAAgEBAKEeXHUAAAAASUVORK5CYII=" height="20">
                                                        <div class="info_benefit"></div>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>PAYCO 결제</th>
                                                <td>
                                                    <label class="label_radio" id="cardBenefitPayco">
                                                        <input type="radio" name="oPaidtype" value="페이코" > <!-- 결제방식선택 oPaidtype--> 
                                                            
                                                        <img src="https://static-bill.nhnent.com/payco/checkout/img/v2/btn_checkout2.png" alt="PAYCO 간편결제" height="18">
                                                        <img class="img_benefit" src="https://res.kurly.com/pc/service/order/2101/bubble_payco_0303.png" height="20">
                                                        <div class="info_benefit"><span class="info">·03/09 0시 ~ 04/30 24시, 결제 건당 최대 1,000원<br>·기본 2% + 추가 3% 페이코 포인트 적립</span></div>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>스마일페이 결제</th>
                                                <td>
                                                    <label class="label_radio" id="cardBenefitSmilepay">
                                                        <input type="radio" name="oPaidtype" value="스마일페이" > <!-- 결제방식선택 oPaidtype--> 
                                                        <img src="../../img/goodscart/ico_smilepay_v2.webp" alt="스마일페이" height="18">
                                                        <img class="img_benefit" src="../../img/goodscart/bubble_smilepay_0315.webp" height="20">
                                                        <div class="info_benefit"></div>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>휴대폰 결제</th>
                                                <td>
                                                    <label class="label_radio">
                                                        <input type="radio" name="oPaidtype" value="휴대폰" > <!-- 결제방식선택 oPaidtype--> 
                                                        휴대폰
                                                    </label>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td class="txt_notice" colspan="2">
                                                    <ul>
                                                        <li>※ 페이코, 네이버페이, 토스, 차이 결제는 결제 시 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</li>
                                                        <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
                                                        <li>※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수 있습니다. <a href="/shop/board/view.php?id=notice&amp;no=207" target="_blank">공지 보러가기</a></li>
                                                        <li id="coupon_typinfo" style="display:none">※ 무통장입금에서만 사용가능한 쿠폰을 선택하였습니다. 다른 결제 수단을 선택하시려면 쿠폰을 제거 하여 주십시오.</li>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                    <input type="hidden" name="undeliver_way" value="2">
                
                                    <div id="cash" style="display:none;">
                                        <h2 class="tit_section">현금영수증발급</h2>
                                        <table class="goodsinfo_table">
                                            <tbody>
                                                <tr>
                                                    <th>현금영수증</th>
                                                    <td>
                                                        <label class="label_radio">
                                                            <input type="radio" name="cashreceipt" value="Y" onclick="cash_required()">
                                                            신청
                                                        </label>
                                                        <label class="label_radio checked">
                                                            <input type="radio" name="cashreceipt" value="N" onclick="cash_required()"
                                                                checked="">
                                                            신청안함
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>발행용도</th>
                                                    <td>
                                                        <label class="label_radio checked">
                                                            <input type="radio" name="cashuseopt" value="0" onclick="setUseopt()"
                                                                checked="">
                                                            소득공제용
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="cashuseopt" value="1" onclick="setUseopt()">
                                                            지출증빙용
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <span id="cert_0" style="display:block;">휴대폰번호</span>
                                                        <span id="cert_1" style="display:none;">사업자번호</span>
                                                    </th>
                                                    <td style="padding-top:14px;">
                                                        <input type="text" name="cashcertno" value="" option="regNum" class="line"
                                                            placeholder="- 생략">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- <script> -->
                                </div>
                                <div style="clear:both;"></div>
                                <h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
                                <div class="data_orderer">
                                    <table class="goodsinfo_table">
                                        <tbody>
                                            <tr>
                                                <td class="reg_agree">
                                                    <div class="bg_dim"></div>
                                                    <div class="check type_form">
                                                        <label class="agree_check">
                                                            <input type="checkbox" name="ordAgree" value="y" required="" fld_esssential=""
                                                                label="결제 진행 필수 동의" msgr="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다.">
                                                            <span class="ico"></span>
                                                            결제 진행 필수 동의
                                                        </label>
                                                        <ul class="list_agree">
                                                            <li>
                                                                <span class="subject">개인정보 수집 · 이용 및 위탁 동의 <span
                                                                        class="emph">(필수)</span></span>
                                                                <a href="#terms" class="link_terms">약관보기</a>
                                                            </li>
                                                            <li id="pgTerms" style="display: list-item;">
                                                                <span class="subject">결제대행 서비스 약관 동의 <span class="emph">(필수)</span></span>
                                                                <a href="#pgTerms" class="link_terms">약관보기</a>
                                                            </li>
                                                        </ul>
                                                        <div class="layer layer_agree">
                                                            <div class="choice_agree view_terms">
                                                                <div class="inner_layer">
                                                                    <div class="in_layer" id="viewTerms"></div>
                                                                    <button type="button" class="btn_ok">확인</button>
                                                                    <button type="button" class="btn_close"><span class="screen_out">레이어
                                                                            닫기</span></button>
                                                                </div>
                                                            </div>
                                                            <div class="choice_agree view_pg">
                                                                <div class="inner_layer">
                                                                    <div class="in_layer" id="viewPg"></div>
                                                                    <button type="button" class="btn_ok">확인</button>
                                                                    <button type="button" class="btn_close"><span class="screen_out">레이어
                                                                            닫기</span></button>
                                                                </div>
                                                            </div>
                    
                                                            <div class="choice_agree view_layer">
                                                                <div class="inner_layer">
                                                                    <div class="in_layer in_allpaper">
                                                                        <img src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper_big_v2.png"
                                                                            alt="샛별배송은 왜 종이 포장재를 사용할까요?">
                                                                        <p class="screen_out">
                                                                            샛별배송을 사용하는 것만으로도 지구를 위하는 일에 함께하실 수 있어요.
                                                                            신선함을 지키는 보냉력과 내구성은 그대로! 다른 어떤 소재보다도 재활용성이 우수하니까!
                                                                            폐기해도 빠르게 분해되니까!
                                                                        </p>
                                                                    </div>
                                                                    <button type="button" class="btn_ok">확인</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

							<div id="paymentMethodResult">


								<input type="hidden" name="oShipstate" value="주문완료">
								<!-- 처리상태 -->
							</div>
							<input type="submit" value="결제하기" class="btn_payment">
						</form>



						<ul class="notice_order">
							<li>직접 주문취소는 <span class="emph">‘입금확인’</span> 상태에서만 가능합니다.
							</li>
							<li>미성년자가 결제 시 법정대리인이 거래를 취소할 수 있습니다.</li>
							<li class="emph">상품 미 배송시, 결제수단으로 환불됩니다.</li>
						</ul>
						<div id="dynamic"></div>
					</div>
					<div class="bg_loading" id="bgLoading" style="display: none;">
						<div class="loading_show"></div>
					</div>
				</div>
			</div>
		</div>

		<!--DSR 시작-->
		<div id="layerDSR">
			<div class="bg_dim"></div>
			<div class="in_layer">
				<div class="inner_layer layer_star">
					<strong class="dsr_result">샛별배송 지역입니다.</strong>
					<div class="ani">
						<img
							data-src="https://res.kurly.com/mobile/img/1908/img_delivery_kurly.png"
							src="https://res.kurly.com/mobile/service/common/bg_1x1.png"
							alt="샛별배송 이미지">
					</div>
					<p class="dsr_desc">
						<strong class="emph">오늘 밤 11시 전</strong>까지 주문시<br> <strong
							class="emph">다음날 아침 7시</strong> 이전 도착합니다!
					</p>
					<p class="dsr_notice">샛별배송은 휴무 없이 매일 배송 합니다</p>
				</div>
				<div class="inner_layer layer_normal">
					<strong class="dsr_result">택배배송 지역입니다.</strong>
					<div class="ani">
						<img
							data-src="https://res.kurly.com/mobile/img/1908/img_delivery_car.png"
							src="https://res.kurly.com/mobile/service/common/bg_1x1.png"
							alt="택배배송 이미지">
					</div>
					<p class="dsr_desc">
						<strong class="emph">밤 8시 전</strong>까지 주문시<br> <strong
							class="emph">다음날</strong> 도착합니다!
					</p>
					<p class="dsr_notice">일요일은 배송 휴무로 토요일에는 주문 불가</p>
				</div>
				<div class="inner_layer layer_none">
					<strong class="dsr_result">배송 불가 지역입니다.</strong>
					<div class="ani">
						<img
							data-src="https://res.kurly.com/mobile/img/1908/img_delivery_none.png"
							src="https://res.kurly.com/mobile/service/common/bg_1x1.png"
							alt="배송불가 이미지">
					</div>
					<p class="dsr_desc">
						<strong class="emph">도로명 주소</strong>로 검색하셨다면,<br> <strong
							class="emph">지번 주소(구 주소)</strong>로 다시 시도해 주세요.
					</p>
					<p class="dsr_notice">배송지역을 확장하도록 노력하겠습니다!</p>
				</div>
				<div class="layer_btn1">
					<button type="button" class="btn_close"
						onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();">확인</button>
				</div>
				<button type="button" class="layer_close"
					onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();"></button>
			</div>
		</div>
		<!--DSR끝-->

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
		$(document).ready(
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
							$self.$window.on('scroll', function() {
								$self.$scrollTop = parseInt($self.$window
										.scrollTop());
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
									&& parseInt($('#branch-banner-iframe').css(
											'bottom')) > 0) {
								$('#footer').addClass('bnr_app');
								$self.saveHeight += $('#branch-banner-iframe')
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
}
%>