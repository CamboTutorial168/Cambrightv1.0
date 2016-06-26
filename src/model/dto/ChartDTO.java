package model.dto;

import com.google.gson.annotations.SerializedName;

public class ChartDTO {
	@SerializedName("branch")
	private String branch;
	@SerializedName("gender")
	private String gender;
	@SerializedName("quantity")
	private String quantity;
	//chat line
	@SerializedName("total")
	private String total;
	@SerializedName("month_ofyear")
	private String month_ofyear;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTotal() {
		return total;
	}
	public String getMonth_ofyear() {
		return month_ofyear;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public void setMonth_ofyear(String month_ofyear) {
		this.month_ofyear = month_ofyear;
	}
}
