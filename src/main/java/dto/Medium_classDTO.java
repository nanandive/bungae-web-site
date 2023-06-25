package dto;

public class Medium_classDTO {
	private int medium_id;
	private String medium_name;

	public int getMedium_id() {
		return medium_id;
	}

	public void setMedium_id(int medium_id) {
		this.medium_id = medium_id;
	}

	public String getMedium_name() {
		return medium_name;
	}

	public void setMedium_name(String medium_name) {
		this.medium_name = medium_name;
	}

	@Override
	public String toString() {
		return "Medium_classDTO [medium_id=" + medium_id + ", medium_name=" + medium_name + "]";
	}

	public Medium_classDTO(int medium_id, String medium_name) {
		super();
		this.medium_id = medium_id;
		this.medium_name = medium_name;
	}

}
