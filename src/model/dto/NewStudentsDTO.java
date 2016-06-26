package model.dto;

public class NewStudentsDTO {
	private String student_id;
	private String id_card;
	private String kh_name;
	private String en_name;
	
	private String img_url;
	private String status;
	
	private String branch_name;
	private String branch_color;
	private String emp_id;
	private String user_id;//tb_users_level
	private String just_reg;
	//ListAbsetn
	private String is_absent;
	public String getStudent_id() {
		return student_id;
	}
	public String getId_card() {
		return id_card;
	}
	public String getKh_name() {
		return kh_name;
	}
	public String getEn_name() {
		return en_name;
	}
	public String getImg_url() {
		return img_url;
	}
	public String getStatus() {
		return status;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public String getBranch_color() {
		return branch_color;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getJust_reg() {
		return just_reg;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public void setKh_name(String kh_name) {
		this.kh_name = kh_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public void setBranch_color(String branch_color) {
		this.branch_color = branch_color;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setJust_reg(String just_reg) {
		this.just_reg = just_reg;
	}
	public String getIs_absent() {
		return is_absent;
	}
	public void setIs_absent(String is_absent) {
		this.is_absent = is_absent;
	}
}