package com.kurly.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kurly.db.Dbconn;

public class FboardDAO {
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql = "";
   String[] generatedColumns = {"fb_idx"};

   public boolean insertData(FboardDTO fboardDTO) {
      try {
         conn = Dbconn.getConnection();
         sql = "insert into tb_fileboard (fb_userid, fb_username, fb_title, fb_content, fb_filename) values(?,?,?,?,?)";
         pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
         pstmt.setString(1,  fboardDTO.getUserid());
         pstmt.setString(2,  fboardDTO.getUsername());
         pstmt.setString(3,  fboardDTO.getTitle());
         pstmt.setString(4,  fboardDTO.getContent());
         pstmt.setString(5, fboardDTO.getFile());
         int result = pstmt.executeUpdate();
         
         try(ResultSet geneResultkey = pstmt.getGeneratedKeys();) {
            if(geneResultkey.next()) {
               fboardDTO.setIdx(geneResultkey.getInt(1));
               System.out.println(fboardDTO.getIdx());
            }
         }
            
         if(result >= 1) {
            System.out.println("Insert 성공");
            fboardDTO = this.updateFilePath(fboardDTO);
            return true;
         }

      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         Dbconn.close(conn, pstmt);
      }
      return false;
   }
   
   public FboardDTO updateFilePath(FboardDTO fboardDTO) {
      try {
         conn = Dbconn.getConnection();
         sql = "update tb_fileboard set fb_filepath=? where fb_idx=?";
         pstmt = conn.prepareStatement(sql);
         String tmp = "/" + FileService.getToday() + "/" + fboardDTO.getFile();
         fboardDTO.setFilepath(tmp);
         pstmt.setString(1, tmp);
         pstmt.setInt(2, fboardDTO.getIdx());
         pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         Dbconn.close(conn, pstmt);
      }
      return fboardDTO;
   }
   
   public List<FboardDTO> selectList() {
      List<FboardDTO> fboardList = new ArrayList<FboardDTO>();
      try {
         conn = Dbconn.getConnection();
         sql = "select * from tb_fileboard order by fb_idx desc";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while(rs.next()) {
            FboardDTO fboardDTO = new FboardDTO();
            fboardDTO.setIdx(rs.getInt("fb_idx"));
            fboardDTO.setUserid(rs.getString("fb_userid"));
            fboardDTO.setUsername(rs.getString("fb_username"));
            fboardDTO.setTitle(rs.getString("fb_title"));
            fboardDTO.setFile(rs.getString("fb_filename"));
            fboardDTO.setRegdate(rs.getString("fb_regdate"));
            fboardDTO.setHit(rs.getInt("fb_hit"));
            fboardDTO.setFilepath(rs.getString("fb_filepath"));
            fboardList.add(fboardDTO);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         Dbconn.close(conn, pstmt, rs);
      }
      return fboardList;
   }
}