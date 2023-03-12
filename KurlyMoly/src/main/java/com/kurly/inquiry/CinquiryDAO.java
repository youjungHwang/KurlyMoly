package com.kurly.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class CinquiryDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String[] generatedColumns = { "tb_idx" };

	public boolean insertData(CinquiryDTO cinquiryDTO) {
		try {
			conn = Dbconn.getConnection();
			sql = "insert into tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename,ciq_isreply) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, cinquiryDTO.getAbout());
			pstmt.setInt(2, cinquiryDTO.getOrderidx());
			pstmt.setString(3, cinquiryDTO.getUserid());
			pstmt.setString(4, cinquiryDTO.getTitle());
			pstmt.setString(5, cinquiryDTO.getContent());
			pstmt.setString(6, cinquiryDTO.getFilename());
			pstmt.setString(7, cinquiryDTO.getIsreply());

			int result = pstmt.executeUpdate();

			try (ResultSet geneResultkey = pstmt.getGeneratedKeys();) {
				if (geneResultkey.next()) {
					cinquiryDTO.setIdx(geneResultkey.getInt(1));
					System.out.println(cinquiryDTO.getIdx());
				}
			}

			if (result >= 1) {
				System.out.println("Insert 성공");
				cinquiryDTO = this.updateFilePath(cinquiryDTO);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return false;
	}

	public CinquiryDTO updateFilePath(CinquiryDTO cinquiryDTO) {
		try {
			conn = Dbconn.getConnection();
			sql = "update tb_cinquiry set ciq_filepath=? where ciq_idx=?";
			pstmt = conn.prepareStatement(sql);
			String tmp = "/" + FileService.getToday() + "/" + cinquiryDTO.getFilename();
			cinquiryDTO.setFilepath(tmp);
			pstmt.setString(1, tmp);
			pstmt.setInt(2, cinquiryDTO.getIdx());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt);
		}
		return cinquiryDTO;
	}

	public List<CinquiryDTO> selectList() {
		List<CinquiryDTO> cinquiryList = new ArrayList<CinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_cinquiry order by ciq_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CinquiryDTO cinquiryDTO = new CinquiryDTO();
				cinquiryDTO.setIdx(rs.getInt("ciq_idx"));
				cinquiryDTO.setAbout(rs.getString("ciq_about"));
				cinquiryDTO.setOrderidx(rs.getInt("ciq_orderidx"));
				cinquiryDTO.setUserid(rs.getString("ciq_userid"));
				cinquiryDTO.setTitle(rs.getString("ciq_title"));
				cinquiryDTO.setContent(rs.getString("ciq_content"));
				cinquiryDTO.setFilename(rs.getString("ciq_filename"));
				cinquiryDTO.setFilepath(rs.getString("ciq_filepath"));
				cinquiryDTO.setInquirydate(rs.getString("ciq_inquirydate"));
				cinquiryDTO.setReply(rs.getString("ciq_reply"));
				cinquiryDTO.setReplydate(rs.getString("ciq_replydate"));

				cinquiryDTO.setIsreply(rs.getString("ciq_isreply"));

				cinquiryList.add(cinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return cinquiryList;
	}

	public List<CinquiryDTO> selectMemList(String userid_as) {
		List<CinquiryDTO> cinquiryList = new ArrayList<CinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select * from tb_cinquiry where ciq_userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid_as);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CinquiryDTO cinquiryDTO = new CinquiryDTO();
				cinquiryDTO.setIdx(rs.getInt("ciq_idx"));
				cinquiryDTO.setAbout(rs.getString("ciq_about"));
				cinquiryDTO.setOrderidx(rs.getInt("ciq_orderidx"));
				cinquiryDTO.setUserid(rs.getString("ciq_userid"));
				cinquiryDTO.setTitle(rs.getString("ciq_title"));
				cinquiryDTO.setContent(rs.getString("ciq_content"));
				cinquiryDTO.setFilename(rs.getString("ciq_filename"));
				cinquiryDTO.setFilepath(rs.getString("ciq_filepath"));
				cinquiryDTO.setInquirydate(rs.getString("ciq_inquirydate"));
				cinquiryDTO.setReply(rs.getString("ciq_reply"));
				cinquiryDTO.setReplydate(rs.getString("ciq_replydate"));

				cinquiryDTO.setIsreply(rs.getString("ciq_isreply"));

				cinquiryList.add(cinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return cinquiryList;
	}

	public List<CinquiryDTO> noreplyList() {
		List<CinquiryDTO> noreplyList = new ArrayList<CinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select ciq_idx from tb_cinquiry where ciq_isreply like '미답변' order by ciq_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CinquiryDTO cinquiryDTO = new CinquiryDTO();
				cinquiryDTO.setIdx(rs.getInt("ciq_idx"));

				noreplyList.add(cinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return noreplyList;
	}

	public List<CinquiryDTO> replyList() {
		List<CinquiryDTO> replyList = new ArrayList<CinquiryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select ciq_idx from tb_cinquiry where ciq_isreply like '답변완료' order by ciq_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CinquiryDTO cinquiryDTO = new CinquiryDTO();
				cinquiryDTO.setIdx(rs.getInt("ciq_idx"));

				replyList.add(cinquiryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return replyList;
	}

}
