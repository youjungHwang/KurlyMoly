package com.kurly.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class ReviewimgDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<ReviewimgDTO> reviewimgList = new ArrayList<>();
	String sql = "";

	public List<ReviewimgDTO> selectReviewimg() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_reviewimg ORDER BY rvd_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewimgDTO reviewimgDetail = new ReviewimgDTO();
				reviewimgDetail.setRvdIdx(rs.getLong("rvd_idx"));
				reviewimgDetail.setRvdRvidx(rs.getLong("rvd_rvidx"));
				reviewimgDetail.setRvdFile(rs.getString("rvd_file"));
				
				reviewimgList.add(reviewimgDetail);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return reviewimgList;
	}

}
