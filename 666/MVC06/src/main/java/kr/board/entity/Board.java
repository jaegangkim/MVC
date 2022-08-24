package kr.board.entity;

public class Board {
	private int num;
	private String memId;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int num, String memId, String title, String content, String writer, String indate, int count) {
		super();
		this.num = num;
		this.memId = memId;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.indate = indate;
		this.count = count;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", memId=" + memId + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", indate=" + indate + ", count=" + count + "]";
	}
	
}

