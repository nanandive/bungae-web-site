package dto;

public class LoveDTO {

	
	private int love_id ;
	private int product_id; 
	private String member_id ;
	public LoveDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoveDTO(int love_id, int product_id, String member_id) {
		super();
		this.love_id = love_id;
		this.product_id = product_id;
		this.member_id = member_id;
	}
	public int getLove_id() {
		return love_id;
	}
	public void setLove_id(int love_id) {
		this.love_id = love_id;
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
	@Override
	public String toString() {
		return "LoveDTO [love_id=" + love_id + ", product_id=" + product_id + ", member_id=" + member_id + "]";
	}
	
	
}
