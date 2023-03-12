<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<%@ page import="com.kurly.inquiry.FileService" %>
<%
	FileService fs = new FileService();

	int maxSize = 10 * 1024 * 1024;
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
		String about = multi.getParameter("itemcd");
		Integer orderidx = Integer.parseInt(multi.getParameter("ordno"));
		String userid = multi.getParameter("userid");
		String title = multi.getParameter("subject");
		String content = multi.getParameter("contents");	
		String isreply = multi.getParameter("isreply");
		
	if(multi.getFilesystemName("filename") != null){
		uploadFile = multi.getFilesystemName("filename"); 
		File file = new File(savePath + "/" + uploadFile);
		
			if(fs.dataUpload(about, orderidx, userid, title, content, isreply,file)){
				response.sendRedirect("mypage_qna.jsp");
			} else {
				out.print("<script>alert('에러!!'); history.back();</script>");
			}

		} else {
			if(fs.dataUpload(about, orderidx, userid, title, content,  isreply)){
				response.sendRedirect("mypage_qna.jsp");
			}else{
				out.print("<script>alert('에러!!'); history.back();</script>");
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
