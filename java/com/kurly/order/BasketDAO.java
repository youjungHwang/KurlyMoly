package com.kurly.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class BasketDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<BasketDTO> basketList = new ArrayList<>();
	String sql = "";

	public List<BasketDTO> selectBasket() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_basket ORDER BY bk_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BasketDTO basketDetail = new BasketDTO();
				basketDetail.setBkIdx(rs.getInt("bkIdx"));
				basketDetail.setBkUserid(rs.getString("bkUserid"));
				basketDetail.setBkProdidx(rs.getInt("bkProdidx"));
				basketDetail.setBkQuantity(rs.getInt("bkQuantity"));
				basketDetail.setBkRegdate(rs.getString("bkRegdate"));

				basketList.add(basketDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return basketList;
	}

	public boolean insertBasket(String bkUserid, int bkProdidx, int bkQuantity) {
		try {
			conn = Dbconn.getConnection();
			sql = "INSERT INTO tb_basket(bk_userid, bk_prodidx, bk_quantity) values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bkUserid); // 사용자 idx
			pstmt.setInt(2, bkProdidx); // 상품 idx
			pstmt.setInt(3, bkQuantity); // 수량

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Insert 성공!!!");
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	// 주문서 userid 개인정보 불러오기
	public List<BasketDTO> basketinfo(String userid) {
		List<BasketDTO> basketinfolist = new ArrayList<BasketDTO>();

		try {
			conn = Dbconn.getConnection();
			System.out.println(userid);
			sql = "select * from tb_basket where bk_userid=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				BasketDTO basket = new BasketDTO();
				basket.setBkIdx(rs.getInt("bk_idx"));
				basket.setBkUserid(rs.getString("bk_userid"));
				basket.setBkProdidx(rs.getInt("bk_prodidx"));
				basket.setBkQuantity(rs.getInt("bk_quantity"));
				basket.setBkRegdate(rs.getString("bk_regdate"));

				basketinfolist.add(basket);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return basketinfolist;
	}

	// 삭제 DELETE
	public boolean delete(int idx) {
		try {
			conn = Dbconn.getConnection();
			if (conn != null) {
				sql = "delete from tb_basket where bk_prodidx=?";
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

	// 수량업데이트
	public boolean amountUpdate(int amount, int idx) {
		try {
			conn = Dbconn.getConnection();
			if (conn != null) {
				sql = "Update tb_basket set bk_quantity=? where bk_prodidx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, amount);
				pstmt.setInt(2, idx);
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
