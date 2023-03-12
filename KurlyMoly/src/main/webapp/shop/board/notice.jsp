<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.kurly.notice.NoticeDTO"%>
<jsp:useBean id="dao" class="com.kurly.notice.NoticeDAO" />

<%
	List<NoticeDTO> list = new ArrayList<>();
	
	list = dao.selectNotice();		
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
    
    <style>
        .skin_checkbox input[type=radio],
        input[type=checkbox] {
            opacity: 1 !important;
        }

        .xans-board-listheader th {
            padding: 20px 0;
        }

        #content {
            padding-bottom: 120px;
        }

        .xans-myshop-couponserial th {
            vertical-align: top;
            line-height: 1.2em;
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
                            <a href="./delivery.jsp"><img class="thumb"
                                    src="../../img/sidebar/bnr_quick_20190403.webp"></a>
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
                            <a href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
                        </div>
                    </div>

                    <!-- 마이페이지_공지사항 리스트 시작 -->
                    <div class="page_aticle aticle_type2">
                        <div id="snb" class="snb_cc">
                            <h2 class="tit_snb">고객센터</h2>
                            <div class="inner_snb">
                                <ul class="list_menu">
                                    <li class="on">
                                        <a href="./notice.jsp">공지사항</a>
                                    </li>
                                    <li>
                                        <a href="./faq.jsp">자주하는 질문</a>
                                    </li>
                                    <li>
                                        <a href="../mypage/mypage_qna.jsp">1:1 문의</a>
                                    </li>

                                </ul>
                            </div>
                            <a href="../mypage/mypage_qna_register.jsp" class="link_inquire"><span class="emph">도움이
                                    필요하신가요 ?</span> 1:1 문의하기</a>
                        </div>
                        <div class="page_section">
                            <div class="head_aticle">
                                <h2 class="tit">공지사항 <span class="tit_sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></h2>
                            </div>
                            <form name="frmList" action="/shop/board/list.php?&amp;"
                                onsubmit="return chkFormList(this)">
                                <input type="hidden" name="id" value="notice">
                                <style>
                                    .notice .layout-pagination {
                                        margin: 0
                                    }

                                    .eng2 {
                                        color: #939393
                                    }

                                    .xans-board-listheader {
                                        font-size: 12px
                                    }
                                </style>
                                <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                                                    <table width="100%" class="xans-board-listheader jh" cellpadding="0"
                                                        cellspacing="0">
                                                        <thead>
                                                            <tr>
                                                                <th>번호</th>
                                                                <th>제목</th>
                                                                <th>작성자</th>
                                                                <th>작성일</th>
                                                                <th>조회</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                        
                                                        	<!--  ★★★★★★ 수정함 ★★★★★★
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=850"><b>[마켓컬리]
                                                                            일용직 2인 코로나19 확진 관련 안내</b></a><b>

                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-18</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">233
                                                                </td>
                                                            </tr>
                                                            -->
<%
															for(int i=0; i<list.size(); i++) {
%>                                                            
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href='view1.jsp?idx=<%=list.get(i).getIdx()%>'><b><%=list.get(i).getTitle() %></b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    <%=list.get(i).getRegdate().substring(0, 10) %></td>
                                                                <td width="30" nowrap="" align="center" class="eng2"><%=list.get(i).getHit() %>
                                                                </td>
                                                            </tr>
<%
															}
%>
															<!--  
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=848"><b>[가격인상공지]
                                                                            [마리꼬] 수딩 밀크 클렌저 500mL 외 3건 (2021 3. 20
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-18</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">47
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=847"><b>[가격인상공지]
                                                                            [벽제갈비] 한우 곰탕 외 2건 (2021 3. 22 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-18</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">36
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="./view.html"><b>[가격인상공지]
                                                                            [삼청동에그롤]부드러운 에그롤 4종 (2021 3. 19
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-16</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">203
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=845"><b>[가격인상공지]
                                                                            [밀도] 스콘 8종 (2021 3. 15 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-12</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">475
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=844"><b>[가격인상공지]
                                                                            [몽슈슈] 도지마롤 2종 외 3건 (2021 3. 15 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-12</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">240
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=843"><b>[가격변경공지]
                                                                            [메종엠오] 마들렌 플레인 외 22건 (2021. 3. 15
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-10</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">292
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=842"><b>[가격인상공지]
                                                                            [데일리라이크] 마이 버디 핸드타올 5P 외 8건 (2021 3. 15
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-10</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">125
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=841"><b>[가격인상공지]
                                                                            [사미헌] 꼬리곰탕 (2021 3. 12 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-08</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">311
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=840"><b>[가격인상공지]
                                                                            [다란팜] 유기농 자연방사 유정란 10구 외 2건 (2021 3. 9
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-05</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">427
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=839"><b>[가격인상공지]
                                                                            [밀도] 레몬 커드 잼 외 1건 (2021 3. 9 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-04</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">346
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=838"><b>[가격인상공지]
                                                                            [견우] 미국산 대패 삼겹살 1kg(냉동) (2021 3. 8
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-04</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">165
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=837"><b>[가격인상공지]
                                                                            [맑은바다목장] 한잔N굴 (2021 3. 8 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-04</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">103
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=836"><b>[가격인하공지]
                                                                            [후디스] 그릭 콜레긴 요거트 1000 (2021. 3. 4
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-03</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">303
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=835"><b>[가격인상공지]
                                                                            [순창성가정식품] 묵은지 청국장 외 4건 (2021 3. 5
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-02</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">203
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=834"><b>[마켓컬리]
                                                                            유튜브 'CR부서 디자이너 브이로그 편' 댓글 이벤트 당첨자
                                                                            안내</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-03-02</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">266
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=833"><b>[가격인상공지]
                                                                            [복슬강아지] 곡물 스틱(오리) 외 3건 (2021 3. 2
                                                                            ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-02-24</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">437
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=832"><b>[가격인상공지]
                                                                            [키친아트] 수세미 4종 (2021 3. 2 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-02-23</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">332
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50" nowrap="" align="center">
                                                                    공지 </td>
                                                                <td
                                                                    style="padding-left:10px; text-align:left; color:#999">
                                                                    <a href="view.php?id=notice&amp;no=831"><b>[가격인하공지]
                                                                            [H’EATING] 제주 흑돈 크리스피 모짜렐라 핫도그 외 2건 (2021.
                                                                            2. 23 ~)</b></a><b>
                                                                    </b>
                                                                </td>
                                                                <td width="100" nowrap="" align="center">
                                                                    MarketKurly </td>
                                                                <td width="100" nowrap="" align="center" class="eng2">
                                                                    2021-02-22</td>
                                                                <td width="30" nowrap="" align="center" class="eng2">356
                                                                </td>
                                                            </tr>
															 ★★★★★★ 수정함 ★★★★★★ -->	
															
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                
                                <table class="xans-board-search xans-board-search2">
                                    <tbody>
                                        <tr>
<!--                                             <td class="input_txt"><img
                                                    src="../../img/gongjisahang_image/ico_function.gif">검색어</td>
                                            <td class="stxt">
                                                <input type="checkbox" name="search[name]" checked>이름
                                                <input type="checkbox" name="search[subject]">제목
                                                <input type="checkbox" name="search[contents]">내용&nbsp;
                                            </td> -->
                                            <td class="input_txt">&nbsp;</td>
                                            <td>
                                                <div class="search_bt">
                                                    <a href="javascript:document.frmList.submit()"><img
                                                            src="../../img/gongjisahang_image/search.png"
                                                            align="absmiddle"></a>
                                                    <input type="text" name="search[word]" value="" required="">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    // KM-1483 Amplitude
                    KurlyTracker.setScreenName('notice_list');
                </script>
                <!-- 마이페이지_공지사항 리스트 종료 -->

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
    <a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 15px;">맨 위로가기</a> <!--  -->
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