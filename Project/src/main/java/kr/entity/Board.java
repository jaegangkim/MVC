package kr.entity;

public class Board {
	private int comm_seq; // 게시물 번호
	private String comm_title; // 게시물 제목
	private String comm_content; // 내용
	private String comm_date; // 날짜
	private String mb_id; // 작성자 id
	private String mb_name; // 작성자
	private int comm_cnt; // 조회수
	private String filename;
	private int likes; // 좋아요 
	private int comment_count; // 댓글 개수
	public Board() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getcomment_count() {
		return comment_count;
	}
	public void setcomment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	@Override
	public String toString() {
		return "Board [comm_seq=" + comm_seq + ", comm_title=" + comm_title + ", comm_content=" + comm_content
				+ ", comm_date=" + comm_date + ", mb_id=" + mb_id + ", mb_name=" + mb_name + ", comm_cnt=" + comm_cnt
				+ ", filename=" + filename + ", likes=" + likes + ", comment_count=" + comment_count + "]";
	}
	
	
}