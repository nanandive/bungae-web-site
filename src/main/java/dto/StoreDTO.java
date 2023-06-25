package dto;

import java.util.Date;

public class StoreDTO {

   private int product_id;
   private String member_id;
   private int large_id;
   private int medium_id;
   private int small_id;
   private String title;
   private String tradearea;
   private String condition;
   private String exchange;
   private int price;
   private String description;
   private String tag;
   private int amount;
   private String safety_sell;
   private String shipping_included;
   private Date register_date;
   private String checks;
   private int blacklist_cnt;
   private int delivery_fee;
   private String status;
   private String sale_method;
   private String image_path;

   private int love_Id;
   private int product_Id;
   private String member_Id;
   



public int getLove_Id() {
	return love_Id;
}

public void setLove_Id(int love_Id) {
	this.love_Id = love_Id;
}

public int getProduct_Id() {
	return product_Id;
}

public void setProduct_Id(int product_Id) {
	this.product_Id = product_Id;
}

public String getMember_Id() {
	return member_Id;
}

public void setMember_Id(String member_Id) {
	this.member_Id = member_Id;
}

public StoreDTO() {
      // TODO Auto-generated constructor stub
   }

   public StoreDTO(int product_id, String member_id, int large_id, int medium_id, int small_id, String title,
         String tradearea, String condition, String exchange, int price, String description, String tag, int amount,
         String safety_sell, String shipping_included, Date register_date, String checks, int blacklist_cnt,
         int delivery_fee, String status, String sale_method, String image_path) {
      super();
      this.product_id = product_id;
      this.member_id = member_id;
      this.large_id = large_id;
      this.medium_id = medium_id;
      this.small_id = small_id;
      this.title = title;
      this.tradearea = tradearea;
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
   }

   @Override
public String toString() {
	return "StoreDTO [product_id=" + product_id + ", member_id=" + member_id + ", large_id=" + large_id + ", medium_id="
			+ medium_id + ", small_id=" + small_id + ", title=" + title + ", tradearea=" + tradearea + ", condition="
			+ condition + ", exchange=" + exchange + ", price=" + price + ", description=" + description + ", tag="
			+ tag + ", amount=" + amount + ", safety_sell=" + safety_sell + ", shipping_included=" + shipping_included
			+ ", register_date=" + register_date + ", checks=" + checks + ", blacklist_cnt=" + blacklist_cnt
			+ ", delivery_fee=" + delivery_fee + ", status=" + status + ", sale_method=" + sale_method + ", image_path="
			+ image_path + ", love_Id=" + love_Id + ", product_Id=" + product_Id + ", member_Id=" + member_Id + "]";
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

   public String getTradearea() {
      return tradearea;
   }

   public void setTradearea(String tradearea) {
      this.tradearea = tradearea;
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







}