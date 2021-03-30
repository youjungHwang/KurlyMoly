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
import com.kurly.order.OrderDTO;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<MemberDTO> memberList = new ArrayList<>();
	String sql = "";

	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public List<MemberDTO> selectMember() {
		try {
			conn = Dbconn.getConnection();
			sql = "SELECT * FROM tb_member ORDER BY m_idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member= new MemberDTO();
				member.setmIdx(rs.getInt("m_idx"));
				member.setmUserid(rs.getString("m_userid"));
				member.setmPassword(rs.getString("m_password"));
				member.setmName(rs.getString("m_name"));
				member.setmTel(rs.getString("m_tel"));
				member.setmEmail(rs.getString("m_email"));
				member.setmBirth(rs.getString("m_birth"));
				member.setmGender(rs.getString("m_gender"));
				member.setmZipcode(rs.getString("m_zipcode"));
				member.setmAddress1(rs.getString("m_address1"));
				member.setmAddress2(rs.getString("m_address2"));
				member.setmRecomid(rs.getString("m_recomid"));
				member.setmRegdate(rs.getString("m_regdate"));
				member.setmMembership(rs.getString("m_membership"));
				member.setmKurlypass(rs.getString("m_kurlypass"));
				member.setmState(rs.getInt("m_state"));
				member.setmWithdrawwhy(rs.getString("m_withdrawwhy"));
				member.setmWithdrawwhy2(rs.getString("m_withdrawwhy2"));
				member.setmWithdrawdate(rs.getString("m_withdrawdate"));
				
				memberList.add(member);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
	// 회원가입
	public int join(MemberDTO member) {
		try {
			sql = "INSERT INTO tb_member(m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			conn = Dbconn.getConnection(); // DB연결
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getmUserid()); // 아이디
			pstmt.setString(2, member.getmPassword()); // 비밀번호
			pstmt.setString(3, member.getmName()); // 이름
			pstmt.setString(4, member.getmTel()); // 연락처
			pstmt.setString(5, member.getmEmail()); // 이메일
			pstmt.setString(6, member.getmBirth()); // 생년월일
			pstmt.setString(7, member.getmGender()); // 성별
			pstmt.setString(8, member.getmZipcode()); // 우편번호
			pstmt.setString(9, member.getmAddress1()); // 주소
			pstmt.setString(10, member.getmAddress2()); // 상세주소
			pstmt.setString(11, member.getmRecomid()); // 추천인
			pstmt.setString(12, member.getmRegdate()); // 등록일자
			pstmt.setString(13, member.getmMembership()); // 멤버십
			pstmt.setString(14, member.getmKurlypass()); // 컬리패스 (가입/비가입)
			pstmt.setInt(15, member.getmState()); // 회원상태 (1: 일반, 2: 탈퇴, 9: 관리자)
			pstmt.setString(16, member.getmWithdrawwhy()); // 불편사항 선택
			pstmt.setString(17, member.getmWithdrawwhy2()); // 불편사항 기타내용 (직접입력)
			pstmt.setString(18, member.getmWithdrawdate()); // 탈퇴일시

			if (pstmt.executeUpdate() != 0) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 로그인
	public MemberDTO login(MemberDTO member) {
		sql = "SELECT m_idx, m_userid, m_name FROM tb_member WHERE m_userid=? AND m_password=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getmUserid());
			pstmt.setString(2, member.getmPassword());
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member.setmIdx(rs.getInt("m_idx"));
				member.setmUserid(rs.getString("m_userid"));
				member.setmName(rs.getString("m_name"));
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 정보 조회
	public MemberDTO info(MemberDTO member) {
		sql = "SELECT * FROM tb_member WHERE m_idx = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getmIdx());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setmName(rs.getString("m_name"));
				member.setmEmail(rs.getString("m_email"));
				member.setmTel(rs.getString("m_tel"));
				member.setmZipcode(rs.getString("m_zipcode"));
				member.setmAddress1(rs.getString("m_address1"));
				member.setmAddress2(rs.getString("m_address2"));
				member.setmGender(rs.getString("m_gender"));
				member.setmBirth(rs.getString("m_birth"));
				member.setmRecomid(rs.getString("m_recomid"));
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 정보 수정
	public int edit(MemberDTO member) {
		try {
			sql = "UPDATE tb_member SET m_password=?, m_name=?, m_email=?, m_tel=?, m_gender=?, m_birth=?, m_recomid=? WHERE m_userid=?";
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getmPassword());
			pstmt.setString(2, member.getmName());
			pstmt.setString(3, member.getmEmail());
			pstmt.setString(4, member.getmTel());
			pstmt.setString(5, member.getmGender());
			pstmt.setString(6, member.getmBirth());
			pstmt.setString(7, member.getmRecomid());
			pstmt.setString(8, member.getmUserid());
			
			if(pstmt.executeUpdate() >= 1) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 아이디 체크
	public boolean idCheck(String userid) {
		if ((Integer) sqlsession.selectOne("Member.idCheck", userid) == 1) {
			// integer 형태로 (mapper namespace="Member")idCheck 값을 가져올 건데, 그 곳에 userid 값을 넣어라.
			// 그런데 그 값이 1인가? 그렇다면 true 리턴
			return true; // 아이디 중복. 가입 불가능
		}
		return false; // 아이디 중복 없음. 가입 가능
	}
	
	// pw 체크
	public boolean pwCheck(MemberDTO member) {
		sql = "SELECT m_idx FROM tb_member WHERE m_idx = ? and m_password = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getmIdx());
			pstmt.setString(2, member.getmPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	   
	   
	// 이메일 체크
	public boolean emailCheck(MemberDTO member) {
		sql = "SELECT m_idx FROM tb_member WHERE m_idx = ? and m_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getmIdx());
			pstmt.setString(2, member.getmEmail());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
