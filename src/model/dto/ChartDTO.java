package model.dto;

import com.google.gson.annotations.SerializedName;

public class ChartDTO {
	@SerializedName("branch")
	private String branch;
	@SerializedName("gender")
	private String gender;
	@SerializedName("quantity")
	private String quantity;
	
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
}
