<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">

    <title>고객 문의</title>
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
                <div id="tab1" class="menutab">
                    <ul>
                        <li class="category"><a href="admin_dashboard.html">대시보드</a></li>
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
                        <li><a href="admin_cancelcheck.html">취소 관리</a></li>
                        <li><a href="admin_exchangecheck.html">교환 관리</a></li>
                        <li><a href="admin_refundcheck.html">반품 관리</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab6" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">문의 사항</li>
                        <li><a href="admin_prd_inquiry.html">상품 문의</a></li>
                        <li class="__activepage1">고객 문의</li>
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
                        <li><a href="admin_eventcheck.html">이벤트 조회</a></li>
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
            <div id="content">
                <div class="title">
                    <p>고객 문의</p>
                </div>
                <div class="quickcheck">
                    <ul>
                        <li>
                            <div class="quickmenu">
                                <img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">답변대기<br><span>0</span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">답변완료<br>
                                <span>0</span> 건</span>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="filter">
                    <form aciton="#" class="regForm">
                        <ul class="reg_list clear">
                            <li class="clear">
                                <label class="o_tit_lbl_search">조회기간</label>
                                <div class="select_duration">
                                    <input type="date"> ~ <input type="date">
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="clear">
                                <label class="tit_lbl">처리상태</label>
                                <div class="select_sales">
                                    <label class="space"><input type="checkbox" name="orderstate" value="전체"> 전체</label>
                                    <label class="space"><input type="checkbox" name="orderstate" value="답변대기"> 답변대기</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="답변완료"> 답변완료</label>
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="search_detail clear">
                                <label class="tit_lbl_search "> 상세조건</label>
                                <div class="search_box"> 
                                    <select name="select_search">
                                        <option value="전체" selected>전체</option>
                                        <option value="고객문의번호">고객문의번호</option>
                                        <option value="문의구분">문의구분</option>
                                        <option value="작성자ID">작성자ID</option>
                                        <option value="제목">제목</option>
                                    </select> <input type="text" name="o_search_cont">
                                </div>
                            </li>
                            <li>
                                <p class="btn_line">
                                    <Input type="submit" value="검색" class="btn_basecolor1"> <Input type="reset"
                                        value="초기화" class="btn_basecolor2">
                                </p>
                            </li>
                        </ul>
                    </form>
                </div>

                <div class="listview">
                    <div class="subtitle float_left">
                        <h3>고객 문의 목록 (총 <span>0</span> 개)</h3>
                    </div>
                    <div class="subfunc float_right clear"> 
                            <select name="pn_cnt">
                                <option svalue="10개씩보기" selected>10개씩보기</option>
                                <option value="20개씩보기">20개씩보기</option>
                                <option value="30개씩보기">30개씩보기</option>
                            </select>
                    </div>
                    <div class="bssBox">
                        <table class="bbsListTbl">
                            <tr>
                                <th>중요</th>
                                <th>답변</th>
                                <th>고객문의번호</th>
                                <th>문의구분</th>
                                <th>작성자ID</th>
                                <th>제목</th>
                                <th>문의일시</th>
                                <th>답변여부</th>
                                <th>답변일시</th>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>배송지연/불만</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">3일이나 지났는데 왜 안와요?</a></td>
                                <td>2020.02.24</td>
                                <td>답변대기</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>컬리패스</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">컬리패스 어떻게 신청하나요?</a></td>
                                <td>2020.02.24</td>
                                <td>답변대기</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>주문결제문의</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">묶음배송 신청하려면 어떻게 해요?</a></td>
                                <td>2020.02.24</td>
                                <td>답변대기</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>취소문의</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">어제 주문했는데 오늘 취소되나요?</a></td>
                                <td>2020.02.24</td>
                                <td>답변완료</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>배송지연/불만</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">음료수 다 터져서 왔어요</a></td>
                                <td>2020.02.24</td>
                                <td>답변완료</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>환불문의</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">상한거 같은데 환불해주세요</a></td>
                                <td>2020.02.24</td>
                                <td>답변완료</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>컬리패스</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">컬리패스가 4만원이상이면 무료배송인가요?</a></td>
                                <td>2020.02.24</td>
                                <td>답변대기</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>주문결제문의</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">결제카드 바꾸고 싶은데 가능한가요?</a></td>
                                <td>2020.02.24</td>
                                <td>답변완료</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>A/S문의</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">하루밖에 안썼는데 고장났어요</a></td>
                                <td>2020.02.24</td>
                                <td>답변완료</td>
                                <td>2020.02.24</td>
                            </tr>
                            <tr>
                                <td><img src="../img/star.png" alt="중요"></td>
                                <td><input type="button" class="bbs_btn"  value="답변"></td>
                                <td><a href="#" class="inquiry_datails">ci12345</a></td>
                                <td>회원정보문의</td>
                                <td>kurlymoly</td>
                                <td><a href="#" class="inquiry_datails">이름 변경이 안돼요</a></td>
                                <td>2020.02.24</td>
                                <td>답변완료</td>
                                <td>2020.02.24</td>
                            </tr>
                        </table>
                    </div>
                
                    <div  class = "pagination">
                        <a href="#" class="pn_btn pn_firstpage">맨 처음 페이지로 가기</a>
                        <a href="#" class="pn_btn pn_prevpage">이전 페이지로 가기</a>
                        <strong class="pn_btn pn_num __active">1</strong>
                        <a href="#" class="pn_btn pn_num">2</a>
                        <a href="#" class="pn_btn pn_num">3</a>
                        <a href="#" class="pn_btn pn_num">4</a>
                        <a href="#" class="pn_btn pn_num">5</a>
                        <a href="#" class="pn_btn pn_num">6</a>
                        <a href="#" class="pn_btn pn_num">7</a>
                        <a href="#" class="pn_btn pn_num">8</a>
                        <a href="#" class="pn_btn pn_num">9</a>
                        <a href="#" class="pn_btn pn_num">10</a>
                        <a href="#" class="pn_btn pn_nextpage">다음 페이지로 가기</a>
                        <a href="#" class="pn_btn pn_lastpage">맨 끝 페이지로 가기</a>
                    </div>
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