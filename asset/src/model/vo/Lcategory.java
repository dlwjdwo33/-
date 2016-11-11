package model.vo;

public class Lcategory {
	int lCode;
	String lCodeName;
	
	public Lcategory() {
	}
	
	public Lcategory(int lCode, String lCodeName) {
		this.lCode = lCode;
		this.lCodeName = lCodeName;
	}

	public int getlCode() {
		return lCode;
	}

	public void setlCode(int lCode) {
		this.lCode = lCode;
	}

	public String getlCodeName() {
		return lCodeName;
	}

	public void setlCodeName(String lCodeName) {
		this.lCodeName = lCodeName;
	}

	@Override
	public String toString() {
		return "lCode [lCode=" + lCode + ", lCodeName=" + lCodeName + "]";
	}
	
	
}
