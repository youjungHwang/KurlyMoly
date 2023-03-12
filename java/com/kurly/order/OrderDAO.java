package com.kurly.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class OrderDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	public boolean insertData(String oUserid, String oOrderer, String oReceiver, String oTel, String oZipcode,
			String oAddress1, String oAddress2, String oAddress3, String oAddress4, Integer oProdamount,
			Integer oDiscount, Integer oUsecoupon, Integer oUsepoint, Integer oDeliveryfee, Integer oAmountpaid,
			Integer oAddpoint, String oPaidtype, String oShipstate) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_order (o_userid, o_orderer, o_receiver, o_tel, "
					+ "o_zipcode, o_address1, o_address2, o_address3, o_address4, "
					+ "o_prodamount, o_discount, o_usecoupon, o_usepoint, o_deliveryfee, "
					+ "o_amountpaid, o_addpoint, o_paidtype, o_shipstate) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oUserid);
			pstmt.setString(2, oOrderer);
			pstmt.setString(3, oReceiver);
			pstmt.setString(4, oTel);
			pstmt.setString(5, oZipcode);
			pstmt.setString(6, oAddress1);
			pstmt.setString(7, oAddress2);
			pstmt.setString(8, oAddress3);
			pstmt.setString(9, oAddress4);
			pstmt.setInt(10, oProdamount);
			pstmt.setInt(11, oDiscount);
			pstmt.setInt(12, oUsecoupon);
			pstmt.setInt(13, oUsepoint);
			pstmt.setInt(14, oDeliveryfee);
			pstmt.setInt(15, oAmountpaid);
			pstmt.setInt(16, oAddpoint);
			pstmt.setString(17, oPaidtype);
			pstmt.setString(18, oShipstate);

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("tb_order Insert 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}


	// mypage > review.jsp (주문내역 가져오기) (HYJ)
	public List<OrderDTO> selectAllOrder() {
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_order ORDER BY o_idx DESC";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO order = new OrderDTO();
				order.setoIdx(rs.getInt("o_idx"));
				order.setoUserid(rs.getString("o_userid"));
				order.setoOrderer(rs.getString("o_orderer"));
				order.setoReceiver(rs.getString("o_receiver"));
				order.setoTel(rs.getString("o_tel"));
				order.setoZipcode(rs.getString("o_zipcode"));
				order.setoAddress1(rs.getString("o_address1"));
				order.setoAddress2(rs.getString("o_address2"));
				order.setoAddress3(rs.getString("o_address3"));
				order.setoAddress4(rs.getString("o_address4"));
				order.setoProdamount(rs.getInt("o_prodamount"));
				order.setoDiscount(rs.getInt("o_discount"));
				order.setoUsecoupon(rs.getInt("o_usecoupon"));
				order.setoUsepoint(rs.getInt("o_usepoint"));
				order.setoDeliveryfee(rs.getInt("o_deliveryfee"));
				order.setoAmountpaid(rs.getInt("o_amountpaid"));
				order.setoAddpoint(rs.getInt("o_addpoint"));
				order.setoPaidtype(rs.getString("o_paidtype"));
				order.setoPaiddate(rs.getString("o_paiddate"));
				order.setoShipnumber(rs.getString("o_shipnumber"));
				order.setoShipstart(rs.getString("o_shipstart"));
				order.setoShipdone(rs.getString("o_shipdone"));
				order.setoShipstate(rs.getString("o_shipstate"));
				order.setoRenewdate(rs.getString("o_renewdate"));

				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	
	
	// mypage > review.jsp (주문내역 가져오기) (HYJ)
	public List<OrderDTO> selectOrder(String userid) {
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_order where o_userid=? ORDER BY o_idx DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO order = new OrderDTO();
				order.setoIdx(rs.getInt("o_idx"));
				order.setoUserid(rs.getString("o_userid"));
				order.setoOrderer(rs.getString("o_orderer"));
				order.setoReceiver(rs.getString("o_receiver"));
				order.setoTel(rs.getString("o_tel"));
				order.setoZipcode(rs.getString("o_zipcode"));
				order.setoAddress1(rs.getString("o_address1"));
				order.setoAddress2(rs.getString("o_address2"));
				order.setoAddress3(rs.getString("o_address3"));
				order.setoAddress4(rs.getString("o_address4"));
				order.setoProdamount(rs.getInt("o_prodamount"));
				order.setoDiscount(rs.getInt("o_discount"));
				order.setoUsecoupon(rs.getInt("o_usecoupon"));
				order.setoUsepoint(rs.getInt("o_usepoint"));
				order.setoDeliveryfee(rs.getInt("o_deliveryfee"));
				order.setoAmountpaid(rs.getInt("o_amountpaid"));
				order.setoAddpoint(rs.getInt("o_addpoint"));
				order.setoPaidtype(rs.getString("o_paidtype"));
				order.setoPaiddate(rs.getString("o_paiddate").substring(0, 10));
				order.setoShipnumber(rs.getString("o_shipnumber"));
				order.setoShipstart(rs.getString("o_shipstart"));
				order.setoShipdone(rs.getString("o_shipdone"));
				order.setoShipstate(rs.getString("o_shipstate"));
				order.setoRenewdate(rs.getString("o_renewdate"));

				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	

	// 검색 상품 보기 (admin_ordercheck)
	public List<OrderDTO> searchOrderList(String duration, String datestart,String datefinish,String keyword,String searchword ) {
		List<OrderDTO> searchList = new ArrayList<OrderDTO>();
			System.out.println("duration:"+duration);
			System.out.println("datestart:"+datestart);
			System.out.println("datefinish:"+datefinish);
			System.out.println("keyword:"+keyword);
			System.out.println("searchword:"+searchword);	
		try {
			conn = Dbconn.getConnection();
			if(((datestart != null)&&(datestart != ""))&&((datefinish != null)&&(datefinish != ""))&&((searchword !=null)&&(searchword !=""))) {
			System.out.println("duration /searchword 검색");
			
			sql = "select * from tb_order where " + keyword+ " like ? and DATE(" + duration+ ") BETWEEN ? and ? order by o_idx desc; ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  "%" + searchword + "%" );
			pstmt.setString(2,  datestart);
			pstmt.setString(3,  datefinish );

			
		}else if (((datestart == null)||(datestart == "")||(datefinish == null)||(datefinish == "") )&&((searchword !=null)&&(searchword != ""))) {
				System.out.println("searchword 검색");
				
				sql = "select * from tb_order where " +  keyword+ " like ? order by o_idx desc; ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + searchword + "%");
				
		
			}else if(((datestart != null)&&(datestart != ""))&&((datefinish != null)&&(datefinish != ""))&&((searchword ==null)||(searchword ==""))) { 
				System.out.println("duration  검색");
				
				sql = "select * from tb_order where DATE(" + duration+ ") BETWEEN ? and ? order by o_idx desc; ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, datestart);
				pstmt.setString(2, datefinish);
				
			}else {
				System.out.println("전체 검색");
				sql = "select * from tb_order order by o_idx desc; ";
				pstmt = conn.prepareStatement(sql);
			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				OrderDTO order = new OrderDTO();
				order.setoIdx(rs.getInt("o_idx"));
				order.setoUserid(rs.getString("o_userid"));
				order.setoOrderer(rs.getString("o_orderer"));
				order.setoReceiver(rs.getString("o_receiver"));
				order.setoTel(rs.getString("o_tel"));
				order.setoZipcode(rs.getString("o_zipcode"));
				order.setoAddress1(rs.getString("o_address1"));
				order.setoAddress2(rs.getString("o_address2"));
				order.setoAddress3(rs.getString("o_address3"));
				order.setoAddress4(rs.getString("o_address4"));
				order.setoProdamount(rs.getInt("o_prodamount"));
				order.setoDiscount(rs.getInt("o_discount"));
				order.setoUsecoupon(rs.getInt("o_usecoupon"));
				order.setoUsepoint(rs.getInt("o_usepoint"));
				order.setoDeliveryfee(rs.getInt("o_deliveryfee"));
				order.setoAmountpaid(rs.getInt("o_amountpaid"));
				order.setoAddpoint(rs.getInt("o_addpoint"));
				order.setoPaidtype(rs.getString("o_paidtype"));
				order.setoPaiddate(rs.getString("o_paiddate"));
				order.setoShipnumber(rs.getString("o_shipnumber"));
				order.setoShipstart(rs.getString("o_shipstart"));
				order.setoShipdone(rs.getString("o_shipdone"));
				order.setoShipstate(rs.getString("o_shipstate"));
				order.setoRenewdate(rs.getString("o_renewdate"));
				searchList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return searchList;
	}
	
	
	
	
}
