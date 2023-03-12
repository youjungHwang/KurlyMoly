<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*" %> 
<jsp:useBean id="mdao" class="com.kurly.member.MemberDAO" />

<%
	String userid_as = null;
	if (session.getAttribute("m_id") != null) {
		userid_as = (String) session.getAttribute("m_id");
		
	
	//접속한 회원 정보 가져오기
	List<MemberDTO> userinfolist = new ArrayList<MemberDTO>();

    System.out.println("userid_as:"+userid_as);
	userinfolist = mdao.useridinfo(userid_as);
	System.out.println("userinfolist:"+userinfolist);
	
	String m_tel = userinfolist.get(0).getmTel();
	String m_email = userinfolist.get(0).getmEmail();
	
	
	
	
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
	<link href="../../css/mypage.css" rel="stylesheet" type="text/css">
	
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
							<a href="../board/delivery.html"><img class="thumb"
								src="../../img/sidebar/bnr_quick_20190403.webp"></a>
							<script>
								var brnQuickScript = (function() {
									var $target = $('#brnQuickObj'), $targetThumb = $('#brnQuickObj .thumb');
									// 시간체크
									function timeCheck() {
										var now = brnQuick.nowTime; // 호출 하는 js에서 변수선언되어 가져다 사용
										if (new Date(
												'2020-12-31T11:00:00+09:00')
												.getTime() <= now
												&& now < new Date(
														'2021-01-15T11:00:00+09:00')
														.getTime()) {
											$target
													.attr('href',
															'/shop/event/kurlyEvent.php?htmid=event/2020/1231/newyearsday');
											$targetThumb
													.attr('src',
															'https://res.kurly.com/pc/service/main/2012/bnr_quick.png');
											$targetThumb.attr('alt',
													'2021 설 선물');
										} else if (new Date(
												'2021-01-15T11:00:00+09:00')
												.getTime() <= now
												&& now <= new Date(
														'2021-02-10T23:00:00+09:00')
														.getTime()) {
											$target
													.attr('href',
															'/shop/event/kurlyEvent.php?htmid=event/2021/0115/newyearsday');
											$targetThumb
													.attr('src',
															'https://res.kurly.com/pc/service/main/2101/bnr_quick.png');
											$targetThumb.attr('alt',
													'2021 설 선물');
										}
									}
									return {
										timeCheck : timeCheck
									}
								})();
								brnQuickScript.timeCheck();
							</script>
						</div>
						<script>
							var brnQuick = {
								nowTime : '1614533726294',
								update : function() {
									$
											.ajax(
													{
														url : campaginUrl
																+ 'pc/service/bnr_quick.html'
													}).done(function(result) {
												$('#brnQuick').html(result);
											});
								}
							}
							brnQuick.update();
						</script>

						<div class="side_menu">
							<a href="../../event_lovers.html" class="link_menu">등급별 혜택</a>
							<a href="#" class="link_menu">레시피</a>
						</div>

						<script>
							/**
							 * 상품상세일때 현재 보고 있는 상품 담기. 상품URL & 상품이미지
							 * 최종 저장 날짜로 부터 24시가 지날시 localStorage 삭제
							 */
							var getGoodsRecent = (function() {
								var i, len, getGoodsRecent, item, _nowTime = '1614533726294';

								_goodsRecent();
								function _goodsRecent() {
									if (localStorage.getItem('goodsRecent') === null) {
										return false;
									}

									try {
										getGoodsRecent = JSON
												.parse(localStorage
														.getItem("goodsRecent"));
										len = getGoodsRecent.length;
										if (addDays(
												getGoodsRecent[len - 1].time, 1) < _nowTime) {
											localStorage
													.removeItem('goodsRecent');
										} else {
											for (i = 0; i < len; i++) {
												item = '<li><a class="link_goods" href="/shop/goods/goods_view.php?goodsno='
														+ getGoodsRecent[i].no
														+ '"><img src="' + getGoodsRecent[i].thumb + '" alt=""></a></li>';
												$('.side_recent .list').append(
														item);
											}
											$('.side_recent').show();
										}
									} catch (e) {
										console
												.log(
														"JSON parse error from the Quick menu goods list!!!",
														e);
									}
								}

								function addDays(date, days) {
									var result = new Date(date);
									result.setDate(result.getDate() + days);
									return result.getTime();
								}

								// return {
								// }
							})();
						</script>
					</div>


					<%
						request.setCharacterEncoding("UTF-8");
					Integer p_idx = 0;
					if (request.getParameter("p_idx") == null || request.getParameter("p_idx") == "") {
						p_idx = 1;
					} else {
						p_idx = Integer.parseInt(request.getParameter("p_idx")); // 전 페이지에서 idx에 대한 세션값을 받아와야 함
					}
					%>

					<div class="page_aticle aticle_type2">

						<div class="page_section section_qna" style="width: 100%">
							<div class="head_aticle">
								<h2 class="tit" style="margin-bottom: 10px;">PRODUCT Q&A</h2>
								<p style="line-height: 30px;">*상품에 대한 문의를 남기는 공간입니다. 해당 게시판의
									성격과 다른 글은 사전동의없이 담당게시판으로 이동될 수 있습니다.</p>
								<p>*배송관련,주문(취소/교환/환불) 관련 문의 및 요청사항은 마이컬리 내 1:1문의에 남겨주세요.</p>
							</div>

							<!-- 상품 문의 Form 시작 -->
							<div class="xans-board-write">
								<form name="fm" id="fm" method="post"
									action="goods_qna_register_ok.jsp"
									onsubmit="return chkForm(this)" style="height: 100%;">
									<input type="hidden" name="prodidx" value="<%=p_idx%>">
									<input type="hidden" name="isreply" value="미답변">

									<table id="table_after" class="boardWrite2" width="100%">
										<colgroup>
											<col width="14%" align="right">
										</colgroup>
										<tbody>
											<tr>
												<th class="input_txt">작성자</th>
												<td><input type="text" name="userid" value="<%=userid_as %>"
													readonly style="background-color: #ccc; outline: none;">
												</td>
											</tr>
											
											<tr>
												<th class="input_txt">이메일</th>
												<td><input type="text" name="email"
													value="<%=m_email%>" readonly
													style="background-color: #ccc; outline: none;"></td>
											</tr>
											<tr>
												<th class="input_txt">연락처</th>
												<td><input type="text" name="tel" value="<%=m_tel%>"
													readonly style="background-color: #ccc; outline: none;">
												</td>
											</tr>

											<script>
												if (document
														.getElementById("input_check").checked) {
													document
															.getElementById("input_check_hidden").disabled = true;
												}
											</script>
											<tr>
												<th class="input_txt">제목</th>
												<td><input type="text" name="title"
													style="width: 100%;"></td>
											</tr>
											<tr>
												<th class="input_txt">내용</th>
												<td class="edit_area" style="position: relative;"><textarea
														name="content" style="width: 100%; height: 474px;"
														class="editing_area" required="" fld_esssential=""
														label="내용"></textarea></td>
											</tr>

										</tbody>
									</table>

									<table width="100%">
										<tbody>
											<tr>
												<td align="right" style="padding-top: 5px; border: none;"
													id="avoidDbl"><input type="submit"
													class="bhs_button yb" value="등록" style="float: none;">
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
							divEl.src = "mypage_qna_order.jsp";

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
