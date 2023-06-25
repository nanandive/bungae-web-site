package dto;

public class FrequentlyDTO {
	private int freq_id;
	private String freq_type;
	private String  freq_title;
	private String  freq_content;
	
	

	public FrequentlyDTO() {
		
	}

	@Override
	public String toString() {
		return "FrequentlyDTO [freq_id=" + freq_id + ", freq_type=" + freq_type + ", freq_title=" + freq_title
				+ ", freq_content=" + freq_content + "]";
	}

	public int getFreq_id() {
		return freq_id;
	}

	public void setFreq_id(int freq_id) {
		this.freq_id = freq_id;
	}
	public String getFreq_type() {
		return freq_type;
	}
	public void setFreq_type(String freq_type) {
		this.freq_type = freq_type;
	}
	public String getFreq_title() {
		return freq_title;
	}
	public void setFreq_title(String freq_title) {
		this.freq_title = freq_title;
	}
	public String getFreq_content() {
		return freq_content;
	}
	public void setFreq_content(String freq_content) {
		this.freq_content = freq_content;
	}
	

}
