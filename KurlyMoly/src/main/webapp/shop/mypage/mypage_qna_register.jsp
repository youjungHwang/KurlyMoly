<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %> 
<jsp:useBean id="mdao" class="com.kurly.member.MemberDAO" />


<%
	String userid_as = null;
	if (session.getAttribute("m_id") != null) {
		userid_as = (String) session.getAttribute("m_id");
		
	
	
	
	
%>

<!-- 1:1 문의 작성 페이지 -->
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
		#content {
			padding-bottom: 120px;
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
							<a href="../board/delivery.html"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
						</div>

						<div class="side_menu">
							<a href="../../event_lovers.html" class="link_menu">등급별 혜택</a>
							<a href="#" class="link_menu">레시피</a>
						</div>
					</div>

					<!-- 마이페이지_자주하는질문(faq) 시작 -->
					<div class="page_aticle aticle_type2">
						<div id="snb" class="snb_cc">
							<h2 class="tit_snb">고객센터</h2>
							<div class="inner_snb">
								<ul class="list_menu">
									<li><a href="../board/notice.html">공지사항</a></li>
									<li><a href="../board/faq.html">자주하는 질문</a></li>
									<li class="on"><a href="./mypage_qna_register.html">1:1 문의</a></li>
								</ul>
							</div>
							<a href="./mypage_qna_register.html" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
						</div>
						<div class="page_section section_qna">
							<div class="head_aticle">
								<h2 class="tit">1:1 문의</h2>
							</div>

							<!-- 1:1 문의 Form 시작 -->
							<div class="xans-board-write">
								<form name="fm" id="fm" method="post" action="mypage_qna_register_ok.jsp"
									enctype="multipart/form-data" onsubmit="return chkForm(this)" style="height: 100%;">
									 <input type="hidden" name="userid" value="<%=userid_as%>">
									 <input type="hidden" name="isreply" value="미답변">

									<table id="table_after" class="boardWrite2" width="100%">
										<colgroup>
											<col width="14%" align="right">
										</colgroup>
										<tbody>
											<tr>
												<th class="input_txt">제목</th>
												<td><select name="itemcd" required fld_esssential=""
													label="질문유형" class="select">
														<option value="">선택해주세요.</option>
														<option value="배송지연/불만">배송지연/불만</option>
														<option value="컬리패스(무료배송)">컬리패스(무료배송)</option>
														<option value="반품문의">반품문의</option>
														<option value="A/S문의">A/S문의</option>
														<option value="환불문의">환불문의</option>
														<option value="주문결제문의">주문결제문의</option>
														<option value="회원정보문의">회원정보문의</option>
														<option value="취소문의">취소문의</option>
														<option value="교환문의">교환문의</option>
														<option value="상품정보문의">상품정보문의</option>
														<option value="기타문의">기타문의</option>
												</select><br> <input type="text" name="subject"
													style="width: 100%" required="" fld_esssential=""
													label="제목" value=""></td>
											</tr>
											<tr>
												<th class="input_txt">주문번호</th>
												<td><input type="text" name="ordno" style="width: 25%">
													<!--     readonly="readonly" onclick="$(this).blur()"
                                                        onfocus="$(this).blur()">
                                                    <input onclick="order_open()" type="button" class="bhs_button yb"
                                                        value="주문조회" style="float:none; line-height:27px; width:100px;">
                                                    <div style="position:relative;z-index:1">
                                                        <iframe id="ifm_order" frameborder="0" scrolling="no"
                                                            style="display:none;position:absolute;width:560px;height:380px;background-color:#fff;position:absolute;left:0;top:0;border:1px solid #000"></iframe>
                                                    </div> --></td>
											</tr>
											<!-- 
                                            <tr>
                                                <th class="input_txt">이메일</th>
                                                <td>
                                                    <input type="text" name="email" value="example@example.com" size="26"
                                                        readonly="readonly" class="read_only">
                                                    <span class="noline smalle" style="padding-left:10px"><input
                                                            type="checkbox" name="mailling"><span
                                                            style="font-size:8pt;">답변수신을 이메일로 받겠습니다.</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="input_txt">문자메시지</th>
                                                <td>
                                                    <input type="text" name="mobile[]" value="010-1111-1111"
                                                        readonly="readonly" class="read_only">
                                                    <span class="noline smalle" style="padding-left:10px"><input
                                                            type="checkbox" name="sms"><span
                                                            style="font-size:8pt;">답변수신을 문자메시지로 받겠습니다.</span></span>
                                                </td>
                                            </tr>
                                             -->
											<tr>
												<th class="input_txt">내용</th>
												<td class="edit_area" style="position: relative;">

													<style>
#qnaNotice .qna_goods {
	display: none
}
</style>
													<div id="qnaNotice">
														<div class="inner_qnaNotice">
															<div class="notice_qna">
																<!--
                                                                1:1문의하기에 들어가는 class="qna_public"
                                                                상품문의하기에 들어가는 class="qna_goods"
                                                                -->
																<strong class="tit qna_public">1:1 문의 작성 전
																	확인해주세요!</strong> <strong class="tit qna_goods">상품문의 작성
																	전 확인해 주세요!</strong>

																<dl class="list qna_goods">
																	<dd>
																		<span>답변은 영업일 기준 2~3일 소요됩니다.</span> <span>해당
																			게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</span> <span>배송관련,
																			주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</span>
																	</dd>
																</dl>

																<dl class="list qna_goods">
																	<dt>제품</dt>
																	<dd>
																		<span>입고일: 품절 상품 입고 일이 확정된 경우, 섬네일에 기재되어
																			있습니다.(종 모양을 클릭하여, 재입고 알람 설정 가능)</span> <span>제품 상세정보:
																			영양성분 및 함량, 용량, 보관 및 취급 방법 등 제품 정보는 상세 이미지 또는 상세정보에서
																			확인 가능합니다.</span>
																	</dd>
																</dl>

																<dl class="list qna_public">
																	<dt>반품 / 환불</dt>
																	<dd>
																		<span>제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인
																			내용을 남겨주세요.</span>
																	</dd>
																</dl>

																<dl class="list" id="branchByVersion15">
																	<dt>주문취소</dt>
																	<dd class="old" style="display: none">
																		<!-- 구버전 분기처리 -->
																		<span>샛별 지역 : 배송일 전날 19시까지 <br> 택배 지역 :
																			배송일 전날 18시까지 <br> 고객행복센터(1644-1107)/ 1:1문의 게시판/
																			카카오톡(마켓컬리) 으로 취소 요청 바랍니다.
																		</span> <span>생산이 시작된 이후에는 취소가 불가능 한 점 고객님의 양해 부탁드립니다.</span>
																		<span>일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> <span>주문상품의
																			부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span> <span>비회원
																			주문건의 경우 1:1문의 게시판 접수가 불가하기에 고객행복센터(1644-1107),
																			카카오톡(마켓컬리) 로 취소 요청 부탁드립니다.</span>
																	</dd>
																	<dd class="new">
																		<span> 배송 단계별로 주문취소 방법이 상이합니다. <br> [입금확인]
																			단계 : [마이컬리 &gt; 주문내역 상세페이지] 에서 직접 취소 가능 <br>
																			[입금확인] 이후 단계 : 고객행복센터로 문의
																		</span> <br> <span>생산이 시작된 [상품 준비중] 이후에는 취소가 제한되는
																			점 고객님의 양해 부탁드립니다.</span> <span>비회원은 모바일 App 또는 모바일
																			웹사이트에서 [마이컬리 &gt; 비회원 주문 조회 페이지] 에서 취소가 가능합니다.</span> <span>일부
																			예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> <span>주문상품의 부분 취소는
																			불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span>
																	</dd>
																</dl>

																<dl class="list">
																	<dt>배송</dt>
																	<dd>
																		<span>주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.</span> <span>배송일
																			및 배송시간 지정은 불가능합니다. (예약배송 포함)</span>
																		<p class="info">※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가
																			문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.</p>
																	</dd>
																</dl>
															</div>
														</div>
													</div> <script>
														var qnaNotice = new Vue(
																{
																	el : '#qnaNotice',
																	data : {
																		getData : null,
																		layerOn : true
																	},
																	methods : {
																		update : function() {
																			var $self = this;
																			$
																					.ajax(
																							{
																								type : 'GET',
																								url : campaginUrl
																										+ 'pc/notice/qna_info.html',
																								datatype : 'html',
																								async : true,
																							})
																					.done(
																							function(
																									result) {
																								$self.getData = result;
																							});
																		}
																	}
																});
														$(document)
																.ready(
																		function() {
																			qnaNotice
																					.update();
																		});
													</script> <textarea
														name="contents" style="width: 100%; height: 474px;"
														class="editing_area" required="" fld_esssential=""
														label="내용"></textarea>
												</td>
											</tr>
											<tr>
												<th class="input_txt">이미지</th>
												<td>
													<table width="95%" id="table" cellpadding="0"
														cellspacing="0" border="0"
														style="border: solid 1px #f4f4f4; border-collapse: collapse;">
														<tbody>
															<tr id="tr_0">
																<td width="20" nowrap="" align="center">1</td>
																<td width="100%"><input type="file" name="file"
																	style="width: 50%" class="linebg"> <!-- <a href="javascript:add()"><img
                                                                            src="../../img/gongjisahang_image/btn_upload_plus.webp"
                                                                            align="absmiddle"></a>  -->
																</td>
															</tr>
														</tbody>
													</table>
													<table>
														<tbody>
															<tr>
																<td height="2"></td>
															</tr>
														</tbody>
													</table> <!-- <div width="100%" style="padding:5px;" class="stxt">
                                                        - 파일은 최대 5개까지 업로드가 지원됩니다.<br>
                                                    </div> -->
												</td>
											</tr>
										</tbody>
									</table>

									<table width="100%">
										<tbody>
											<tr>
												<td align="right" style="padding-top: 5px; border: none;"
													id="avoidDbl"><input type="submit"
													class="bhs_button yb" value="저장" style="float: none;">
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>

						</div>
					</div>


				</div>

				<script type="text/javascript">
					function order_open() {
						var divEl = document.getElementById('ifm_order');
						divEl.style.display = "block";
						if (divEl.src == '')
							divEl.src = "mypage_qna_order.php";

						// KM-1483 Amplitude 연동
						KurlyTracker
								.setScreenName('personal_inquiry_writing_order_history_selection');
					}

					function order_close() {
						var divEl = document.getElementById('ifm_order');
						divEl.style.display = "none";
					}

					function order_put(ordno) {
						document.fm.ordno.value = ordno;
						order_close();
					}

					function add() {
						var table = document.getElementById('table');
						var reviewFileNum = "5";
						if (table.rows.length >= parseInt(reviewFileNum)) {
							alert("업로드는 최대 " + reviewFileNum + "개만 지원합니다");
							return;
						}
						var tr_num = table.rows.length;
						oTr = table.insertRow(table.rows.length);
						oTr.id = "tr_" + (tr_num);
						oTd1 = oTr.insertCell(0);
						oTd1.style.textAlign = "center";
						oTd2 = oTr.insertCell(1);
						tmpHTML = "<input type=file name='file[]' style='width:50%' class=line> <a href=\"javascript:del('"
								+ "tr_"
								+ (tr_num)
								+ "')\"><img src='/shop/data/skin/designgj/img/common/btn_upload_minus.gif' align=absmiddle></a>";
						oTd2.innerHTML = tmpHTML;
						calcul();
					}
					function del(index, ncode) {
						var table = document.getElementById('table');
						for (i = 0; i < table.rows.length; i++)
							if (index == table.rows[i].id)
								table.deleteRow(i);
						calcul();
					}
					function calcul() {
						var table = document.getElementById('table');
						for (var i = 0; i < table.rows.length; i++) {
							table.rows[i].cells[0].innerHTML = i + 1;
						}
					}

					// KM-1483 Amplitude 연동
					KurlyTracker.setScreenName('personal_inquiry_writing');
				</script>
				<!-- 마이페이지_자주하는질문(faq) 종료 -->

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
		// 현재 반대로 액션되는 문제 발생
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
		// 클릭인인경우(푸터에 있으나, 아직공용작업은 못함) => bgLoading 이부분 처리필요
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
}else{ %>
		
		<script>
			alert("로그인 후 이용가능합니다.");
			location.href = "../member/login.jsp";
		</script>
<% } %>	
