package com.kurly.inquiry;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class FileService {
	private CinquiryDAO cinquiryDAO = null;

	public static String SAVE_PATH = "C:\\Users\\ITSC\\Desktop\\hnh\\KurlyMoly\\src\\main\\webapp\\img\\inquiry";  //★★경로수정  

	public FileService() {
		cinquiryDAO = new CinquiryDAO();
	}
	
	public boolean dataUpload(String about, Integer orderidx, String userid, String title, String content,String isreply, File file) {
		CinquiryDTO cinquiryDTO = new CinquiryDTO();
		cinquiryDTO.setAbout(about);
		cinquiryDTO.setOrderidx(orderidx);
		cinquiryDTO.setUserid(userid);
		cinquiryDTO.setTitle(title);
		cinquiryDTO.setContent(content);
		cinquiryDTO.setIsreply(isreply);
		cinquiryDTO.setFilename(file.getName());	// 원본 파일명
		
		boolean isSuccess = cinquiryDAO.insertData(cinquiryDTO);
		if(isSuccess) {
			moveFile(cinquiryDTO, file); 
		}
		
		return isSuccess;
	}
	
	public boolean dataUpload(String about, Integer orderidx, String userid, String title, String content,  String isreply) {
		CinquiryDTO cinquiryDTO = new CinquiryDTO();
		cinquiryDTO.setAbout(about);
		cinquiryDTO.setOrderidx(orderidx);
		cinquiryDTO.setUserid(userid);
		cinquiryDTO.setTitle(title);
		cinquiryDTO.setContent(content);
		cinquiryDTO.setIsreply(isreply);

	   cinquiryDAO.insertData(cinquiryDTO);
		
		
		return true;
	}
	
	
	public void moveFile(CinquiryDTO cinquiryDTO, File file) {
		File dir= new File(SAVE_PATH +"/"+ getToday()); //그날 그날 폴더를 만듦. 폴더 분할 
		if(!dir.isDirectory()) { 
			dir.mkdir(); // 폴더를 만들어줌. 
		}
		if(file.isFile()) {
			File newFile = new File(SAVE_PATH + cinquiryDTO.getFilepath()); 
			file.renameTo(newFile); 
		}
	}
	
	
	public static String getToday() { 
		Calendar cal = Calendar.getInstance(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // Ctrl +shift +o 
		return sdf.format(cal.getTime()); 
	}
}
