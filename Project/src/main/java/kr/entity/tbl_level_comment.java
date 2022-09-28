package kr.entity;


public class tbl_level_comment {
	private int lv_cmt_seq;
	private int lv_seq;
	private int level;
	private String lv_cmt_content;
	private String cmt_date;
	private String mb_id;
	private String mb_name;	
	
	public tbl_level_comment(){
	}
	
	public tbl_level_comment(int lv_cmt_seq, int lv_seq,int level, String lv_cmt_content, String cmt_date, String mb_id, String mb_name) {
		super();
		this.level = level;
		this.lv_cmt_seq = lv_cmt_seq;
		this.lv_seq = lv_seq;
		this.lv_cmt_content = lv_cmt_content;
		this.cmt_date = cmt_date;
		this.mb_id = mb_id;
		this.mb_name = mb_name;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getLv_cmt_seq() {
		return lv_cmt_seq;
	}
	public void setLv_cmt_seq(int lv_cmt_seq) {
		this.lv_cmt_seq = lv_cmt_seq;
	}
	public int getLv_seq() {
		return lv_seq;
	}
	public void setLv_seq(int lv_seq) {
		this.lv_seq = lv_seq;
	}
	public String getLv_cmt_content() {
		return lv_cmt_content;
	}
	public void setLv_cmt_content(String lv_cmt_content) {
		this.lv_cmt_content = lv_cmt_content;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

}