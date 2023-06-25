package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import dto.MemberDTO;
import dto.OrdersDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class OrdersDAO {


	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 주문테이블 추가하는 메소드
	public void createOrders(String member_id, int product_id, String payment_method, String delivery_method, int price, 
			String member_address) throws NamingException { 
	


	  String sql = "INSERT INTO ORDERS  (order_id, product_id, member_id, delivery, orderdate, price,      or_address, status, payment_method ) "
              + "VALUES (orders_seq.NEXTVAL, ?, ?, ?, sysdate , ?, ?, '구매완료' , ?)";

      try {
          conn = ConnectionProvider.getConnection();
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, product_id); // product_id
          pstmt.setString(2, member_id);		// member_id
          pstmt.setString(3, delivery_method); // delivery

          pstmt.setInt(4, price); 		//price
          pstmt.setString(5, member_address);		//
          pstmt.setString(6, payment_method);		// 
          
          
          conn.commit();
          int result = pstmt.executeUpdate();

          if (result > 0) {
              // INSERT 성공한 경우 처리할 내용
              conn.commit();
              System.out.println("주문테이블추가완료");
        
             
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
