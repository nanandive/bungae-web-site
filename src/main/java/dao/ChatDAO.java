package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ChatDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ChatDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
    
   public ArrayList<ChatDTO> getChatListByID(String member_id, int product_id, String chatID){//
      ArrayList<ChatDTO> chatList = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      //보낸사람이든 받은사람이든 두경ㅇ에 해당되면 값 가져옴
      String SQL ="SELECT * FROM USERCHAT WHERE (( MEMBER_ID = ? AND PRODUCT_ID =? ) OR (MEMBER_ID = ? AND PRODUCT_ID = ?))"
            + " AND CHATID > ? ORDER BY CHATTIME " ; 
      try {
         conn = ConnectionProvider.getConnection();
            pstmt = conn.prepareStatement(SQL);
            
            
            pstmt.setString(1, member_id);
            pstmt.setInt(2, product_id);
            pstmt.setInt(3, product_id);
            pstmt.setString(4, member_id);
            pstmt.setInt(5, Integer.parseInt(chatID));
            rs = pstmt.executeQuery();
            chatList = new ArrayList<ChatDTO>();
            while(rs.next()) {
               ChatDTO userchat = new ChatDTO();
               userchat.setChatID(rs.getInt("chatID"));
               userchat.setMember_id(rs.getString("member_id"));
               userchat.setChatContent(rs.getString("chatContent"));
               int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11 , 13));
               String timeType = "오전";
               if(chatTime >= 12) {
                  timeType = "오후";
                  chatTime -= 12;
               }
               userchat.setChatTime(rs.getString("chatTime").substring(0,11) + " " + timeType + " " + chatTime + " : " + rs.getString("chatTime").substring(14,16) + " ");
               chatList.add(userchat); 
            }
            
            
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
      }
      
      return chatList;
      
   }
   
   public ArrayList<ChatDTO> getChatListByRecent(String member_id, int product_id, int number){//
      
      System.out.println(member_id); // %EC%83%81%EC%A0%903
      System.out.println(product_id);
      System.out.println(number);
      
      ArrayList<ChatDTO> chatList = null;
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      //보낸사람이든 받은사람이든 두경ㅇ에 해당되면 값 가져옴
      //tlatms2003
      //1 conn.commit();        
      //10
      String SQL ="SELECT * FROM USERCHAT WHERE (( MEMBER_ID = ? AND PRODUCT_ID = ? ) OR (MEMBER_ID = ? AND PRODUCT_ID = ?))"
            + " AND CHATID > (SELECT MAX(chatID) - ? FROM USERCHAT ) ORDER BY CHATTIME " ; 
      try {
         conn = ConnectionProvider.getConnection();
            pstmt = conn.prepareStatement(SQL);
            
            
            pstmt.setString(1, member_id);
            pstmt.setInt(2, product_id);
            pstmt.setString(3, member_id);
            pstmt.setInt(4, product_id); 
            pstmt.setInt(5, number);
            rs = pstmt.executeQuery();
            chatList = new ArrayList<ChatDTO>();
            
            
            while(rs.next()) {
               ChatDTO userchat = new ChatDTO();
               userchat.setChatID(rs.getInt("chatID"));
               userchat.setMember_id(rs.getString("member_id"));
               userchat.setChatContent(rs.getString("chatContent"));
                // "2023-06-16 10:45:11"
               //int chatTime = Integer.parseInt(rs.getString("chatTime"));
               //String timeType = "오전";
               //if(chatTime >= 12) {
              //    timeType = "오후";
              //    chatTime -= 12;
              // }
               //userchat.setChatTime(rs.getString("chatTime").substring(0,11) + " " + timeType + " " + chatTime + " : " + rs.getString("chatTime").substring(14,16) + " ");
               userchat.setChatTime(rs.getString("chatTime") );
               chatList.add(userchat); 
            }
            
            
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
      }
      
      return chatList;
      
   }
   
   
   
   
   
   
   public int submit(String member_id, int product_id, String chatContent){//채팅 보내는 전송기능
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      //보낸사람이든 받은사람이든 두경ㅇ에 해당되면 값 가져옴
      String SQL = "INSERT INTO USERCHAT VALUES ( NULL, ?, ?, ?, sysdate) "; // NULL값 넣어서 CHATID가 자동으로 하나씩 증가함
      try {
         conn = ConnectionProvider.getConnection();
            pstmt = conn.prepareStatement(SQL);
            
            
            pstmt.setString(1, member_id);
            pstmt.setInt(2, product_id);
            pstmt.setString(3, chatContent);   
            return pstmt.executeUpdate();
            
            
            
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
      }
      
      return -1; //db오류
      
   }
   
   
   
}
