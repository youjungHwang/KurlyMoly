<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 공지사항 게시글 페이지 N -->
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

        .skin_checkbox input[type=radio],
        input[type=checkbox] {
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
                            <a href="./delivery.html"><img class="thumb"
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
                            <a href="../../event_lovers.html" class="link_menu">등급별 혜택</a>
                            <a href="#" class="link_menu">레시피</a>
                        </div>
                    </div>

                    <!-- 마이페이지_공지사항 게시글1 시작 -->
                    <div class="tit_page">
                        <h2 class="tit">공지사항</h2>
                        <p class="sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
                    </div>

                    <div class="layout-wrapper">
                        <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                            <table width="100%" align="center" cellpadding="0" cellspacing="0">
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
                                                                        <td>[가격인상공지] [삼청동에그롤]부드러운 에그롤 4종 (2021 3. 19 ~)
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">작성자</th>
                                                                        <td>MarketKurly</td>
                                                                    </tr>
                                                                    <tr class="etcArea">
                                                                        <td colspan="2">
                                                                            <ul>
                                                                                <li class="date ">
                                                                                    <strong class="th">작성일</strong>
                                                                                    <span class="td">2021-03-16</span>
                                                                                </li>
                                                                                <li class="hit ">
                                                                                    <strong class="th">조회수</strong>
                                                                                    <span class="td">26</span>
                                                                                </li>
                                                                            </ul>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="eng" style="padding:5px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding:10px;" height="200" valign="top"
                                                            id="contents">
                                                            <table width="100%" style="table-layout:fixed">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="board_view_content"
                                                                            style="word-wrap:break-word;word-break:break-all"
                                                                            id="contents_846" valign="top">
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222" face="Font"
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    고객님, 안녕하세요.</font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222" face="Font"
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    <br>
                                                                                </font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    <span
                                                                                        style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;"><b
                                                                                            style="color: rgb(34, 34, 34); font-family: Font;">"</b></span>
                                                                                </font><span
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    <font color="#222222" face="Font">
                                                                                        <b>[삼청동에그롤]부드러운 에그롤
                                                                                            4종"&nbsp;</b>
                                                                                    </font>
                                                                                </span>
                                                                                <font color="#222222" face="Font">가격을
                                                                                    조정하게 되어 안내드립니다.&nbsp;</font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222" face="Font"
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    <br
                                                                                        style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                </font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222"
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    <b># 가격인상 요인</b>
                                                                                </font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222"><b>-&nbsp;원가 인상으로
                                                                                        인한 가격 인상</b></font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222"><b><br></b></font>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <div
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    위의 사유로 공급가가 상승됨에 따라, 컬리에서도 부득이하게
                                                                                    일정부분 가격조정을 하게 된 점 양해 부탁드립니다.</div>
                                                                            </div>
                                                                            <div
                                                                                style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                <font color="#222222" face="Font"
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                    <br>
                                                                                </font>
                                                                            </div>
                                                                            <div><span
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: normal;">
                                                                                    <font face="Font"># 가격 조정시점</font>
                                                                                </span></div>
                                                                            <div><b style="font-family: Font;">&nbsp;-
                                                                                    2021년 3월 19일 (금) 오전 11시~</b>
                                                                                <font face="Font"><b>&nbsp;</b></font>
                                                                            </div>
                                                                            <div><img
                                                                                    src="../../img/gongjisahang_image/table1.png"
                                                                                    alt=""></div>
                                                                            <div><br></div>
                                                                            <div><br></div>
                                                                            <div><span
                                                                                    style="font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 700; font-stretch: normal; line-height: normal;">
                                                                                    <div
                                                                                        style="font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; line-height: normal; font-family: Font; margin: 0px;">
                                                                                        좋은 품질, 합리적인 가격으로 만족드릴 수 있도록 항상
                                                                                        최선을 다하겠습니다.&nbsp;</div>
                                                                                    <div
                                                                                        style="font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; line-height: normal; font-family: Font; margin: 0px;">
                                                                                        <br>
                                                                                    </div>
                                                                                    <div
                                                                                        style="font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: 400; font-stretch: normal; line-height: normal; font-family: Font; margin: 0px;">
                                                                                        <div
                                                                                            style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                            감사합니다.</div>
                                                                                        <div
                                                                                            style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                            <br
                                                                                                style="font-stretch: 100%; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: normal; margin: 0px;">
                                                                                        </div>
                                                                                        <div
                                                                                            style="font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: normal; margin: 0px;">
                                                                                            마켓컬리 드림</div>
                                                                                    </div>
                                                                                </span></div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="1" bgcolor="#f4f4f4"></td>
                                                    </tr>
                                                </tbody>
                                            </table><br>
                                            <table width="100%" style="table-layout:fixed" cellpadding="0"
                                                cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="center" style="padding-top:10px;">
                                                            <table width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <a href="./notice.html"><span
                                                                                    class="bhs_button yb"
                                                                                    style="float:none;">목록</span></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div
                                                class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002">
                                                <ul>
                                                    <li class="prev ">
                                                        <strong>이전글</strong><a
                                                            href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a
                                                            href="../../shop/board/view2.html">[마켓컬리] 일용직 1인 코로나19 확진 관련
                                                            안내</a>
                                                    </li>
                                                    <li class="next ">
                                                        <strong>다음글</strong><a
                                                            href="/board/free/read.html?no=22443&amp;board_no=1&amp;page="></a><a
                                                            href="../../shop/board/view3.html">[마켓컬리] 물류센터 일용직 근무자 코로나19
                                                            확진 관련 안내 </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <script>
                            // KM-1483 Amplitude
                            KurlyTracker.setScreenName('notice_detail');
                        </script>
                    </div>
                    <!-- 마이페이지_공지사항 게시글1 종료 -->

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
</body>

</html>