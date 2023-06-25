package dto;

public class Small_classDTO {
	private int small_id;
	private String small_name;

	public int getSmall_id() {
		return small_id;
	}

	public void setSmall_id(int small_id) {
		this.small_id = small_id;
	}

	public String getSmall_name() {
		return small_name;
	}

	public Small_classDTO(int small_id, String small_name) {
		super();
		this.small_id = small_id;
		this.small_name = small_name;
	}

	public void setSmall_name(String small_name) {
		this.small_name = small_name;
	}

	@Override
	public String toString() {
		return "Small_classDTO [small_id=" + small_id + ", small_name=" + small_name + "]";
	}
}
