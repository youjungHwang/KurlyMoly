package com.kurly.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class ClaimDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<ClaimDTO> claimList = new ArrayList<>();
	String sql = "";

	public List<ClaimDTO> selectClaim() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_claim ORDER BY c_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClaimDTO claimDetail = new ClaimDTO();
				claimDetail.setcIdx(rs.getLong("c_idx"));
				claimDetail.setcOrderidx(rs.getLong("c_orderidx"));
				claimDetail.setcClaimtype(rs.getLong("c_claimtype"));
				claimDetail.setcClaimwhy(rs.getString("c_claimwhy"));
				claimDetail.setcClaimdate(rs.getString("c_claimdate"));
				claimDetail.setcState(rs.getString("c_state"));
				claimDetail.setcStatedate(rs.getString("c_statedate"));
				claimDetail.setcRefusalwhy(rs.getString("c_refusalwhy"));
				
				claimList.add(claimDetail);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return claimList;
	}
}
