package kr.entity;

public class Board {
	private int comm_seq; // 게시물 번호
	private String comm_title; // 게시물 제목
	private String comm_content; // 내용
	private String comm_date; // 날짜
	private String mb_id; // 작성자 id
	private String mb_name; // 작성자
	private int comm_cnt; // 조회수
	
	public Board() { // 디폴트 생성자
	}

	public Board(int comm_seq, String comm_title, String comm_content, String comm_date, String mb_id, String mb_name, int comm_cnt) {
		super();
		this.comm_seq = comm_seq;
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_date = comm_date;
		this.mb_id = mb_id;
		this.mb_name = mb_name;
		this.comm_cnt = comm_cnt;
	}

	public int getComm_seq() {
		return comm_seq;
	}

	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}

	public String getComm_title() {
		return comm_title;
	}

	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public String getComm_date() {
		return comm_date;
	}

	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
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

	public int getComm_cnt() {
		return comm_cnt;
	}

	public void setComm_cnt(int comm_cnt) {
		this.comm_cnt = comm_cnt;
	}

	@Override
	public String toString() {
		return "Board [comm_seq=" + comm_seq + ", comm_title=" + comm_title + ", comm_content=" + comm_content
				+ ", comm_date=" + comm_date + ", mb_id=" + mb_id + ", comm_cnt=" + comm_cnt + "]";
	}

	
	
	
}
