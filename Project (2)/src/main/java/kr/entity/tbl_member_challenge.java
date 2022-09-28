package kr.entity;

public class tbl_member_challenge {
	private int mc_seq;
	private String mb_id;
	private int chal_item_seq;
	private int pay_money;
	private String pay_date;
	public tbl_member_challenge() {
		super();
		// TODO Auto-generated constructor stub
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
	
	
	
	
	
}
