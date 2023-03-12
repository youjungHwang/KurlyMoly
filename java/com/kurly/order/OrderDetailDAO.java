package com.kurly.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class OrderDetailDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	public boolean insertData(Integer od_orderidx, Integer od_productidx, Integer od_quantity, String od_deliverytype) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_orderdetail (od_orderidx, od_productidx, od_quantity, od_deliverytype) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, od_orderidx);
			pstmt.setInt(2, od_productidx);
			pstmt.setInt(3, od_quantity);
			pstmt.setString(4, od_deliverytype);

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("tb_orderdetail Insert 성공");

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public int selectLastOidx() {
		int od_orderidx = 0;
		try {

			conn = Dbconn.getConnection();
			sql = "SELECT o_idx FROM tb_order ORDER BY o_paiddate DESC limit 1 "; // tb_order의 마지막 주문번호(oidx) 가져오기.
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				od_orderidx = rs.getInt("o_idx");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return od_orderidx;

	}

	// mypage > review.jsp (주문상세내역 가져오기) (HYJ) - orderdetail은 userid가 없음.
	public List<OrderDetailDTO> selectOrderDetail(int o_idx) {

		List<OrderDetailDTO> orderDetailList = new ArrayList<OrderDetailDTO>();
		System.out.println("o_idx : " + o_idx);
		try {

			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_orderdetail where od_orderidx =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o_idx); // od_orderidx와 o_idx 같은지 확인
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDetailDTO orderDetail = new OrderDetailDTO();
				orderDetail.setOdIdx(rs.getInt("od_idx"));
				orderDetail.setOdOrderidx(rs.getInt("od_orderidx"));
				orderDetail.setOdProductidx(rs.getInt("od_productidx"));
				orderDetail.setOdQuantity(rs.getInt("od_quantity"));
				orderDetail.setOdDeliverytype(rs.getString("od_deliverytype"));
				orderDetail.setOdShipnumber(rs.getString("od_shipnumber"));
				orderDetail.setOdShipstart(rs.getString("od_shipstart"));
				orderDetail.setOdShipdone(rs.getString("od_shipdone"));
				orderDetail.setOdShipstate(rs.getString("od_shipstate"));
				orderDetail.setOdRenewdate(rs.getString("od_renewdate"));

				orderDetailList.add(orderDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderDetailList;

	}

}
