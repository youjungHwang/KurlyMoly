<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
v
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%@ page import="com.kurly.inquiry.CinquiryDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:useBean id="ciqdao" class="com.kurly.inquiry.CinquiryDAO" />

<%
request.setCharacterEncoding("utf-8");

String userid_as = null; // header.jsp에 있는 변수명(userid)과 일치하여 오류발생함에 따라 변수명 수정 (★나희★)
if (session.getAttribute("m_id") != null) {
	userid_as = (String) session.getAttribute("m_id");
}

//접속한 회원 정보 가져오기
List<CinquiryDTO> cinquirylist = new ArrayList<CinquiryDTO>();
cinquirylist = ciqdao.selectMemList(userid_as);


%>



<!-- 1:1 문의 리스트 페이지 -->
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
			padding-bottom: 180px;
		}
		
		.xans-board-listheader {
			line-height: 4.5em;
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
							<a href="../board/delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
						</div>

						<div class="side_menu">
							<a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
							<a href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
						</div>
					</div>

					<!-- 마이페이지_자주하는질문(faq) 시작 -->
					<div class="page_aticle aticle_type2">
						<div id="snb" class="snb_cc">
							<h2 class="tit_snb">고객센터</h2>
							<div class="inner_snb">
								<ul class="list_menu">
									<li><a href="../board/notice.jsp">공지사항</a></li>
									<li><a href="../board/faq.jsp">자주하는 질문</a></li>
									<li class="on"><a href="./mypage_qna_register.jsp">1:1 문의</a></li>
								</ul>
							</div>
							<a href="./mypage_qna_register.jsp" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
						</div>
						<div class="page_section section_qna">
							<div class="head_aticle">
								<h2 class="tit">1:1 문의</h2>
							</div>

							<table class="xans-board-listheader" width="100%">
								<tbody>
									<tr class="input_txt">
										<th width="10%">번호</th>
										<th width="20%">카테고리</th>
										<th>제목</th>
										<th width="18%">작성자</th>
										<th width="12%">작성일</th>
									</tr>
								
								<% if( cinquirylist.size() == 0){ %>
						
								<div class="no_data"
									style="padding: 150px 0 148px; border-top: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; font-size: 12px; color: #4c4c4c">
									1:1 문의 내역이 존재하지 않습니다.</div>
								<% }else{ %> 
								<% 
								for(int i=0; i< cinquirylist.size(); i++){
									
									String ciq_about = cinquirylist.get(i).getAbout();
									String ciq_title = cinquirylist.get(i).getTitle();
									String ciq_userid = cinquirylist.get(i).getUserid();
									String ciq_inquirydate = cinquirylist.get(i).getInquirydate();
								
								%>
								
										<tr>
											<td><%=i+1%></td>
											<td><%=ciq_about%></td>
											<td><%=ciq_title %></td>
											<td><%=ciq_userid %></td>
											<td><%=ciq_inquirydate.substring(0,10)%></td>
										</tr>
										
										
										<%
										}
								}
								%>
								</tbody>
							</table>
							
							
							<div style="position: relative">
								<div style="position: absolute; right: 0; top: 60px;">
									<!-- <a href="javascript:popup_register( 'add_qna' );"><span class="bhs_buttonsm yb"
                                            style="float:none;">글쓰기</span></a> -->
									<a href="./mypage_qna_register.jsp"><span
										class="bhs_buttonsm yb" style="float: none;">글쓰기</span></a>
								</div>
							</div>
							<div class="layout-pagination">
								<div class="pagediv"></div>
							</div>
						</div>
					</div>
				</div>

				<script type="text/javascript">
					function popup_register(mode, sno) {
						if (mode == 'del_qna')
							var win = window.open(
									"../mypage/mypage_qna_del.php?mode=" + mode
											+ "&sno=" + sno, "qna_register",
									"width=400,height=200");
						else
							parent.location.href = ("../mypage/mypage_qna_register.php?mode="
									+ mode + "&sno=" + sno);
					}

					var preContent;

					function view_content(obj) {
						var div = obj.parentNode;

						for (var i = 1, m = div.childNodes.length; i < m; i++) {
							if (div.childNodes[i].nodeType != 1)
								continue; // text node.
							else if (obj == div.childNodes[i])
								continue;

							obj = div.childNodes[i];
							break;
						}

						if (preContent && obj != preContent) {
							obj.style.display = "block";
							preContent.style.display = "none";
							preCheck = false
						} else if (preContent && obj == preContent) {
							preContent.style.display = (preContent.style.display == "none" ? "block"
									: "none");
						} else if (preContent == null) {
							obj.style.display = "block";
						}

						preContent = obj;

						if (preContent.style.display === 'block') {
							KurlyTracker
									.setScreenName('personal_inquiry_detail');
						} else {
							KurlyTracker
									.setScreenName('personal_inquiry_history');
						}
					}

					// KM-1483 Amplitude 연동
					KurlyTracker.setScreenName('personal_inquiry_history');
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
	<!--  -->
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
</body>

</html>