package com.kurly.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class CouponDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<CouponDTO> couponList = new ArrayList<>();
	String sql = "";

	public List<CouponDTO> selectCoupon() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_coupon ORDER BY cp_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CouponDTO couponDetail = new CouponDTO();
				couponDetail.setCpIdx(rs.getInt("cpIdx"));
				couponDetail.setCpMemidx(rs.getInt("cpMemidx"));
				couponDetail.setCpCode(rs.getInt("cpCode"));
				couponDetail.setCpName(rs.getString("cpName"));
				couponDetail.setCpDetails(rs.getString("cpDetails"));
				couponDetail.setCpAmount(rs.getInt("cpAmount"));
				couponDetail.setCpRegdate(rs.getString("cpRegdate"));
				couponDetail.setCpDuedate(rs.getString("cpDuedate"));
				couponDetail.setCpIsused(rs.getInt("cpIsused"));

				couponList.add(couponDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return couponList;
	}

	// 정보 조회
	public CouponDTO info(CouponDTO coupon) {
		sql = "SELECT * FROM tb_coupon WHERE cp_memidx = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, coupon.getCpMemidx());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				coupon.setCpIdx(rs.getInt("cp_idx")); // 회원번호
				coupon.setCpCode(rs.getInt("cp_code")); // 쿠폰코드
				coupon.setCpName(rs.getString("cp_name")); // 쿠폰명
				coupon.setCpDetails(rs.getString("cp_details")); // 쿠폰발급사유
				coupon.setCpAmount(rs.getInt("cp_amount")); // 쿠폰 금액
				coupon.setCpRegdate(rs.getString("cp_regdate")); // 발급일시
				coupon.setCpDuedate(rs.getString("cp_duedate")); // 만료일시
				coupon.setCpIsused(rs.getInt("cp_isused")); // 사용여부 0:미사용/1:사용
				return coupon;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 쿠폰 수량 카운트
	public int count(int cp_memidx) {
		int total2 = 0;

		try {

			conn = Dbconn.getConnection();
			sql = "SELECT COUNT(*) as total  FROM tb_coupon                   where cp_isused = 0 AND cp_memidx =?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cp_memidx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total2 = rs.getInt("total");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total2;
	}

}
