package model.dto;

public class PaymentHistory {
	private String pay_type_fee;
	private String recept_id;
	private String recept_name;
	private String branch_name;
	private String branch_color;
	private String fee_type;
	private String discount;
	private String date_paid;
	private String subprog_title;
	private String expired;
	private String total;
	public String getPay_type_fee() {
		return pay_type_fee;
	}
	public void setPay_type_fee(String pay_type_fee) {
		this.pay_type_fee = pay_type_fee;
	}
	public String getRecept_id() {
		return recept_id;
	}
	public void setRecept_id(String recept_id) {
		this.recept_id = recept_id;
	}
	public String getRecept_name() {
		return recept_name;
	}
	public void setRecept_name(String recept_name) {
		this.recept_name = recept_name;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_color() {
		return branch_color;
	}
	public void setBranch_color(String branch_color) {
		this.branch_color = branch_color;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getDate_paid() {
		return date_paid;
	}
	public void setDate_paid(String date_paid) {
		this.date_paid = date_paid;
	}
	public String getSubprog_title() {
		return subprog_title;
	}
	public void setSubprog_title(String subprog_title) {
		this.subprog_title = subprog_title;
	}
	public String getExpired() {
		return expired;
	}
	public void setExpired(String expired) {
		this.expired = expired;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}
