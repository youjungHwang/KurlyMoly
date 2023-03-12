<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<%@ page import="com.kurly.product.FileService" %>


<jsp:useBean id="productDAO" class="com.kurly.product.ProductDAO"/>

<%


	FileService fs = new FileService();

	int maxSize = 10 * 1024 * 1024;
	String savePath = fs.SAVE_PATH;
	String format = "UTF-8";
	String uploadFile = "";
	String uploadFile2 = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, format, new DefaultFileRenamePolicy());
		int idx = Integer.parseInt( multi.getParameter("idx"));
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
		String imgname =multi.getFilesystemName("imgname");
		String detailimgname = multi.getFilesystemName("detailimgname");
	
		
	
	if(imgname != null && detailimgname != null ){
		uploadFile = multi.getFilesystemName("imgname"); 
		uploadFile2 = multi.getFilesystemName("detailimgname"); 
		File file = new File(savePath + "/" + uploadFile);
		File file2 = new File(savePath + "/" + uploadFile2);
		
			if (fs.dataEdit_prod(idx, category1, category2, title, subtitle, brand, price, discprice, point, stock, 
					deliverytype ,packingtype, salesunit, weight, origin , description, salestate, isdisplay, file,file2)){
				
				response.sendRedirect("admin_productcheck.jsp"); 
			}else{
				out.print("<script>alert('이미지 등록에 실패했습니다.'); history.back();</script>");
			} 

   }else if(imgname == null && detailimgname != null) {  
		uploadFile2 = multi.getFilesystemName("detailimgname"); 
		File file2 = new File(savePath + "/" + uploadFile2);

		if (fs.dataEdit2_prod(idx, category1, category2, title, subtitle, brand, price, discprice, point, stock, 
				deliverytype ,packingtype, salesunit, weight, origin , description, salestate, isdisplay,file2)){
			// 이미지 파일이 있는 경우, 
			response.sendRedirect("admin_productcheck.jsp"); 
		}else{
			out.print("<script>alert('상세 이미지 등록에 실패했습니다.'); history.back();</script>");
		} 
			
			
	}else if((imgname != null && detailimgname == null)) { 
		uploadFile = multi.getFilesystemName("imgname"); 
		File file = new File(savePath + "/" + uploadFile);
		

		if (fs.dataEdit3_prod(idx, category1, category2, title, subtitle, brand, price, discprice, point, stock, 
				deliverytype ,packingtype, salesunit, weight, origin , description, salestate, isdisplay, file)){
			// 이미지 파일이 있는 경우, 
			response.sendRedirect("admin_productcheck.jsp"); 
		}else{
			out.print("<script>alert('대표이미지 등록에 실패했습니다.'); history.back();</script>");
		} 
			
		
	}else{

	 if(productDAO.edit4Data(idx, category1, category2, title, subtitle, brand, price, discprice, point, stock, 
				deliverytype ,packingtype, salesunit, weight, origin , description, salestate, isdisplay)) {
			response.sendRedirect("admin_productcheck.jsp"); 
		}else{
			out.print("<script>alert('상품 수정에 실패했습니다.'); history.back();</script>");
		} 
		
	}

	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	