<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!--  isELIgnored= "false" -->
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.kurly.notice.NoticeDTO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="com.kurly.notice.NoticeDAO" />
<%
	Date from = new Date();
	SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");	// 2021-03-02
	String to = fm.format(from);	// 2021-03-02
	
	int start;
	int totalCount = 0;
	String pageSize = request.getParameter("pageSize");
	int pagePerCount;
	if (pageSize == null){
		pagePerCount = 4;
	}else {
		pagePerCount = Integer.parseInt(pageSize);
	}
	
	List<NoticeDTO> list = new ArrayList<>();
	
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum != null && !pageNum.equals("")) {
		 start = (Integer.parseInt(pageNum) - 1) * pagePerCount;
	}else {
		 pageNum="1";
		 start = 0;
	}
	totalCount = dao.count();
	
	list = dao.selectList(pagePerCount, start);	
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<link href="../css/admin_style.css" rel="stylesheet" type="text/css">
	<script src="../script/admin_notice.js"></script>
	
	<title>공지사항 조회</title>
	<script>
		function chageLangSelect(){
	    	var langSelect = document.getElementById("id-lang");
	     
	    	// select element에서 선택된 option의 value가 저장된다.
	    	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	 
	    	// select element에서 선택된 option의 text가 저장된다.
	    	var selectText = langSelect.options[langSelect.selectedIndex].text;
	    	window.console.log(selectValue)
	    	var pageNumJs = <%=pageNum%> ;
	    	location.href="admin_noticelist.jsp?pageNum=" + pageNumJs + "&pageSize=" + selectValue
		}
	</script>
</head>

<body>

	<div id="wrap">
		<!-- 상단 메뉴 시작 -->
		<header id="header">
			<div id="header_menu1" class="header_menu">
				<ul>
					<li><a href="admin_dashboard.jsp"><img id="kurly_logo" src="../img/kurly.png" alt="컬리로고"></a></li>
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
				<div id="profile_area">
					<img id="pro_file" src="../img/profile.png">
				</div>
				<div id="tab1" class="menutab">
					<ul>
						<li class="category"><a href="admin_dashboard.jsp">대시보드</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab2" class="menutab __activepage">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category">공지사항</li>
						<li class="__activepage1">공지사항 조회</li>
						<li><a href="admin_noticeadd.jsp">공지사항 등록</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab3" class="menutab">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category">상품 관리</li>
						<li><a href="admin_productcheck.jsp">상품 조회/수정</a></li>
						<li><a href="admin_productadd.jsp">상품 등록</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab4" class="menutab">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category">판매 관리</li>
						<li><a href="admin_ordercheck.jsp">주문 조회</a></li>
						<li><a href="admin_deliverycheck.jsp">주문/배송 현황</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab5" class="menutab">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category clear">클레임 관리</li>
						<li><a href="admin_cancelcheck.jsp">취소 관리</a></li>
						<li><a href="admin_exchangecheck.jsp">교환 관리</a></li>
						<li><a href="admin_refundcheck.jsp">반품 관리</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab6" class="menutab">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category">문의 사항</li>
						<li><a href="admin_pinquirycheck.jsp">상품 문의</a></li>
						<li><a href="admin_cinquirycheck.jsp">고객 문의</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab7" class="menutab">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category">회원 관리</li>
						<li><a href="admin_membercheck.jsp">회원 조회</a></li>
						<li><a href="admin_wd_member.jsp">탈퇴회원 조회</a></li>
					</ul>
				</div>
				<div class="hr"></div>

				<div id="tab8" class="menutab">
					<img src="../img/ico_folding_down.png">
					<ul>
						<li class="category">이벤트 관리</li>
						<li><a href="admin_eventcheck.jsp">이벤트 조회</a></li>
						<li><a href="admin_eventadd.jsp">이벤트 등록</a></li>
					</ul>
				</div>
				<div class="hr"></div>

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
					<p>공지사항 조회</p>
				</div>
				<div class="filter">
					<form aciton="#" class="regForm">
						<ul class="reg_list clear">
							<li class="clear"><label class="tit_lbl_search"> 검색어</label>
								<div class="search_box">
									<select name="select_search">
										<option value="제목" selected>제목</option>
										<option value="번호">번호</option>
									</select> <input type="text" name="search_cont">
								</div></li>
							<div class="hr"></div>

							<li class="search_detail clear"><label
								class="tit_lbl_search">상세검색</label>
								<div clas="search_detail">
									<select name="select_important">
										<option value="전체" selected>분류 전체</option>
										<option value="중요">중요공지</option>
										<option value="일반">일반공지</option>
									</select> <select name="select_display">
										<option value="전체" selected>전시상태 전체</option>
										<option value="전시중">전시중</option>
										<option value="전시중단">전시중단</option>
									</select> <br> <input type="date"> ~ <input type="date">
								</div></li>
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
				<form action="admin_noticedelete.jsp">
				<% request.setCharacterEncoding("euc-kr"); %>
					<div class="subtitle float_left">
						<h3>
							공지사항 목록 (총
							<%=totalCount%>개)
						</h3>
					</div>
					<div class="subfunc float_right clear">
						<input type="submit" class="deleterows" name="deleterows"
							value="선택삭제" > <span><%=pageSize %></span>
						<select name="pn_cnt" id="id-lang" onchange="chageLangSelect()">
							<option value=5 <c:if test="${pagePerCount == 5}">selected</c:if>>5개씩보기</option>
							<option value=10
								<c:if test="${pagePerCount == 10}">selected</c:if>>10개씩보기</option>
							<option value=20
								<c:if test="${pagePerCount == 20}">selected</c:if>>20개씩보기</option>
						</select>

					</div>

					<div class="bssBox">
						<table class="bbsListTbl">
							<tr>
								<th><input type="checkbox" name="selectAllrows"
									onclick='checkAll(this) '></th>
								<th>공지번호</th>
								<th>제목</th>
								<th>조회수</th>
								<th>전시상태</th>
								<th>중요</th>
								<th>공지등록일</th>
							</tr>
							<%
		for(int i=0; i<list.size(); i++) {
%>
							<tr>
								<td><input type="checkbox" name="selectrows"onclick='checkSelectAll()' value="<%=list.get(i).getIdx()%>"></td>
								<td><a href='admin_noticeEdit.jsp?idx=<%=list.get(i).getIdx()%>'><%=list.get(i).getIdx() %></a></td>
								<td><%=list.get(i).getTitle() %></td>
								<td><%=list.get(i).getHit() %></td>
								<td><%=list.get(i).getIsdisplay() %></td>
								<td><%=list.get(i).getIsimpt() %></td>
								<td><%=list.get(i).getRegdate().substring(0, 10) %></td>
							</tr>
							<%
		}
		int pageNums = 0;
		if(totalCount % pagePerCount == 0) {
			pageNums = (totalCount / pagePerCount) ;
		}else {
			pageNums = totalCount / pagePerCount + 1;
		}
%>

						</table>
					</div>

					<div class="pagination">
						<a href="#" class="pn_btn pn_firstpage">맨 처음 페이지로 가기</a> <a
							href="#" class="pn_btn pn_prevpage">이전 페이지로 가기</a>
						<%
         for(int i=1; i<=pageNums; i++) {
         		out.print("<a href='admin_noticelist.jsp?pageNum=" + i + "&pageSize=" + 
	            		 pagePerCount + "' class='pn_btn pn_num'>"+ i +"</a>");
         	}
%>
					
						<a href="#" class="pn_btn pn_nextpage">다음 페이지로 가기</a> <a href="#"
							class="pn_btn pn_lastpage">맨 끝 페이지로 가기</a>
					</div>
					</form>
				</div>


<script>
 
        function checkSelectAll()  {
        // 전체 체크박스
        const checkboxes 
            = document.querySelectorAll('input[name="selectrows"]');
        // 선택된 체크박스
        const checked 
            = document.querySelectorAll('input[name="selectrows"]:checked');
        // select all 체크박스
        const selectAll 
            = document.querySelector('input[name="selectAllrows"]');

        if(checkboxes.length === checked.length)  {
            selectAll.checked = true;
            
        }else {
            selectAll.checked = false;
            
        }

        }
        function checkAll(selectAll)  {
        const checkboxes 
            = document.getElementsByName('selectrows');
        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
        }
</script>



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