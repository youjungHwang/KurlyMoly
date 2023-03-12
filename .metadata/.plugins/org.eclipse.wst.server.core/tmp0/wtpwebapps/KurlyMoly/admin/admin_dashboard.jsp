<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">

    <title>대시보드</title>
</head>

<body>
    <div id="wrap">
        <!-- 상단 메뉴 시작 -->
        <header id="header">
            <div id="header_menu1" class="header_menu">
                <ul>
                    <li>
                        <a href="#"><img id="kurly_logo" src="../img/kurly.png" alt="컬리로고"></a>
                    </li>
                    <li>
                        <h2>관리자 센터</h2>
                    </li>
                </ul>
            </div>

            <div id="header_menu2">
                <ul class="util clear" class="header_menu">
                    <li><a href="admin_dashboard.html">Admin 님</a></li>
                    <li><a href="admin_mypage.html">내 정보</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </header>
        <!-- 상단 메뉴 끝 -->

        <!--컨테이너 시작-->
        <div class="container clear">
            <!-- 사이드 메뉴 시작 -->
            <div class="side_menu">
                <div id="profile_area"><img id="pro_file" src="../img/profile.png"></div>
                <div id="tab1" class="menutab  __activepage">
                    <ul>
                        <li class="category __activepage1">대시보드</li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab2" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category">공지사항</li>
                        <li><a href="admin_noticecheck.html">공지사항 조회</a></li>
                        <li><a href="admin_noticeadd.html">공지사항 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab3" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">상품 관리</li>
                        <li><a href="admin_productcheck.html">상품 조회/수정</a></li>
                        <li><a href="admin_productadd.html">상품 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab4" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">판매 관리</li>
                        <li><a href="admin_ordercheck.html">주문 조회</a></li>
                        <li><a href="admin_deliverycheck.html">주문/배송 현황</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab5" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category clear">클레임 관리</li>
                        <li><a href="admin_cancelcheck.html"></a>취소 관리</li>
                        <li><a href="admin_exchangecheck.html">교환 관리</a></li>
                        <li><a href="admin_refundcheck.html">반품 관리</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab6" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">문의 사항</li>
                        <li><a href="admin_prd_inquiry.html">상품 문의</a></li>
                        <li><a href="admin_ctm_inquiry.html">고객 문의</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab7" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">회원 관리</li>
                        <li><a href="admin_membercheck.html">회원 조회</a></li>
                        <li><a href="admin_wd_member.html">탈퇴회원 조회</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab8" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">이벤트 관리</li>
                        <li><a href="admin_exchangecheck.html">이벤트 조회</a></li>
                        <li><a href="admin_eventadd.html">이벤트 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab9" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">기본 정보</li>
                        <li><a href="admin_mypage.html">내 정보</a></li>
                    </ul>
                </div>
            </div>
            <!-- 사이드 메뉴 끝 -->
            <!-- 내용 시작-->
            <div id="content" style="height: 100.5vh;">
                <div class="title dash_title  clear">
                    <p><img src="../img/notice.png"> [사내 공지] 마켓컬리 카카오뱅크 결제 신규 도입 | 2021.03.16 </p>
                </div>
            <div class="dash_cont clear">
                <ul class="dash_box clear">
                    <li class="dash_subtitle"><a href="#">상품</a></li>
                    <li class="clear">
                        <div><a href="#">
                            <div class="dash_tit_lbl">판매중</div>
                            <div class="dash_content">0</div>
                        </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">품절</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">판매중지</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                </ul>

                <ul class="dash_box clear">
                    <li class="dash_subtitle"><a href="#">주문/배송</a></li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">신규주문</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">상품준비중</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">배송중</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">배송완료</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">구매확정</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                </ul>

                <ul class="dash_box clear">
                    <li class="dash_subtitle"><a href="#">클레임</a></li>
                
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">취소요청</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">교환요청</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">반품요청</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                </ul>

                <ul class="dash_box clear">
                    <li class="dash_subtitle"><a href="#">미답변문의</a></li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">상품문의</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">고객문의</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                </ul>

                <ul class="dash_box clear">
                    <li class="dash_subtitle"><a href="#">회원</a></li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">신규회원</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">탈퇴회원</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                </ul>

                <ul class="dash_box clear">
                    <li class="dash_subtitle"><a href="#">이벤트</a></li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">전시대기</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">전시중</div>
                        <div class="dash_content">0</div>
                    </a></div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">전시종료</div>
                        <div class="dash_content">0</div>
                        </a></div>
                    </li>
                </ul>
            </div>

            <!-- 푸터 시작 -->
            <div class="footer">
                <div class="footer_menu">
                    <ul class="footer_list">
                        <li><a href="#">관리자센터 메뉴얼</a></li>
                        <li> | </li>
                        <li><a href="#">구글 애널리틱스</a></li>
                        <li> | </li>
                        <li><a href="#">마켓컬리 협업툴</a></li>
                        <li> | </li>
                        <li><a href="#">개발도구</a></li>
                    </ul>
                </div>
            </div>
            <!-- 푸터 끝-->
        </div>
        <!-- 내용 끝-->
        </div>
        <!--컨테이너 끝-->

    </div>
</body>

</html>