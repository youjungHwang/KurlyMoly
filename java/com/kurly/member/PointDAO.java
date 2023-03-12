package com.kurly.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class PointDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<PointDTO> pointList = new ArrayList<>();
	String sql = "";

	public int sum(int po_memidx) {

		int sum = 0;
		try {

			conn = Dbconn.getConnection();
			sql = "SELECT SUM(po_points) as total FROM tb_point where po_type ='적립' AND po_memidx =?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, po_memidx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum = rs.getInt("total");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}

	public int sum2(int po_memidx) {

		int sum2 = 0;
		try {

			conn = Dbconn.getConnection();
			sql = "SELECT SUM(po_points) as total FROM tb_point where po_type ='사용' AND po_memidx =?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, po_memidx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sum2 = rs.getInt("total");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum2;
	}

	public int sum_duepoint(int po_memidx) {

		int sumDuepoint = 0;
		try {

			conn = Dbconn.getConnection();
			sql = "SELECT sum(po_duepoints) as total  FROM tb_point where po_type ='적립' AND po_memidx =?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, po_memidx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sumDuepoint = rs.getInt("total");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sumDuepoint;
	}
}
