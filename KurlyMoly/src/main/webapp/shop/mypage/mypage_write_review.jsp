<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat"%>


<%@ page import="com.kurly.product.ProductDTO"%>
<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO" />

<jsp:useBean class="com.kurly.member.CouponDTO" id="coupon" />
<jsp:useBean class="com.kurly.member.CouponDAO" id="cdao" />
<jsp:useBean class="com.kurly.member.PointDAO" id="daoP" />		
<jsp:useBean class="com.kurly.member.PointDTO" id="point" />


<%
   request.setCharacterEncoding("UTF-8");

//★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★
	String idx = null;
	
	if (session.getAttribute("m_idx") != null) {
		idx = (String) session.getAttribute("m_idx");
		
	}
	Integer cp_idx = 0; 
	Integer cp_memidx = (Integer.parseInt(idx)); 
	Integer cp_isused = 0; // 사용, 미사용 1, 0
	int total = cdao.count(cp_memidx);
	
	Integer po_idx = 0;
	Integer po_memidx = (Integer.parseInt(idx));  
	String po_type = "";
	int po_points = 0;
	String po_duedate = "";
	int po_sumpoints = 0;
	int po_duepoints = 0;
	int sum = daoP.sum(po_memidx);
	int sum2 = daoP.sum2(po_memidx);
	int totalPoint = sum - sum2;
	int sum_duepoint = daoP.sum_duepoint(po_memidx);

	// 계산식 관련
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정
	

	int p_idx = 0;
	
	// rv_productidx 추가 위해서 작성
	if (request.getParameter("p_idx") == null || request.getParameter("p_idx") == "") {
		p_idx = 1;
	} else {
		p_idx = Integer.parseInt(request.getParameter("p_idx"));
	}
	

	// rv_userid 추가 위해서 작성
   String userid_as = null;    
   if (session.getAttribute("m_id") != null) {
	      userid_as = (String) session.getAttribute("m_id");
	   }
   

	// 장바구니 상품 리스트 가져오기
	List<ProductDTO> productlist = new ArrayList<ProductDTO>();
	productlist =  pdao.prodinfo(p_idx);
	String p_imgname = productlist.get(0).getImgname();
	String p_title1 = productlist.get(0).getTitle();
   
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="../../css/style.css" rel="stylesheet" type="text/css">
    <link href="../../css/mypage.css" rel="stylesheet" type="text/css">
    <link href="../../css/jsScript.css" rel="stylesheet" type="text/css">
    <link href="https://unpkg.com/swiper/swiper-bundle.css" rel="stylesheet" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="../../script/script.js"></script>
    <script src="../../script/MJscript.js"></script>
    <script src="../../script/kurlytracker.js"></script>
</head>

<body>
    <!-- container 시작 -->
    <div id="container">
        <%@ include file="../include/header.jsp"%>
        <!-- main 시작 -->
        <div id="main">
            <!-- 본문 시작 -->
            <div id="content">
                <div id="qnb" class="quick-navigation" style="top: 516px;">
                    <div class="bnr_qnb" id="brn_Quick">
                        <a href="../board/delivery.html"><img class="thumb"
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

                <!--=============================== mypage_main 시작=================================-->
                <div id="mypage_main">
                    <div id="content">
                        <div id="content_back">
                            <div id="myPageTop" class="mypage_top">
                                <h2 class="screen_out">마이 페이지</h2>
                                <div class="mypagetop_user">
                                    <div class="inner_mypagetop">
                                        <div class="grade_user">
                                            <div class="grade">
                                                <span class="screen_out">등급</span>
                                                <span class="ico_grade class0">
                                                    <span class="ineer_grade">
                                                        <span class="in_grade">일반</span>
                                                    </span>
                                                </span>
                                                <div class="grade_bonus">
                                                
                                               <!-- ★★★@@@★★★ 추가함(HYJ) ★★★@@@★★★ --> 
			                                       <div class="user">
			                                          <strong class="name"><%=session.getAttribute("m_name")%></strong> <span class="txt">님</span>
			                                       </div>
			                                       <div class="bonus">
			                                          <strong class="tit">첫구매 우대 -</strong> 적립 5%
			                                       </div>
			                                       <div class="bonus">
			                                          <strong class="tit">첫구매 우대 -</strong> 20,000원 이상 무료 배송
			                                       </div>
			                                    </div>
			                                 </div>
			                                 <div class="next">
			                                    <a href="" class="total_gd">전체등급 보기</a> <a href=""
			                                       class="next_gd">다음 달 예상등급 보기</a>
			                                 </div>
			                              </div>
			                              <ul class="list_mypage">
			                                 <li class="user_point">
			                                    <div class="link">
			                                       <div class="tit">적립금</div>
			                                       <a href="" class="info"> <%=nf.format(totalPoint)%> 원 <img
			                                          src="../../img/mypage/ico_arrow_56x56.webp" alt="">
			                                          <span class="date"> 소멸 예정 <%=nf.format(sum_duepoint)%>원 </span>
			                                       </a>
			                                    </div>
			                                 </li>
			                                 <li class="user_coupon">
			                                    <div class="link">
			                                       <div class="tit">쿠폰</div>
			                                       <a href="" class="info"> <%=total%> 개 <img
			                                          src="../../img/mypage/ico_arrow_56x56.webp" alt="">
			                                       </a>
			                                    </div>
			                                 </li>
                            			 <!-- ★★★@@@★★★ 추가함(HYJ) 끝 ★★★@@@★★★ -->
                              
                                            <li class="user_kurlypass">
                                                <div class="link">
                                                    <div class="tit">컬리패스</div>
                                                    <a href="" class="info">알아보기

                                                        <img src="../../img/mypage/ico_arrow_56x56.webp" alt="">

                                                    </a>

                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <a href="" alt="이벤트 페이지로 이동" class="bnr_event">
                                        <img src="../../img/mypage/eventfront.png" alt="이벤트페이지">
                                    </a>

                                </div>

                            </div>

                            <div class="page_aticle aticle_type2 clear">
                                <div id="snb" class="snb_mypage">
                                    <h2 class="tit_snb">마이컬리</h2>
                                    <div class="inner_snb">
                                        <ul class="list_menu">
                                            <li>
                                                <a href="./mypage_main.html">주문 내역</a>
                                            </li>
                                            <li>
                                                <a href="./mypage_transport.html">배송지 관리</a>
                                            </li>
                                            <li>
                                                <a href="./mypage_Zzim.html">늘 사는 것</a>
                                            </li>
                                            <li class="on">
                                                <a href="./mypage_review.html">상품 후기</a>
                                            </li>
                                            <li>
                                                <a href="./mypage_emoney.html">적립금</a>
                                            </li>
                                            <li>
                                                <a href="./mypage_coupon.html">쿠폰</a>
                                            </li>
                                            <li>
                                                <a href="./mypage_editinfo.html">개인 정보 수정</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <a href="./mypage_qna_register.html" class="link_inquire">
                                        <span class="emph">도움이 필요하신가요 ?</span>
                                        <p>1:1 문의하기</p>
                                    </a>
                                </div>
                                <!--=========================================== 내용 시작=================================-->
                                <div class="page_section section_write">
                                    <div class="head_aticle">
                                        <h2 class="tit">후기 작성</h2>
                                    </div>
                                    <div class="head_section layer_type">
                                        <span class="link">
                                            <a href="#none">작성 시 유의 사항</a>
                                        </span>
                                        <div class="layer" style="display: none;">
                                            <h4 class="tit_layer">후기 작성 시 유의사항</h4>
                                            <p class="desc_layer">
                                                마켓컬리는 믿을 수 있는 후기문화를 함께 만들어 가고자
                                                <br> 합니다. 따라서 후기 내용이 아래에 해당하는 경우에는 검토 후
                                                <br> 비공개 조치될 수 있습니다.
                                            </p>
                                            <ul class="list_layer">
                                                <li>1. 욕설, 비난 등 업체나 타인에게 불쾌한 내용을 작성한 경우</li>
                                                <li>2. 해당 상품과 무관한 내용이나 동일 문자의 반복 등 부적합한
                                                    <br> 내용을 작성한 경우
                                                </li>
                                                <li>
                                                    3. 상품의 기능이나 효과 등에 오해의 소지가 있는 내용을 <br> 작성한 경우
                                                </li>
                                                <li>4. 저작권, 초상권 등 타인의 권리를 침해하는 이미지를 사용한
                                                    <br> 경우
                                                </li>
                                            </ul>
                                            <button type="button" class="btn_ok">확인</button>
                                            <button type="button" class="btn_close"><span class="screen_out">레이어
                                                    닫기</span></button>
                                        </div>

                                    </div>

									<!-- ★★★@@@★★★  추가함(HYJ) : 226라인까지 수정함★★★@@@★★★   -->
                                    <form name="form_review" id="form_review" method="POST" action="mypage_write_review_ok.jsp"  enctype="multipart/form-data" onsubmit="return sendit()">
                                        
                                        <input type="hidden" name="rvProductidx" value="<%=p_idx%>">   
                                        <input type="hidden" name="rvUserid" value="<%=userid_as%>">
                                   
                                        <div class="write_board">
                                            <div class="goods_info">
                                                <div class="thumb">
                                                    <img src="../../img/goods_detail/<%=p_imgname%>" alt="상품 이미지">
                                                </div>
                                                <div class="desc">
                                                    <div class="inner_desc">
                                                        <div class="name_main"><%=p_title1%></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <table class="tbl">
                                                <caption style="display: none;">후기 작성 입력상자</caption>
                                                <colgroup>
                                                    <col style="width: 110px;">
                                                    <col style="width: auto;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th>제목</th>
                                                        <td><input type="text" name="rvTitle" placeholder="제목을 입력해주세요"
                                                                class="inp" value=""></td>                                                          
                                                    </tr>
                                                    <tr>
                                                        <th>후기작성</th>
                                                        <td>
                                                            <div class="field_cmt">
                                                                <textarea name="rvContent" id="fieldCmt" cols="100" rows="10" 
                                                                    placeholder="자세한  후기는 다른 고객의 구매에 많은 도움이 되며, 일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 반품/환불 문의는 1:1문의로 가능합니다."></textarea>
                                                             
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    
							                                                    
							                       <script type="text/javascript">
							      
												      var sel_file; 
												      
												      $(document).ready(function() {
												      	$("#input_img").on("change", handleImgFileSelect); 
												      	}); 
												      	
												      	function handleImgFileSelect(e) {
												      		 var files = e.target.files; 
												      		 var filesArr = Array.prototype.slice.call(files);
												      		 
												      		 filesArr.forEach(function(f){
												      		 	if(!f.type.match("image.*")){
												      		 		alert("확장자는 이미지 확장자만 가능합니다.");
																	return ; 
															}
															
															sel_file = f; 
															
															var reader = new FileReader(); 
															reader.onload = function(e) {
																$("#img").attr("src",e.target.result);
															}
															reader.readAsDataURL(f);
												         	});
												         }
												      	
												      </script>	
							                                                    
                                                    
                                                    
                                                    <tr>
                                                        <th>사진등록</th>
                                                        <td>
                                                            <div class="photo_add">
                                                                <div class="inner_photo">
                                                                    <!--아래 버튼으로 업로드 하게 되면 요 div로 이후 문장이 생성됨 <div class="item_photo"  style="display: block;"><span class="photo" style="background-image: url();"></span>
                                                                <button type="button" class="btn_delete"></button>
                                                                <input type="file" name="file[]" class="file_upload" onchange="" value="사진등록하기"
                                                                accept="image/x-png,image/gif,image/jpeg">  -->
                                                                    <!-- 파일 업로드 스끄립뜨 -->
                                                                </div>
    
                                                               		<input type="file"  id="input_img" name='imgname' accept="image/*" style='display: none;' />
	                                                              	<div  onclick='document.all.imgname.click();' 
	                                                              	style=" width: 100px; height:100px; text-align: center; line-height: 115px; border:1px solid #ccc; overflow:hidden; position:relative;" >
												                   		 <img id="target_img" src="../../img/plus.png" alt="이미지추가" >
												                   		 <img id="img" style="height:100%; position: absolute; left: 0px; "/>
				                  									</div>

                                                            </div>

                                       
                                    
                                        <p class="photo_notice">구매한 상품이 아니거나 캡처 사진을 첨부할 경우, 통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
                                        </td>
                                        </tr>
                                        </tbody>
                                        </table>
                                        <p class="link_inquire">혹시 상품에 문제가 있으셨나요? <a href="./mypage_qna_register.jsp"> 1:1 문의하기</a></p>
                                     
                                        <button type="submit" id="btnsubmit1" class="btn_reg btn_disabled">등록하기</button>
       								
       									<button type="submit" id="btnsubmit2" class="btn_reg" style="display:none">등록하기</button>
       							
									
									  <script>
									        'use strict';
									        $('#fieldCmt').change(function(){
									        	if(fieldCmt.value.length == 0) {
									        		 $('#btnsubmit1').css("display", "block");	
									        		 $('#btnsubmit2').css("display", "none");	
									        	}else{
									    			$('#btnsubmit1').css("display", "none");
									    			$('#btnsubmit2').css("display", "block");	
									        	}
									        });
									         
									
									   </script>                    
                                        
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
    <!-- main 종료 -->

    <!-- footer 시작 -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer 종료 -->
    </div>
    <!-- container 종료 -->

    <!-- quick list 시작 -->
    <a href="#top" id="pageTop" class="on">맨 위로가기</a>
    <!-- quick list 끝 -->
</body>

</html>