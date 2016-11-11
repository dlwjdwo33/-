package model.vo;

public class History {
	int sequence;
	String accNo;
	int dwcode;
	int payment;
	int price;
	String date;
	String memo;
	String useloc;
	int mcode;
	int lcode;
	String aid;
	String mcodename;
	String bankname;
	String lcodename;
	
	public History(){
		
	}
	
	public History(String accNo, int dwcode, int payment, int price, String date, String memo, String useloc,
			int mcode, int lcode) {
		this.accNo = accNo;
		this.dwcode = dwcode;
		this.payment = payment;
		this.price = price;
		this.date = date;
		this.memo = memo;
		this.useloc = useloc;
		this.mcode = mcode;
		this.lcode = lcode;
	}

	public History(int seq, String accno, int dwcode, int payment, int price, String date, String memo,
			String useloc, int code, int lcode) {
		this.sequence = seq;
		this.accNo = accno;
		this.dwcode = dwcode;
		this.payment = payment;
		this.price = price;
		this.date = date;
		this.memo = memo;
		this.useloc = useloc;
		this.mcode = code;
		this.lcode = lcode;
	}

	
	public History(String haccno, String bankname, int dwcode, int paytype, int price, String hdate, String memo,
			String specification, int hmcode, String aid, String mcodename) {
		this.accNo = haccno;
		this.bankname= bankname;
		this.dwcode=dwcode;
		this.payment=paytype;
		this.price=price;
		this.date=hdate;
		this.memo=memo;
		this.useloc=specification;
		this.mcode=hmcode;
		this.aid=aid;
		this.mcodename=mcodename;

	}



	public History(int seq, String haccno, String bankname, int dwcode, int paytype, int price, String hdate, String memo,
			String specification, int hmcode, String aid, String mcodename) {
		this.sequence = seq;
		this.accNo = haccno;
		this.bankname= bankname;
		this.dwcode=dwcode;
		this.payment=paytype;
		this.price=price;
		this.date=hdate;
		this.memo=memo;
		this.useloc=specification;
		this.mcode=hmcode;
		this.aid=aid;
		this.mcodename=mcodename;
	}

	public History(int seq, String haccno, String bankname, int dwcode, int paytype, int price, String hdate, String memo,
			String specification, int hmcode, String aid, String mcodename , String lcodename) {
		
		this.sequence = seq;
		this.accNo = haccno;
		this.bankname= bankname;
		this.dwcode=dwcode;
		this.payment=paytype;
		this.price=price;
		this.date=hdate;
		this.memo=memo;
		this.useloc=specification;
		this.mcode=hmcode;
		this.aid=aid;
		this.mcodename=mcodename;
		this.lcodename=lcodename;
	} 

	

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public int getDwcode() {
		return dwcode;
	}

	public void setDwcode(int dwcode) {
		this.dwcode = dwcode;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getUseloc() {
		return useloc;
	}

	public void setUseloc(String useloc) {
		this.useloc = useloc;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public int getLcode() {
		return lcode;
	}

	public void setLcode(int lcode) {
		this.lcode = lcode;
	}
	
	public int getSequence() {
		return sequence;
	}


	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	
	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getMcodename() {
		return mcodename;
	}

	public void setMcodename(String mcodename) {
		this.mcodename = mcodename;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getLcodename() {
		return lcodename;
	}

	public void setLcodename(String lcodename) {
		this.lcodename = lcodename;
	}

	@Override
	public String toString() {
		return "History [sequence=" + sequence + ", accNo=" + accNo + ", dwcode=" + dwcode + ", payment=" + payment
				+ ", price=" + price + ", date=" + date + ", memo=" + memo + ", useloc=" + useloc + ", mcode=" + mcode
				+ ", lcode=" + lcode + ", aid=" + aid + ", mcodename=" + mcodename + ", bankname=" + bankname
				+ ", lcodename=" + lcodename + "]";
	}



	

	
	
}
