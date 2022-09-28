package kr.entity;

public class tbl_member {
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_phone;
	private int challenge_total;
	private String mb_joindate;
	private String mb_type;
	private int mb_level; 
	
	public tbl_member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public int getChallenge_total() {
		return challenge_total;
	}
	public void setChallenge_total(int challenge_total) {
		this.challenge_total = challenge_total;
	}
	public String getMb_joindate() {
		return mb_joindate;
	}
	public void setMb_joindate(String mb_joindate) {
		this.mb_joindate = mb_joindate;
	}
	public String getMb_type() {
		return mb_type;
	}
	public void setMb_type(String mb_type) {
		this.mb_type = mb_type;
	}
	public int getMb_level() {
		return mb_level;
	}
	public void setMb_level(int mb_level) {
		this.mb_level = mb_level;
	}
	@Override
	public String toString() {
		return "tbl_member [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name + ", mb_phone=" + mb_phone
				+ ", challenge_total=" + challenge_total + ", mb_joindate=" + mb_joindate + ", mb_type=" + mb_type
				+ ", mb_level=" + mb_level + "]";
	}
	
	
	
	
}




