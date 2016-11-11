package model.vo;

public class mCode {
	int mcode;
	int lcode;
	String mCodeName;
	
	public mCode() {
	}
	public mCode(int mcode,String mCodeName,int code) {
		this.mcode = mcode;
		this.lcode = code;
		this.mCodeName = mCodeName;
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
	public String getmCodeName() {
		return mCodeName;
	}
	public void setmCodeName(String mCodeName) {
		this.mCodeName = mCodeName;
	}
	
	
}
