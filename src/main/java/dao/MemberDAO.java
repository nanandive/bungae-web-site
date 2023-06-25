package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import javax.naming.NamingException;

import dto.MemberDTO;
import dto.ProductDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class MemberDAO {


	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;



	// 로그인 아이디 조회 메소드 
	public MemberDTO getMemberInfo(String member_id) throws NamingException {
		MemberDTO member = null;


		String sql = "SELECT * FROM member WHERE member_id = ? ";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setMember_id(rs.getString("member_id")); /// 로그인 처리 안되어있어서 이거 나중에 getInt ("memberId 로 바꿔줘야함") 
				member.setIntroduce(rs.getString("introduce"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setBirth(rs.getDate("birth"));
				member.setRegdate(rs.getDate("regdate"));
				member.setVisitor_cnt(rs.getInt("visitor_cnt"));
				member.setSell_cnt(rs.getInt("sell_cnt"));
				member.setDelivery_cnt(rs.getInt("delivery_cnt"));
				member.setRate(rs.getDouble("rate"));
				member.setPoint(rs.getInt("point"));
				member.setBlock_cnt(rs.getInt("block_cnt"));
				member.setAddress(rs.getString("address"));

			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return member;


	}



	//판매자 아이디 조회 메소드 
	public ProductDTO getSellMemberInfo(int product_id) throws NamingException {
		ProductDTO sellmember = null;


		String sql = "SELECT * FROM product WHERE product_id = ? ";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, product_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sellmember = new ProductDTO();
				sellmember.setProduct_id(rs.getInt("product_id"));
				sellmember.setMember_id(rs.getString("member_id"));
				sellmember.setTitle(rs.getString("title"));
				sellmember.setTradeArea(rs.getString("tradeArea")); 
				sellmember.setCondition(rs.getString("condition"));
				sellmember.setExchange(rs.getString("exchange"));
				sellmember.setPrice(rs.getInt("price"));
				sellmember.setDescription(rs.getString("description"));
				sellmember.setTag(rs.getString("tag"));
				sellmember.setAmount(rs.getInt("amount"));
				sellmember.setSafety_sell(rs.getString("safety_sell"));
				sellmember.setShipping_included(rs.getString("shipping_included"));
				sellmember.setRegister_date(rs.getDate("register_date"));
				sellmember.setChecks(rs.getString("checks"));
				sellmember.setBlacklist_cnt(rs.getInt("blacklist_cnt"));
				sellmember.setDelivery_fee(rs.getInt("delivery_fee"));

				sellmember.setStatus(rs.getString("status")); 
				sellmember.setSale_method(rs.getString("sale_method")); 

				sellmember.setLarge_id(rs.getInt("large_id"));
				sellmember.setMedium_id(rs.getInt("medium_id"));
				sellmember.setSmall_id(rs.getInt("small_id"));

				sellmember.setImage_path(rs.getString("image_path"));

			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return sellmember;


	}






	// 회원 판매횟수 메소드
	public void sellUpdate(String sellMember_id) throws NamingException {
		String sql = "UPDATE member SET sell_cnt= sell_cnt+1 WHERE member_id = ? ";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellMember_id);


			int result = pstmt.executeUpdate();

			if(result > 0 ) {
				conn.commit();
				System.out.println("업데이트성공!");
			} else {
				System.out.println("업데이트 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}


	}



	// 소개글 업데이트 메소드
	public boolean updateIntroMyShop(String intro, String member_id) throws NamingException, SQLException {   
		String sql = "UPDATE MEMBER SET introduce = ? WHERE member_id = ?";

		boolean success = false; // 업데이트 성공 여부를 저장할 변수

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, intro);
			pstmt.setString(2, member_id);

			int rows = pstmt.executeUpdate();
			conn.commit();

			if (rows == 0) {
				System.out.println("회원 정보 업데이트 실패");
			} else {
				System.out.println("회원 정보 업데이트 성공");
				success = true; // 업데이트 성공 시 success 변수를 true로 설정
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return success; // 업데이트 성공 여부 반환
	}




	// 사용자가 찜한 목록 불러오기 위한 메소드	 
	public ArrayList<ProductDTO> getLoveListForMember(String member_id) throws NamingException {
		ArrayList<ProductDTO> loveList = new ArrayList<ProductDTO>();
		String sql = "SELECT *  "
				+ " FROM PRODUCT P INNER JOIN LOVE L ON P.product_id = L.product_id "
				+ " WHERE L.member_id = ?";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product = new ProductDTO();
				product.setProduct_id(rs.getInt("product_id"));
				product.setMember_id(rs.getString("member_id"));
				product.setTitle(rs.getString("title"));
				product.setTradeArea(rs.getString("tradeArea")); 
				product.setCondition(rs.getString("condition"));
				product.setExchange(rs.getString("exchange"));
				product.setPrice(rs.getInt("price"));
				product.setDescription(rs.getString("description"));
				product.setTag(rs.getString("tag"));
				product.setAmount(rs.getInt("amount"));
				product.setSafety_sell(rs.getString("safety_sell"));
				product.setShipping_included(rs.getString("shipping_included"));
				product.setRegister_date(rs.getDate("register_date"));
				product.setChecks(rs.getString("checks"));
				product.setBlacklist_cnt(rs.getInt("blacklist_cnt"));
				product.setDelivery_fee(rs.getInt("delivery_fee"));

				product.setStatus(rs.getString("status")); 
				product.setSale_method(rs.getString("sale_method")); 

				product.setLarge_id(rs.getInt("large_id"));
				product.setMedium_id(rs.getInt("medium_id"));
				product.setSmall_id(rs.getInt("small_id"));

				product.setImage_path(rs.getString("image_path"));
				System.out.println(product.toString());
				loveList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return loveList;
	}



	// 사용자 팔로우수 구하는 메소드 
	public int getFollowersCount(String member_id) throws NamingException {
		int followersCount = 0;

		String sql = "SELECT member_id FROM FOLLOW WHERE follower_name = ?";

		try{

			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				followersCount++;
			} 
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		System.out.println("팔로우수 카운트 성공 : " + followersCount);
		return followersCount;
	}




	//회원가입 메소드
	public void insertMember(String[] parameterArray) throws SQLException, NamingException {




		String sql = "INSERT INTO MEMBER (member_ID, introduce, name, Tel, Birth, regdate, visitor_Cnt, sell_Cnt, delivery_Cnt, rate, point, block_Cnt, address) "
				+ "VALUES (?, '잘왔따' , ?, ?, ?, SYSDATE, 0, 0, 0, 0, 0, 0, ?)";

		try {




			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, parameterArray[0]); 
			pstmt.setString(2, parameterArray[2]); //
			pstmt.setString(3, parameterArray[1]); //
			pstmt.setString(4, parameterArray[3]); // 
			pstmt.setString(5, parameterArray[4]); // 



			int result = pstmt.executeUpdate();

			if (result > 0) {
				// INSERT 성공한 경우 처리할 내용
				conn.commit(); 
				System.out.println("회원등록완료");



			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}


	}




	// 로그인 아이디 비밀번호(핸드폰번호) 인 메소드

	public String loginMember(String member_id, String tel) {

		String sql = null;
		String member = null;
		try {


			sql = "select member_id from Member where member_id = ? and tel = ? ";

			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();


			if(rs.next()) {
				member = rs.getString("member_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return member;
	}

	
	public void increaseVisitCount(String member_id) throws NamingException {
		String sql = "UPDATE member SET visitor_cnt= visitor_cnt+1 WHERE member_id = ? ";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member_id);


			int result = pstmt.executeUpdate();

			if(result > 0 ) {
				conn.commit();
				System.out.println("상점방문수 업데이트 성공!");
			} else {
				System.out.println("상점방문수 업데이트 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		
	}
//	
//	// 회원탈퇴 메소드 
//	public boolean deleteMember(String member_id) throws NamingException {
//		   boolean success = false;
//		
//		MemberDTO delmember = null;
//
//
//		String sql = " DELETE FROM member WHERE member_id = ? ";
//
//		try {
//			conn = ConnectionProvider.getConnection();
//			pstmt = conn.prepareStatement(sql);
//
//			pstmt.setString(1, member_id);
//			rs = pstmt.executeQuery();
// 
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			JdbcUtil.close(rs);
//			JdbcUtil.close(pstmt);
//			JdbcUtil.close(conn);
//		}
//
//		return delmember;
//
//
//	}

	public boolean deleteMember(String member_id) throws SQLException, NamingException {
        boolean success = false;

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionProvider.getConnection();
            String sql = "DELETE FROM member WHERE member_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_id);

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                success = true;
            }
        } finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }

        return success;
    }
	
	
	
	// 사용자가 팔로잉 하는 사람 수 
		public int getFollowingCount(String member_id) throws NamingException {


			String sql = "SELECT M.* FROM FOLLOW F JOIN MEMBER M ON F.member_id = M.member_id WHERE F.follower_name = ? ";
			int followingCount = 0;

			try{

				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					followingCount++;
				} 
			}catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(conn);
			}
			System.out.println("팔로잉수 카운트 성공 : " + followingCount);
			return followingCount;
		}



		public boolean getFollowCheck(String member_id, String user) throws NamingException {
			boolean followCheck = false;

			String sql = "SELECT COUNT(*) FROM FOLLOW WHERE member_id = ? AND follower_name = ?";

			try {
				// 팔로우 여부를 확인하는 쿼리 작성

				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member_id);
				pstmt.setString(2, user);
				rs = pstmt.executeQuery();

				// 쿼리 실행 결과로 팔로우 여부 확인
				if (rs.next()) {
					int count = rs.getInt(1);
					followCheck = (count > 0);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// 사용한 리소스 반환
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			return followCheck;
		}
		
		
		
		public List<MemberDTO> getAllMember(String memberid) throws NamingException, SQLException{
			
			List<MemberDTO> members = new ArrayList<>();
			String sql = " SELECT * "
					+ " FROM member "
					+ " WHERE member_id = ? ";
			
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			
			try {
				
				pstmt.setString(1, memberid);
				rs = pstmt.executeQuery();
				
				while( rs.next() ) {
					
					String member_id = rs.getString("member_id");
					String introduce = rs.getString("introduce");
					String name = rs.getString("name");
					String tel = rs.getString("tel");
					Date birth = rs.getDate("birth");
					Date regdate = rs.getDate("regdate");
					int visitor_cnt = rs.getInt("visitor_cnt");
					int sell_cnt = rs.getInt("sell_cnt");
					int delivery_cnt = rs.getInt("delivery_cnt");
					double rate = rs.getDouble("rate");
					int point = rs.getInt("point");
					int block_cnt = rs.getInt("block_cnt");
					String address = rs.getString("address");
					
					MemberDTO member = new MemberDTO(member_id, introduce, name, tel, birth, regdate, visitor_cnt, sell_cnt, delivery_cnt, delivery_cnt, point, block_cnt, address);
					members.add(member);
					
				} // while
				
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			
			return members;


		}
}
