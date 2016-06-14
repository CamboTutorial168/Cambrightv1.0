package model.dto;

public class SchoolFeeDTO {
	private String fee_id;
	private String paid_date;
	private String expr_date;
	private String discount;
	private String fee;
	private String student_id;
	private String fee_type_id;
	private String prog_t_id;
	private String fee_type;
	private String status;
	public String getFee_id() {
		return fee_id;
	}
	public void setFee_id(String fee_id) {
		this.fee_id = fee_id;
	}
	public String getPaid_date() {
		return paid_date;
	}
	public void setPaid_date(String paid_date) {
		this.paid_date = paid_date;
	}
	public String getExpr_date() {
		return expr_date;
	}
	public void setExpr_date(String expr_date) {
		this.expr_date = expr_date;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getFee_type_id() {
		return fee_type_id;
	}
	public void setFee_type_id(String fee_type_id) {
		this.fee_type_id = fee_type_id;
	}
	public String getProg_t_id() {
		return prog_t_id;
	}
	public void setProg_t_id(String prog_t_id) {
		this.prog_t_id = prog_t_id;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
