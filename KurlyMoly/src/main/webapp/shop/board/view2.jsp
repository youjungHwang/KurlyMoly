<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                                                                        <td>[마켓컬리] 일용직 1인 코로나19 확진 관련 안내</td>
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
                                                                                    <span class="td">2020-12-29</span>
                                                                                </li>
                                                                                <li class="hit ">
                                                                                    <strong class="th">조회수</strong>
                                                                                    <span class="td">3862</span>
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
                                                                            id="contents_792" valign="top">
                                                                            <div>고객님 안녕하세요. 마켓컬리입니다.</div>
                                                                            <div><br></div>
                                                                            <div>금일(12/29) 오후, 지난 12/26 토요일 냉동센터에서 근무했던
                                                                                일용직 근무자 1인의 코로나19 확진 판정 소식을 전달받아 안내
                                                                                말씀드립니다.&nbsp;</div>
                                                                            <div><br></div>
                                                                            <div>해당 근무자는 12월 24일 ~ 12월 25일 사이 이천
                                                                                물류센터(타사) 업무 시 코로나 확진자와 동선이 겹쳐 감염된 것으로
                                                                                확인했고, 12월 27일 밀접 접촉자로 연락을 받아 검사를 진행하였으며
                                                                                방역 당국으로부터 오늘 검사 결과가 통보되었습니다.</div>
                                                                            <div><br></div>
                                                                            <div>해당 직원은 근무 시 방역당국의 지침에 따라 상시 마스크와 장갑 등을
                                                                                착용한 상태에서 업무 진행한 것이 확인되었습니다.</div>
                                                                            <div><br></div>
                                                                            <div><b>이에 마켓컬리에서는 아래와 같이 조치하였습니다.</b></div>
                                                                            <div>- 확진자가 근무하거나 지나간 모든 지역의 방역을 완료했습니다.
                                                                            </div>
                                                                            <div>- 해당 직원과 접촉 가능성이 있는 밀접 접촉자는 없는 것으로
                                                                                파악되었습니다.&nbsp;</div>
                                                                            <div>- 현재 컬리는 무중단 운영을 위해 확진자 발생 시나리오를 기반으로
                                                                                센터별 운영을 개별화하여 각 센터 간 교류를 금지하고 있습니다.
                                                                            </div>
                                                                            <div><br></div>
                                                                            <div>컬리는 코로나가 급격히 번지고 있는 현 상황에서, 전 직원이 사회적
                                                                                거리두기를 준수할 수 있도록 마스크, 손세정, 일일 체온체크를 의무화하고
                                                                                있으며 1/2 재택근무(모든 직원이 일주일에 3일 재택근무를 시행,
                                                                                사무실 밀집도를 1/2로 줄임)를 시행하고 있습니다. 또한 모든 미팅은
                                                                                대면 미팅이 아닌 화상 미팅으로 대체하고, 사무실 공간에 대한 주기적인
                                                                                방역, 회식 금지, 2인 이하 식사 제한 등 엄격한 사회적 거리두기를
                                                                                진행하고 있습니다.</div>
                                                                            <div><br></div>
                                                                            <div>이러한 노력에도 불구하고, 급격한 확진자 증가에 따라 많은 직원들이
                                                                                코로나 바이러스 위험에 노출될 수 밖에 없습니다. 이에 감염 가능성이
                                                                                조금이라도 있을 경우, 컬리가 검사 비용을 지원하여 검사를 받고, 그
                                                                                결과를 투명하게 고객 여러분께 결과를 알려드리고 있습니다.</div>
                                                                            <div><br></div>
                                                                            <div>앞으로도 컬리는 코로나19 확산을 방지하고, 관련된 모든 상황을
                                                                                고객님께 빠르게 전달하도록 하겠습니다.</div>
                                                                            <div>이번 사안으로 불편을 겪으신 고객님께 다시 한번 진심으로 사과
                                                                                말씀드립니다.</div>
                                                                            <div><br></div>
                                                                            <div>감사합니다.</div>
                                                                            <div>마켓컬리 드림.</div>
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
                                                                            <a
                                                                                href="list.php?id=notice&amp;search[subject]=on&amp;search[word]=%C0%CF%BF%EB%C1%F7"><span
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
                                                class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
                                                <ul>
                                                    <li class="prev ">
                                                    <li class="prev ">
                                                        <strong>이전글</strong><a
                                                            href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a
                                                            href="../../shop/board/view1.html">[가격인상공지] [삼청동에그롤]부드러운 에그롤
                                                            4종 (2021 3. 19 ~)</a>
                                                    </li>
                                                    <li class="next ">
                                                        <strong>다음글</strong><a
                                                            href="/board/free/read.html?no=22443&amp;board_no=1&amp;page="></a><a
                                                            href="../../shop/board/view3.html">[마켓컬리] 물류센터 일용직 근무자 코로나19
                                                            확진 관련 안내 </a>
                                                    </li>
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
                                                <br><textarea id="examC_792"
                                                    style="display:none;width:100%;height:300px">&lt;div&gt;고객님 안녕하세요. 마켓컬리입니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;금일(12/29) 오후, 지난 12/26 토요일 냉동센터에서 근무했던 일용직 근무자 1인의 코로나19 확진 판정 소식을 전달받아 안내 말씀드립니다.&amp;nbsp;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;해당 근무자는 12월 24일 ~ 12월 25일 사이 이천 물류센터(타사) 업무 시 코로나 확진자와 동선이 겹쳐 감염된 것으로 확인했고, 12월 27일 밀접 접촉자로 연락을 받아 검사를 진행하였으며 방역 당국으로부터 오늘 검사 결과가 통보되었습니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;해당 직원은 근무 시 방역당국의 지침에 따라 상시 마스크와 장갑 등을 착용한 상태에서 업무 진행한 것이 확인되었습니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;b&gt;이에 마켓컬리에서는 아래와 같이 조치하였습니다.&lt;/b&gt;&lt;/div&gt;&lt;div&gt;- 확진자가 근무하거나 지나간 모든 지역의 방역을 완료했습니다.&lt;/div&gt;&lt;div&gt;- 해당 직원과 접촉 가능성이 있는 밀접 접촉자는 없는 것으로 파악되었습니다.&amp;nbsp;&lt;/div&gt;&lt;div&gt;- 현재 컬리는 무중단 운영을 위해 확진자 발생 시나리오를 기반으로 센터별 운영을 개별화하여 각 센터 간 교류를 금지하고 있습니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;컬리는 코로나가 급격히 번지고 있는 현 상황에서, 전 직원이 사회적 거리두기를 준수할 수 있도록 마스크, 손세정, 일일 체온체크를 의무화하고 있으며 1/2 재택근무(모든 직원이 일주일에 3일 재택근무를 시행, 사무실 밀집도를 1/2로 줄임)를 시행하고 있습니다. 또한 모든 미팅은 대면 미팅이 아닌 화상 미팅으로 대체하고, 사무실 공간에 대한 주기적인 방역, 회식 금지, 2인 이하 식사 제한 등 엄격한 사회적 거리두기를 진행하고 있습니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;이러한 노력에도 불구하고, 급격한 확진자 증가에 따라 많은 직원들이 코로나 바이러스 위험에 노출될 수 밖에 없습니다. 이에 감염 가능성이 조금이라도 있을 경우, 컬리가 검사 비용을 지원하여 검사를 받고, 그 결과를 투명하게 고객 여러분께 결과를 알려드리고 있습니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;앞으로도 컬리는 코로나19 확산을 방지하고, 관련된 모든 상황을 고객님께 빠르게 전달하도록 하겠습니다.&lt;/div&gt;&lt;div&gt;이번 사안으로 불편을 겪으신 고객님께 다시 한번 진심으로 사과 말씀드립니다.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;감사합니다.&lt;/div&gt;&lt;div&gt;마켓컬리 드림.&lt;/div&gt;</textarea>
                                            </p>
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