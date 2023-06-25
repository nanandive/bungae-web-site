package dto;

import java.util.Date;

public class OrdersDTO {

	
	    private int order_id; // 주문 ID
	    private int product_id; // 상품ID 
	    private String member_id; // 회원ID
	    private int delivery; //거래방식
	    private Date orderdate; // 결제일
	    private int price; // 가격
	    private String or_address; // 주소
	    private String status; // 진행상태 
	    private int payment_method;  // 결제수단  
		public OrdersDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public OrdersDTO(int order_id, int product_id, String member_id, int delivery, Date orderdate, int price,
				String or_address, String status, int payment_method) {
			super();
			this.order_id = order_id;
			this.product_id = product_id;
			this.member_id = member_id;
			this.delivery = delivery;
			this.orderdate = orderdate;
			this.price = price;
			this.or_address = or_address;
			this.status = status;
			this.payment_method = payment_method;
		}
		public int getOrder_id() {
			return order_id;
		}
		public void setOrder_id(int order_id) {
			this.order_id = order_id;
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
		public int getDelivery() {
			return delivery;
		}
		public void setDelivery(int delivery) {
			this.delivery = delivery;
		}
		public Date getOrderdate() {
			return orderdate;
		}
		public void setOrderdate(Date orderdate) {
			this.orderdate = orderdate;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getOr_address() {
			return or_address;
		}
		public void setOr_address(String or_address) {
			this.or_address = or_address;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public int getPayment_method() {
			return payment_method;
		}
		public void setPayment_method(int payment_method) {
			this.payment_method = payment_method;
		}
		@Override
		public String toString() {
			return "OrdersDTO [order_id=" + order_id + ", product_id=" + product_id + ", member_id=" + member_id
					+ ", delivery=" + delivery + ", orderdate=" + orderdate + ", price=" + price + ", or_address="
					+ or_address + ", status=" + status + ", payment_method=" + payment_method + "]";
		}
	
		
	    
	    
	    
}
