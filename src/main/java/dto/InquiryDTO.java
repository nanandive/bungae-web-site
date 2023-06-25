package dto;

import java.util.Date;

public class InquiryDTO {
	
	private int inquiry_id;
	private int admin_id;
	private String type;
	private String inquiry_img;
	private String inquiry_ct;
	private Date write_date;
	private String status;
	private String detail_type;
	private String answer;

	public InquiryDTO() {

	}

	public InquiryDTO(int inquiry_id, int admin_id, String type, String inquiry_img, String inquiry_ct, Date write_date,
			String status, String detail_type, String answer) {
		super();
		this.inquiry_id = inquiry_id;
		this.admin_id = admin_id;
		this.type = type;
		this.inquiry_img = inquiry_img;
		this.inquiry_ct = inquiry_ct;
		this.write_date = write_date;
		this.status = status;
		this.detail_type = detail_type;
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "InquiryDTO [inquiry_id=" + inquiry_id + ", admin_id=" + admin_id + ", type=" + type + ", inquiry_img="
				+ inquiry_img + ", inquiry_ct=" + inquiry_ct + ", write_date=" + write_date + ", status=" + status
				+ ", detail_type=" + detail_type + ",answer=" + answer + "]";
	}

	public int getInquiry_id() {
		return inquiry_id;
	}

	public void setInquiry_id(int inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getInquiry_img() {
		return inquiry_img;
	}

	public void setInquiry_img(String inquiry_img) {
		this.inquiry_img = inquiry_img;
	}

	public String getInquiry_ct() {
		return inquiry_ct;
	}

	public void setInquiry_ct(String inquiry_ct) {
		this.inquiry_ct = inquiry_ct;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDetail_type() {
		return detail_type;
	}

	public void setDetail_type(String detail_type) {
		this.detail_type = detail_type;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}	

}