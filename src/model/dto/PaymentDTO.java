package model.dto;

public class PaymentDTO {
	private String pay_id;
	private String pay_type_fee;
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
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
	public String getPaid_student_id() {
		return paid_student_id;
	}
	public void setPaid_student_id(String paid_student_id) {
		this.paid_student_id = paid_student_id;
	}
	public String getSubprog_id() {
		return subprog_id;
	}
	public void setSubprog_id(String subprog_id) {
		this.subprog_id = subprog_id;
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
	private String fee_type;
	private String discount;
	private String date_paid;
	
	private String paid_student_id;
	private String subprog_id;
	private String subprog_title;
	private String expired;
	private String total;
	public String getSubprog_title() {
		return subprog_title;
	}
	public void setSubprog_title(String subprog_title) {
		this.subprog_title = subprog_title;
	}
	public String getPay_type_fee() {
		return pay_type_fee;
	}
	public void setPay_type_fee(String pay_type_fee) {
		this.pay_type_fee = pay_type_fee;
	}
	
	@Override
	public String toString() {
		return "PaymentDTO [pay_id=" + pay_id + ", fee_type=" + fee_type
				+ ", discount=" + discount + ", date_paid=" + date_paid
				+ ", paid_student_id=" + paid_student_id + ", subprog_id="
				+ subprog_id + ", expired=" + expired + ", total=" + total
				+ "]";
	}
}
