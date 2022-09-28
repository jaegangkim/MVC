package kr.entity;

public class sumMonthPay {

	private String day;
	private int sumPay;
	private int item;
	
	public sumMonthPay() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	public int getItem() {
		return item;
	}





	public void setItem(int item) {
		this.item = item;
	}





	public String getDay() {
		return day;
	}





	public void setDay(String day) {
		this.day = day;
	}





	public int getSumPay() {
		return sumPay;
	}





	public void setSumPay(int sumPay) {
		this.sumPay = sumPay;
	}





	@Override
	public String toString() {
		return "sumMonthPay [day=" + day + ", sumPay=" + sumPay + ", item=" + item + "]";
	}






	
	
	
	
}
