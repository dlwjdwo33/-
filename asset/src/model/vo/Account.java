package model.vo;

public class Account {
	String accNo;
	String bankName;
	int balance;
	String aid;
	String aaaa;

	public Account() {
	}
	
//accountDao 에서추가로 오버라이드 한 함수에서 사용할 생성자.
	public Account(String accNo, String bankName, int balance) {
		super();
		this.accNo = accNo;
		this.bankName = bankName;
		this.balance = balance;
	}

	public Account(String accNo, String bankName, int balance, String id) {
		this.accNo = accNo;
		this.bankName = bankName;
		this.balance = balance;
		this.aid = id;
	}
	
	public int withdraw(int money){
		this.balance -= money;
		return balance;
	}
	
	public int deposit(int money){
		this.balance += money;
		return balance;
	}

	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	
	

	public String getAaaa() {
		return aaaa;
	}

	public void setAaaa(String aaaa) {
		this.aaaa = aaaa;
	}

	@Override
	public String toString() {
		return "Account [accNo=" + accNo + ", bankName=" + bankName + ", balance=" + balance + ", aid=" + aid
				+ ", aaaa=" + aaaa + "]";
	}
	
	
	
	
	
	
}
