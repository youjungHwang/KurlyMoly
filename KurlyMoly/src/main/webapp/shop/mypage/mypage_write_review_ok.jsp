<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>

<jsp:useBean class="com.kurly.review.ReviewDTO" id="review"/>
<jsp:useBean class="com.kurly.review.ReviewDAO" id="dao"/>
<jsp:setProperty property="*" name="review"/>

<%
   request.setCharacterEncoding("UTF-8");	
    int result = 0 ; 
	int maxSize = 10 * 1024 * 1024;
	
	String savePath = "C:\\Users\\ITSC\\Desktop\\hnh\\KurlyMoly\\src\\main\\webapp\\img\\review_image";
	String format = "UTF-8";
	String uploadFile = "";


	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
		
		int rvProductidx = Integer.parseInt(multi.getParameter("rvProductidx"));
		String rvUserid = multi.getParameter("rvUserid");
		String rvTitle = multi.getParameter("rvTitle");
		String rvContent = multi.getParameter("rvContent");
		String rvImgname = multi.getFilesystemName("imgname");
%>
<jsp:setProperty property="rvProductidx" value="<%=rvProductidx%>"  name="review"/>
<jsp:setProperty property="rvUserid" value="<%=rvUserid%>"  name="review"/>
<jsp:setProperty property="rvTitle" value="<%=rvTitle%>"  name="review"/>
<jsp:setProperty property="rvContent" value="<%=rvContent%>"  name="review"/>
	
	
		
<% 		if( rvImgname != null){
			uploadFile = multi.getFilesystemName("imgname"); 
			File file = new File(savePath + "/" + uploadFile);
%>
<jsp:setProperty property="rvImgname" value="<%=rvImgname%>"  name="review"/>

<%		
		result = dao.insertDataImg(review);
		}else{ 
		result = dao.insertData(review);
		}

	 if(result == 1){	   		
%>
	<script>
	      alert('리뷰가 등록되었습니다.');
	      location.href='mypage_review.jsp';
	</script>
<%
   } else {   
%>
	<script>
	      alert('리뷰 등록을 실패했습니다.');
	      history.back();
	</script>
<%
   }
	 
	}catch(Exception e){
		e.printStackTrace();
	}
	 
%>
		 
		 
	