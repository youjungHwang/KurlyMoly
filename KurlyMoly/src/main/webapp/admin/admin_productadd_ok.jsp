<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<%@ page import="com.kurly.product.FileService" %>
<%
	FileService fs = new FileService();

	int maxSize = 10 * 1024 * 1024;
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	String uploadFile2 = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
		String category1 = multi.getParameter("category1");
		String category2 = multi.getParameter("category2");
		String title = multi.getParameter("title");
		String subtitle = multi.getParameter("subtitle");
		String brand = multi.getParameter("brand");
		Integer price = Integer.parseInt(multi.getParameter("price"));
		Integer discprice = Integer.parseInt(multi.getParameter("discprice"));
		Integer point = Integer.parseInt(multi.getParameter("point"));
		Integer stock = Integer.parseInt(multi.getParameter("stock"));
		String deliverytype = multi.getParameter("deliverytype");
		String packingtype = multi.getParameter("packingtype");
		String salesunit = multi.getParameter("salesunit");
		String weight = multi.getParameter("weight");		
		String origin = multi.getParameter("origin");
		String description = multi.getParameter("description");
		String salestate = multi.getParameter("salestate");
		String isdisplay = multi.getParameter("isdisplay");
	
		
	
	if(multi.getFilesystemName("imgname") != null){
		uploadFile = multi.getFilesystemName("imgname"); 
		uploadFile2 = multi.getFilesystemName("detailimgname"); 
		File file = new File(savePath + "/" + uploadFile);
		File file2 = new File(savePath + "/" + uploadFile2);
		System.out.println(file);
		System.out.println(file2);
		
			if (fs.dataUpload_prod(category1, category2, title, subtitle, brand, price, discprice, point, stock, 
					deliverytype ,packingtype, salesunit, weight, origin , description, salestate, isdisplay, file,file2)){
				// 이미지 파일이 있는 경우, 
				response.sendRedirect("admin_productcheck.jsp"); 
			}else{
				out.print("<script>alert('에러!!'); history.back();</script>");
			} 

		}else{  // 이미지 파일이 없는경우, 

				out.print("<script>alert('대표 이미지를 등록하세요.'); history.back();</script>");
			} 

	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	