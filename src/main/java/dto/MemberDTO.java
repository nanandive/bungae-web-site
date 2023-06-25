package dto;

import java.util.Date;

public class MemberDTO {

   
    private String member_id; // 회원id
       private String introduce; // 상점소개글
       private String name; // 회원이름
       private String tel; // 회원전화번호
       private Date birth; // 회원생일
       private Date regdate; //  계정 생성일
       private int visitor_cnt; // 방문자수
       private int sell_cnt; // 상품판매횟수
       private int delivery_cnt; // 택배발송횟수
       private double rate; // 별점
       private int point; // 포인트
       private int block_cnt;  // 신고당한횟수
       private String address; // 주소
       
      public MemberDTO() {
         super();
         // TODO Auto-generated constructor stub
      }
      
      
      public MemberDTO(String member_id, String introduce, String name, String tel, Date birth, Date regdate,
            int visitor_cnt, int sell_cnt, int delivery_cnt, double rate, int point, int block_cnt,
            String address) {
         super();
         this.member_id = member_id;
         this.introduce = introduce;
         this.name = name;
         this.tel = tel;
         this.birth = birth;
         this.regdate = regdate;
         this.visitor_cnt = visitor_cnt;
         this.sell_cnt = sell_cnt;
         this.delivery_cnt = delivery_cnt;
         this.rate = rate;
         this.point = point;
         this.block_cnt = block_cnt;
         this.address = address;
      }
      public String getMember_id() {
         return member_id;
      }
      public void setMember_id(String member_id) {
         this.member_id = member_id;
      }
      public String getIntroduce() {
         return introduce;
      }
      public void setIntroduce(String introduce) {
         this.introduce = introduce;
      }
      public String getName() {
         return name;
      }
      public void setName(String name) {
         this.name = name;
      }
      public String getTel() {
         return tel;
      }
      public void setTel(String tel) {
         this.tel = tel;
      }
      public Date getBirth() {
         return birth;
      }
      public void setBirth(Date birth) {
         this.birth = birth;
      }
      public Date getRegdate() {
         return regdate;
      }
      public void setRegdate(Date regdate) {
         this.regdate = regdate;
      }
      public int getVisitor_cnt() {
         return visitor_cnt;
      }
      public void setVisitor_cnt(int visitor_cnt) {
         this.visitor_cnt = visitor_cnt;
      }
      public int getSell_cnt() {
         return sell_cnt;
      }
      public void setSell_cnt(int sell_cnt) {
         this.sell_cnt = sell_cnt;
      }
      public int getDelivery_cnt() {
         return delivery_cnt;
      }
      public void setDelivery_cnt(int delivery_cnt) {
         this.delivery_cnt = delivery_cnt;
      }
      public double getRate() {
         return rate;
      }
      public void setRate(double rate) {
         this.rate = rate;
      }
      public int getPoint() {
         return point;
      }
      public void setPoint(int point) {
         this.point = point;
      }
      public int getBlock_cnt() {
         return block_cnt;
      }
      public void setBlock_cnt(int block_cnt) {
         this.block_cnt = block_cnt;
      }
      public String getAddress() {
         return address;
      }
      public void setAddress(String address) {
         this.address = address;
      }
      @Override
      public String toString() {
         return "MemberDTO [member_id=" + member_id + ", introduce=" + introduce + ", name=" + name + ", tel=" + tel
               + ", birth=" + birth + ", regdate=" + regdate + ", visitor_cnt=" + visitor_cnt + ", sell_cnt="
               + sell_cnt + ", delivery_cnt=" + delivery_cnt + ", rate=" + rate + ", point=" + point
               + ", block_cnt=" + block_cnt + ", address=" + address + "]";
      }
   
       
       
       
}