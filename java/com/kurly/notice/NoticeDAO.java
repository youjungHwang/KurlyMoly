package com.kurly.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kurly.db.Dbconn;
import com.kurly.db.SqlMapConfig;

public class NoticeDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	List<NoticeDTO> noticeList = new ArrayList<>();

	public NoticeDAO() {
		sqlsession = ssf.openSession(true); // openSession(true) 설정시 자동 commit
		System.out.println("마이바티스 설정 성공!");
	}

	// noticeadd()
	public int noticeadd(NoticeDTO notice) {
		HashMap<String, String> dataMap = new HashMap<>();

		dataMap.put("n_title", notice.getTitle());
		dataMap.put("n_content", notice.getContent());
		dataMap.put("n_isimpt", notice.getIsimpt());
		dataMap.put("n_isdisplay", notice.getIsdisplay());

		return sqlsession.insert("Notice.noticeadd", dataMap);
	}

	// 페이징 count() - admin_noticelist.jsp
	public int count() {
		int cnt = 0;
		return sqlsession.selectOne("Notice.totalCount");
	}

	public List<NoticeDTO> selectList(int pagePerCount, int start) {
		HashMap<String, Integer> dataMap = new HashMap<>();
		dataMap.put("pagePerCount", pagePerCount);
		dataMap.put("start", start);
		noticeList = sqlsession.selectList("Notice.selectList", dataMap);
		System.out.println(noticeList.size());
		return noticeList;
	}

	// list -> view 데이터 넘기기 - admin_noticeview.jsp
	public NoticeDTO selectView(int idx) {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO = sqlsession.selectOne("Notice.selectView", idx);
		return noticeDTO;
	}

	// delete - admin_noticedelete.jsp
	public boolean delete(int idx) {
		if (conn != null) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO = sqlsession.selectOne("Notice.delete", idx);
		}
		return true;
	}

	// edit - admin_noticeedit_ok.jsp
	public int edit(NoticeDTO notice) {
		HashMap<String, String> dataMap = new HashMap<>();

		dataMap.put("n_title", notice.getTitle());
		dataMap.put("n_content", notice.getContent());

		return sqlsession.update("Notice.edit", dataMap);
	}

	// 홈페이지 공지사항 select(HYJ) -- 추가함
	public List<NoticeDTO> selectNotice() {
		List<NoticeDTO> selectList = new ArrayList<>();

		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_notice ORDER BY n_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeDTO noticeDetail = new NoticeDTO();
				noticeDetail.setIdx(rs.getInt("n_idx"));
				noticeDetail.setTitle(rs.getString("n_title"));
				noticeDetail.setContent(rs.getString("n_content"));
				noticeDetail.setHit(rs.getInt("n_hit"));
				noticeDetail.setIsdisplay(rs.getString("n_isdisplay"));
				noticeDetail.setIsimpt(rs.getString("n_isimpt"));
				noticeDetail.setRegdate(rs.getString("n_regdate").substring(0, 10));
				selectList.add(noticeDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectList;
	}

	public boolean admindelete(int idx) {
		try {
			conn = Dbconn.getConnection();
			if (conn != null) {
				sql = "delete from tb_notice where n_idx=?";
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

	public boolean view(int idx) {
		try {
			conn = Dbconn.getConnection();
			if (conn != null) {
				sql = "select from tb_notice where n_idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					String n_title = rs.getString("n_title");
					String n_content = rs.getString("n_content");

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public NoticeDTO viewNotice(int idx) {
		NoticeDTO board = new NoticeDTO();
		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_notice where n_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board.setTitle(rs.getString("n_title"));
				board.setContent(rs.getString("n_content"));
				board.setHit(rs.getInt("n_hit"));
				board.setIsimpt(rs.getString("n_isimpt"));
				board.setIsdisplay(rs.getString("n_isdisplay"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}

}
