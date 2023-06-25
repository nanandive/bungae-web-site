package dto;

import java.util.Date;

public class ProductDTO {

    private int product_id; // 상품ID
       private String member_id; // 회원ID
       private int large_id; // 대분류ID
       private int medium_id; // 중분류ID
       private int small_id; // 소분류ID
       private String title; // 제목
       private String tradeArea; // 거래지역
       private String condition; // 물건상태
       private String exchange; // 교환여부
       private int price; // 가격
       private String description; // 상품설명
       private String tag; // 연관태그
       private int amount; // 수량
       private String safety_sell; // 빠른판매여부(안전판매)
       private String shipping_included; // 배송비포함여부
       private Date register_date; // 상품등록일
       private String checks; // 검수가능
       private int blacklist_cnt; // 신고당한횟수
       private int delivery_fee; // 배송비
       private String status; // 진행상태
       private String sale_method; // 거래방식
       private String image_path ;  //상품이미지경로
       private int view_count ; // 조회수 
      public ProductDTO() {
         super();
         // TODO Auto-generated constructor stub
      }
      public ProductDTO(int product_id, String member_id, int large_id, int medium_id, int small_id, String title,
            String tradeArea, String condition, String exchange, int price, String description, String tag,
            int amount, String safety_sell, String shipping_included, Date register_date, String checks,
            int blacklist_cnt, int delivery_fee, String status, String sale_method, String image_path,
            int view_count) {
         super();
         this.product_id = product_id;
         this.member_id = member_id;
         this.large_id = large_id;
         this.medium_id = medium_id;
         this.small_id = small_id;
         this.title = title;
         this.tradeArea = tradeArea;
         this.condition = condition;
         this.exchange = exchange;
         this.price = price;
         this.description = description;
         this.tag = tag;
         this.amount = amount;
         this.safety_sell = safety_sell;
         this.shipping_included = shipping_included;
         this.register_date = register_date;
         this.checks = checks;
         this.blacklist_cnt = blacklist_cnt;
         this.delivery_fee = delivery_fee;
         this.status = status;
         this.sale_method = sale_method;
         this.image_path = image_path;
         this.view_count = view_count;
      }
      public int getProduct_id() {
         return product_id;
      }
      public void setProduct_id(int product_id) {
         this.product_id = product_id;
      }
      public String getMember_id() {
         return member_id;
      }
      public void setMember_id(String member_id) {
         this.member_id = member_id;
      }
      public int getLarge_id() {
         return large_id;
      }
      public void setLarge_id(int large_id) {
         this.large_id = large_id;
      }
      public int getMedium_id() {
         return medium_id;
      }
      public void setMedium_id(int medium_id) {
         this.medium_id = medium_id;
      }
      public int getSmall_id() {
         return small_id;
      }
      public void setSmall_id(int small_id) {
         this.small_id = small_id;
      }
      public String getTitle() {
         return title;
      }
      public void setTitle(String title) {
         this.title = title;
      }
      public String getTradeArea() {
         return tradeArea;
      }
      public void setTradeArea(String tradeArea) {
         this.tradeArea = tradeArea;
      }
      public String getCondition() {
         return condition;
      }
      public void setCondition(String condition) {
         this.condition = condition;
      }
      public String getExchange() {
         return exchange;
      }
      public void setExchange(String exchange) {
         this.exchange = exchange;
      }
      public int getPrice() {
         return price;
      }
      public void setPrice(int price) {
         this.price = price;
      }
      public String getDescription() {
         return description;
      }
      public void setDescription(String description) {
         this.description = description;
      }
      public String getTag() {
         return tag;
      }
      public void setTag(String tag) {
         this.tag = tag;
      }
      public int getAmount() {
         return amount;
      }
      public void setAmount(int amount) {
         this.amount = amount;
      }
      public String getSafety_sell() {
         return safety_sell;
      }
      public void setSafety_sell(String safety_sell) {
         this.safety_sell = safety_sell;
      }
      public String getShipping_included() {
         return shipping_included;
      }
      public void setShipping_included(String shipping_included) {
         this.shipping_included = shipping_included;
      }
      public Date getRegister_date() {
         return register_date;
      }
      public void setRegister_date(Date register_date) {
         this.register_date = register_date;
      }
      public String getChecks() {
         return checks;
      }
      public void setChecks(String checks) {
         this.checks = checks;
      }
      public int getBlacklist_cnt() {
         return blacklist_cnt;
      }
      public void setBlacklist_cnt(int blacklist_cnt) {
         this.blacklist_cnt = blacklist_cnt;
      }
      public int getDelivery_fee() {
         return delivery_fee;
      }
      public void setDelivery_fee(int delivery_fee) {
         this.delivery_fee = delivery_fee;
      }
      public String getStatus() {
         return status;
      }
      public void setStatus(String status) {
         this.status = status;
      }
      public String getSale_method() {
         return sale_method;
      }
      public void setSale_method(String sale_method) {
         this.sale_method = sale_method;
      }
      public String getImage_path() {
         return image_path;
      }
      public void setImage_path(String image_path) {
         this.image_path = image_path;
      }
      public int getView_count() {
         return view_count;
      }
      public void setView_count(int view_count) {
         this.view_count = view_count;
      }
      @Override
      public String toString() {
         return "ProductDTO [product_id=" + product_id + ", member_id=" + member_id + ", large_id=" + large_id
               + ", medium_id=" + medium_id + ", small_id=" + small_id + ", title=" + title + ", tradeArea="
               + tradeArea + ", condition=" + condition + ", exchange=" + exchange + ", price=" + price
               + ", description=" + description + ", tag=" + tag + ", amount=" + amount + ", safety_sell="
               + safety_sell + ", shipping_included=" + shipping_included + ", register_date=" + register_date
               + ", checks=" + checks + ", blacklist_cnt=" + blacklist_cnt + ", delivery_fee=" + delivery_fee
               + ", status=" + status + ", sale_method=" + sale_method + ", image_path=" + image_path
               + ", view_count=" + view_count + "]";
      }
       
      
       
       
       
}