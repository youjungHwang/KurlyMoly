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
	String sql = "";

	public boolean insertData(ProductDTO productDTO) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_description, p_salestate, p_isdisplay, p_imgname,p_imgpath, p_detailimgname,p_detailimgpath) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productDTO.getCategory1());
			pstmt.setString(2, productDTO.getCategory2());
			pstmt.setString(3, productDTO.getTitle());
			pstmt.setString(4, productDTO.getSubtitle());
			pstmt.setString(5, productDTO.getBrand());
			pstmt.setInt(6, productDTO.getPrice());
			pstmt.setInt(7, productDTO.getDiscprice());
			pstmt.setInt(8, productDTO.getPoint());
			pstmt.setInt(9, productDTO.getStock());
			pstmt.setString(10, productDTO.getDeliverytype());
			pstmt.setString(11, productDTO.getPackingtype());
			pstmt.setString(12, productDTO.getSalesunit());
			pstmt.setString(13, productDTO.getWeight());
			pstmt.setString(14, productDTO.getOrigin());
			pstmt.setString(15, productDTO.getDescription());
			pstmt.setString(16, productDTO.getSalestate());
			pstmt.setString(17, productDTO.getIsdisplay());
			pstmt.setString(18, productDTO.getImgname());
			pstmt.setString(19, productDTO.getImgpath());
			pstmt.setString(20, productDTO.getDetailimgname());
			pstmt.setString(21, productDTO.getDetailimgpath());

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Insert 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public boolean editData(ProductDTO productDTO) {
		try {
			conn = Dbconn.getConnection();
			sql = "update  tb_product set  p_category1=?, p_category2=?, p_title=?, p_subtitle=?, p_brand=?, p_price=?, p_discprice=?, p_point=?, p_stock=?, p_deliverytype=?, p_packingtype=?, p_salesunit=?, p_weight=?, p_origin=?, p_description=?, p_salestate=?, p_isdisplay=?, p_imgname=?, p_imgpath=?, p_detailimgname=?,p_detailimgpath=? where p_idx =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productDTO.getCategory1());
			pstmt.setString(2, productDTO.getCategory2());
			pstmt.setString(3, productDTO.getTitle());
			pstmt.setString(4, productDTO.getSubtitle());
			pstmt.setString(5, productDTO.getBrand());
			pstmt.setInt(6, productDTO.getPrice());
			pstmt.setInt(7, productDTO.getDiscprice());
			pstmt.setInt(8, productDTO.getPoint());
			pstmt.setInt(9, productDTO.getStock());
			pstmt.setString(10, productDTO.getDeliverytype());
			pstmt.setString(11, productDTO.getPackingtype());
			pstmt.setString(12, productDTO.getSalesunit());
			pstmt.setString(13, productDTO.getWeight());
			pstmt.setString(14, productDTO.getOrigin());
			pstmt.setString(15, productDTO.getDescription());
			pstmt.setString(16, productDTO.getSalestate());
			pstmt.setString(17, productDTO.getIsdisplay());
			pstmt.setString(18, productDTO.getImgname());
			pstmt.setString(19, productDTO.getImgpath());
			pstmt.setString(20, productDTO.getDetailimgname());
			pstmt.setString(21, productDTO.getDetailimgpath());
			pstmt.setInt(22, productDTO.getIdx());

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Update 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public boolean edit2Data(ProductDTO productDTO) {
		try {
			conn = Dbconn.getConnection();
			sql = "update  tb_product set  p_category1=?, p_category2=?, p_title=?, p_subtitle=?, p_brand=?, p_price=?, p_discprice=?, p_point=?, p_stock=?, p_deliverytype=?, p_packingtype=?, p_salesunit=?, p_weight=?, p_origin=?, p_description=?, p_salestate=?, p_isdisplay=?, p_detailimgname=?,p_detailimgpath=? where p_idx =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productDTO.getCategory1());
			pstmt.setString(2, productDTO.getCategory2());
			pstmt.setString(3, productDTO.getTitle());
			pstmt.setString(4, productDTO.getSubtitle());
			pstmt.setString(5, productDTO.getBrand());
			pstmt.setInt(6, productDTO.getPrice());
			pstmt.setInt(7, productDTO.getDiscprice());
			pstmt.setInt(8, productDTO.getPoint());
			pstmt.setInt(9, productDTO.getStock());
			pstmt.setString(10, productDTO.getDeliverytype());
			pstmt.setString(11, productDTO.getPackingtype());
			pstmt.setString(12, productDTO.getSalesunit());
			pstmt.setString(13, productDTO.getWeight());
			pstmt.setString(14, productDTO.getOrigin());
			pstmt.setString(15, productDTO.getDescription());
			pstmt.setString(16, productDTO.getSalestate());
			pstmt.setString(17, productDTO.getIsdisplay());

			pstmt.setString(18, productDTO.getDetailimgname());
			pstmt.setString(19, productDTO.getDetailimgpath());
			pstmt.setInt(20, productDTO.getIdx());

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Update 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public boolean edit3Data(ProductDTO productDTO) {
		try {
			conn = Dbconn.getConnection();
			sql = "update  tb_product set  p_category1=?, p_category2=?, p_title=?, p_subtitle=?, p_brand=?, p_price=?, p_discprice=?, p_point=?, p_stock=?, p_deliverytype=?, p_packingtype=?, p_salesunit=?, p_weight=?, p_origin=?, p_description=?, p_salestate=?, p_isdisplay=?, p_imgname=?,p_imgpath=? where p_idx =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productDTO.getCategory1());
			pstmt.setString(2, productDTO.getCategory2());
			pstmt.setString(3, productDTO.getTitle());
			pstmt.setString(4, productDTO.getSubtitle());
			pstmt.setString(5, productDTO.getBrand());
			pstmt.setInt(6, productDTO.getPrice());
			pstmt.setInt(7, productDTO.getDiscprice());
			pstmt.setInt(8, productDTO.getPoint());
			pstmt.setInt(9, productDTO.getStock());
			pstmt.setString(10, productDTO.getDeliverytype());
			pstmt.setString(11, productDTO.getPackingtype());
			pstmt.setString(12, productDTO.getSalesunit());
			pstmt.setString(13, productDTO.getWeight());
			pstmt.setString(14, productDTO.getOrigin());
			pstmt.setString(15, productDTO.getDescription());
			pstmt.setString(16, productDTO.getSalestate());
			pstmt.setString(17, productDTO.getIsdisplay());

			pstmt.setString(18, productDTO.getImgname());
			pstmt.setString(19, productDTO.getImgpath());
			pstmt.setInt(20, productDTO.getIdx());

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Update 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public boolean edit4Data(int idx, String category1, String category2, String title, String subtitle, String brand,
			int price, int discprice, int point, int stock, String deliverytype, String packingtype, String salesunit,
			String weight, String origin, String description, String salestate, String isdisplay) {
		try {
			conn = Dbconn.getConnection();
			sql = "update  tb_product set  p_category1=?, p_category2=?, p_title=?, p_subtitle=?, p_brand=?, p_price=?, p_discprice=?, p_point=?, p_stock=?, p_deliverytype=?, p_packingtype=?, p_salesunit=?, p_weight=?, p_origin=?, p_description=?, p_salestate=?, p_isdisplay=? where p_idx =?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			pstmt.setString(3, title);
			pstmt.setString(4, subtitle);
			pstmt.setString(5, brand);
			pstmt.setInt(6, price);
			pstmt.setInt(7, discprice);
			pstmt.setInt(8, point);
			pstmt.setInt(9, stock);
			pstmt.setString(10, deliverytype);
			pstmt.setString(11, packingtype);
			pstmt.setString(12, salesunit);
			pstmt.setString(13, weight);
			pstmt.setString(14, origin);
			pstmt.setString(15, description);
			pstmt.setString(16, salestate);
			pstmt.setString(17, isdisplay);
			pstmt.setInt(18, idx);

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Update 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	// 전체 리스트 보기 (goods_list)
	public List<ProductDTO> selectList() {
		rs = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_product order by p_idx desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				productList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return productList;
	}

	// 카테고리별(대) 보기 (goods_list)
	public List<ProductDTO> categoryList1(String category1) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			System.out.println(category1);
			sql = "select * from tb_product where p_category1=? order by p_idx desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category1);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// 카테고리별(소) 보기 (goods_list)
	public List<ProductDTO> categoryList2(String category1, String category2) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			System.out.println(category1);
			System.out.println(category2);
			sql = "select * from tb_product where p_category1=? and p_category2=? order by p_idx desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// 검색 상품 보기 (goods_research)
	public List<ProductDTO> searchList(String sword) {
		List<ProductDTO> searchList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			System.out.println(sword);
			sql = "select * from tb_product where p_title like ? or p_subtitle like ? or  p_brand like ? or p_description like ? order by p_idx desc; ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%" + sword + "%");
			pstmt.setString(2, "%" + sword + "%");
			pstmt.setString(3, "%" + sword + "%");
			pstmt.setString(4, "%" + sword + "%");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				searchList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return searchList;
	}

	// 날짜최신순 보기 (신상품, new)
	public List<ProductDTO> newestList() {
		List<ProductDTO> newestList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_product order by p_regdate desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				newestList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return newestList;
	}

	// 낮은 가격순 보기 (알뜰쇼핑,sales)
	public List<ProductDTO> lowestList() {
		List<ProductDTO> lowestList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_product order by p_price";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				lowestList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return lowestList;
	}

	// 재고많은순 보기 (베스트)
	public List<ProductDTO> highstockList() {
		List<ProductDTO> highstockList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_product order by p_stock desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				highstockList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return highstockList;
	}

	// 주문보기 (goods_cart/goods_order)
	public List<ProductDTO> prodinfo(int bk_prodidx) {
		List<ProductDTO> productlist = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_idx=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, bk_prodidx);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				productlist.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return productlist;
	}

	// 검색 상품 보기 (admin_ordercheck)
	public List<ProductDTO> searchProdList(String datestart, String datefinish, String category1, String category2,
			String keyword, String searchword) {
		List<ProductDTO> searchList = new ArrayList<ProductDTO>();

		System.out.println("datestart:" + datestart);
		System.out.println("datefinish:" + datefinish);

		System.out.println("category1:" + category1);
		System.out.println("category2:" + category2);
		System.out.println("keyword:" + keyword);
		System.out.println("searchword:" + searchword);
		try {
			conn = Dbconn.getConnection();

			sql = "select * from  tb_product where 1=1";

			if ((category1 != null) && (category1 != "")) {
				sql += " AND p_category1 = '" + category1 + "' ";
			}

			if ((category2 != null) && (category2 != "")) {
				sql += " AND p_category2= '" + category2 + "' ";
			}

			if ((searchword != null) && (searchword != "")) {
				sql += " AND " + keyword + " like +'%" + searchword + "%' ";
			}

			if (((datestart != null) && (datestart != "")) && ((datefinish != null) && (datefinish != ""))) {
				sql += "AND DATE(p_regdate) BETWEEN '" + datestart + "' and '" + datefinish + "' ";
			}

			sql += " order by p_idx desc;";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setCategory1(rs.getString("p_category1"));
				productDTO.setCategory2(rs.getString("p_category2"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setPoint(rs.getInt("p_point"));
				productDTO.setStock(rs.getInt("p_stock"));
				productDTO.setDeliverytype(rs.getString("p_deliverytype"));
				productDTO.setPackingtype(rs.getString("p_packingtype"));
				productDTO.setSalesunit(rs.getString("p_salesunit"));
				productDTO.setWeight(rs.getString("p_weight"));
				productDTO.setOrigin(rs.getString("p_origin"));
				productDTO.setImgname(rs.getString("p_imgname"));
				productDTO.setImgpath(rs.getString("p_imgpath"));
				productDTO.setDescription(rs.getString("p_description"));
				productDTO.setSalestate(rs.getString("p_salestate"));
				productDTO.setIsdisplay(rs.getString("p_isdisplay"));

				searchList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return searchList;
	}

	// null null 1 (goods_list)
	public List<ProductDTO> sortList001() {
		rs = null;

		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product order by p_idx desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// null null 2 (goods_list)
	public List<ProductDTO> sortList002() {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product order by p_regdate desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// null null 3 (goods_list)
	public List<ProductDTO> sortList003() {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product order by p_stock desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// null null 4 (goods_list)
	public List<ProductDTO> sortList004() {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product order by p_discprice";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 null 1 (goods_list)
	public List<ProductDTO> sortList101(String category1) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? order by p_idx desc ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 null 2 (goods_list)
	public List<ProductDTO> sortList102(String category1) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? order by p_regdate desc ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 null 3 (goods_list)
	public List<ProductDTO> sortList103(String category1) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? order by p_stock desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 null 4 (goods_list)
	public List<ProductDTO> sortList104(String category1) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? order by p_discprice ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 cate2 1 (goods_list)
	public List<ProductDTO> sortList111(String category1, String category2) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? and p_category2=?  order by p_idx desc ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 cate2 2 (goods_list)
	public List<ProductDTO> sortList112(String category1, String category2) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? and p_category2=?  order by p_regdate desc ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 cate2 3 (goods_list)
	public List<ProductDTO> sortList113(String category1, String category2) {
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? and p_category2=?  order by p_stock desc ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// cate1 cate2 4 (goods_list)
	public List<ProductDTO> sortList114(String category1, String category2) {
		rs = null;
		List<ProductDTO> categoryList = new ArrayList<ProductDTO>();

		try {
			conn = Dbconn.getConnection();

			sql = "select * from tb_product where p_category1=? and p_category2=?  order by p_discprice ";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			pstmt.setString(2, category2);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ProductDTO productDTO = new ProductDTO();
				productDTO.setIdx(rs.getInt("p_idx"));
				productDTO.setTitle(rs.getString("p_title"));
				productDTO.setSubtitle(rs.getString("p_subtitle"));
				productDTO.setBrand(rs.getString("p_brand"));
				productDTO.setPrice(rs.getInt("p_price"));
				productDTO.setDiscprice(rs.getInt("p_discprice"));
				productDTO.setImgname(rs.getString("p_imgname"));

				categoryList.add(productDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}

	// 삭제 DELETE
	public boolean delete(int idx) {
		try {
			conn = Dbconn.getConnection();
			if (conn != null) {
				sql = "delete from tb_like where l_prodidx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				if (pstmt.executeUpdate() >= 1) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
