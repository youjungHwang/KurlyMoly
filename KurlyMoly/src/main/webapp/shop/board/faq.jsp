<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!-- 자주하는 질문 리스트 페이지 N -->
<!-- ★★★★★★★★★★★★★★★★★★★★ 페이지당 글 개수가 15개씩 보이도록 jsp작업 필요 -->
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
                            <a href="./delivery.jsp"><img class="thumb" src="../../img/sidebar/bnr_quick_20190403.webp"></a>
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
                                    <li>
                                        <a href="./notice.jsp">공지사항</a>
                                    </li>
                                    <li class="on">
                                        <a href="./faq.jsp">자주하는 질문</a>
                                    </li>
                                    <li>
                                        <a href="../mypage/mypage_qna.jsp">1:1 문의</a>
                                    </li>
                                </ul>
                            </div>
                            <a href="../mypage/mypage_qna_register.jsp" class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1 문의하기</a>
                        </div>
                        <form name="frmList" id="form" method="get" action="?">
                            <div class="page_section">
                                <div class="head_aticle">
                                    <h2 class="tit">자주하는 질문 <span class="tit_sub">고객님들께서 가장 자주하시는 질문을 모두 모았습니다.</span>
                                    </h2>
                                </div>
                                <!-- <div class="search_date">
                                    <a href="#none" class="btn_layer">선택</a>
                                    <ul class="layer_search">
                                        <li>
                                            <a href="#none" @click="searchResult" data-value="01" data-selected="">회원문의</a>
                                        </li>
                                        <li>
                                            <a href="#none" @click="searchResult" data-value="02" data-selected="">주문/결제</a>
                                        </li>
                                        <li>
                                            <a href="#none" @click="searchResult" data-value="03" data-selected="">취소/교환/반품</a>
                                        </li>
                                        <li>
                                            <a href="#none" @click="searchResult" data-value="04" data-selected="">배송문의</a>
                                        </li>
                                        <li>
                                            <a href="#none" @click="searchResult" data-value="05" data-selected="">쿠폰/적립금</a>
                                        </li>
                                        <li>
                                            <a href="#none" @click="searchResult" data-value="07" data-selected="">서비스 이용 및 기타</a>
                                        </li>
                                    </ul>
                                    <input type="hidden" name="sitemcd" value="">
                                    <script>
                                        var $targetBtn = $('.search_date .btn_layer');
                                        var $targetLayer = $('.search_date .layer_search');
                                        var $targetSelector = $('.layer_search a');

                                        $targetSelector.each(function () {
                                            if ($(this).data('selected')) {
                                                $targetBtn.text($(this).data('selected'));
                                            }
                                        });
                                        $targetBtn.on('click', function (e) {
                                            e.preventDefault();
                                            $(this).toggleClass('on');
                                            $targetLayer.slideToggle(100);
                                        });
                                        $targetSelector.on('click', function (e) {
                                            e.preventDefault();
                                            var value = $(this).data('value');
                                            var text = $(this).text();
                                            $targetBtn.trigger('click').text(text);
                                            $('[name=sitemcd]').val(value);
                                            $('[name=frmList]').submit();
                                        });
                                    </script>
                                </div> -->

                                <!-- 자주하는 질문 table 안 내용만 시작 -->
                                <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                                    <table width="100%" class="xans-board-listheader">
                                        <tbody>
                                            <tr>
                                                <th width="70" class="input_txt">번호</th>
                                                <th width="135" class="input_txt">카테고리</th>
                                                <th class="input_txt">제목</th>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <!-- 자주하는 질문 1페이지 내용 시작 -->
                                    <div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)"
                                                id="faq_7">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">61</td>
                                                        <td width="135" align="center">회원문의</td>
                                                        <td style="cursor:pointer">아이디와 비밀번호가 생각나지 않아요. 어떻게 찾을 수 있나요?
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img
                                                                    src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>(PC) 오른쪽 위의 [로그인] &gt; 화면 아래 [아이디 찾기] [비밀번호 찾기]<br>
                                                                <br>
                                                                (모바일) 아래 탭에서 [마이컬리] &gt; 로그인 화면 아래 [아이디 찾기] [비밀번호 찾기]<br>
                                                                <br>
                                                                <br>
                                                             	를 통해 확인이 가능하며, 임시 비밀번호의 경우 회원가입시 등록하신 메일로 발송이 됩니다.<br>
                                                                <br>
                                                                <br>
                                                              	가입시 기재한 메일 주소가 기억나지 않으시거나 오류가 발생하는 경우, <br>
                                                                <br>
																고객행복센터(1644-1107) 또는 카카오톡으로 문의 주시면 신속하게 도움 드리겠습니다.<br>
                                                                <br>
                                                                <br>
																상담시에는 고객님의 개인정보보호를 위해 기존에 사용하시던 비밀번호는 안내가 불가하며, 개인정보 확인 후 임시비밀번호를 설정해드립니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_31">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">60</td>
                                                        <td width="135" align="center">주문/결제</td>
                                                        <td style="cursor:pointer">(샛별배송) 어제 주문했는데 오늘 아침에 배송이 안 됐어요. 왜 그런가요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>샛별배송은 밤 11시 이후 주문건은 다다음날 새벽에 배송됩니다.<br>
                                                                <br>
                                                                <br>
                                                                (PC) 홈페이지 상단 고객님 성함 (마이컬리) &gt; 나의 주문내역 &gt; 주문내역상세<br>
                                                                <br>
                                                                (모바일) 마이컬리 &gt; 주문 내역 &gt; 주문내역상세<br>
                                                                <br>
																에서 결제완료시간을 확인해주세요. <br>
                                                                <br>
                                                                <br>
																밤 11시 이전 결제 건임에도 불구하고 배송이 안 되었을 경우, 고객센터 (1644-1107) 또는 1:1 문의에 문의 남겨주세요.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_89">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">59</td>
                                                        <td width="135" align="center">배송문의</td>
                                                        <td style="cursor:pointer">묶음 배송이 가능한가요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>컬리에서는 주문번호 별로 포장이 되며 주문번호 별로 배송비가 발생합니다. <br>
                                                                <br>
																묶음배송과 배송비절약을 원하실 경우, 주문 전체취소 후 한 꺼번에 재주문 하셔야합니다.<br>
                                                                <br>
                                                                (참고: 품절된 상품은 구매가 어려울 수 있습니다.)
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_97">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">58</td>
                                                        <td width="135" align="center">취소/교환/반품</td>
                                                        <td style="cursor:pointer">교환 또는 반품신청 시에 사진을 첨부해야 하나요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>상품의 하자 등의 사유로 교환 또는 반품을 신청하시는 경우, 1:1 문의 또는 카카오톡 문의에 해당 사항을 확인할 수 있는 사진 첨부를 부탁드립니다. <br>
                                                                <br>
                                                                <br>
																구매하신 상품의 문제 상황을 확인할 수 있는 당시의 상세한 사진일 수록, 보다 신속하고 정확한 안내를 받으실수 있습니다. <br>
                                                                <br>
                                                                <br>
																고객님의 소중한 말씀과 사진은 해당 담당부서로 공유되며, 이를 바탕으로 더 나은 품질의 상품으로 제공드리도록 하겠습니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_101">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">57</td>
                                                        <td width="135" align="center">쿠폰/적립금</td>
                                                        <td style="cursor:pointer">적립금 유효기간은 어떻게 확인하나요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>적립금의 유효기간은 아래 페이지에서 확인하실 수 있습니다.<br>
                                                                <br>
                                                                <br>
                                                                (PC) 홈페이지 상단 고객님 성함 (마이컬리) &gt; 나의 적립금<br>
                                                                <br>
                                                                (모바일) 마이컬리 &gt; 적립금<br>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_109">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">56</td>
                                                        <td width="135" align="center">서비스 이용 및 기타</td>
                                                        <td style="cursor:pointer">장바구니 상품은 언제까지 보관이 되나요? </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>장바구니 상품은 최대 90일간 저장됩니다. <br>
                                                                <br>
                                                                90일동안 구매하지 않는다면, 해당 상품은 장바구니에서 소멸되오니, 이용에 참고 부탁드립니다.
                                                                <br>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_13">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">55</td>
                                                        <td width="135" align="center">회원문의</td>
                                                        <td style="cursor:pointer">주문하지 않았는데, 주문완료 메시지 또는 배송완료 메시지를 받았습니다.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>상품을 주문하신 고객님이 핸드폰 번호를 잘못 입력하시어 <br>
                                                                <br>
																주문하지 않은 고객님께 문자가 발송되는 경우가 있으며,<br>
                                                                <br>
                                                                <br>
																지인분께서 고객님께 선물하실 경우에는 수령자 번호로 배송완료 메세지가 발송되므로 선물배송일 가능성도 있습니다.<br>
                                                                <br>
                                                                <br>
																자세한 사항은 고객행복센터(1644-1107)로 연락주시거나 [1:1문의] 또는 [카카오톡] 으로 문의바랍니다.<br>
                                                                <br>
                                                                (PC) 홈페이지 하단 [1:1문의]<br>
                                                                <br>
                                                                (모바일) 마이컬리 &gt; 1:1 문의 또는 마이컬리 &gt; 고객센터 &gt; 카카오톡 문의
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_18">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">54</td>
                                                        <td width="135" align="center">취소/교환/반품</td>
                                                        <td style="cursor:pointer">상품을 반품했는데 아직 카드취소가 되지 않았어요. 어떻게 된 건가요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>카드환불의 경우 카드사 사정에 따라 환불 접수일로 부터 영업일 기준 3~7일 정도 소요될 수 있습니다. <br>
                                                                <br>
                                                                (취소완료시 카드사에서 안내드리는 SMS는 고객님의 수신 설정여부에 따라 미수신 될 수 있습니다)<br>
                                                                <br>
																자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 1:1문의로 문의 부탁드립니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_56">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">53</td>
                                                        <td width="135" align="center">서비스 이용 및 기타</td>
                                                        <td style="cursor:pointer">내가 주문한 내역은 어떻게 확인하나요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>1. 컬리 회원이신 경우<br>
                                                                <br>
                                                                <br>
																로그인 후,<br>
                                                                <br>
                                                                (PC) 홈페이지 상단 고객님 성함 (마이컬리) &gt; 나의 주문내역<br>
                                                                <br>
                                                                (모바일) 마이컬리 &gt; 주문내역<br>
                                                                <br>
																에서 해당 주문번호를 눌러 확인 가능합니다.<br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                2. 비회원이신 경우<br>
                                                                <br>
                                                                <br>
																비회원 주문확인 및 배송 조회는 모바일 앱과 웹, 혹은 고객센터 (1644-1107)에서 가능합니다.<br>
                                                                <br>
                                                                (모바일 앱) 마이컬리 &gt; 비회원 주문 조회, <br>
                                                                <br>
                                                                (모바일 웹) 로그인 화면에서 비회원 탭을 누른 후 주문자명, 주문번호를 입력하여 조회하시면 됩니다.<br>
                                                                <br>
                                                                (PC) 조회 불가합니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_82">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">52</td>
                                                        <td width="135" align="center">배송문의</td>
                                                        <td style="cursor:pointer">주문 후 주문정보(배송지, 메모, 출입방법 등)변경하려고 하는데 어떻게 해야하나요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>주문 후 배송정보 변경은 주문상태가 배송준비중 전까지 고객행복센터로 문의주세요.<br>
																배송준비중부터는 수정이 불가합니다.<br>
                                                                <br>
                                                                *일부 예약상품은 배송정보 변경 가능시간이 상이하오니 상품 상세페이지에서 확인 부탁드립니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_95">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">51</td>
                                                        <td width="135" align="center">쿠폰/적립금</td>
                                                        <td style="cursor:pointer">적립금은 유효기간이 있나요? </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>2018년 4월 1일 이후 새로운 적립금 시스템 도입으로 도입 이후 적립된 금액은 유효기간 적용이 됩니다. <br>
                                                                <br>
                                                                <br>
                                                                - 유효기간: 발급일로부터 12개월<br>
                                                                <br>
                                                                - 소멸기간: 지급일 부터 1년이 지난 적립금은 매 분기 말일 (3월 31일, 6월 30일, 9월
                                                                30일, 12월 31일) 에 소멸됩니다.<br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                * 적립금은 자동으로 유효기간이 적게 남은 금액부터 사용됩니다.<br>
                                                                <br>
                                                                * 주문시 받으신 적립금은 주문취소 및 환불 시 차감됩니다. <br>
                                                                <br>
                                                                * 잔여 적립금이 부족한 경우, 결제하신 금액에서 공제한 후 환불해드립니다.<br>
                                                                <br>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_98">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">50</td>
                                                        <td width="135" align="center">주문/결제</td>
                                                        <td style="cursor:pointer">(회원) 쿠폰 적용은 어떻게 하나요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>주문서에서 [4. 결제금액] 섹션 중 쿠폰칸을 눌러 조회하신 후 [확인] 버튼을 눌러 적용할 수 있습니다. <br>
                                                                <br>
																한 주문건에 적립금과 쿠폰은 동시에 사용할 수 없으며 한 주문건에 쿠폰은 한 장만 사용가능합니다.
                                                                <br>
                                                                <br>
																쿠폰별로 사용법 및 조건이 다를 수 있으니, 사용법 문의는 1:1 문의에 남겨주세요.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_26">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">49</td>
                                                        <td width="135" align="center">주문/결제</td>
                                                        <td style="cursor:pointer">(회원) 적립금 적용은 어떻게 하나요?</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>주문서에서 [4. 결제금액] 섹션 중 적립금 칸에 1원 단위로 적용이 가능합니다. <br>
                                                                <br>
                                                               	보유 적립금 확인 후, 원하시는 금액 입력을 해주세요. <br>
                                                                <br>
                                                               	한 주문건에 적립금과 쿠폰은 동시에 사용할 수 없습니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_49">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">48</td>
                                                        <td width="135" align="center">쿠폰/적립금</td>
                                                        <td style="cursor:pointer">주문취소/반품 후 사용했던 적립금/쿠폰은 재사용 가능한가요?
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>주문 취소하신 경우 쿠폰 또는 적립금은 자동으로 복원됩니다. <br>
                                                                <br>
																구매로 인해 적립된 구매적립금은 차감됩니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_62">
                                                <tbody>
                                                    <tr>
                                                        <td width="70" align="center">47</td>
                                                        <td width="135" align="center">배송문의</td>
                                                        <td style="cursor:pointer">(샛별배송) 현관, 경비실 앞에 배송이 되었어요. </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tbody>
                                                        <tr valign="top">
                                                            <th style="color:#0000bf;width:40px; padding-top:1px;"><img src="../../img/gongjisahang_image/faq_a.webp"></th>
                                                            <td>샛별배송은 택배배송과 다르게 새벽에 배송이 되기 때문에, 분실/도난 등의 가능성을 최소화하기 위해
                                                               	고객님 자택 앞까지 배송하고 있습니다. <br>
                                                                <br>
                                                               	다만, 아래와 같이 공동현관 출입 또는 자택 앞으로 배송할 수 없는 경우, <br>
                                                                <br>
                                                               	최대한 상품을 안전하게 배송드리고자 공동현관 앞 또는 경비실 앞으로 대응배송이 될 수 있습니다.
                                                                <br>
                                                                <br>
                                                                <br>
																예: <br>
                                                                (1) 카드키로만 출입이 가능한 공동현관<br>
                                                                <br>
                                                                (2) 경비실을 통해 출입해야하는 공동현관 (경비부재시 출입불가) <br>
                                                                <br>
                                                                (3) 새벽시간에 건물의 공동현관을 폐쇄할 경우<br>
                                                                <br>
                                                                <br>
                                                                <br>
																관련하여 문의가 있으신 경우, 컬리의 고객행복센터 (1644-1107) 또는 카카오톡, 1:1문의로 접수바랍니다.<br>
                                                                <br>
                                                               	담당자 신속하게 안내드리도록 하겠습니다.
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 자주하는 질문 1페이지 내용 종료 -->

                                        <!-- 자주하는 질문 2페이지 내용 시작 -->
                                        <div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_94">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">46</td>
                                                            <td width="135" align="center">취소/교환/반품</td>
                                                            <td style="cursor:pointer">교환/반품 기준이 어떻게 되나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>[상품에 문제가 있는 경우]<br>
                                                                    <br>
                                                                    1. 신선식품: 상품을 받은 날로부터 2일이내에 사진과 함께 1:1 문의 또는 카카오톡 문의로 접수해주세요. <br>
                                                                    <br>
                                                                    2. 그외의 상품: 상품을 받은 날로부터 3개월 이내, 또는 문제가 있다는 사실을 알았거나 알 수 있었던 날로부터 30일 이내에, 사진과 함께 1:1 문의 또는 카카오톡 문의로 접수해주세요. <br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    [단순변심 / 주문 오류의 경우]<br>
                                                                    <br>
                                                                    1. 신선식품: 재판매가 불가한 상품의 특성상 단순변심, 주문 실수, 개인 기호에 따른 교환 및 반품은 어렵습니다.<br>
                                                                    <br>
                                                                    2. 그외의 상품: 상품을 받은 날로부터 7일이내에 교환 또는 환불 신청할 수 있습니다.
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    (참고) <br>
                                                                   	단순변심인 경우 배송비는 고객님 부담입니다. <br>
                                                                   	이미 배송비를 부담하신 경우에는 3000원, 무료 배송 받으신 경우에는 6000원이 부담됩니다. <br>
                                                                    <br>
                                                                   	상품에 문제가 있는 것이 확인될 경우 배송비는 컬리에서 부담합니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_96">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">45</td>
                                                            <td width="135" align="center">회원문의</td>
                                                            <td style="cursor:pointer">회원 탈퇴 후 동일한 연락처로 재가입이 가능한가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>회원탈퇴 후 30일 이내에는 동일한 연락처로 가입이 불가합니다.</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_103">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">44</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">카카오톡으로는 어떻게 문의할 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>(PC) 하단 고객센터 푸터에서 카카오톡 문의를 누르고 QR코드로 접속해주세요. PC에 카카오톡이 깔려있다면 대화가 바로 시작합니다.<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 고객센터 &gt; 카카오톡 문의 또는 마이컬리 &gt; 1:1 문의 &gt; 카카오톡 문의를 눌러주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_11">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">43</td>
                                                            <td width="135" align="center">회원문의</td>
                                                            <td style="cursor:pointer">회원탈퇴를 하고 싶어요.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>혹여 컬리 이용시 불편하셨던 점이 있으시다면 1:1 문의접수 부탁드립니다.<br>
                                                                    <br>
                                                                   	담당자 신속하게 확인하여 안내 및 조치드리겠습니다.<br>
                                                                    <br>
                                                                    <br>
                                                                   	아래는 회원탈퇴 방법입니다.<br>
                                                                    <br>
                                                                    <br>
                                                                   	로그인 후,<br>
                                                                    <br>
                                                                    (PC) 상단 고객님 성함 (마이컬리) &gt; 개인정보 수정 &gt; 비밀번호 재확인 최하단
                                                                    [탈퇴하기] 버튼<br>
                                                                    <br>
                                                                    (모바일 웹) 마이컬리 &gt; 개인정보 수정 &gt; 비밀번호 재확인 최하단 [탈퇴하기] 버튼<br>
                                                                    <br>
                                                                    (앱) 마이컬리 &gt; 개인정보 수정 &gt; 비밀번호 재확인 &gt; 개인정보 수정 하단
                                                                    [탈퇴하기] 버튼<br>
                                                                    <br>
                                                                    <br>
                                                                   	을 통해 탈퇴하실 수 있습니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    * 고객님의 개인정보를 위해 직접 탈퇴만 가능합니다.<br>
                                                                    <br>
                                                                    * 잔여 적립금과 쿠폰은 탈퇴와 함께 소멸되며 별도의 환불처리는 불가합니다.<br>
                                                                    <br>
                                                                    * 회원 탈퇴시 부정이용 방지를 위하여 30일 동안 보관 후 파기하며, 재화 또는 서비스
                                                                   	제공에 해당하는 경우는 관련 법령에 의거하여 보유기간 동안 보관 후 파기합니다.<br>
                                                                    <br>
                                                                    1) 계약 또는 청약철회 등에 관한 기록 (전자상거래 등에서 소비자 보호에 관한 법률) :
                                                                   	보유기간 5년<br>
                                                                    2) 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래 등에서 소비자 보호에 관한 법률)
                                                                    : 보유기간 5년<br>
                                                                    3) 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래 등에서 소비자 보호에 관한 법률)
                                                                    : 보유기간 3년<br>
                                                                    4) 본인 확인에 대한 기록 (정보통신 이용촉진 및 정보보호 등에 관한 법률) : 보유기간
                                                                    6개월<br>
                                                                    5) 인터넷 로그기록자료, 접속지 추적자료 (통신비밀보호법) : 보유기간 3개월
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_30">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">42</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">할인 된 금액은 어디서 확인 할 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>할인 된 금액은 주문 전 장바구니에서 확인가능하며, <br>
                                                                    <br>
                                                                   	주문(결제)이후에는 아래 경로를 통해 확인하실 수 있습니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 상단 고객님 이름 &gt; 나의 주문내역 &gt; 주문내역상세<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 주문 내역 &gt; 주문내역상세<br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_60">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">41</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">팝업이 안 보여요.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>마켓컬리에서는 고객님께 유용하고 중요한 정보를 팝업으로 안내드리고 있습니다. <br>
                                                                    <br>
                                                                   	팝업차단을 해제하시면 더 많은 좋은 쇼핑기회를 얻으실 수 있습니다.<br>
                                                                    <br>
                                                                    * 윈도우 XP 서비스팩2 (SP2) 일 경우, 팝업차단이 설정되어 보이지 않을 수
                                                                   	있습니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    1. 확인방법<br>
                                                                    <br>
                                                                   	익스플로러 &gt; 팝업차단 &gt; 팝업차단유무확인<br>
                                                                    <br>
                                                                    <br>
                                                                    2. 해결방법<br>
                                                                    <br>
                                                                    (1) 팝업창이 나오지 않을 경우, 주소입력 (URL) 단 밑에 노란 표시줄을 더블 클릭<br>
                                                                    <br>
                                                                    (2) 안내창 더블클릭 &gt; 현재사이트의 팝업을 항상 허용<br>
                                                                    <br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_85">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">40</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">(샛별배송) 공동현관문에 비밀번호가 있어야 출입이 가능한데 배송을 어떻게 받을 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>샛별배송의 경우 비밀번호가 있는 공동현관문이라면, 주문서 작성시 공동현관 출입방법에 비밀번호를
                                                                   	선택하여 필수로 적어주셔야 합니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	특수문자 (# * 등) 까지 정확하게 모두 적어주시어야 고객님의 자택 앞에 배송드릴 수 있습니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	출입 불가 시 경비실 앞 혹은 공동현관 앞에 배송되오니 참고해주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_100">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">39</td>
                                                            <td width="135" align="center">쿠폰/적립금</td>
                                                            <td style="cursor:pointer">쿠폰은 어떻게 적용하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>(회원) 주문서에서 [4. 결제금액] 섹션아래 쿠폰칸을 눌러 조회하신 후 [확인] 버튼을 눌러 적용이 가능합니다. <br>
                                                                    <br>
                                                                    * 한 주문건에 쿠폰은 한 장만 사용가능하며, 신규회원 혜택 사용 시에는 적립금과 함께 사용 불가한 점 안내드립니다 * <br>
                                                                    <br>
                                                                   	쿠폰별로 사용법 및 조건이 다를 수 있으니, 사용법 문의는 1:1 문의에 남겨주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_9">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">38</td>
                                                            <td width="135" align="center">회원문의</td>
                                                            <td style="cursor:pointer">회원 정보를 변경하려면 어떻게 해야 하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>로그인 후,<br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 홈페이지 오른쪽 위의 고객님 성함 (마이컬리) &gt; 개인 정보 수정 <br>
                                                                    <br>
                                                                    (모바일) 아래 탭 마이컬리 &gt; 개인정보 수정<br>
                                                                    <br>
                                                                    <br>
                                                                   	에서 회원정보 변경이 가능합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    * 아이디는 변경이 불가합니다.<br>
                                                                    <br>
                                                                    * 개인정보 수정에서 배송정보는 수정할 수 없습니다. 배송정보 변경을 원하실 경우<br>
                                                                    <br>
                                                                   	샛별배송지역고객님께서는 배송일 전날 밤 11시 (택배지역 고객님은 배송일 전날 밤 8시) 전까지 <br>
                                                                    <br>
                                                                    1:1 문의에 주문번호와 함께 변경주소를 남겨주시면 반영이 가능합니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_22">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">37</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">주문이 안 됩니다.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>주문이 안 되는 경우,<br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 모든 인터넷 창을 종료 후, 컬리 홈페이지 재접속 후에 다시 로그인 해주세요.<br>
                                                                    <br>
                                                                    (모바일 웹) 사용하는 브라우저에서 탭 혹은 창을 닫고, 재접속 후에 다시 로그인 해주세요.<br>
                                                                    <br>
                                                                    (모바일 앱) 앱 종료 후 재로그인해주세요. <br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                   	공용 PC의 경우 방화벽이 높게 설정되어 있을 경우, 결제가 어려울 수 있습니다. <br>
                                                                    <br>
                                                                   	결제에 필요한 모든 콘텐츠 사용 및 프로그램을 허용해 주셔야 합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                   	재로그인, 재접속 이후에도 동일한 문제가 발생하실 경우, 고객센터 (1644-1107) 또는
                                                                    1:1 문의, 카카오톡에 하단 정보와 함께 문의 남겨주세요.<br>
                                                                    <br>
                                                                    1. 오류가 발생 된 플랫폼 정보: 앱 (안드로이드), 앱 (iOS), 모바일 웹,
                                                                    PC<br>
                                                                    <br>
                                                                    2. 모바일인 경우: 기기 정보 / PC인 경우: 윈도우 정보<br>
                                                                    <br>
                                                                    3. 모바일인 경우: 버전정보 / PC인 경우: 브라우저 정보 (인터넷 익스플로러, 크롬, 파이어폭스, 사파리 등) <br>
                                                                    <br>
                                                                    4. 구체적 오류 내용. 어느 화면에서 어떤 부분을 눌렀을 때 어떤 현상이 발생되는지 구체적인 내용설명과 화면 캡쳐해주시면 많은 도움이 됩니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_90">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">36</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">이벤트 문자는 오는데, 배송완료문자만 오지 않습니다.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom:10px;">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#bf0000;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_q.webp">
                                                                </th>
                                                                <td>배송완료 문자가 안와요.</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>이벤트 문자와 다르게 배송완료 문자는 사진이 포함되어 보내지기 때문에 통신사 자체 스팸처리
                                                                   	또는 고객님 기기의 용량 초과의 문제일 수 있습니다. <br>
                                                                    <br>
                                                                   	고객님의 휴대폰 수신 용량이 초과된 것은 아닌지 우선 확인부탁드리며, <br>
                                                                    <br>
                                                                   	자체 스팸처리가 아닌 경우 통신사측으로부터 1644-1107 번호가 자동 스팸처리가 된 것은 아닌지 확인 부탁드립니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                   	아래와 같은 경우 스팸처리가 될 수 있습니다. <br>
                                                                    <br>
                                                                    1. 고객님께서 직접 해당번호(1644-1107)를 스팸등록 하신 경우<br>
                                                                    <br>
                                                                    2. 스팸 차단 앱이 핸드폰에 저장되어 있어 자동으로 스팸처리가 되는 경우<br>
                                                                    <br>
                                                                    3. 통신사에서 자체적으로 스팸으로 지정해 버리는 경우<br>
                                                                    <br>
                                                                    <br>
                                                                   	위 항목에 해당하지 않음에도 문자가 발송되지 않은 경우 고객센터 (1644-1107)에 문의 부탁드립니다.<br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_99">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">35</td>
                                                            <td width="135" align="center">쿠폰/적립금</td>
                                                            <td style="cursor:pointer">적립금은 어떻게 적용하나요? </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>(회원) 주문서에서 [4. 결제금액] 섹션아래 적립금 칸에 1원 단위로 적용이 가능합니다.
                                                                    <br>
                                                                    <br>
                                                                   	보유 적립금 확인 후, 원하시는 금액 입력하여 적용해주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_105">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">34</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">(샛별배송) 새벽에 공동현관출입이 어려운 경우 어떻게 해야하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>새벽에 공동현관출입이 어렵지만 고객님께서 새벽에 전화를 받으실 수 있다면, <br>
                                                                    <br>
                                                                   	주문서 [3.배송정보] 섹션에 공동현관출입방법 중, 연락처로 전화를 선택하시거나<br>
                                                                    <br>
                                                                   	전화를 받으실 수 있다고 메모해주세요. (주문 전 휴대폰 번호를 꼭 확인해주세요.)<br>
                                                                    <br>
                                                                    <br>
                                                                   	요청해주시는 고객님들에 한해, 문제 발생 시 고객님께 전화드려 출입방법을 문의드려 배송시 참고하도록 하겠습니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_10">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">33</td>
                                                            <td width="135" align="center">회원문의</td>
                                                            <td style="cursor:pointer">외국인이나 해외에 거주하는 사람도 회원가입 할 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>마켓컬리는 외국인, 해외거주자 고객님들도 대한민국에서 개통한 핸드폰이 있으실 경우 가입이 가능합니다. <br>
                                                                    <br>
                                                                   	다만 해외배송은 불가한 점 참고 부탁드립니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_16">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">32</td>
                                                            <td width="135" align="center">취소/교환/반품</td>
                                                            <td style="cursor:pointer">교환시 별도 배송비가 부과되나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>가공식품 및 일부 비식품류에 한해서만 반품이 가능합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                   	단순변심에 의한 교환/반품 시 배송비 6,000원 (주문 건 배송비를 낸 경우 3,000원)을
                                                               		고객님께서 부담하셔야합니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    1. 상품에 이상이 없거나 상품의 특성적인 부분인 경우<br>
                                                                    <br>
                                                                    2. 단순 변심에 의해 교환 및 반품하는 경우<br>
                                                                    <br>
                                                                    3. 옵션 및 상품을 잘못 선택하여 잘못 주문했을 경우<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                	판매자 과실 등 상품에 문제로 인해 교환시 배송비를 판매자가 부담합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    1. 수령한 상품이 불량인 경우<br>
                                                                    <br>
                                                                    2. 수령한 상품이 파손된 경우 <br>
                                                                    <br>
                                                                    3. 상품이 상품상세정보와 다른 경우<br>
                                                                    <br>
                                                                    4. 주문한 상품과 다른 상품이 배송된 경우 등<br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 자주하는 질문 2페이지 내용 종료 -->

                                        <!-- 자주하는 질문 3페이지 내용 시작 -->
                                        <div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_23">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">31</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">결제내역을 문자나 메일로 받아 볼 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>주문하신 내역은 고객님의 회원정보에 기재된 휴대폰으로 카카오톡 알림 (없다면 문자메시지) 및 메일로 발송을 드립니다.<br>
                                                                    <br>
                                                                   	카카오톡 알림 수신거부 또는 메일 수신거부 시, 결제내역이 전송되지 않을 수 있습니다.<br>
                                                                    <br>
                                                                   	이메일 수신여부는 마이컬리 &gt; 개인정보수정 에서 확인 및 변경이 가능합니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_45">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">30</td>
                                                            <td width="135" align="center">쿠폰/적립금</td>
                                                            <td style="cursor:pointer">적립금은 어떻게 쌓을 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>적립금은 주문결제, 후기 작성, 이벤트에 참여하고 쌓을 수 있습니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    1. 주문결제 적립금 : 배송비를 제외한 결제금액에 각 고객등급별 적립률을 곱한 금액으로 지급됩니다.<br>
                                                                    <br>
                                                                    (일반 0.5%, 프렌즈 1%, 화이트 3%, 라벤더 5%, 퍼플 7%, 더 퍼플
                                                                    7%)<br>
                                                                    <br>
                                                                   	일부 상품은 적립금이 지급되지 않습니다. (상품 상세에서 확인가능) <br>
                                                                    <br>
                                                                    <br>
                                                                    2. 후기 작성 : 일반 텍스트 후기는 50원, 사진후기는 100원의 적립금이 지급됩니다.
                                                                    <br>
                                                                    <br>
                                                                   	더퍼플, 퍼플 고객님들은 후기작성 적립금이 2배로 쌓입니다. 적립금 지급은 후기 작성후 영업일 2~3 일 내에 지급됩니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    3. 이벤트: 각 종 이벤트 참여를 통해 적립금을 쌓을 수 있습니다. <br>
                                                                    <br>
                                                                   	자세한 사항은 아래 상세 페이지를 통해 확인해주세요.<br>
                                                                    <br>
                                                                    (PC) 메인 메뉴에서 [이벤트]<br>
                                                                    <br>
                                                                    (모바일 웹/앱) 홈 탭화면의 상단 [이벤트] 메뉴 화면
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_74">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">29</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">문자를 받고 싶지 않은데 수신거부는 어떻게 하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>문자 수신거부를 원하실 경우, 로그인 후<br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 홈페이지 상단 고객님 성함 (마이컬리) &gt; 개인정보수정<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 개인정보수정<br>
                                                                    <br>
                                                                   	에서 SMS 수신여부를 수신안함으로 선택 후 [수정하기] 버튼을 누르시면 반영됩니다.<br>
                                                                    <br>
                                                                    <br>
                                                                   	직접 변경이 어려우시다면 고객센터 (1644-1107) 또는 1:1 문의에 접수해주세요.
                                                                    <br>
                                                                    <br>
                                                                    * 다만, 수신거부를 하시더라도 주문한 상품에 대한 결제정보, 배송정보와 같이 반드시 필요한
                                                                   	정보를 포함한 문자는 자동으로 발송됩니다. <br>
                                                                   	따라서 모든 문자에 대한 수신 거부를 원하시는 경우, 고객님 개인 휴대폰에서 수신거부
                                                                    (스팸등록) 등 직접 설정해주셔야 합니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_76">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">28</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">(샛별배송) 카드키가 필요한데 출입은 어떻게 하나요?
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>자택 공동현관 출입이 카드키로만 가능할 경우, 주문서에 아래 4가지 출입방법 중 하나를
                                                                   	선택하여 주문해주세요.<br>
                                                                    <br>
                                                                    <br>
                                                                    1. 경비실 호출<br>
                                                                    <br>
                                                                    2. 경비실로 배송<br>
                                                                    <br>
                                                                    3. 세대호출<br>
                                                                    <br>
                                                                    4. 연락처로 전화<br>
                                                                    <br>
                                                                    <br>
                                                                   	위 4가지 모두 어려울 경우, 배송이 어려울 수 있는 점 참고부탁드립니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_14">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">27</td>
                                                            <td width="135" align="center">회원문의</td>
                                                            <td style="cursor:pointer">마켓 컬리 회원가입을 하면 어떤 혜택이 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>회원가입시 혜택은 기간에 따라 다르며, 가입 후 타임세일과 같은 할인 혜택을 받으실 수
                                                                   	있습니다. <br>
                                                                    <br>
                                                                   	뿐만아니라, 다양한 이벤트 참여를 통해 쿠폰, 적립금, 선물배송 등의 혜택을 받으실 수도
                                                                   	있습니다. <br>
                                                                    <br>
                                                                   	비회원의 경우 할인혜택을 받을 수 없으니, 회원가입을 통해 컬리에서 제공하는 여러 이벤트 및
                                                                   	할인 혜택을 받아보세요!
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_21">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">26</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">무통장입금은 없나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>유통기한이 짧은 극 신선품을 판매하고 있어 결제시간과 입금시간이 다를 경우 품절이 발생할 수
                                                                   	있으므로, 무통장 입금이 불가합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                   	대신 아래와 같이 다른 다양한 결제 시스템을 제공하고 있는 점 참고부탁드립니다.<br>
                                                                    <br>
                                                                   	｜카드결제, 핸드폰 소액결제, 페이코 간편결제
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_41">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">25</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">상품 문의는 어떻게 하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>상품문의는 <br>
                                                                    <br>
                                                                    (PC) 상품상세 &gt; 상품 문의<br>
                                                                    <br>
                                                                    (모바일) 상품상세 &gt; 상품 문의 또는 마이컬리 &gt; 상품문의<br>
                                                                    <br>
                                                                    <br>
                                                                   	에 남겨주시면 영업일 기준 1~2 일 내에 답변드립니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    * 교환, 환불, 배송, 쿠폰사용 등의 문의는 신속한 조치를 위해 1:1 문의에 남겨주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_48">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">24</td>
                                                            <td width="135" align="center">쿠폰/적립금</td>
                                                            <td style="cursor:pointer">적립금, 쿠폰은 어디서 볼 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>로그인 후, 아래 화면에서 확인하실 수 있습니다. <br>
                                                                    <br>
                                                                    (PC) 홈페이지 상단 고객님 성함 (마이컬리) &gt; 나의 적립금 또는 나의 쿠폰<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 적립금 또는 쿠폰<br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_88">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">23</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">(샛별배송) 배송시간 및 날짜를 정할 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>배송시간 및 날짜 지정은 어렵습니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	샛별배송은 오늘밤 11시 전까지 주문하신다면, 다음날 아침 7시까지 신선하고 빠르게
                                                                   	배송해드리고 있습니다. <br>
                                                                    <br>
                                                                   	교통상황 및 기상 (눈, 비)에 따라 배송지연이 될 수 있는 점 양해부탁합니다.<br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_106">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">22</td>
                                                            <td width="135" align="center">취소/교환/반품</td>
                                                            <td style="cursor:pointer">상품을 교환/반품 하고 싶어요.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>받으신 상품을 교환/반품 하셔야 한다면 교환 사유, 문제가 발생한 부분을 확인할 수 있는
                                                                   	사진과 함께 고객센터 (1644-1107) 또는 1:1 문의에 남겨주세요. <br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 홈페이지 상단 고객센터 &gt; 1:1 문의 또는 홈페이지 하단 1:1문의<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 1:1 문의 또는 마이컬리 &gt; 고객센터 &gt; 1:1 문의
                                                                   	또는 카카오톡 문의
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_25">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">21</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">30만원 이상 결제시 공인인증서 인증이 꼭 필요 한가요?
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>2005년 11월 1일부터 금감원의 전자상거래 안정성 강화 정책에 따라 30만원 이상의 모든
                                                                   	신용카드 결제에 공인인증 사용이 의무화 되었습니다. <br>
                                                                    <br>
                                                                   	따라서 공인인증서가 있어야하며, 안전한 결제를 위해 공인인증서 확인 후 이용 부탁드립니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_38">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">20</td>
                                                            <td width="135" align="center">취소/교환/반품</td>
                                                            <td style="cursor:pointer">주문 취소는 어떻게 하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>배송 단계별 주문 취소 방법은 상이합니다.<br>
                                                                   	ㅇ[입금확인] 단계 - [마이컬리 &gt; 주문내역 상세페이지] 에서 직접 취소 가능<br>
                                                                   	ㅇ[입금확인] 이후 단계 - 고객행복센터로 문의<br>
                                                                    <br>
                                                                    - 생산이 시작된 [상품 준비중] 이후 단계에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.<br>
                                                                    - 비회원은 모바일 App 또는 모바일 웹사이트에서 [마이컬리 &gt; 비회원 주문 조회 페이지] 에서 취소가 가능합니다.<br>
                                                                    - 일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.<br>
                                                                    - 주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_63">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">19</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">(샛별배송) 배송완료 알림톡 또는 문자는 언제 오나요?
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>샛별배송 배송완료 알림톡 또는 문자는 고객님께서 주문서에 기입하신 옵션대로 배송직후 또는 아침
                                                                    7시에 전송됩니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 홈페이지 상단 고객님 성함 (마이컬리) &gt; 나의 주문내역 &gt;
                                                                   	주문내역상세<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 주문 내역 &gt; 주문내역상세<br>
                                                                    <br>
                                                                    <br>
                                                                   	에서 선택하신 배송시간을 확인하실 수 있습니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	주문건의 배송완료 알림톡 또는 문자의 전송 시간을 변경하셔야 한다면, 배송전날 밤 11시
                                                                   	전까지 1:1 문의에 남겨주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_92">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">18</td>
                                                            <td width="135" align="center">회원문의</td>
                                                            <td style="cursor:pointer">회원가입은 무료인가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>마켓컬리는 배송지역 상관 없이 회원가입은 무료입니다.<br>
                                                                    <br>
                                                                   	회원가입 후 다양한 혜택과 상품을 만나보세요!
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_102">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">17</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">후기 적립금은 얼마인가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>일반 텍스트 후기는 50원, 사진후기는 100원의 적립금이 지급됩니다. <br>
                                                                    <br>
                                                                   	더퍼플, 퍼플 고객님들에게는 적립금이 2배로 쌓입니다. <br>
                                                                    <br>
                                                                   	또한 매주 베스트 후기 20명을 추첨하여 적립금 5,000원을 지급하고 있습니다. <br>
                                                                    <br>
                                                                    * 적립금 지급은 후기 작성후 영업일 2~3 일 내에 지급됩니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 자주하는 질문 3페이지 내용 종료 -->

                                        <!-- 자주하는 질문 4페이지 내용 시작 -->
                                        <div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_27">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">16</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">상품후기는 어떻게 남길 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>배송 완료일로부터 30일 동안 상품후기를 작성하실 수 있습니다. (30일 경과 시 후기작성이
                                                                   	불가합니다.)<br>
                                                                    <br>
                                                                   	교환/환불 등의 신속한 조치가 필요하시다면, 1:1문의 또는 카카오톡에 문의
                                                                   	접수해주세요.<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 나의 주문내역 &gt; 해당 주문 건 &gt; 후기작성 혹은 주문하신 상품상세
                                                                    &gt; 상품후기 &gt; 상품후기 작성<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 상품 후기 혹은 주문하신 상품상세 &gt; 상품후기 &gt;
                                                                   	상품후기 작성<br>
                                                                    <br>
                                                                    <br>
                                                                    * 근거없는 비망 및 욕설이 기재되어 있을 경우 삭제됩니다. <br>
                                                                    <br>
                                                                    * 타인의 주관적인 의견으로 인하여 상품의 기능이나 효과 등에 오해가 있을 수 있는 상품후기는
                                                                   	삭제될 수 있습니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_47">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">15</td>
                                                            <td width="135" align="center">쿠폰/적립금</td>
                                                            <td style="cursor:pointer">비회원 주문내역에 대한 실적 합산이 가능한가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>비회원으로 구매하신 내역은 실적 합산이 불가합니다. <br>
                                                                    <br>
                                                                   	주문하시기 전 회원가입하셔서 적립금도 쌓고 더 많은 혜택을 누리세요!
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_91">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">14</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">관공서, 학교, 회사, 시장, 공업단지로도 샛별배송이 가능한가요? </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0" style="margin-bottom:10px;">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#bf0000;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_q.webp">
                                                                </th>
                                                                <td>관공서, 학교, 회사로도 배송이 되나요?</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>샛별배송의 경우 관공서, 학교(기숙사), 회사, 시작, 백화점, 공단지역 등 새벽출입에 제한이
                                                                   	있어 배송이 어렵습니다. <br>
                                                                    <br>
                                                                   	하지만 관공서 건물이라도 새벽출입이 가능하고 출입방법을 자세히 적어주시면 배송드리고 있습니다.
                                                                    <br>
                                                                    <br>
                                                                   	새벽출입여부를 확인하신 후 주문해주세요.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_107">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">13</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">대량주문은 어떻게 신청하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td> <br>
                                                                   	최소 구매금액 100만원 이상 시 해당 서비스를 이용하실 수 있습니다. (기준 충족 시 다중
                                                                   	배송 가능) <br>
                                                                   	여러 주소지에 배송 주문 시, 주소지 1곳 당 결제금액이 4만원 미만일 경우 주소지당 개별
                                                                   	배송비가 발생 됩니다. <br>
                                                                   	문의를 남겨주시면 빠른 시간 내에 상담 전화 드립니다. ( ☎ 1644 - 1108, 메일 :
                                                                    kurlygift@kurlycorp.com )<br>
                                                                    <br>
                                                                    1. 컬리 회원이신 경우,<br>
                                                                    <br>
                                                                    (PC) 홈페이지 상단 [고객센터] -&gt; [대량주문 문의] 게시판 문의<br>
                                                                    (모바일) 화면 하단 [마이컬리] -&gt; [대량주문 문의] 게시판 문의<br>
                                                                    <br>
                                                                   	위 순서대로 진행하시어 게시판으로 문의 부탁드립니다.<br>
                                                                    <br>
                                                                    2. 비회원이신 경우,<br>
                                                                    <br>
                                                                   	비회원으로의 대량주문 문의는 상기 연락처 및 메일 주소를 통해 문의 가능하십니다.<br>
                                                                    <br>
                                                                    ( 운영 시간 : 평일 10:00 ~ 19:00 / 토요일, 일요일 &amp; 공휴일 전화
                                                                   	상담 불가 )<br>
                                                                    <br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_19">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">12</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">마켓컬리에서 어떤 결제방법을 제공하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>컬리의 결제수단은 아래와 같습니다.<br>
                                                                    <br>
                                                                    <br>
                                                                 	 ｜ 카드결제, 핸드폰 소액결제, 간편결제 (스마일페이, 페이나우, 네이버페이, 페이코)<br>
                                                                    <br>
                                                                    <br>
                                                                   	컬리에서는 유통기한이 짧은 극신선품을 판매하고 있어 <br>
                                                                    <br>
                                                                   	결제시간과 입금시간이 다를 경우 품절이 발생할 수 있으므로 무통장 입금이 불가합니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_70">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">11</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">유기농과 친환경, 무농약의 차이는 뭔가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>친환경 농산물은 인체와 생태환경에 해로운 화학비료, 농약, 제초제 등을 최대한 사용하지 않고
                                                                   	재배한 농산물입니다. <br>
                                                                    <br>
                                                                   	친환경 농산물 중에 화학비료와 농약 사용량에 따라 무농약, 유기농 등 으로 나눠 집니다.
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    1. 무농약: 농약은 사용하지 않되 화학비료를 사용한 농산물<br>
                                                                    <br>
                                                                    2. 유기농: 화학비료와 농약을 일체 사용하지 않고 재배한 농산물
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_75">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">10</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">배송지역 검색을 했더니 배송불가라고 떠요.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>컬리에서는 주문하신 지역에 따라 샛별배송 혹은 택배로 배송이 됩니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	서울 전지역 및 경기, 인천 일부지역은 샛별배송으로, 그 외 지역은 택배배송으로 운영됩니다.
                                                                    <br>
                                                                    <br>
                                                                   	컬리에서 사용하는 택배는 일반택배가 아닌 당일에 출고되어 당일에 배송되는 시스템으로, 현재
                                                                   	택배에서 당일배송을 지원하지 않는 지역은 배송이 어렵습니다.<br>
                                                                    <br>
                                                                   	혹여 배송불가지역 관련하여 궁금한 사항이 있으시다면 [1:1문의] 게시판에 [고객님 주소] 를
                                                                   	기재하여 문의해주세요. <br>
                                                                    <br>
                                                                   	샛별배송 지역 확장을 위해 지속적으로 연구하고 노력하겠습니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_29">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">9</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">현금영수증 발행을 취소하고 싶어요.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>고객의 요청에 의해 발급된 현금영수증은 국세청 승인 후에는 변경 불가합니다. <br>
                                                                    <br>
                                                                   	국세청 승인 전이라면 1:1 문의 또는 고객센터(1644-1107)로 문의 바랍니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_67">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">8</td>
                                                            <td width="135" align="center">서비스 이용 및 기타</td>
                                                            <td style="cursor:pointer">마켓컬리는 어떤 회사인가요? 믿고 주문할 수 있는 곳 인가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>마켓컬리에서는 사람을 소중히 하는 마음으로, 산지에서 친환경 혹은 유기농 인증을 받은 제품들을
                                                                   	꼼꼼히 선택하여 판매합니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	제품을 최대한 신선하게 배송해 드리기 위해, <br>
                                                                    <br>
                                                                   	샛별배송지역은 밤 11시 전까지 주문하신 경우 다음날 아침 7시까지, <br>
                                                                    <br>
                                                                   	택배지역은 저녁 8시까지 주문한 경우 택배 시스템을 통해 다음날 밤 11시 전까지 제품을
                                                                   	배송해 드립니다.<br>
                                                                    <br>
                                                                    <br>
                                                                   	또한 수령하신 제품에 문제가 발생할 경우를 대비해 고객만족보장제도를 운영하고 있으며, <br>
                                                                    <br>
                                                                    1:1 문의에 사진 (사진으로 확인할 수 있는 경우) 및 불편사항을 접수해 주시면 확인 후
                                                                   	환불, 교환도 드리고 있습니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    "우리가 곧 고객이다" 라는 신념으로 좋은 제품을 선택하고 검수하며,<br>
                                                                    <br>
                                                                   	문제 발생 시 고객님의 편에서 조치를 드리고 있으니, 안심하고 이용해 주시기 바랍니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_81">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">7</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">샛별배송 또는 택배배송을 선택 할 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>컬리는 지역에 따라 배송방법이 분류됩니다. <br>
                                                                    <br>
                                                                    <br>
                                                                   	서울 전지역, 경기, 인천 일부 지역은 샛별배송이 가능합니다. <br>
                                                                    <br>
                                                                   	그 외 다른 지역은 택배배송으로 배송됩니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    * 일부 배송불가 지역이 있으니 아래 페이지에서 확인해주세요.<br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 상단 [배송지역 검색] 또는 사이드 메뉴에 [배송 안내]<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 배송 안내
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_17">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">6</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">현금영수증/세금계산서 발급은 어떻게 하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>실시간 계좌이체 구매만 현금영수증 발행이 가능합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                   	결제화면에서 소득공제용, 지출증빙용 등 용도에 맞게 현금영수증을 선택 후 주민등록번호, 휴대폰
                                                                   	번호 혹은 사업자등록번호 등의 정보를 입력하시면 <br>
                                                                    <br>
                                                                   	결제완료 후 (PC) 마이컬리 &gt; 나의 주문 내역 에서 영수증 출력이 가능합니다.<br>
                                                                    <br>
                                                                    * 간편결제 페이코의 결제 수단 중 계좌이체 시에도 같은 방법으로 현금영수증 발행이
                                                                   	가능합니다. 그 외의 결제수단은 현금영수증 발행이 불가합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                   	결제 완료 후 발행을 원하신다면, <br>
                                                                    <br>
                                                                    (PC) 마이컬리 &gt; 나의 주문 내역 하단에 [현금영수증 발행 신청] 버튼을 눌러 신청이 가능합니다.<br>
                                                                    <br>
                                                                    * 발급은 영업일 기준으로 약 2주 정도 소요될 수 있습니다. 현재 시스템상 별도의 세금계산서
                                                                   	발행은 불가하며,<br>
                                                                    <br>
                                                                   	결제 시 사업자번호를 입력하고 지출증빙용 현금영수증을 발금받으시면 세금계산서 대용으로 사용이
                                                                   	가능합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                   	궁금하신 점 있으시면 1:1 문의 혹은 고객센터(1644-1107)로 연락주시면 신속히
                                                                   	해결해드리겠습니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_93">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">5</td>
                                                            <td width="135" align="center">배송문의</td>
                                                            <td style="cursor:pointer">배송 가능 지역인지 어떻게 확인하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>배송지역은 아래 페이지를 통해 확인하실 수 있습니다. <br>
                                                                    <br>
                                                                    <br>
                                                                    (PC) 상단 [배송지역 검색] 또는 사이드 메뉴에 [배송 안내]<br>
                                                                    <br>
                                                                    (모바일) 마이컬리 &gt; 배송 안내 <br>
                                                                    <br>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_15">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">4</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">비회원 주문확인 및 배송 조회는 어떻게 할 수 있나요?
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>비회원 주문확인 및 배송 조회는 모바일 앱과 웹, 혹은 고객센터 (1644-1107)에서 가능합니다.<br>
                                                                    <br>
                                                                    <br>
                                                                    (모바일 앱) 마이컬리 &gt; 비회원 주문 조회<br>
                                                                    <br>
                                                                    (모바일 웹) 로그인 화면에서 [비회원] 을 누른 후 주문자명, 주문번호를 입력하여 조회하시면 됩니다.<br>
                                                                    <br>
                                                                    (PC) 조회 불가합니다.
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_24">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">3</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">비회원도 상품 주문이 가능한가요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>비회원도 주문이 가능합니다. 다만 할인혜택을 받으 실 수 없으며, 주문내역 조회에 불편이 있을 수 있습니다.<br>
                                                                    <br>
                                                                   	지금 가입하시고 신규회원 이벤트, 컬리러버스 적립금 등 더 많은 혜택을 받아 보세요!
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_20">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">2</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">전화로도 주문할 수 있나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>컬리는 현재 전화주문이 불가합니다. (오프라인 매장 보유X)<br>
                                                                    <br>
                                                                   	모든 주문은 온라인으로 가능하오니 모바일 또는 인터넷으로 접속하셔서 원하시는 상품을
                                                                   	주문해주세요!
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 자주하는 질문 4페이지 내용 종료 -->

                                        <!-- 자주하는 질문 5페이지 내용 시작 -->
                                        <div>
                                            <div>
                                                <table width="100%" class="table_faq" onclick="view_content(this)" id="faq_28">
                                                    <tbody>
                                                        <tr>
                                                            <td width="70" align="center">1</td>
                                                            <td width="135" align="center">주문/결제</td>
                                                            <td style="cursor:pointer">상품주문은 어떻게 하나요?</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
                                                    <table cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <th style="color:#0000bf;width:40px; padding-top:1px;">
                                                                    <img src="../../img/gongjisahang_image/faq_a.webp">
                                                                </th>
                                                                <td>구매를 원하시는 상품을 장바구니에 담으신 후, [결제하기] 버튼을 누르시면 됩니다.</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 자주하는 질문 5페이지 내용 종료 -->
                                    </div>
                                    <!-- 자주하는 질문 table 안 내용만 종료 -->

                                    <!-- <div style="padding:1px; border-top:1px solid #e6e6e6"></div>
                                    <div class="layout-pagination">
                                        <div class="pagediv">
                                        	<a href="/shop/service/faq.php?&amp;page=1" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a>
                                        	<a href="/shop/service/faq.php?&amp;page=1" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
                                        	<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
                                        	<a href="/shop/service/faq.php?&amp;page=2" class="layout-pagination-button layout-pagination-number">2</a>
                                        	<a href="/shop/service/faq.php?&amp;page=3" class="layout-pagination-button layout-pagination-number">3</a>
                                        	<a href="/shop/service/faq.php?&amp;page=4" class="layout-pagination-button layout-pagination-number">4</a>
                                        	<a href="/shop/service/faq.php?&amp;page=5" class="layout-pagination-button layout-pagination-number">5</a>
                                        	<a href="/shop/service/faq.php?&amp;page=2" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
                                        	<a href="/shop/service/faq.php?&amp;page=5" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
										</div>
                                    </div>
                                    <table class="xans-board-search xans-board-search2">
                                        <tbody>
                                            <tr>
                                                <td class="input_txt">&nbsp;</td>
                                                <td>
                                                    <div class="search_bt">
                                                        <input type="image" src="../../img/gongjisahang_image/search.png" align="absmiddle">
                                                        <input type="text" name="sword" value="" required="">
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table> -->
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <script>
                    var preContent;

                    function view_content(obj) {
                        var div = obj.parentNode;

                        for (var i = 1, m = div.childNodes.length; i < m; i++) {
                            if (div.childNodes[i].nodeType != 1) continue;	// text node.
                            else if (obj == div.childNodes[i]) continue;

                            obj = div.childNodes[i];
                            break;
                        }

                        if (preContent && obj != preContent) {
                            obj.style.display = "block";
                            preContent.style.display = "none";
                        }
                        else if (preContent && obj == preContent) preContent.style.display = (preContent.style.display == "none" ? "block" : "none");
                        else if (preContent == null) obj.style.display = "block";

                        preContent = obj;
                    }

                    { // 초기출력
                        var no = "faq_";
                        if (document.getElementById(no)) view_content(document.getElementById(no));
                    }

                    // KM-1483 Amplitude 연동
                    KurlyTracker.setScreenName('frequently_ask_question')
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