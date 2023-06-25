package dto;

public class ChatDTO {
   int chatID;
   String member_id;
   int product_id;
   String chatContent;
   String chatTime;
   public int getChatID() {
      return chatID;
   }
   public void setChatID(int chatID) {
      this.chatID = chatID;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public int getProduct_id() {
      return product_id;
   }
   public void setProduct_id(int product_id) {
      this.product_id = product_id;
   }
   public String getChatContent() {
      return chatContent;
   }
   public void setChatContent(String chatContent) {
      this.chatContent = chatContent;
   }
   public String getChatTime() {
      return chatTime;
   }
   public void setChatTime(String chatTime) {
      this.chatTime = chatTime;
   }
   
   
}