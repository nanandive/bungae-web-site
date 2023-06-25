package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import dto.ProductDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ProductDAO {


   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;



   // 상품 하나 정보 메소드(상품의 상세 정보를 가져오는 메서드)
   // product_id 를 매개변수로 받아 해당 상품의 정보를 데이터베이스에서 조회합니다.
   public ProductDTO getProductInfo(int product_id) throws NamingException {
      ProductDTO product = null;
      //           String member_id = "user1";

      String sql = "SELECT * FROM product WHERE product_id = ? ";

      try {
         conn = ConnectionProvider.getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, product_id);
         //               pstmt.setString(2, member_id);
         rs = pstmt.executeQuery();

         if (rs.next()) { 
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


         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(conn);
      }

      return product;
   }


   // 내상점 내가 등록한 목록 메소드(특정 회원이 등록한 상품 목록을 가져오는 메서드)
   // member_id 를 매개변수로 받아 해당 회원이 등록한 상품 목록을 데이터 베이스에서 조회한다. 
   public ArrayList<ProductDTO> getMyShopProductList(String member_id) throws NamingException {
      ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();

      String sql = "SELECT * FROM product WHERE member_id = ? ORDER BY register_date desc";

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
            productList.add(product);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(conn);
      }

      return productList;
   }




   
   /// 전체 목록 뿌릴 메소드 (모든 상품 목록을 가져오는 메서드 입니다)
   // 데이터 베이스에서 모든 상품 정보를 조회하여 반환합니다.
   public ArrayList<ProductDTO> getAllProductList() throws NamingException {
      ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();

      String sql = "SELECT * FROM product ORDER BY register_Date desc";

      try {
         conn = ConnectionProvider.getConnection();
         pstmt = conn.prepareStatement(sql);

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
            productList.add(product);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(conn);
      }

      return productList;
   }



   // 사용자가 가지고 있는 상품 정보(특정 회원이 가지고 있는 상품 정보를 가져오는 메서드)
   //product_id, member_id를 매개변수로 받아 해당 상품의 정보를 데이터 베이스에서 조회한다. 
    public ProductDTO getdetailProduct(int product_id, String member_id) throws NamingException {
       ProductDTO product = null;
      
       String sql = "SELECT * FROM product WHERE product_id = ? AND member_id =?";

       try {
           conn = ConnectionProvider.getConnection();
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, product_id);
           pstmt.setString(2, member_id);
           rs = pstmt.executeQuery();
          if (rs.next()) { 
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
         product.setView_count(rs.getInt("view_count"));
           }
       } catch (SQLException e) {
           e.printStackTrace();
       } finally {
           JdbcUtil.close(rs);
           JdbcUtil.close(pstmt);
           JdbcUtil.close(conn);
       }

       return product;
   }

    
    
    //상품을 생성하는 메서드 입니다. 상품 정보를 매개변수로 받아 데이터 베이스에 새로운 상품을 등록합니다.
    public void createProduct(String[] parameterArray) throws NamingException {
          ProductDTO product = null;
          int generatedId = 0;
          String sql = "INSERT INTO PRODUCT (product_id, member_id, large_id, medium_id, title, tradearea, "
                  + "condition, exchange, price, description, tag, amount, safety_sell, shipping_included, register_date, checks, blacklist_cnt, delivery_fee, status, sale_method, image_path) "
                  + "VALUES (product_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? ,'배송비여부', SYSDATE, '검수가능', 0, 0, '거래중', '택배거래', ?)";

          try {
              conn = ConnectionProvider.getConnection();
              pstmt = conn.prepareStatement(sql);
             
            
              pstmt.setString(1, parameterArray[0]); // 상점1
              pstmt.setInt(2, Integer.parseInt(parameterArray[3])); // 1
              pstmt.setInt(3, Integer.parseInt(parameterArray[4])); // 1
				/*
				 * pstmt.setInt(4, Integer.parseInt(parameterArray[5])); // 1
				 * 
				 * pstmt.setInt(4, 1);
				 */
              
              pstmt.setString(4, parameterArray[2]); // 제목
              pstmt.setString(5, parameterArray[5]); // 안양시
              pstmt.setString(6, parameterArray[6]); // 중고상품
              pstmt.setString(7, parameterArray[7]); // 교환여부
              pstmt.setInt(8, Integer.parseInt(parameterArray[8])); // 12327 
              pstmt.setString(9, parameterArray[9]); // 내용
              pstmt.setString(10, parameterArray[10]); // 태그
              pstmt.setInt(11, Integer.parseInt(parameterArray[11])); // 1
              pstmt.setString(12, parameterArray[12]); // 안전결제 
				
				  pstmt.setString(13, "" + parameterArray[1]); //
				
             
              int result = pstmt.executeUpdate();

              if (result > 0) {
                  // INSERT 성공한 경우 처리할 내용
                  conn.commit();
                  System.out.println("상품등록완료");

               
                  
              }

          } catch (SQLException e) {
              e.printStackTrace();
          } finally {
              JdbcUtil.close(rs);
              JdbcUtil.close(pstmt);
              JdbcUtil.close(conn);
          }

      }


    //가장 최근에 등록된 상품의 ID를 가져오는 메서드입니다.
    public int getProductID() throws SQLException, NamingException {
          int productId = 0;
          String sql = "SELECT MAX(product_id) FROM PRODUCT";

          try {
              conn = ConnectionProvider.getConnection();
                 pstmt = conn.prepareStatement(sql);
              rs =pstmt.executeQuery(sql);

              if (rs.next()) {
                  productId = rs.getInt(1);
              }
          } finally {
              JdbcUtil.close(rs);
              JdbcUtil.close(pstmt);
              JdbcUtil.close(conn);
          }

          return productId;
      }
    
    
 // 대분류만 선택하는 경우 목록 리스트 메소드
    public ArrayList<ProductDTO> getOneCategoryProductList(int large_id) throws NamingException {

       ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();

       String sql = "SELECT * FROM product  where large_id = ?";

       try {
          conn = ConnectionProvider.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, large_id);
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
             productList.add(product);
          }
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          JdbcUtil.close(rs);
          JdbcUtil.close(pstmt);
          JdbcUtil.close(conn);
       }

       return productList;




    }

    // 대분류, 중분류만 선택하는 경우 목록 리스트 메소드
    public ArrayList<ProductDTO> getTwoCategoryProductList(int large_id, int medium_id) throws NamingException {
       ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();

       String sql = "SELECT * FROM product  where large_id = ? and medium_id = ? ";

       try {
          conn = ConnectionProvider.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, large_id);
          pstmt.setInt(2, medium_id);
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
             productList.add(product);
          }
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          JdbcUtil.close(rs);
          JdbcUtil.close(pstmt);
          JdbcUtil.close(conn);
       }

       return productList;

    }

    // 대분류, 중분류, 소분류만 선택하는 경우 목록 리스트 메소드
    public ArrayList<ProductDTO> getThreeCategoryProductList(int large_id, int medium_id, int small_id) throws NamingException {
       ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();

       String sql = "SELECT * FROM product  where large_id = ? and medium_id = ? and small_id = ?";

       try {
          conn = ConnectionProvider.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, large_id);
          pstmt.setInt(2, medium_id);
          pstmt.setInt(3, small_id);
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
             productList.add(product);
          }
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          JdbcUtil.close(rs);
          JdbcUtil.close(pstmt);
          JdbcUtil.close(conn);
       }

       return productList;
    }


 // 상품 조회수
 	public void increaseViews(int product_id) throws NamingException, SQLException { // 조회수 컬럼 넣어야함
 		
 		String sql = "UPDATE product SET view_count = view_count+1 WHERE product_id = ?";



 		try {
 			conn = ConnectionProvider.getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, product_id);
 		

 			int rows = pstmt.executeUpdate();
 			conn.commit();

 			if (rows == 0) {
 				System.out.println("조회수 증가 업데이트 실패");
 			} else {
 				System.out.println("조회수 증가 업데이트 성공");
 			}
 		} finally {
 			JdbcUtil.close(pstmt);
 			JdbcUtil.close(conn);
 		}

 		
 	}


 	public int getLoveCount(int product_id) throws NamingException, SQLException {
 	    Connection conn = null;
 	    PreparedStatement pstmt = null;
 	    ResultSet rs = null;
 	    int loveCount = 0;

 	    try {
 	        conn = ConnectionProvider.getConnection();
 	        String sql = "SELECT COUNT(*) FROM LOVE WHERE product_id = ?";
 	        pstmt = conn.prepareStatement(sql);
 	        pstmt.setInt(1, product_id);

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

 	// 로그인한 사용자가 해당 상품을 찜했는지 여부 화인 메소드
 	public boolean getLoveCheck(String member_id, int product_id) throws NamingException, SQLException {
 	
 		String sql = "SELECT *  FROM love WHERE member_id = ? and  product_id = ?";
 		
 		boolean flag = false;
 		conn = ConnectionProvider.getConnection();
 		pstmt = conn.prepareStatement(sql);
 		
 		pstmt.setString(1, member_id);
 		pstmt.setInt(2, product_id);
 		ResultSet rs = pstmt.executeQuery();
 		
 		
 		if(rs.next()) {
 			flag = true;
 			System.out.println("찜한 상품임ㄴ");
 		} else {

 			System.out.println("찜한 상품 아님");
 		}
 		
 		return flag;
 	}


 	
 	
 	
 	// 찜버튼 눌렀을 떄 개수 추가하기위한 메소드
 	public void createLove(String member_id, int product_id) throws NamingException {
 		
 		 String sql = "INSERT INTO LOVE (love_id, product_id, member_id ) "
 	              + "VALUES (love_seq.NEXTVAL, ?, ? )";

 	      try {
 	          conn = ConnectionProvider.getConnection();
 	          pstmt = conn.prepareStatement(sql);
 	          pstmt.setInt(1, product_id); // product_id
 	          pstmt.setString(2, member_id);		// member_id
 	          

 	          
 	          
 	          conn.commit();
 	          int result = pstmt.executeUpdate();

 	          if (result > 0) {
 	              // INSERT 성공한 경우 처리할 내용
 	              conn.commit();
 	              System.out.println("해당상품찜추가완료");
 	        
 	             
 	              }
 	         
 	      } catch (SQLException e) {
 	          e.printStackTrace();
 	      } finally {
 	          JdbcUtil.close(rs);
 	          JdbcUtil.close(pstmt);
 	          JdbcUtil.close(conn);
 	      }
 		
 		
 	}

 	// 찜버튼 눌렀을 때 개수 감소하기위해 메소드
 	public void deleteLove(String member_id, int product_id) throws NamingException {
 		 String sql = "delete from love where product_id = ? and member_id = ?";

 	      try {
 	          conn = ConnectionProvider.getConnection();
 	          pstmt = conn.prepareStatement(sql);
 	          pstmt.setInt(1, product_id); // product_id
 	          pstmt.setString(2, member_id);		// member_id
 	          

 	          
 	          
 	          conn.commit();
 	          int result = pstmt.executeUpdate();

 	          if (result > 0) {
 	              // INSERT 성공한 경우 처리할 내용
 	              conn.commit();
 	              System.out.println("해당상품찜삭제");
 	        
 	             
 	              } else {
 		              System.out.println("해당상품삭제 실ㅠㅐ");

 	              }
 	         
 	      } catch (SQLException e) {
 	          e.printStackTrace();
 	      } finally {
 	          JdbcUtil.close(rs);
 	          JdbcUtil.close(pstmt);
 	          JdbcUtil.close(conn);
 	      }
 		
 		
 	}




}