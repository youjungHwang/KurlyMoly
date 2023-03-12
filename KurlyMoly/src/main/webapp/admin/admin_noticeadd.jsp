<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">

    <title>공지사항 등록</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
</head>

<body>
    <div id="wrap">
        <!-- 상단 메뉴 시작 -->
        <header id="header">
            <div id="header_menu1" class="header_menu">
                <ul>
                    <li>
                        <a href="admin_dashboard.jsp"><img id="kurly_logo" src="../img/kurly.png" alt="컬리로고"></a>
                    </li>
                    <li>
                        <h2>관리자 센터</h2>
                    </li>
                </ul>
            </div>

            <div id="header_menu2">
                <ul class="util clear" class="header_menu">
                    <li><a href="admin_dashboard.jsp">Admin 님</a></li>
                    <li><a href="admin_mypage.jsp">내 정보</a></li>
                    <li><a href="admin_logout.jsp">로그아웃</a></li>
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

                <div id="tab2" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category">공지사항</li>
                        <li><a href="admin_noticecheck.html">공지사항 조회</a></li>
                        <li class="__activepage1">공지사항 등록</li>
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
                        <li><a href="admin_wd_member.html">탈회회원 조회</a></li>
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
                    <p>공지사항 등록</p>
                </div>
                <div class="notice_add">
                    <form class="regForm" method="post" action="admin_noticeadd_ok.jsp">
	                    <ul class="reg_list">
	                        <li class="clear">
	                            <div>
		                            <label class="noti_tit_lbl">분류</label>
		                            <div class="title_box"> 
		                            <select class=" space" name="n_issdisplay">
				                            <option value="전시중" selected>전시중</option>
				                            <option value="전시중단">전시중단</option>
		                            </select>
		                            <input type="checkbox"  name="n_isimpt" id="imp" value="중요" onclick="unchecked_norm"> 중요 공지사항으로 설정
		                            <input type="checkbox" name="n_isimpt" id ="norm" value="일반" style="display:none;" checked="checked">
		                            
		                            <script>
		                            $(function() {
		                            	$('#imp').on('click',function(){ $('#norm').attr('checked', false)} 
		                            });
		                            
		                            </script>
		                            
		                           
		                        	</div> 
                        		</div>
                        	</li>
                    		<div class="hr"> </div>
                    		
		                    <li class="clear">
		                        <label class="noti_tit_lbl">제목</label>
		                        <div class="title_box">
		                        	<input type="text" name="n_title" placeholder="제목을 입력해주세요"> 
		                        </div>
		                    </li>
		                    <div class="hr"> </div>
		                    
		                    <li class="clear">
		                        <div>
		                            <label class="noti_tit_lbl">상품 공지사항 상세</label>
		                            <div class="noti_content">
		                                 <textarea name="n_content" id="editor" ></textarea>
		                                <script>
		                                ClassicEditor
		                                    .create( document.querySelector( '#editor' ) )
		                                    .catch( error => {
		                                        console.error( error );
		                                    } );

		                                </script>
		                               
		                            </div>
		                        </div>
		                    </li>
		                    <li>
		                        <p class="btn_line">
		                            <Input type="submit" value="공지사항 등록" class="btn_basecolor1"> 
		                            <Input type="reset" value="취소" class="btn_basecolor2">
		                        </p>
		                    </li>
                    	</ul>
                    </form>
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