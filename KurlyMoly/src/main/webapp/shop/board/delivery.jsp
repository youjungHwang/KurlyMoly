<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 샛별배송 안내게시글 N -->
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
            line-height: 1.8em;
        }

        .xans-board-write table input[type=text],
        .xans-board-write table input[type=password] {
            height: 25px;
        }

        .boardWrite2 .smalle {
            position: relative;
        }

        .boardWrite2 .smalle input[type=checkbox] {
            position: relative;
            right: 2px;
            vertical-align: middle;
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

                        <div class="side_menu">
                            <a href="../../event_lovers.jsp" class="link_menu">등급별 혜택</a>
                            <a href="../recipe/recipe_all.jsp" class="link_menu">레시피</a>
                        </div>
                    </div>

                    <!-- 마이페이지_공지사항 게시글 시작 -->
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
                                                                        <td>마켓컬리 배송 안내</td>
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
                                                                                    <span class="td">2016-01-08</span>
                                                                                </li>
                                                                                <li class="hit ">
                                                                                    <strong class="th">조회수</strong>
                                                                                    <span class="td">2561150</span>
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
                                                        <td id="noticeView">
                                                            <!-- 이벤트 시작 -->
                                                            <style type="text/css">
                                                                .page_noticeview {
                                                                    text-align: center
                                                                }

                                                                .page_noticeview img {
                                                                    vertical-align: top
                                                                }
                                                            </style>
                                                            <div class="page_noticeview">
                                                                <h3 class="screen_out">공지사항 - 마켓컬리 배송 안내</h3>
                                                                <img src="../../img/gongjisahang_image/img_main_190528_v2.webp" alt="">
                                                                <img src="../../img/gongjisahang_image/img_delivery1_v3.webp" alt="">
                                                                <img src="../../img/gongjisahang_image/img_delivery2_v3.webp" alt="">
                                                                <img src="../../img/gongjisahang_image/img_delivery3.webp" alt="">
                                                                <a href="javascript:address_chk_popup();"><img src="../../img/gongjisahang_image/img_delivery4.webp" alt=""></a>
                                                                <img src="../../img/gongjisahang_image/img_delivery5.webp" alt="">
                                                                <img src="../../img/gongjisahang_image/img_delivery7_190528_v3.webp" alt="">
                                                            </div>
                                                            <!-- // 이벤트 끝 -->
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="1" bgcolor="#f4f4f4"></td>
                                                    </tr>
                                                </tbody>
                                            </table><br>
                                            <table width="100%" style="table-layout:fixed" cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="center" style="padding-top:10px;">
                                                            <table width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <a href="list.php?id=notice"><span class="bhs_button yb" style="float:none;">목록</span></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
                                                <ul>
                                                    <li class="prev ">
                                                        <strong>이전글</strong><a href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a href="./view3.jsp">[마켓컬리] 물류센터 일용직 근무자 코로나19 확진 관련 안내</a>
                                                    </li>
                                                    <li class="next ">
                                                        <strong>다음글</strong><a href="/board/free/read.html?no=22443&amp;board_no=1&amp;page="></a><a href="./view2.jsp">[마켓컬리] 일용직 1인 코로나19 확진 관련 안내</a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <br>
                                            <table width="100%" cellpadding="5" cellspacing="0">
                                                <colgroup>
                                                    <col width="100" align="right" bgcolor="#f7f7f7"
                                                        style="padding-right:10px">
                                                    <col style="padding-left:10px">
                                                </colgroup>
                                            </table>
                                            <p>
                                                <br><textarea id="examC_64"
                                                    style="display:none;width:100%;height:300px">&lt;div class="board_64"&gt;
                                                                        &lt;div class="view_pc"&gt;
                                                                        
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_main_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery1_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery2_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery3_190528_v3.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery4_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        
                                                                        &lt;a href="javascript:address_chk_popup();"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery5_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;/a&gt;
                                                                        
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery6_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/pc/img_delivery7_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;/div&gt;
                                                                        
                                                                        
                                                                        &lt;div class="view_mobile"&gt;
                                                                        
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_main_190528.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont1_190528.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont2_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont3_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        
                                                                        &lt;a href="javascript:address_chk_popup();"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_cont4_190528.jpg" alt="" style="display:block"&gt;
                                                                        &lt;/a&gt;
                                                                        
                                                                        &lt;div class="" style="position:relative"&gt;
                                                                        &lt;div class="delivery_tab"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_btn_delivery1_190528.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_btn_delivery2_190528.jpg" alt="" style="display:none"&gt;
                                                                        &lt;/div&gt;
                                                                        &lt;div class="delivery_select"&gt;
                                                                        &lt;a href="#none" class="link_delivery1" style="position:absolute;left:0;top:0;width:50%;height:100%"&gt;&lt;/a&gt;
                                                                        &lt;a href="#none" class="link_delivery2" style="position:absolute;right:0;top:0;width:50%;height:100%"&gt;&lt;/a&gt;
                                                                        &lt;/div&gt;
                                                                        &lt;/div&gt;
                                                                        
                                                                        &lt;div class="delivery_cont"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_delivery1_190528_v2.jpg" alt="" style="display:block"&gt;
                                                                        &lt;img src="https://res.kurly.com/images/cms/2019/notice/1905/mobile/m_img_delivery2_190528.jpg" alt="" style="display:none"&gt;
                                                                        &lt;/div&gt;
                                                                        
                                                                        &lt;/div&gt;
                                                                        
                                                                        &lt;/div&gt;
                                                                        </textarea>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <script>
                            // KM-1483 Amplitude
                            KurlyTracker.setScreenName('delivery_guide'); // 배송안내
                        </script>
                    </div>

                    <!-- 마이페이지_공지사항 게시글 종료 -->

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