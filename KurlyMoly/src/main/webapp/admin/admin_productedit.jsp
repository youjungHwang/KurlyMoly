<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kurly.product.ProductDTO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<jsp:useBean id="productDAO" class="com.kurly.product.ProductDAO"/>

<%
	request.setCharacterEncoding("UTF-8");
	Integer p_idx =0; 
	if(request.getParameter("p_idx") == null || request.getParameter("p_idx") == "") {  	
		p_idx = 1; 
	} else{
	 	p_idx = Integer.parseInt(request.getParameter("p_idx")); // 전 페이지에서 idx에 대한 세션값을 받아와야 함
	}  
  

	// 장바구니 상품 리스트 가져오기
	List<ProductDTO> productlist = new ArrayList<ProductDTO>();

	productlist = productDAO.prodinfo(p_idx);
	
	String p_category1 = productlist.get(0).getCategory1();
	String p_category2 = productlist.get(0).getCategory2();
	String p_title = productlist.get(0).getTitle();	
	String p_subtitle = productlist.get(0).getSubtitle();
	String p_brand = productlist.get(0).getBrand();
	
	int p_price = productlist.get(0).getPrice();
	int p_discprice = productlist.get(0).getDiscprice();
	int p_point = productlist.get(0).getPoint();
	int p_stock = productlist.get(0).getStock();
	
	String p_deliverytype = productlist.get(0).getDeliverytype();
	String p_packingtype = productlist.get(0).getPackingtype();
	String p_salesunit = productlist.get(0).getSalesunit();	
	String p_weight = productlist.get(0).getWeight();
	String p_origin = productlist.get(0).getOrigin();
	
	String p_imgname = productlist.get(0).getImgname();
	String p_imgpath = productlist.get(0).getImgpath();
	String p_description = productlist.get(0).getDescription();	
	String p_detailimgname = productlist.get(0).getDetailimgname();
	String p_detailimgpath = productlist.get(0).getDetailimgpath();
	
	String p_salestate = productlist.get(0).getSalestate();
	String p_isdisplay = productlist.get(0).getIsdisplay();
	String p_regdate = productlist.get(0).getRegdate();	
	

	
	
	
	%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.js"  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="  crossorigin="anonymous"></script>
 	<script type="text/javascript" src="./js/jquery-3.1.0.min.js" charset="utf-8"></script>
 

    <title>상품 수정</title>
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
                        <li class="category"><a href="admin_dashboard.jsp">대시보드</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab2" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category">공지사항</li>
                        <li><a href="admin_noticelist.jsp">공지사항 조회</a></li>
                        <li><a href="admin_noticeadd.jsp">공지사항 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab3" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">상품 관리</li>
                        <li><a href="admin_productcheck.jsp">상품 조회/수정</a></li>
                        <li class="__activepage1">상품 등록</li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab4" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">판매 관리</li>
                        <li><a href="admin_ordercheck.jsp">주문 조회</a></li>
                        <li><a href="admin_deliverycheck.jsp">주문/배송 현황</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab5" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category clear">클레임 관리</li>
                        <li><a href="admin_cancelcheck.jsp">취소 관리</a></li>
                        <li><a href="admin_exchangecheck.jsp">교환 관리</a></li>
                        <li><a href="admin_refundcheck.jsp">반품 관리</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab6" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">문의 사항</li>
                        <li><a href="admin_pinquirycheck.jsp">상품 문의</a></li>
                        <li><a href="admin_cinquirycheck.jsp">고객 문의</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab7" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">회원 관리</li>
                        <li><a href="admin_membercheck.jsp">회원 조회</a></li>
                        <li><a href="admin_wd_member.jsp">탈회회원 조회</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab8" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">이벤트 관리</li>
                        <li><a href="admin_eventcheck.jsp">이벤트 조회</a></li>
                        <li><a href="admin_eventadd.jsp">이벤트 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab9" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">기본 정보</li>
                        <li><a href="admin_mypage.jsp">내 정보</a></li>
                    </ul>
                </div>
            </div>
            <!-- 사이드 메뉴 끝 -->
            <!-- 내용 시작-->
            <div id="content">

                <div class="title">
                    <p>상품 수정</p>
                </div>
                
                
                
                
                <form name="fm" id="fm"class="regForm" method="post" action="admin_productedit_ok.jsp"  enctype="multipart/form-data" >
					<input type="hidden" name="idx" value="<%=p_idx%>">
                <div class="productadd">
                    
                    <ul class="reg_list reg_list_category" >
                        <li class="tit_lbl">
                            카테고리
                        </li>

                        <li class="prod_category">
	                        <select class="select_category" name="category1"   size=8 >    
	                            <option value="<%=p_category1%>" selected hidden></option>
	                            <option value="001">채소</option>
	                            <option value="002">과일·견과·쌀</option>
	                            <option value="003" >수산·해산·건어물</option>
	                            <option value="004">정육·계란</option>
	                            <option value="005">국·반찬·메인 요리</option>
	                            <option value="006">샐러드·간편식</option>
	                            <option value="007">면·양념·오일</option>
	                            <option value="008">생수·음료·우유·커피</option>
	                            <option value="009">간식·과자·떡</option>
	                            <option value="010">베이커리·치즈·델리</option>
	                            <option value="011">건강식품</option>
	                            <option value="012">생활용품·리빙</option>
	                            <option value="013">뷰티·바디케어</option>
	                            <option value="014">주방용품</option>
	                            <option value="015">가전제품</option>
	                            <option value="016">베이비·키즈</option>
	                            <option value="017">반려동물</option>
                            </select>      
                            
                            <select class="select_category"  name="category2" size=8>   
                                <option value="<%=p_category2%>"  selected hidden></option>
 								<option value="01">고구마·감자·당근</option>
                                <option value="02">시금치·쌈채소·나물</option>
                                <option value="03">브로콜리·파프리카·양배추</option>
                                <option value="04">양파·대파·마늘·배추</option>
                                <option value="05">오이·호박·고추</option>
                                <option value="06">냉동·이색·간편채소</option>
                                <option value="07">콩나물·버섯</option>
                                
                                <option value="01">제철과일</option>
                                <option value="02">국산과일</option>
                                <option value="03">수입과일</option>
                                <option value="04">간편과일</option>
                                <option value="05">냉동·건과일</option>
                                <option value="06">견과류</option>
                                <option value="07">쌀·잡곡</option>
                                
                                <option value="01">제철수산</option>
                                <option value="02">생선류</option>
                                <option value="03">굴비·반건류</option>
                                <option value="04">오징어·낙지·문어</option>
                                <option value="05">새우·게·랍스터</option>
                                <option value="06">해산물·조개류</option>
                                <option value="07">수산가공품</option>
                                <option value="08">김·미역·해조류</option>
                                <option value="09">건어물·다시팩</option>
                                
                                <option value="01">국내산 소고기</option>
                                <option value="02">수입산 소고기</option>
                                <option value="03">돼지고기</option>
                                <option value="04">계란류</option>
                                <option value="05">닭·오리고기</option>
                                <option value="06">양념육·돈까스</option>
                                <option value="07">양고기</option>
                                
                                <option value="01">국·탕·찌개</option>
                                <option value="02">밀키트·메인요리</option>
                                <option value="03">밑반찬</option>
                                <option value="04">김치·젓갈·장류</option>
                                <option value="05">두부·어묵·부침개</option>
                                <option value="06">베이컨·햄·통조림</option>
                                
                                <option value="01">샐러드·닭가슴살</option>
                                <option value="02">도시락·밥류</option>
                                <option value="03">파스타·면류</option>
                                <option value="04">떡볶이·튀김·순대</option>
                                <option value="05">폭립·떡갈비·안주</option>
                                <option value="06">죽·스프·카레</option>
                                <option value="07">선식·시리얼</option>
                                
                                <option value="01">생수·탄산수</option>
                                <option value="02">음료·주스</option>
                                <option value="03">우유·두유·요거트</option>
                                <option value="04">커피</option>
                                <option value="05">차</option>
                              
                                <option value="01">과자·스낵·쿠키</option>
                                <option value="02">초콜릿·젤리·캔디</option>
                                <option value="03">우유·두유·요거트</option>
                                <option value="04">떡·한과</option>
                                <option value="05">아이스크림</option>
                                
                                <option value="01">식빵·빵류</option>
                                <option value="02">잼·버터·스프레드</option>
                                <option value="03">케이크·파이·디저트</option>
                                <option value="04">치즈</option>
                                <option value="05">델리</option>
                                <option value="06">올리브·피클</option>
                                
                                
                            </select> 
                 
                        </li>
                    </ul>
                </div>

                <div class="filter productadd">
                
                        <ul class="reg_list">
                            <li class="tit_lbl">
                                상품 정보 </li>
                        <div class="prod_inner">
                            <li class=" clear">
                                <label class="tit_lbl_search"> 상품명</label>
                                <div class="search_box"> 
                                    <input class="long_input" type="text" name="title" value="<%=p_title%>" ><!-- <span class="print_bytes"> 0 / 100 </span> -->
                                </div>
                            </li>
                            <div class="hr"> </div>
                            <li class="clear">
                                <label class="tit_lbl_search"> 상품 한줄 설명</label>
                                <div class="search_box"> 
                                    <input class="long_input" type="text" name="subtitle" value="<%=p_subtitle%>" ><!-- <span class="print_bytes"> 0 / 100 </span> -->
                                </div>
                            </li>
                            <div class="hr"> </div>
                            <li class="clear">
                                <label class="tit_lbl_search"> 브랜드명</label>
                                <div class="search_box" style="float:left;"> 
                              <input type="text" name="brand" value="<%=p_brand%>" > 
                                </div>
                                <div style="float:left; line-height:50px; margin-left: 10px;" class="clear"> 
		                            <select name="salestate" value="<%=p_salestate%>">
		                                <option value="판매대기">판매대기</option>
			                            <option value="판매중">판매중</option>
			                            <option value="품절">품절</option>
			                            <option value="판매중지">판매중지</option>
			                            <option value="판매종료">판매종료</option>
		                            </select>
		                    	</div>
                            </li>
                            <div class="hr"> </div>
                            <li class="clear">
                                <label class="tit_lbl_search"> 판매가</label>
                                <div class="search_box"> 
                              <input class="short_input" type="text" name="price" placeholder="숫자만 입력"  value="<%=p_price%>"><span class="print_units"> 원 </span> 
                                </div>
                            </li>
                            <div class="hr"> </div>
                            <li class="clear">
                                <label class="tit_lbl_search"> 할인가</label>
                                <div class="search_box"> 
                                    <input class="short_input" type="text" name="discprice" placeholder="숫자만 입력" value="<%=p_discprice%>"><span class="print_units" > 원 </span> 
                                </div>
                            </li>
                             <div class="hr"> </div>
                             <li class="clear">
                                <label class="tit_lbl_search"> 지급포인트</label>
                                <div class="search_box"> 
                                    <input class="short_input" type="text" name="point" placeholder="숫자만 입력"  value="<%=p_point%>"><span class="print_units"> 점 </span> 
                                </div>
                            </li>
                            <div class="hr"> </div>
                            <li class="clear">
                                <label class="tit_lbl_search"> 재고수량</label>
                                <div class="search_box" > 
                                    <input class="short_input" type="text" name="stock" placeholder="숫자만 입력" value="<%=p_stock%>"><span class="print_units"> 개 </span> 
                                </div>
                           		
                            </li>
                        </div>
                        </ul>
                </div>


                <div class="productadd">
                    <ul class="reg_list">
                        <li class="tit_lbl">
                            옵션 </li>
                    <div class="prod_inner">
                        <li class="clear">
                            <label class="tit_lbl_search"> 배송구분</label>
                            <div class="select_sales">
                                <label class="space"><input type="radio" name="deliverytype" value="<%=p_deliverytype%>" checked= "checked" style="display:none; "> 선택하세요</label>
                                <label class="space"><input type="radio" name="deliverytype" value="샛별배송" > 샛별배송</label>
                                <label class="space"><input type="radio" name="deliverytype" value="일반배송"> 일반배송</label>
                                <label class="space"><input type="radio" name="deliverytype" value="샛별배송/일반배송"> 샛별배송/일반배송</label>
                            </div>
                        </li>
                        <div class="hr"> </div>
                        <li class="clear">
                            <label class="tit_lbl_search"> 포장타입</label>
                            <div class="select_sales">
                                <label class="space2"><input type="radio" name="packingtype" value="<%=p_packingtype%>" checked= "checked" style="display:none; "> 선택하세요</label>
                                <label class="space2"><input type="radio" name="packingtype" value="냉동"> 냉동</label>
                                <label class="space2"><input type="radio" name="packingtype" value="냉장"> 냉장</label>
                                <label class="space2"><input type="radio" name="packingtype" value="상온"> 상온</label>
                                <label class="space2"><input type="radio" name="packingtype" value="기타"> 기타</label>
                            </div>
                        </li>
                        <div class="hr"> </div>
                        <li class="clear">
                            <label class="tit_lbl_search"> 판매단위</label>
                            <div class="search_box"> 
                          <input class="middle_input" type="text" name="salesunit"  value="<%=p_salesunit%>"> 
                            </div>
                        </li>
                        <div class="hr"> </div>
                        <li class="clear">
                            <label class="tit_lbl_search"> 중량용량</label>
                            <div class="search_box"> 
                          <input class="middle_input"  type="text" name="weight" value="<%=p_weight%>"> 
                            </div>
                        </li>
                        <div class="hr"> </div>
                        <li class="clear">
                            <label class="tit_lbl_search"> 원산지</label>
                            <div class="search_box"> 
                          <input class="middle_input"  type="text" name="origin"  value="<%=p_origin%>"> 
                            </div>
                        </li>
                    </div>
                    </ul>
                </div>
 
                    

            <div class="productadd">
                <ul class="reg_list">
                    <li class="tit_lbl">
                        상품이미지 
                    </li>
                   
                    <div class="prod_inner">
		                <li class="search_detail clear">
		                    <div>
		                    <label class="tit_lbl_search">대표이미지</label>
                     
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
		                     
		                     <div>
			                     <input type="file" id="input_img" name='imgname' style='display: none;' />
			                     <div class="img_add" onclick='document.all.imgname.click();' style="overflow:hidden; position:relative;" >
				                   		 <img id="target_img" src="../img/plus.png" alt="이미지추가" >
				                   		 <img id="img" style="height:100%; position: absolute; left:0;  "/>
				                  </div>
			                 </div>
		                </li>
		            </div>
            	</ul>
            </div>
 

            <div class="productadd">
                <ul class="reg_list clear">
                    <li class="tit_lbl clear">
                        상품 상세 설명 
                  
                    </li>
                    <li class="clear">
                        <div class="prod_content">
                            <textarea name="description" id="editor" ><%=p_description %></textarea>
                            <script>
                            ClassicEditor
                                .create( document.querySelector( '#editor' ) )
                                .catch( error => {
                                    console.error( error );
                                } );
                            CKEDITOR.replace( 'description', {
                                filebrowserUploadUrl: '/KulryMoly/uploads'
                            });
                          
                            </script>
                        </div>
                    </li>
                     <li class="tit_lbl clear">
                          <label class="tit_lbl_search">상세이미지</label>    
                        		<input type='file' multiple=multiple name='detailimgname'> 
                    </li> 

              
                    <li class="clear" style="padding-bottom: 20px;">
                        <p class="btn_line">
                            
                            <input type="hidden" name="isdisplay" value="전시중"> 
                            <Input type="submit" value="상품 등록" class="btn_basecolor1"> 
                            <Input type="reset"  value="취소" class="btn_basecolor2">
                        </p>
                    </li>
                    
                </ul>
            </div>
            </form>
      <!-- 푸터 시작 -->
            <div class="footer">
                <div class="footer_menu">
                    <ul class="footer_list">
                        <li><a href="./admin_manual.pdf" download>관리자센터 메뉴얼</a></li>
                        <li> | </li>
                        <li><a href="https://analytics.google.com/analytics">구글 애널리틱스</a></li>
                        <li> | </li>
                        <li><a href="https://trello.com/">마켓컬리 협업툴</a></li>
                        <li> | </li>
                        <li><a href="https://opentutorials.org/">개발도구</a></li>
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