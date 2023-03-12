<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!--  isELIgnored= "false" -->

<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	NumberFormat nf = NumberFormat.getInstance(); // 숫자 포맷 지정을 위한 변수 설정
	
	Long m_idx = null;
	String m_userid = null;
	String m_name = null;
	String m_tel = null;
	String m_email = null;
	String m_birth = null;
	String m_gender = null;
	String m_zipcode = null;
	String m_address1 = null;
	String m_address2 = null;
	String address = null;
	String m_regdate = null;
	String m_recomid = null;
	String m_membership = null;
	String m_kurlypass = null;
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mysql://localhost:3306/KurlyMoly";
	String uid = "root";
	String upw = "1234";
	
	// 페이징 작업
	int totalCount = 0; // 전체 글 개수
	int pagePerCount = 0; // 페이지당 글 개수 ** 10개씩 보기
	int start = 0; // 시작 글번호
	
	String pageSize = request.getParameter("pageSize");
	if (pageSize == null) {
		pagePerCount = 5;
	} else {
		pagePerCount = Integer.parseInt(pageSize);
	}
	
	String pageNum = request.getParameter("pageNum");
	if (pageNum != null && !pageNum.equals("")) {
		start = (Integer.parseInt(pageNum) - 1) * pagePerCount;
	} else {
		pageNum = "1";
		start = 0;
	}
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if (conn != null) {
			sql = "select count(m_idx) as total from tb_member";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				totalCount = rs.getInt("total");
			}
		}
	
	} catch (Exception e) {
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

    <title>회원 조회</title>
    <script>
		function chageLangSelect(){
	    	var langSelect = document.getElementById("id-lang");
	     
	    	// select element에서 선택된 option의 value가 저장된다.
	    	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	 
	    	// select element에서 선택된 option의 text가 저장된다.
	    	var selectText = langSelect.options[langSelect.selectedIndex].text;
	    	window.console.log(selectValue);
	    	var pageNumJs = <%=pageNum%>;
	    	location.href="./admin_membercheck.jsp?pageNum=" + pageNumJs + "&pageSize=" + selectValue;
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

                <div id="tab7" class="menutab __activepage">
                    <img src="../img/ico_folding_down.png"> 
                    <ul>
                        <li class="category">회원 관리</li>
                        <li class="__activepage1">회원 조회</li>
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
                    <p>회원 조회</p>
                </div>
                <div class="filter">
                    <form aciton="#" class="regForm">
                        <ul class="reg_list clear">
                            <li class="clear">
                                <label class="o_tit_lbl_search">가입기간</label>
                                <div class="select_duration">
                                    <input type="date"> ~ <input type="date">
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="clear">
                                <label class="tit_lbl">멤버십 등급</label>
                                <div class="select_sales">
                                    <label class="space"><input type="checkbox" name="orderstate" value="전체"> 전체</label>
                                    <label class="space"><input type="checkbox" name="orderstate" value="더퍼플"> 더퍼플</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="퍼플"> 퍼플</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="라벤더"> 화이트</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="라벤더"> 프렌즈</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="라벤더"> 일반</label>
                                </div>
                            </li>
                            <div class="hr"> </div>
                            <li class="clear">
                                <label class="tit_lbl">컬리패스</label>
                                <div class="select_sales">
                                    <label class="space"><input type="checkbox" name="orderstate" value="전체"> 전체</label>
                                    <label class="space"><input type="checkbox" name="orderstate" value="가입"> 가입</label>
                                    <label class="space"><input type="checkbox" name="orderstate"
                                    value="비가입"> 비가입</label>
                                </div>
                            </li>
                            <div class="hr"> </div>

                            <li class="search_detail clear">
                                <label class="tit_lbl_search "> 상세조건</label>
                                <div class="search_box"> 
                                    <select name="select_search">
                                        <option value="전체" selected>전체</option>
                                        <option value="회원번호">회원번호</option>
                                        <option value="회원ID">회원ID</option>
                                        <option value="이름">이름</option>
                                        <option value="생년월일">생년월일</option>
                                        <option value="성별">성별</option>
                                        <option value="주소">주소</option>
                                        <option value="추천인ID">추천인ID</option>
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
                        <h3>회원 목록 (총 <span><%=totalCount%></span> 명)</h3>
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
                                <th>회원번호</th>
                                <th>회원ID</th>
                                <th>이름</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th>생년월일</th>
                                <th>성별</th>
                                <th>주소</th>
                                <th>회원가입일</th>
                                <th>추천인ID</th>
                                <th>멤버십등급</th>
                                <th>컬리패스</th>
                            </tr>
                            
<%
								Connection conn2 = null;
								PreparedStatement pstmt2 = null;
								ResultSet rs2 = null;
								
								String sql2 = "";
								String url2 = "jdbc:mysql://localhost:3306/kurlymoly";
								String uid2 = "root";
								String upw2 = "1234";

								try {
									Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
									conn2 = DriverManager.getConnection(url2, uid2, upw2);
									if (conn2 != null) {
										sql2 = "select * from tb_member order by m_idx desc limit ?, ?";
										pstmt2 = conn2.prepareStatement(sql2);
										pstmt2.setInt(1, start);
										pstmt2.setInt(2, pagePerCount);
										rs2 = pstmt2.executeQuery();

										for (int i = 0; i < pagePerCount; i++) {
											if (rs2.next()) {
												m_idx = rs2.getLong("m_idx");
												m_userid = rs2.getString("m_userid");
												m_name = rs2.getString("m_name");
												m_tel = rs2.getString("m_tel");
												m_email = rs2.getString("m_email");
												m_birth = rs2.getString("m_birth");
												m_gender = rs2.getString("m_gender");
												m_zipcode = rs2.getString("m_zipcode");
												m_address1 = rs2.getString("m_address1");
												m_address2 = rs2.getString("m_address2");
												address = m_zipcode + " " + m_address1 + " " + m_address2;
												m_regdate = rs2.getString("m_regdate").substring(0, 10);
												m_recomid = rs2.getString("m_recomid");
												m_membership = rs2.getString("m_membership");
												m_kurlypass = rs2.getString("m_kurlypass");
											}
%>
                            <tr>
                                <td><a href="#"><%=m_idx%></a></td>
                                <td><%=m_userid%></td>
                                <td><%=m_name%></td>
                                <td><%=m_tel%></td>
                                <td><%=m_email%></td>
                                <td><%=m_birth%></td>
                                <td><%=m_gender%></td>
                                <td><%=address%></td>
                                <td><%=m_regdate%></td>
                                <td><%=m_recomid%></td>
                                <td><%=m_membership%></td>
                                <td><%=m_kurlypass%></td>
                            </tr>
<%
										}
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
%>
                        </table>
                    </div>
<%
						int pageNums = 0;
						if (totalCount % pagePerCount == 0) {
							pageNums = (totalCount / pagePerCount);
						} else {
							pageNums = (totalCount / pagePerCount) + 1;
						}
%>

					<div class="pagination">
						<a href="#" class="pn_btn pn_firstpage">맨 처음 페이지로 가기</a>
						<a href="#" class="pn_btn pn_prevpage">이전 페이지로 가기</a>
<%
						for (int i = 1; i <= pageNums; i++) {
							out.print("<a href='./admin_membercheck.jsp?pageNum=" + i +"&pageSize=" + 
				            		 pagePerCount + "' class='pn_btn pn_num' __active>" + i + "</a>");  // 페이지 사이즈 추가
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