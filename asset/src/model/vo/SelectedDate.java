package model.vo;

public class SelectedDate {
	String startDate;
	String endDate;
	
	
	public SelectedDate() {
	}
	public SelectedDate(String startDate, String endDate) {
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public String getStartDate(){
		return this.startDate;
	}
	public String getEndDate(){
		return this.endDate;
	}
	
	

}
