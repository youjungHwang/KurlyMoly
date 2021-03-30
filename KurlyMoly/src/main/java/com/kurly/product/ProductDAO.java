package com.kurly.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class ProductDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<ProductDTO> productList = new ArrayList<>();
	String sql = "";

	public List<ProductDTO> selectProduct() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_product ORDER BY p_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO productDetail = new ProductDTO();
				productDetail.setpIdx(rs.getLong("p_idx"));
				productDetail.setpCategory1(rs.getString("p_category1"));
				productDetail.setpCategory2(rs.getString("p_category2"));
				productDetail.setpTitle(rs.getString("p_title"));
				productDetail.setpSubtitle(rs.getString("p_subtitle"));
				productDetail.setpBrand(rs.getString("p_brand"));
				productDetail.setpPrice(rs.getInt("p_price"));
				productDetail.setpDiscprice(rs.getInt("p_discprice"));
				productDetail.setpPoint(rs.getInt("p_point"));
				productDetail.setpStock(rs.getInt("p_stock"));
				productDetail.setpDeliverytype(rs.getString("p_deliverytype"));
				productDetail.setpPackingtype(rs.getString("p_packingtype"));
				productDetail.setpSalesUnit(rs.getString("p_salesunit"));
				productDetail.setpWeight(rs.getString("p_weight"));
				productDetail.setpOrigin(rs.getString("p_origin"));
				productDetail.setpMainImg(rs.getString("p_mainimg"));
				productDetail.setpDescription(rs.getString("p_description"));
				productDetail.setpSaleState(rs.getString("p_salestate"));
				productDetail.setpDisplay(rs.getString("p_display"));
				productDetail.setpRegdate(rs.getString("p_regdate"));
				
				productList.add(productDetail);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return productList;
	}
	
	public ProductDTO cartProduct(int p_idx) {
		ProductDTO productDetail = new ProductDTO();
		
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_product WHERE p_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productDetail.setpIdx(rs.getLong("p_idx"));
				productDetail.setpCategory1(rs.getString("p_category1"));
				productDetail.setpCategory2(rs.getString("p_category2"));
				productDetail.setpTitle(rs.getString("p_title"));
				productDetail.setpSubtitle(rs.getString("p_subtitle"));
				productDetail.setpBrand(rs.getString("p_brand"));
				productDetail.setpPrice(rs.getInt("p_price"));
				productDetail.setpDiscprice(rs.getInt("p_discprice"));
				productDetail.setpPoint(rs.getInt("p_point"));
				productDetail.setpStock(rs.getInt("p_stock"));
				productDetail.setpDeliverytype(rs.getString("p_deliverytype"));
				productDetail.setpPackingtype(rs.getString("p_packingtype"));
				productDetail.setpSalesUnit(rs.getString("p_salesunit"));
				productDetail.setpWeight(rs.getString("p_weight"));
				productDetail.setpOrigin(rs.getString("p_origin"));
				productDetail.setpMainImg(rs.getString("p_mainimg"));
				productDetail.setpDescription(rs.getString("p_description"));
				productDetail.setpSaleState(rs.getString("p_salestate"));
				productDetail.setpDisplay(rs.getString("p_display"));
				productDetail.setpRegdate(rs.getString("p_regdate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return productDetail;
	}

}
