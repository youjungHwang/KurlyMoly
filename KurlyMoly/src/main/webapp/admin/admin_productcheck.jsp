<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored= "false"%>


<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:useBean id="pdao" class="com.kurly.product.ProductDAO"/>
<%@ page import="com.kurly.product.ProductDTO"%>


<%  
		request.setCharacterEncoding("UTF-8");
		NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정

		

	    // 상품 리스트 가져오기.
	  List<ProductDTO> productlist = new ArrayList<ProductDTO>();
		
	  productlist = pdao.selectList();
		

		String datestart = request.getParameter("datestart"); // 기간 시작일
		String datefinish = request.getParameter("datefinish"); // 기간 마감일
		String category1 = request.getParameter("category1"); // 기간 시작일
		String category2 = request.getParameter("category2"); // 기간 마감일
		String keyword = request.getParameter("keyword"); // 검색컬럼
		String searchword = request.getParameter("searchword"); // 검색단어
	  
	 productlist = pdao.searchProdList(datestart,datefinish, category1,category2, keyword, searchword );
	  
         
         // 페이징 작업

         int pagePerCount = 10; // 페이지당 글 개수 **문제8. 10개씩 보기
         int start = 0; // 시작 글번호

     	
        String pageNum = request.getParameter("pageNum");
		if(pageNum != null && !pageNum.equals("")){
			start = (Integer.parseInt(pageNum)-1) * pagePerCount;
		}else{
			pageNum = "1";
			start = 0;
		}

     	String pageSize = request.getParameter("pageSize");
     	if (pageSize == null) {
     		pagePerCount = 5;
     	} else {
     		pagePerCount = Integer.parseInt(pageSize);
     	}
     	

     	//상단 목록별 개수 가져오기
        int totalCount = 0; // 전체 글 개수
        int waitprodCount = 0; // 판매대기 글 개수
        int nowsaleCount = 0; // 판매중 글 개수
        int nostockCount = 0; // 품절 글 개수
        int stopsaleCount = 0; // 판매중단 글 개수
        int donesaleCount = 0; // 판매완료 글 개수

		Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         
         String sql = "";
         String url = "jdbc:mysql://localhost:3306/KurlyMoly";
         String uid = "root";
         String upw = "1234";
         

         try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, uid, upw);
            if(conn != null){
               sql = "select count(*) as total, "
            		   + "count(case when p_salestate='판매대기' then 1 end) as waitprod, "
            		   + "count(case when p_salestate='판매중' then 1 end) as nowsale,"
            		   + "count(case when p_salestate='품절' then 1 end) as nostock,"
            		   + "count(case when p_salestate='판매중지' then 1 end) as stopsale,"
            		   + "count(case when p_salestate='판매종료' then 1 end) as donesale from tb_product;";
            		   
               pstmt= conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
               
               if(rs.next()){
                  totalCount = rs.getInt("total");
                  waitprodCount = rs.getInt("waitprod");
                  nowsaleCount = rs.getInt("nowsale");
                  nostockCount = rs.getInt("nostock");
                  stopsaleCount = rs.getInt("stopsale");
                  donesaleCount = rs.getInt("donesale");
               }

            }
            
         }catch(Exception e){
            e.printStackTrace();   
         }      
         
         
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/admin_style.css" rel="stylesheet" type="text/css">

    <title>상품 조회</title>
      <script>
     
		function chageLangSelect(){
	    	var langSelect = document.getElementById("id-lang");
	     
	    	// select element에서 선택된 option의 value가 저장된다.
	    	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	 
	    	// select element에서 선택된 option의 text가 저장된다.
	    	var selectText = langSelect.options[langSelect.selectedIndex].text;
	    	window.console.log(selectValue);
	    	var pageNumJs = <%=pageNum%>;
	    	location.href="./admin_productcheck.jsp?pageNum=" + pageNumJs + "&pageSize=" + selectValue;
		}
	</script>
    
    
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
                        <li class="__activepage1">상품 조회/수정</li>
                        <li><a href="admin_productadd.jsp">상품 등록</a></li>
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
                    <p>상품 조회/수정</p>
                </div>
                <div class="quickcheck">

                    <ul>
                        <li>
                            <div class="quickmenu">
                                <img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">전체    <br><span><%=totalCount %></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">판매대기<br>
                                <span><%= waitprodCount%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">판매중  <br>
                                <span><%= nowsaleCount%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">품절    <br>
                                <span><%= nostockCount%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">판매중지<br>
                                <span><%= stopsaleCount%></span> 건</span>
                            </div>
                        </li>
                        <li>
                            <div class="quickmenu"><img class="quickimg" src="../img/cart.png">
                                <span class="prod_state">판매종료<br>
                                <span><%= donesaleCount%></span> 건</span>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="filter">
                    <form action="admin_productcheck.jsp" method='GET' class="regForm">
                        <ul class="reg_list clear">
	                         <li  class="clear">
	                                <label class="tit_lbl clear">등록기간</label>
	                                <div class="select_duration">
	                                    <input type="date" name= "datestart" value ="<%=datestart%>"  > ~ <input type="date" name="datefinish" value ="<%=datefinish%>">
	                                </div>
	                            </li>
	                            
	                         <div class="hr"> </div>
 
                            <li class="clear">
                                <label class="tit_lbl">카테고리</label>

                                <div class="select_category1">
                                    <select name="category1" value ="<%=category1%>" >
                                      	<option value="" >대분류</option>
                                     	<option value="001">채소(001)</option>
			                            <option value="002">과일·견과·쌀(002)</option>
			                            <option value="003" >수산·해산·건어물(003)</option>
			                            <option value="004">정육·계란(004)</option>
			                            <option value="005">국·반찬·메인 요리(005)</option>
			                            <option value="006">샐러드·간편식(006)</option>
			                            <option value="007">면·양념·오일(007)</option>
			                            <option value="008">생수·음료·우유·커피(008)</option>
			                            <option value="009">간식·과자·떡(009)</option>
			                            <option value="010">베이커리·치즈·델리(010)</option>
			                            <option value="011">건강식품(011)</option>
			                            <option value="012">생활용품·리빙(012)</option>
			                            <option value="013">뷰티·바디케어(013)</option>
			                            <option value="014">주방용품(014)</option>
			                            <option value="015">가전제품(015)</option>
			                            <option value="016">베이비·키즈(016)</option>
			                            <option value="017">반려동물(017)</option>
                                    </select>
                                </div>

                                <div class="select_category2 clear">
                                    <select name="category2" value ="<%=category2%>">
                                       		 <option value="" >중분류</option>
                                            <option value="01">고구마·감자·당근(01)</option>
			                                <option value="02">시금치·쌈채소·나물(02)</option>
			                                <option value="03">브로콜리·파프리카·양배추(03)</option>
			                                <option value="04">양파·대파·마늘·배추(04)</option>
			                                <option value="05">오이·호박·고추(05)</option>
			                                <option value="06">냉동·이색·간편채소(06)</option>
			                                <option value="07">콩나물·버섯(07)</option>
			                                
			                                <option value="01">제철과일(01)</option>
			                                <option value="02">국산과일(02)</option>
			                                <option value="03">수입과일(03)</option>
			                                <option value="04">간편과일(04)</option>
			                                <option value="05">냉동·건과일(05)</option>
			                                <option value="06">견과류(06)</option>
			                                <option value="07">쌀·잡곡(07)</option>
			                                
			                                <option value="01">제철수산(01)</option>
			                                <option value="02">생선류(02)</option>
			                                <option value="03">굴비·반건류(03)</option>
			                                <option value="04">오징어·낙지·문어(04)</option>
			                                <option value="05">새우·게·랍스터(05)</option>
			                                <option value="06">해산물·조개류(06)</option>
			                                <option value="07">수산가공품(07)</option>
			                                <option value="08">김·미역·해조류(08)</option>
			                                <option value="09">건어물·다시팩(09)</option>
			                                
			                                <option value="01">국내산 소고기(01)</option>
			                                <option value="02">수입산 소고기(02)</option>
			                                <option value="03">돼지고기(03)</option>
			                                <option value="04">계란류(04)</option>
			                                <option value="05">닭·오리고기(05)</option>
			                                <option value="06">양념육·돈까스(06)</option>
			                                <option value="07">양고기(07)</option>
			                                
			                                <option value="01">국·탕·찌개(01)</option>
			                                <option value="02">밀키트·메인요리(02)</option>
			                                <option value="03">밑반찬(03)</option>
			                                <option value="04">김치·젓갈·장류(04)</option>
			                                <option value="05">두부·어묵·부침개(05)</option>
			                                <option value="06">베이컨·햄·통조림(06)</option>
			                                
			                                <option value="01">샐러드·닭가슴살(01)</option>
			                                <option value="02">도시락·밥류(02)</option>
			                                <option value="03">파스타·면류(03)</option>
			                                <option value="04">떡볶이·튀김·순대(04)</option>
			                                <option value="05">폭립·떡갈비·안주(05)</option>
			                                <option value="06">죽·스프·카레(06)</option>
			                                <option value="07">선식·시리얼(07)</option>
			                                
			                                <option value="01">생수·탄산수(01)</option>
			                                <option value="02">음료·주스(02)</option>
			                                <option value="03">우유·두유·요거트(03)</option>
			                                <option value="04">커피(04)</option>
			                                <option value="05">차(05)</option>
			                              
			                                <option value="01">과자·스낵·쿠키(01)</option>
			                                <option value="02">초콜릿·젤리·캔디(02)</option>
			                                <option value="03">우유·두유·요거트(03)</option>
			                                <option value="04">떡·한과(04)</option>
			                                <option value="05">아이스크림(05)</option>
			                                
			                                <option value="01">식빵·빵류(01)</option>
			                                <option value="02">잼·버터·스프레드(02)</option>
			                                <option value="03">케이크·파이·디저트(03)</option>
			                                <option value="04">치즈(04)</option>
			                                <option value="05">델리(05)</option>
			                                <option value="06">올리브·피클(06)</option>
                                    </select>
                                </div>
                            </li> 
	                         <div class="hr"> </div>   
	                         
	                           <li class="search_detail clear">
                                <label class="tit_lbl_search o_search_detail"> 상세조건</label>
                                <div class="search_box"> 
                                    <select name="keyword" value ="<%=keyword%>" >
                                        <option value="p_idx" selected>상품번호</option>
                                        <option value="p_title">상품명</option>
                                        <option value="p_brand">브랜드명</option>
                                        <option value="p_deliverytype">배송구분</option>
                                        <option value="p_salestate">판매상태</option>
                                    </select> 
                                    <input type="text" name="searchword"  > 
                                </div>
                            </li>

                           
                            <li>
                                <p class="btn_line">
                                    <Input type="submit" value="검색" class="btn_basecolor1"> 
                                    <Input type="reset" value="초기화" class="btn_basecolor2">
                                </p>
                            </li>
                        </ul>
                    </form>
                </div>

                <div class="listview">
                    <div class="subtitle float_left">
                        <h3>상품 목록 (총 <span><%=productlist.size()%></span> 개)</h3>
                    </div>
                     <div class="subfunc float_right clear"> 
						<select name="pn_cnt" id="id-lang" onchange="chageLangSelect()">
							<option value="5" <c:if test="${pagePerCount == 5}">selected</c:if>>5개씩 보기</option>
							<option value="10" <c:if test="${pagePerCount == 10}">selected</c:if>>10개씩 보기</option>
							<option value="20" <c:if test="${pagePerCount == 20}">selected</c:if>>20개씩 보기</option>
						</select>
                    </div>

                    <div class="bssBox">
                        <table class="bbsListTbl">
                            <tr>
                                <th><input type="checkbox" name="selectrows" value=""></th>
                                <th>상품번호</th>
                                <th>대분류</th>
                                <th>소분류</th>
                                <th>상품명</th>
                                <th>할인가</th>
                                <th>재고수량</th>
                                <th>포장타입</th>
                                <th>브랜드</th>
                                <th>판매상태</th>
                                <th>수정</th>

                            </tr>
   <%
						for(int i = start ; i < pagePerCount ; i++){   

					        
							int p_idx = productlist.get(i).getIdx();

							String p_category1 = productlist.get(i).getCategory1();
							String p_category2 = productlist.get(i).getCategory2();
							String p_title = productlist.get(i).getTitle();
							String p_subtitle = productlist.get(i).getSubtitle();
							String p_brand = productlist.get(i).getBrand();
							
							int p_price = productlist.get(i).getPrice();
							int p_discprice = productlist.get(i).getDiscprice();
							int p_stock = productlist.get(i).getStock();

							String p_packingtype = productlist.get(i).getPackingtype();
							String p_salestate = productlist.get(i).getSalestate();
							
%>                         
                         
                            <tr>
                                <td><input type="checkbox" name="selectrows" value=""></td>
                                <td><a href="../shop/goods/goods_detail.jsp?p_idx=<%=p_idx%>"> <%=p_idx%></a></td>
                                <td><%=p_category1%></td>
                                <td><%=p_category2%></td>
                                <td><a href="../shop/goods/goods_detail.jsp?p_idx=<%=p_idx%>"> <%=p_title%></a></td>
                                <td><%=p_discprice%></td>
                                <td><%=p_stock%></td>
                                <td><%=p_packingtype%></td>
                                <td><%=p_brand%></td>
                                <td><%=p_salestate%></td>
                                <td><input type="button" class="bbs_btn"  value="수정" onclick="location.href='admin_productedit.jsp?p_idx=<%=p_idx%>' "></td>
                            </tr>
<%} %>
                        </table>
                    </div>
                

 					<%   
						int pageNums = 0;   
						if(totalCount % pagePerCount == 0){
							pageNums = (totalCount / pagePerCount);
						}else{
							pageNums = (totalCount / pagePerCount) + 1;
						}
					
					%>

                       <div  class = "pagination">
                        <a href="#" class="pn_btn pn_firstpage">맨 처음 페이지로 가기</a>
                        <a href="#" class="pn_btn pn_prevpage">이전 페이지로 가기</a>
						<%
						       for(int i=1; i<=pageNums; i++) {
						             out.print("<a href='admin_productcheck.jsp?pageNum=" + i + "&pageSize=" + 
						            		 pagePerCount +"' class='pn_btn pn_num' __active>"+ i +"</a>");  // 페이지 사이즈 추가
						          }
						%>                   
                        
                        <a href="#" class="pn_btn pn_nextpage">다음 페이지로 가기</a>
                        <a href="#" class="pn_btn pn_lastpage">맨 끝 페이지로 가기</a>
                    </div>
                </div>
            
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