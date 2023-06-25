package dto;

import java.util.Date;

public class ReviewDTO {
	
	private int order_id;
	private int product_id;
	private String member_id;
	private Date write_time;
	private double star;
	private String review_detail;
	private Date review_update;
	private String review_state;
	private String title;
	
	
	
	
	



	public ReviewDTO() {
		super();

	}


	


	public ReviewDTO(int order_id, int product_id, String member_id, Date write_time, double star, String review_detail,
			Date review_update, String review_state, String title) {
		super();
		this.order_id = order_id;
		this.product_id = product_id;
		this.member_id = member_id;
		this.write_time = write_time;
		this.star = star;
		this.review_detail = review_detail;
		this.review_update = review_update;
		this.review_state = review_state;
		this.title = title;
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





	public Date getWrite_time() {
		return write_time;
	}





	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}





	public double getStar() {
		return star;
	}





	public void setStar(double star) {
		this.star = star;
	}





	public String getReview_detail() {
		return review_detail;
	}





	public void setReview_detail(String review_detail) {
		this.review_detail = review_detail;
	}





	public Date getReview_update() {
		return review_update;
	}





	public void setReview_update(Date review_update) {
		this.review_update = review_update;
	}





	public String getReview_state() {
		return review_state;
	}





	public void setReview_state(String review_state) {
		this.review_state = review_state;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	@Override
	public String toString() {
		return "ReviewDTO [order_id=" + order_id + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", write_time=" + write_time + ", star=" + star + ", review_detail=" + review_detail
				+ ", review_update=" + review_update + ", review_state=" + review_state + ", title=" + title + "]";
	}


	


	
	
	
	
	
	
	
}
