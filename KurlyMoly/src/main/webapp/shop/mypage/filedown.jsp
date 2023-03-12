<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kurly.inquiry.FileService" %>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	String savePath = FileService.SAVE_PATH;
	String filePath = request.getParameter("filePath"); 
	String fileName = request.getParameter("file"); 
	
	InputStream in =null; 
	OutputStream os =null;
	File file = null; 
	String client =""; 
	boolean skip = false; 
	
	try{
		file = new File(savePath+filePath); 
		System.out.println(filePath);
		System.out.println(file);
		in = new FileInputStream(file);
	}catch(Exception e){
		skip =true; 
	}
	
	client = request.getHeader("User-Agent"); 
	System.out.println(client);
	response.reset(); 
	
	if(!skip){
		fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1"); 
		//file 이름 인코딩을 바꿔서보냄 전달할 때 한글 이름깨지지 않도록.
		response.setHeader("Content-Disposition","attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Type","application/octet-stream; charset=utf-8");
		response.setHeader("Content-Length",""+file.length()); 
		out.clear(); //버퍼를 비워준다. 파일 전송시, 데이터 한번에 전송이 아니라, 
		out = pageContext.pushBody(); //바디를 전달할 객체 out
		//소켓 
		os = response.getOutputStream(); //전달 객체, outputstream을 os로 줌. 
		byte b[] = new byte[(int)file.length()]; 
		int leng =0; 
		while((leng = in.read(b))> 0){
			os.write(b,0,leng);  //데이터를 채워서 보내고, 
		}
	}else{
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script>alert('파일을 찾을 수 없습니다.');history.back();</script>");
	}
%>
