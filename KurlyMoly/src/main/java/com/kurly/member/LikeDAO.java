package com.kurly.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kurly.db.Dbconn;
import com.kurly.db.SqlMapConfig;

public class LikeDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<LikeDTO> likeList = new ArrayList<>();
	String sql = "";

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public LikeDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit 됨
		System.out.println("마이바티스 설정 성공!");
	}

	// 찜 목록 추가
	public boolean insertLike(String lUserid, int lIdx) {
		try {
			conn = Dbconn.getConnection();
			sql = "INSERT INTO tb_like(l_userid, l_prodidx) VALUES (?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lUserid); // 사용자아이디
			pstmt.setInt(2, lIdx); // 상품 idx

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
}
