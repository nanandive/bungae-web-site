package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import dto.MemberDTO;
import dto.ProductDTO;
import dto.ReviewDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ReviewDAO {

	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//리뷰의 상세 정보를 가져오는 메서드
	//order_id를 매개변술로 받아 해당 상품의 정보를 DB에서 조회한다.
	public ReviewDTO getReviewInfo(int order_id) throws NamingException {
		ReviewDTO review = null;
		
		String sql = " SELECT * FROM store_review WHERE order_id = ? ";
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_id);
			rs=pstmt.executeQuery();
			
			if( rs.next() ) {
				review = new ReviewDTO();
				review.setOrder_id(rs.getInt("order_id"));
				review.setProduct_id(rs.getInt("product_id"));
				review.setMember_id(rs.getString("member_id"));
				review.setWrite_time(rs.getDate("write_time"));
				review.setStar(rs.getDouble("star"));
				review.setReview_detail(rs.getString("review_detail"));
				review.setReview_update(rs.getDate("review_update"));
				review.setReview_state(rs.getString("review_state"));
				review.setTitle(rs.getString("title"));
				
				//System.out.println(review.toString());
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	
		return review;
		
	}
	
	
	
	
	//구매자 아이디 조회 메소드
	public ReviewDTO getBuyMemberInfo(String member_id) throws NamingException {
		ReviewDTO buymember = null;
		
		String sql = "SELECT * FROM store_review WHERE member_id = ?";
		
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				buymember = new ReviewDTO();
				buymember.setOrder_id(rs.getInt("order_id"));
				buymember.setProduct_id(rs.getInt("product_id"));
				buymember.setMember_id(rs.getString("member_id"));
				buymember.setWrite_time(rs.getDate("write_time"));
				buymember.setStar(rs.getDouble("star"));
				buymember.setReview_detail(rs.getString("review_detail"));
				buymember.setReview_update(rs.getDate("review_update"));
				buymember.setReview_state(rs.getString("review_state"));
				buymember.setTitle(rs.getString("title"));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return buymember;
		
	}
	
	
	//사용자가 올린 상품에 대한 후기를 불러오기 위한 메소드
		public ArrayList<ReviewDTO> getMyReviewListForMember(String member_id) throws NamingException {
			
			ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
			
			String sql = " SELECT * "
					+ "FROM store_review s INNER JOIN product p ON s.product_id = p.product_id "
					+ "WHERE p.member_id = ? ";
			
			try {
		         conn = ConnectionProvider.getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, member_id);
		         rs = pstmt.executeQuery();

		         while (rs.next()) {
		        	ReviewDTO review = new ReviewDTO();
		        	review = new ReviewDTO();
					review.setOrder_id(rs.getInt("order_id"));
					review.setProduct_id(rs.getInt("product_id"));
					review.setMember_id(rs.getString("member_id"));
					review.setWrite_time(rs.getDate("write_time"));
					review.setStar(rs.getDouble("star"));
					review.setReview_detail(rs.getString("review_detail"));
					review.setReview_update(rs.getDate("review_update"));
					review.setReview_state(rs.getString("review_state"));
					review.setTitle(rs.getString("title"));
						
					System.out.println(review.toString());
					reviewList.add(review);
					
		        	 
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         JdbcUtil.close(rs);
		         JdbcUtil.close(pstmt);
		         JdbcUtil.close(conn);
		      }

		      return reviewList;
			
		}
		
		
		//사용자가 올린 상품에 대한 후기를 불러오기 위한 메소드
		public ArrayList<ProductDTO> getMyReviewNameListForMember(String member_id) throws NamingException {
					
			ArrayList<ProductDTO> reviewNameList = new ArrayList<ProductDTO>();
					
				String sql = " SELECT * "
						+ "FROM product p INNER JOIN store_review s ON p.product_id = s.product_id "
						+ "WHERE s.member_id = ? ";
					
					try {
				         conn = ConnectionProvider.getConnection();
				         pstmt = conn.prepareStatement(sql);
				         pstmt.setString(1, member_id);
				         rs = pstmt.executeQuery();

				         while (rs.next()) {
				        	ProductDTO productName = new ProductDTO();
				        	productName.setProduct_id(rs.getInt("product_id"));
				        	productName.setMember_id(rs.getString("member_id"));
				        	productName.setLarge_id(rs.getInt("large_id"));
				        	productName.setMedium_id(rs.getInt("medium_id"));
				        	productName.setSmall_id(rs.getInt("small_id"));
				        	productName.setTitle(rs.getString("title"));
				        	productName.setTradeArea(rs.getString("tradearea"));
				        	productName.setCondition(rs.getString("condition"));
				        	productName.setExchange(rs.getString("exchange"));
				        	productName.setPrice(rs.getInt("price"));
				        	productName.setDescription(rs.getString("description"));
				        	productName.setTag(rs.getString("tag"));
				        	productName.setAmount(rs.getInt("amount"));
				        	productName.setSafety_sell(rs.getString("safety_sell"));
				        	productName.setShipping_included(rs.getString("shipping_included"));
				        	productName.setRegister_date(rs.getDate("register_date"));
				        	productName.setChecks(rs.getString("checks"));
				        	productName.setBlacklist_cnt(rs.getInt("blacklist_cnt"));
				        	productName.setDelivery_fee(rs.getInt("delivery_fee"));
				        	productName.setStatus(rs.getString("status"));
				        	productName.setSale_method(rs.getString("sale_method"));
				        	productName.setImage_path(rs.getString("image_path"));
				        	productName.setView_count(rs.getInt("view_count"));
				        	
				        	
				        	
								
							System.out.println(productName.toString());
							reviewNameList.add(productName);
							
				        	 
				         }
				      } catch (SQLException e) {
				         e.printStackTrace();
				      } finally {
				         JdbcUtil.close(rs);
				         JdbcUtil.close(pstmt);
				         JdbcUtil.close(conn);
				      }

				      return reviewNameList;
					
				}
		
	
	
	
}
