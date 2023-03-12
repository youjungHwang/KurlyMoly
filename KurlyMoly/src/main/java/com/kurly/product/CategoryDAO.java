package com.kurly.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class CategoryDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 전체 리스트 보기
	public List<CategoryDTO> showCategoryList(String category1) {
		List<CategoryDTO> categoryList = new ArrayList<CategoryDTO>();

		try {
			conn = Dbconn.getConnection();
			sql = "select distinct cate_name1, cate_name1Kor,cate_name2, cate_name2Kor from tb_category where cate_name1=? order by cate_name2;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category1);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CategoryDTO categoryDTO = new CategoryDTO();
				categoryDTO.setCateName1(rs.getString("cate_name1"));
				categoryDTO.setCateName1Kor(rs.getString("cate_name1Kor"));
				categoryDTO.setCateName2(rs.getString("cate_name2"));
				categoryDTO.setCateName2Kor(rs.getString("cate_name2Kor"));

				categoryList.add(categoryDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return categoryList;
	}
}
