<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@ page import="java.sql.*" %>


<%  
		
		int totalCount = 0; // 전체 글 개수
		int waitprodCount = 0; // 판매대기 글 개수
		int nowsaleCount = 0; // 판매중 글 개수
		int nostockCount = 0; // 품절 글 개수
		int stopsaleCount = 0; // 판매중단 글 개수
		int donesaleCount = 0; // 판매완료 글 개수
		
	    int order1Count = 0; // 판매대기 글 개수
	    int order2Count = 0; // 판매중 글 개수
	    int order3Count = 0; // 품절 글 개수
	    int order4Count = 0; // 판매중단 글 개수
	    int order5Count = 0; // 판매완료 글 개수
	    
	    int piq_noreply = 0; // 상품문의 미답변 개수
	    int ciq_noreply = 0; // 고객문의 미답변 개수
	    int activeuser = 0 ; // 사용회원
    	int withdrawer = 0;  // 탈퇴회원 

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
         
         
         try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(url, uid, upw);
             if(conn != null){
                sql = "select count(*) as total, "  
             		   + "count(case when o_shipstate='주문완료' then 1 end) as order1, "
             		   + "count(case when o_shipstate='상품준비중' then 1 end) as order2,"
             		   + "count(case when o_shipstate='배송중' then 1 end) as order3,"
             		   + "count(case when o_shipstate='배송완료' then 1 end) as order4,"
             		   + "count(case when o_shipstate='구매확정' then 1 end) as order5 from tb_order;";
             		   
                pstmt= conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                   totalCount = rs.getInt("total");
                   order1Count = rs.getInt("order1");
                   order2Count = rs.getInt("order2");
                   order3Count = rs.getInt("order3");
                   order4Count = rs.getInt("order4");
                   order5Count = rs.getInt("order5");
                }

             }
             
          }catch(Exception e){
             e.printStackTrace();   
          }      
         
         
         try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(url, uid, upw);
             if(conn != null){
                sql = "select count(case when piq_isreply='미답변' then 1 end) as piq_noreply from tb_pinquiry;";
                
                pstmt= conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                	piq_noreply = rs.getInt("piq_noreply");
                }

             }
             
          }catch(Exception e){
             e.printStackTrace();   
          }      
         
         
         try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(url, uid, upw);
             if(conn != null){
                sql = "select count(case when ciq_isreply='미답변' then 1 end) as ciq_noreply from tb_cinquiry;";
                
                pstmt= conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                	ciq_noreply = rs.getInt("ciq_noreply");
                }

             }
             
          }catch(Exception e){
             e.printStackTrace();   
          }      
         
         
         
         try{
             Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection(url, uid, upw);
             if(conn != null){
                sql = "select count(case when m_state='1' then 1 end) as activeuser,"
                		+ "count(case when m_state='2' then 1 end) as withdrawer from tb_member;";
                		
                		
                pstmt= conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if(rs.next()){
                	activeuser = rs.getInt("activeuser");
                	withdrawer = rs.getInt("withdrawer");
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

    <title>대시보드</title>
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
                    <li><a href="admin_logout.jsp";">로그아웃</a></li>
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
                        <li><a href="admin_noticelist.jsp">공지사항 조회</a></li>
                        <li><a href="admin_noticeadd.jsp">공지사항 등록</a></li>
                    </ul>
                </div>
                <div class="hr"> </div>

                <div id="tab3" class="menutab">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">상품 관리</li>
                        <li><a href="admin_productcheck.jsp">상품 조회/수정</a></li>
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
<!-- 
                <div id="tab5" class="menutab">
                    <img src="../img/ico_folding_down.png">
                    <ul>
                        <li class="category clear">클레임 관리</li>
                        <li><a href="admin_cancelcheck.jsp"></a>취소 관리</li>
                        <li><a href="admin_exchangecheck.jsp">교환 관리</a></li>
                        <li><a href="admin_refundcheck.jsp">반품 관리</a></li>
                    </ul>
                </div>
-->
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
                        <li><a href="./admin_membercheck.jsp">회원 조회</a></li>
                        
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
                <div class="title dash_title  clear">
                    <p><img src="../img/notice.png"> [사내 공지] 마켓컬리 카카오뱅크 결제 신규 도입 | 2021.03.16 </p>
                </div>
            <div class="dash_cont clear" style="height: 550px;">
                <ul class="dash_box clear"  ><a href="./admin_productcheck.jsp">
                    <li class="dash_subtitle">상품</li>
                       <li class="clear">
                       
                            <div class="dash_tit_lbl">판매대기</div>
                            <div class="dash_content"><%=waitprodCount%></div>
                      
                    </li>
                    <li class="clear">
                      
                            <div class="dash_tit_lbl">판매중</div>
                            <div class="dash_content"><%=nowsaleCount%></div>
                     
                    </li>
                    <li class="clear">
                       
                        <div class="dash_tit_lbl">품절</div>
                        <div class="dash_content"><%=nostockCount%></div>
                   
                    </li>
                    <li class="clear">
                       
                        <div class="dash_tit_lbl">판매중지</div>
                        <div class="dash_content"><%=donesaleCount %></div>
                  
                    </li>
                    <li class="clear">
                      
                        <div class="dash_tit_lbl">판매중지</div>
                        <div class="dash_content"><%=stopsaleCount %></div>
                
                    </li></a>
                </ul>



                <ul class="dash_box clear"><a href="./admin_ordercheck.jsp">
                    <li class="dash_subtitle">주문/배송</li>
                    <li class="clear">
                   
                        <div class="dash_tit_lbl">신규주문</div>
                        <div class="dash_content"><%=order1Count%></div>
                 
                    </li>
                    <li class="clear">
                        
                        <div class="dash_tit_lbl">상품준비중</div>
                        <div class="dash_content"><%=order2Count%></div>
                  
                    </li>
                    <li class="clear">
                   
                        <div class="dash_tit_lbl">배송중</div>
                        <div class="dash_content"><%=order3Count %></div>

                    </li>
                    <li class="clear">
                     
                        <div class="dash_tit_lbl">배송완료</div>
                        <div class="dash_content"><%=order4Count %></div>
                 
                    </li>
                    <li class="clear">
                    
                        <div class="dash_tit_lbl">구매확정</div>
                        <div class="dash_content"><%=order5Count%></div>
                    
                    </li></a>
                </ul>

                <ul class="dash_box clear"><a href="./admin_cinquirycheck.jsp">
                    <li class="dash_subtitle">미답변문의</li>
                    <li class="clear">
                        
                        <div class="dash_tit_lbl">상품문의</div>
                        <div class="dash_content"><%=piq_noreply%></div>
                  
                    </li>
                    <li class="clear">
                       
                        <div class="dash_tit_lbl">고객문의</div>
                        <div class="dash_content"><%=ciq_noreply%></div>
                   
                    </li></a>
                </ul>

                <ul class="dash_box clear"><a href="./admin_membercheck.jsp">
                    <li class="dash_subtitle">회원</li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">활동회원</div>
                        <div class="dash_content"><%=activeuser%></div> 
                    </div>
                    </li>
                    <li class="clear">
                        <div><a href="#">
                        <div class="dash_tit_lbl">탈퇴회원</div>
                        <div class="dash_content"><%=withdrawer%></div>
                  </div>
                    </li> </a> 
                </ul>

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