package dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.NamingException;

import org.apache.catalina.User;

import dto.StoreDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class StoreDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public StoreDAO() throws NamingException {
		try {
			conn = ConnectionProvider.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<StoreDTO> getProductOne(String id) {
		List<StoreDTO> products = new ArrayList<>();
		String sql = " SELECT * " + " FROM product " + " WHERE member_id = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				String member_id = rs.getString("member_id");
				int large_id = rs.getInt("large_id");
				int medium_id = rs.getInt("medium_id");
				int small_id = rs.getInt("small_id");
				String title = rs.getString("title");
				String tradearea = rs.getString("tradearea");
				String condition = rs.getString("condition");
				String exchange = rs.getString("exchange");
				int price = rs.getInt("price");
				String description = rs.getString("description");
				String tag = rs.getString("tag");
				int amount = rs.getInt("amount");
				String safety_sell = rs.getString("safety_sell");
				String shipping_included = rs.getString("shipping_included");
				java.sql.Timestamp register_date = rs.getTimestamp("register_date");
				String checks = rs.getString("checks");
				int blacklist_cnt = rs.getInt("blacklist_cnt");
				int delivery_fee = rs.getInt("delivery_fee");
				String status = rs.getString("status");
				String sale_method = rs.getString("sale_method");
				String image_path = rs.getString("image_path");

				StoreDTO product = new StoreDTO(product_id, member_id, large_id, medium_id, small_id, title, tradearea,
						condition, exchange, price, description, tag, amount, safety_sell, shipping_included,
						register_date, checks, blacklist_cnt, delivery_fee, status, sale_method, image_path);
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return products;
	}

	public List<StoreDTO> upProductdate(String member, int product) {
		List<StoreDTO> products = new ArrayList<>();
		String updateSql = "UPDATE product SET register_date = sysdate " + "WHERE member_id = ? AND product_id = ?";

		String selectSql = "SELECT * FROM product WHERE member_id = ? AND product_id = ?";

		try {
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, member);
			pstmt.setInt(2, product);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(selectSql);
			pstmt.setString(1, member);
			pstmt.setInt(2, product);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				String member_id = rs.getString("member_id");
				int large_id = rs.getInt("large_id");
				int medium_id = rs.getInt("medium_id");
				int small_id = rs.getInt("small_id");
				String title = rs.getString("title");
				String tradearea = rs.getString("tradearea");
				String condition = rs.getString("condition");
				String exchange = rs.getString("exchange");
				int price = rs.getInt("price");
				String description = rs.getString("description");
				String tag = rs.getString("tag");
				int amount = rs.getInt("amount");
				String safety_sell = rs.getString("safety_sell");
				String shipping_included = rs.getString("shipping_included");
				java.sql.Timestamp register_date = rs.getTimestamp("register_date");
				String checks = rs.getString("checks");
				int blacklist_cnt = rs.getInt("blacklist_cnt");
				int delivery_fee = rs.getInt("delivery_fee");
				String status = rs.getString("status");
				String sale_method = rs.getString("sale_method");
				String image_path = rs.getString("image_path");

				StoreDTO product1 = new StoreDTO(product_id, member_id, large_id, medium_id, small_id, title, tradearea,
						condition, exchange, price, description, tag, amount, safety_sell, shipping_included,
						register_date, checks, blacklist_cnt, delivery_fee, status, sale_method, image_path);
				products.add(product1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return products;
	}

	

/*		// 특정 상점의 특정 상품의 love 횟수를 조회하는 메서드입니다.
		public int getLoveCountByProductAndMember(int productId, String memberId) throws SQLException {
			String query = "SELECT COUNT(*) AS love_count FROM LOVE WHERE product_id = ? AND member_id = ?";

			try (PreparedStatement statement = connection.prepareStatement(query)) {
				statement.setInt(1, productId);
				statement.setString(2, memberId);

				try (ResultSet resultSet = statement.executeQuery()) {
					if (resultSet.next()) {
						return resultSet.getInt("love_count");
					}
				}
			}

			return 0; // 해당 상점과 상품에 해당하는 love 횟수가 없는 경우 0을 반환합니다.
		}
	}*/


	


	public int getLoveCount(int product_Id) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int loveCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			String sql = "SELECT COUNT(*) FROM LOVE WHERE product_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_Id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				loveCount = rs.getInt(1);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		System.out.println("해당상품 찜 개수 : " + loveCount);
		return loveCount;
	}
	
	
	
	

	public ArrayList<StoreDTO> search(String title) {
	    String SQL = "SELECT * FROM product WHERE TITLE LIKE ?";
	    ArrayList<StoreDTO> userList = new ArrayList<>();

	    try {
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setString(1, "%"+title+"%");
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            StoreDTO user = new StoreDTO();
	            user.setTitle(rs.getString("title"));
	            user.setStatus(rs.getString("status"));
	            user.setPrice(rs.getInt("price"));
	            user.setSafety_sell(rs.getString("safety_sell"));
	            user.setRegister_date(rs.getDate("register_date"));

	            userList.add(user);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return userList;
	}
}

	

	/*public int getLoveCount(int productId) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int loveCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			String sql = "SELECT COUNT(*) FROM LOVE WHERE product_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productId);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				loveCount = rs.getInt(1);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		System.out.println("해당상품 찜 개수 : " + loveCount);
		return loveCount;*/
	



	
	/*
	 * 
	 * public static ArrayList<User> search(String title1) { String SQL =
	 * "SELECT * FROM product WHERE TITLE  = ?"; ArrayList<User> products = new
	 * ArrayList<>();
	 * 
	 * try { pstmt = conn.prepareStatement(SQL); pstmt.setString(1, title1); rs =
	 * pstmt.executeQuery();
	 * 
	 * while (rs.next()) {
	 * 
	 * 
	 * User user = new User();
	 * 
	 * int product_id = rs.getInt("product_id"); String member_id =
	 * rs.getString("member_id"); int large_id = rs.getInt("large_id"); int
	 * medium_id = rs.getInt("medium_id"); int small_id = rs.getInt("small_id");
	 * String title = rs.getString("title"); String tradearea =
	 * rs.getString("tradearea"); String condition = rs.getString("condition");
	 * String exchange = rs.getString("exchange"); int price = rs.getInt("price");
	 * String description = rs.getString("description"); String tag =
	 * rs.getString("tag"); int amount = rs.getInt("amount"); String safety_sell =
	 * rs.getString("safety_sell"); String shipping_included =
	 * rs.getString("shipping_included"); java.sql.Timestamp register_date =
	 * rs.getTimestamp("register_date"); String checks = rs.getString("checks"); int
	 * blacklist_cnt = rs.getInt("blacklist_cnt"); int delivery_fee =
	 * rs.getInt("delivery_fee"); String status = rs.getString("status"); String
	 * sale_method = rs.getString("sale_method");
	 * 
	 * 
	 * 
	 * 
	 * User.setimage_path = (rs.getString(1)); User.setstatus = (rs.getString(2));
	 * User.settitle = (rs.getString(3));
	 * 
	 * User.setimage_path = (rs.getString(1)); User.status = (rs.getString(1));
	 * userList.add(user); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return userList; }
	 */

	// Add other methods for updating, deleting, etc.

	/*
	 * public List<StoreDTO> upProductdate(String member, int product) {
	 * List<StoreDTO> products = new ArrayList<>(); String sql =
	 * "UPDATE product SET register_date = sysdate " +
	 * "WHERE member_id = ? AND product_id = ?";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, member);
	 * pstmt.setInt(2, product); rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { int product_id = rs.getInt("product_id"); String
	 * member_id = rs.getString("member_id"); int large_id = rs.getInt("large_id");
	 * int medium_id = rs.getInt("medium_id"); int small_id = rs.getInt("small_id");
	 * String title = rs.getString("title"); String tradearea =
	 * rs.getString("tradearea"); String condition = rs.getString("condition");
	 * String exchange = rs.getString("exchange"); int price = rs.getInt("price");
	 * String description = rs.getString("description"); String tag =
	 * rs.getString("tag"); int amount = rs.getInt("amount"); String safety_sell =
	 * rs.getString("safety_sell"); String shipping_included =
	 * rs.getString("shipping_included"); java.sql.Timestamp register_date =
	 * rs.getTimestamp("register_date"); String checks = rs.getString("checks"); int
	 * blacklist_cnt = rs.getInt("blacklist_cnt"); int delivery_fee =
	 * rs.getInt("delivery_fee"); String status = rs.getString("status"); String
	 * sale_method = rs.getString("sale_method"); String image_path =
	 * rs.getString("image_path");
	 * 
	 * StoreDTO product1 = new StoreDTO(product_id, member_id, large_id, medium_id,
	 * small_id, title, tradearea, condition, exchange, price, description, tag,
	 * amount, safety_sell, shipping_included, register_date, checks, blacklist_cnt,
	 * delivery_fee, status, sale_method, image_path); products.add(product1); } }
	 * catch (SQLException e) { e.printStackTrace(); } finally { JdbcUtil.close(rs);
	 * JdbcUtil.close(pstmt); }
	 * 
	 * return products; }
	 */

	/*
	 * 
	 * public List<StoreDTO> lovecount(String memberId) throws SQLException {
	 * 
	 * List<StoreDTO> lovecount1 = new ArrayList<>(); int followersCount = 0;
	 * 
	 * String sql =
	 * "SELECT p.product_id, p.product_name, COUNT(j.jjim_id) AS count " +
	 * "FROM product p " + "JOIN jjim j ON p.product_id = j.product_id " +
	 * "WHERE j.member_id = ? " + "GROUP BY p.product_id, p.product_name"; try {
	 * 
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, memberId); rs =
	 * pstmt.executeQuery();
	 * 
	 * while (rs.next()) { int product_id = rs.getInt("product_id"); String title =
	 * rs.getString("title"); int loved_id = rs.getInt("loved_id");
	 * 
	 * 
	 * 
	 * 
	 * followersCount++;
	 * 
	 * }
	 * 
	 * StoreDTO lovecount1 = new StoreDTO(product_id, title, loved_id); }
	 * productList.add(product);
	 * 
	 * 
	 * 
	 * 
	 * return productList; }
	 * 
	 */


