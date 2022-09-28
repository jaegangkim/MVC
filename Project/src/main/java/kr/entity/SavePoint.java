package kr.entity;

public class SavePoint {
	private int save_seq;
	private String save_title;
	private String save_content;
	private String save_write;
	private String save_date;
	
	public SavePoint() {
	}

	public SavePoint(int save_seq, String save_title, String save_content, String save_write, String save_date) {
		super();
		this.save_seq = save_seq;
		this.save_title = save_title;
		this.save_content = save_content;
		this.save_write = save_write;
		this.save_date = save_date;
	}

	public int getSave_seq() {
		return save_seq;
	}

	public void setSave_seq(int save_seq) {
		this.save_seq = save_seq;
	}

	public String getSave_title() {
		return save_title;
	}

	public void setSave_title(String save_title) {
		this.save_title = save_title;
	}

	public String getSave_content() {
		return save_content;
	}

	public void setSave_content(String save_content) {
		this.save_content = save_content;
	}

	public String getSave_write() {
		return save_write;
	}

	public void setSave_write(String save_write) {
		this.save_write = save_write;
	}

	public String getSave_date() {
		return save_date;
	}

	public void setSave_date(String save_date) {
		this.save_date = save_date;
	}
	
	
}
