package model.vo;
public class Mcategory {
	int mcode;
	String mCodeName;
	int mLcode;
	
	public Mcategory() {
	}

	public Mcategory(int mcode, String mCodeName, int mLcode) {
		super();
		this.mcode = mcode;
		this.mCodeName = mCodeName;
		this.mLcode = mLcode;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public String getmCodeName() {
		return mCodeName;
	}

	public void setmCodeName(String mCodeName) {
		this.mCodeName = mCodeName;
	}

	public int getmLcode() {
		return mLcode;
	}

	public void setmLcode(int mLcode) {
		this.mLcode = mLcode;
	}
	
	
}
