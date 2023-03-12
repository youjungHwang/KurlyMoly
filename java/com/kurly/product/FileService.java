package com.kurly.product;
import java.io.File;

public class FileService {
	private ProductDAO productDAO = null;
	public static String SAVE_PATH = "C:\\Users\\ITSC\\Desktop\\hnh\\KurlyMoly\\src\\main\\webapp\\img\\goods_detail";
	
	public FileService() {
		productDAO = new ProductDAO();
	}

	
	public boolean dataUpload_prod(String category1,String category2,String title,String subtitle,String brand,int price, 
			int discprice,int point, int stock, String deliverytype,String packingtype, String salesunit,
			String weight,String origin ,String description,String salestate, String isdisplay, File file1, File file2) {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setCategory1(category1);
		productDTO.setCategory2(category2);
		productDTO.setTitle(title);
		productDTO.setSubtitle(subtitle);
		productDTO.setBrand(brand);
		productDTO.setPrice(price);
		productDTO.setDiscprice(discprice);
		productDTO.setPoint(point);
		productDTO.setDeliverytype(deliverytype);
		productDTO.setPackingtype(packingtype);
		productDTO.setSalesunit(salesunit);
		productDTO.setWeight(weight);
		productDTO.setOrigin(origin);
		productDTO.setDescription(description);
		productDTO.setSalestate(salestate);
		productDTO.setIsdisplay(isdisplay);
		productDTO.setImgname(file1.getName());	// 원본 파일명
		productDTO.setImgpath(file1.getPath());	// 원본 파일경로
		productDTO.setDetailimgname(file2.getName());	// 원본 파일명
		productDTO.setDetailimgpath(file2.getPath());	// 원본 파일경로
		
		
		System.out.println(file2.getName()); 
		boolean isSuccess = productDAO.insertData(productDTO);
		
		return isSuccess;
	}
	
}