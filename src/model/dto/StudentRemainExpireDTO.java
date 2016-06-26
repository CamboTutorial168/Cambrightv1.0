package model.dto;

public class StudentRemainExpireDTO {
	private String student_id;
	private String id_card;
	private String kh_name;
	private String en_name;
	private String img_url;
	private String status;
	private String branch_id;
	private String branch_name;
	private String branch_color;
	private String remain_date;
	private String expried_date;
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
	public String getKh_name() {
		return kh_name;
	}
	public void setKh_name(String kh_name) {
		this.kh_name = kh_name;
	}
	public String getEn_name() {
		return en_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_color() {
		return branch_color;
	}
	public void setBranch_color(String branch_color) {
		this.branch_color = branch_color;
	}
	public String getRemain_date() {
		return remain_date;
	}
	public void setRemain_date(String remain_date) {
		this.remain_date = remain_date;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getExpried_date() {
		return expried_date;
	}
	public void setExpried_date(String expried_date) {
		this.expried_date = expried_date;
	}
}
