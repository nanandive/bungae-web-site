package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.NamingException;

import dto.InquiryDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class InquiryDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;



	public List<InquiryDTO> getAllInquiries() throws NamingException, SQLException {
		List<InquiryDTO> inquiries = new ArrayList<>();
		String sql = "select * from inquiry WHERE ROWNUM <= 3 order by inquiry_id desc";

		conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		try {

			while (rs.next()) {
				int inquiry_id = rs.getInt("inquiry_id");
				int admin_id = rs.getInt("admin_id");
				String type = rs.getString("type");
				String inquiry_img = rs.getString("inquiry_img");
				String inquiry_ct = rs.getString("inquiry_ct");
				Date write_date = rs.getDate("write_date");
				String status = rs.getString("status");
				String detail_type = rs.getString("detail_type");
				String answer = rs.getString("answer");

				InquiryDTO inquiry = new InquiryDTO(inquiry_id, admin_id, type, inquiry_img, inquiry_ct, write_date, status, detail_type,answer);
				inquiries.add(inquiry);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return inquiries;
	}


	public void insertInquiry(String type, String inquiry_ct, String detail_type) throws NamingException, SQLException {

		String sql = " INSERT INTO inquiry (inquiry_id, admin_id, type, inquiry_img, inquiry_ct, write_date, status, detail_type) "
				+ " VALUES ( INQUIRYSEQ.nextval, 0, ?, 'a', ?, SYSDATE, '답변완료' , ?) ";
		
		conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		

		try {

			pstmt.setString(1, type);
			pstmt.setString(2, inquiry_ct);
			pstmt.setString(3, detail_type);

			int result = pstmt.executeUpdate();

			if ( result > 0) {
				conn.commit();
				System.out.println("문의하기 등록 완료!!");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}
	
	
	public List<InquiryDTO> Inquires( int id ) throws NamingException, SQLException {
	      
	      List<InquiryDTO> inquiries = new ArrayList<>();
	      String sql = "select * from inquiry WHERE inquiry_id = ? ";

	      conn = ConnectionProvider.getConnection();
	      PreparedStatement pstmt = conn.prepareStatement(sql);

	      try {
	         
	         pstmt.setInt(1, id);
	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            int inquiry_id = rs.getInt("inquiry_id");
	            int admin_id = rs.getInt("admin_id");
	            String type = rs.getString("type");
	            String inquiry_img = rs.getString("inquiry_img");
	            String inquiry_ct = rs.getString("inquiry_ct");
	            Date write_date = rs.getDate("write_date");
	            String status = rs.getString("status");
	            String detail_type = rs.getString("detail_type");
	            String answer = rs.getString("answer");

	            InquiryDTO inquiry = new InquiryDTO(inquiry_id, admin_id, type, inquiry_img, inquiry_ct, write_date, status, detail_type, answer);
	            inquiries.add(inquiry);
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         JdbcUtil.close(rs);
	         JdbcUtil.close(pstmt);
	      }

	      return inquiries;
	   }
	   
}
