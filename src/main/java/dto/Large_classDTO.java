package dto;

public class Large_classDTO {
	private int large_id;
	private String large_name;

	public int getLarge_id() {
		return large_id;
	}

	public void setLarge_id(int large_id) {
		this.large_id = large_id;
	}

	public String getLarge_name() {
		return large_name;
	}

	public void setLarge_name(String large_name) {
		this.large_name = large_name;
	}

	@Override
	public String toString() {
		return "Large_classDTO [large_id=" + large_id + ", large_name=" + large_name + "]";
	}

	public Large_classDTO(int large_id, String large_name) {
		super();
		this.large_id = large_id;
		this.large_name = large_name;
	}
}
