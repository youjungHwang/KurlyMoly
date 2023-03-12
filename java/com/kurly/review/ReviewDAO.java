package com.kurly.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class ReviewDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	public List<ReviewDTO> selectReview() {
		List<ReviewDTO> reviewList = new ArrayList<>();

		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_review ORDER BY rv_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewDTO reviewDetail = new ReviewDTO();
				reviewDetail.setRvIdx(rs.getLong("rv_idx"));
				reviewDetail.setRvProductidx(rs.getInt("rv_productidx"));
				reviewDetail.setRvUserid(rs.getString("rv_userid"));
				reviewDetail.setRvTitle(rs.getString("rv_title"));
				reviewDetail.setRvContent(rs.getString("rv_content"));
				reviewDetail.setRvHelped(rs.getInt("rv_helped"));
				reviewDetail.setRvRegdate(rs.getString("rv_regdate").substring(0, 10));

				reviewList.add(reviewDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	}

	// mypage > 상품후기 글등록(HYJ)
	public int insertData(ReviewDTO review) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_review (rv_productidx, rv_userid, rv_title, rv_content) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getRvProductidx());
			pstmt.setString(2, review.getRvUserid());
			pstmt.setString(3, review.getRvTitle());
			pstmt.setString(4, review.getRvContent());

			if (pstmt.executeUpdate() != 0) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// mypage > 상품후기 글등록(HYJ)
	public int insertDataImg(ReviewDTO review) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_imgname) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review.getRvProductidx());
			pstmt.setString(2, review.getRvUserid());
			pstmt.setString(3, review.getRvTitle());
			pstmt.setString(4, review.getRvContent());
			pstmt.setString(5, review.getRvImgname());

			if (pstmt.executeUpdate() != 0) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
