package model.dto;

public class PaymentFilterDTO {
	private String student_id;
	private String id_card;
	private String class_id;
	private String class_title;
	private String teach_id;
	private String sub_prog_id;
	private String sub_prog_title;
	private String term_fee;
	private String sem_fee;
	private String year_fee;
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_title() {
		return class_title;
	}
	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}
	public String getTeach_id() {
		return teach_id;
	}
	public void setTeach_id(String teach_id) {
		this.teach_id = teach_id;
	}
	public String getSub_prog_id() {
		return sub_prog_id;
	}
	public void setSub_prog_id(String sub_prog_id) {
		this.sub_prog_id = sub_prog_id;
	}
	public String getSub_prog_title() {
		return sub_prog_title;
	}
	public void setSub_prog_title(String sub_prog_title) {
		this.sub_prog_title = sub_prog_title;
	}
	public String getTerm_fee() {
		return term_fee;
	}
	public void setTerm_fee(String term_fee) {
		this.term_fee = term_fee;
	}
	public String getSem_fee() {
		return sem_fee;
	}
	public void setSem_fee(String sem_fee) {
		this.sem_fee = sem_fee;
	}
	public String getYear_fee() {
		return year_fee;
	}
	public void setYear_fee(String year_fee) {
		this.year_fee = year_fee;
	}
}
