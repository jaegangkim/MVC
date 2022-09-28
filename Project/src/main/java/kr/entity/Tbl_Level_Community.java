package kr.entity;

public class Tbl_Level_Community {

	private int level; // 2
	private int lv_seq; // 레벨 게시판 글 번호 // 21
	private String lv_title; // 레벨 게시판 제목
	private String lv_content; // 레벨 게시판 내용
	private String lv_date; // 레벨 게시판 작성시간
	private String mb_id; // 작성 회원 id
	private String mb_name; // 작성 회원 id
	private int lv_cnt; // 레벨 게시판 조회수
	public Tbl_Level_Community(){
		
	}

	public Tbl_Level_Community(int lv_seq, String lv_title, String lv_content, String lv_date, String mb_id, String mb_name,
			int lv_cnt) {
		super();
		this.lv_seq = lv_seq;
		this.lv_title = lv_title;
		this.lv_content = lv_content;
		this.lv_date = lv_date;
		this.mb_id = mb_id;
		this.mb_name = mb_name;
		this.lv_cnt = lv_cnt;
	}

	public int getLv_seq() {
		return lv_seq;
	}

	public void setLv_seq(int lv_seq) {
		this.lv_seq = lv_seq;
	}

	public String getLv_title() {
		return lv_title;
	}

	public void setLv_title(String lv_title) {
		this.lv_title = lv_title;
	}

	public String getLv_content() {
		return lv_content;
	}

	public void setLv_content(String lv_content) {
		this.lv_content = lv_content;
	}

	public String getLv_date() {
		return lv_date;
	}

	public void setLv_date(String lv_date) {
		this.lv_date = lv_date;
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

	public int getLv_cnt() {
		return lv_cnt;
	}

	public void setLv_cnt(int lv_cnt) {
		this.lv_cnt = lv_cnt;
	}

	public int getLevel() {
		return level;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}
}