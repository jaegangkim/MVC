package kr.entity;

public class Mb_Level {
//    tbl_member_challenge
	private int mc_seq;
	private String mb_id;
	private int chal_item_seq;
	private int pay_money;
	private String pay_date;
	
//    tbl_member
	private String mb_pw;
	private String mb_name;
	private String mb_phone;
	private int challenge_total;
	private String mb_joindate;
	private String mb_type;
	private int mb_level;
	private int mb_avg;
	
	
	public Mb_Level(int mc_seq, String mb_id, int chal_item_seq, int pay_money, String pay_date, String mb_pw,
			String mb_name, String mb_phone, int challenge_total, String mb_joindate, String mb_type, int mb_level,
			int mb_avg) {
		super();
		this.mc_seq = mc_seq;
		this.mb_id = mb_id;
		this.chal_item_seq = chal_item_seq;
		this.pay_money = pay_money;
		this.pay_date = pay_date;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_phone = mb_phone;
		this.challenge_total = challenge_total;
		this.mb_joindate = mb_joindate;
		this.mb_type = mb_type;
		this.mb_level = mb_level;
		this.mb_avg = mb_avg;
	}

	public int getMb_avg() {
		return mb_avg;
	}

	public void setMb_avg(int Mb_avg) {
		this.mb_avg = Mb_avg ;
	}

	
	public Mb_Level() {
		
	}

	public int getMc_seq() {
		return mc_seq;
	}

	public void setMc_seq(int mc_seq) {
		this.mc_seq = mc_seq;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getChal_item_seq() {
		return chal_item_seq;
	}

	public void setChal_item_seq(int chal_item_seq) {
		this.chal_item_seq = chal_item_seq;
	}

	public int getPay_money() {
		return pay_money;
	}

	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
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
	
	
}