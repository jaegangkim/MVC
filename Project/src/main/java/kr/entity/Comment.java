package kr.entity;

public class Comment {
	
	private int comm_cmt_seq; // 댓글 번호
	private int comm_seq; // Board 번호
	private String comm_cmt_content; // 댓글 내용
	private String comm_cmt_date; // 댓글 작성 날짜
	private String mb_id; // 댓글 작성자
	private String mb_name;
	
	
	public Comment() {
		
	}
	
	
	public Comment(int comm_cmt_seq, int comm_seq, String comm_cmt_content, String comm_cmt_date, String mb_id, String mb_name) {
		this.comm_cmt_seq = comm_cmt_seq;
		this.comm_seq = comm_seq;
		this.comm_cmt_content = comm_cmt_content;
		this.comm_cmt_date = comm_cmt_date;
		this.mb_id = mb_id;
		this.mb_name = mb_name;
	}



	public int getComm_cmt_seq() {
		return comm_cmt_seq;
	}

	public void setComm_cmt_seq(int comm_cmt_seq) {
		this.comm_cmt_seq = comm_cmt_seq;
	}

	public int getComm_seq() {
		return comm_seq;
	}

	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}

	public String getComm_cmt_content() {
		return comm_cmt_content;
	}

	public void setComm_cmt_content(String comm_cmt_content) {
		this.comm_cmt_content = comm_cmt_content;
	}

	public String getComm_cmt_date() {
		return comm_cmt_date;
	}

	public void setComm_cmt_date(String comm_cmt_date) {
		this.comm_cmt_date = comm_cmt_date;
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
