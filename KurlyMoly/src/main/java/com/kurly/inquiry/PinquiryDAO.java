package com.kurly.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class PinquiryDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<PinquiryDTO> pinquiryList = new ArrayList<>();
	String sql = "";

	public boolean insertData(Integer prodidx, String userid, String issecret, String title, String content,
			String isreply) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_isreply) values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodidx);
			pstmt.setString(2, userid);
			pstmt.setString(3, issecret);
			pstmt.setString(4, title);
			pstmt.setString(5, content);
			pstmt.setString(6, isreply);

			int result = pstmt.executeUpdate();

			if (result >= 1) {
				System.out.println("Insert 성공");
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public List<PinquiryDTO> selectList() {
		List<PinquiryDTO> pinquiryList = new ArrayList<PinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_pinquiry order by piq_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PinquiryDTO pinquiryDTO = new PinquiryDTO();
				pinquiryDTO.setIdx(rs.getInt("piq_idx"));
				pinquiryDTO.setProdidx(rs.getInt("piq_prodidx"));
				pinquiryDTO.setUserid(rs.getString("piq_userid"));
				pinquiryDTO.setTitle(rs.getString("piq_title"));
				pinquiryDTO.setContent(rs.getString("piq_content"));
				pinquiryDTO.setIssecret(rs.getString("piq_issecret"));
				pinquiryDTO.setReply(rs.getString("piq_reply"));
				pinquiryDTO.setInquirydate(rs.getString("piq_inquirydate"));
				pinquiryDTO.setReplydate(rs.getString("piq_replydate"));
				pinquiryDTO.setIsreply(rs.getString("piq_isreply"));

				pinquiryList.add(pinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return pinquiryList;
	}

	public List<PinquiryDTO> noreplyList() {
		List<PinquiryDTO> noreplyList = new ArrayList<PinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select piq_idx from tb_pinquiry where piq_isreply like '미답변' order by piq_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PinquiryDTO pinquiryDTO = new PinquiryDTO();
				pinquiryDTO.setIdx(rs.getInt("piq_idx"));

				noreplyList.add(pinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return noreplyList;
	}

	public List<PinquiryDTO> replyList() {
		List<PinquiryDTO> replyList = new ArrayList<PinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select piq_idx from tb_pinquiry where piq_isreply like '답변완료' order by piq_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PinquiryDTO pinquiryDTO = new PinquiryDTO();
				pinquiryDTO.setIdx(rs.getInt("piq_idx"));

				replyList.add(pinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return replyList;
	}	   

	public List<PinquiryDTO> selectPinquiry() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_pinquiry ORDER BY piq_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PinquiryDTO pinquiryDetail = new PinquiryDTO();
				pinquiryDetail.setIdx(rs.getInt("piq_idx"));
				pinquiryDetail.setProdidx(rs.getInt("piq_prodidx"));
				pinquiryDetail.setUserid(rs.getString("piq_userid"));
				pinquiryDetail.setIssecret(rs.getString("piq_issecret"));
				pinquiryDetail.setTitle(rs.getString("piq_title"));
				pinquiryDetail.setContent(rs.getString("piq_content"));
				pinquiryDetail.setInquirydate(rs.getString("piq_inquirydate").substring(0, 10));
				pinquiryDetail.setReply(rs.getString("piq_reply"));
				pinquiryDetail.setReplydate(rs.getString("piq_replydate").substring(0, 10));
				pinquiryDetail.setIsreply(rs.getString("piq_isreply"));

				pinquiryList.add(pinquiryDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pinquiryList;
	}

}
