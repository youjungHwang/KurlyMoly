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
	List<OrderDetailDTO> orderDetailList = new ArrayList<>();
	String sql = "";

	public List<OrderDetailDTO> selectOrderDetail() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_orderdetail ORDER BY od_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDetailDTO orderDetail = new OrderDetailDTO();
				orderDetail.setOdIdx(rs.getLong("od_idx"));
				orderDetail.setOdOrderidx(rs.getLong("od_orderidx"));
				orderDetail.setOdProductidx(rs.getLong("od_productidx"));
				orderDetail.setOdQuantity(rs.getInt("od_quantity"));
				orderDetail.setOdDeliverytype(rs.getString("od_deliverytype"));
				orderDetail.setOdShipnumber(rs.getString("od_shipnumber"));
				orderDetail.setOdShipstart(rs.getString("od_shipstart"));
				orderDetail.setOdShipdone(rs.getString("od_shipdone"));
				orderDetail.setOdShipstate(rs.getString("od_shipstate"));
				orderDetail.setOdRenewdate(rs.getString("od_renewdate"));
				
				orderDetailList.add(orderDetail);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return orderDetailList;
	}
}
