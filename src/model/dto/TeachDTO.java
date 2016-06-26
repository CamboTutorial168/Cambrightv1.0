package model.dto;

public class TeachDTO  {
	private String teach_id;
	private String sub_prog_id;
	private String sub_prog_title;
	private String prog_id;
	private String id_card;
	private String eng_name;
	private String emp_id;
	private String branch_id;
	private String branch_name;
	private String branch_color;
	private String status;
	private String class_id;
	private String class_name;
	private String class_color;
	private String student_num;
	private String empbranch;
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
	public String getProg_id() {
		return prog_id;
	}
	public void setProg_id(String prog_id) {
		this.prog_id = prog_id;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public String getBranch_color() {
		return branch_color;
	}
	public void setBranch_color(String branch_color) {
		this.branch_color = branch_color;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_color() {
		return class_color;
	}
	public void setClass_color(String class_color) {
		this.class_color = class_color;
	}
	public String getStudent_num() {
		return student_num;
	}
	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}
	public String getEmpbranch() {
		return empbranch;
	}
	public void setEmpbranch(String empbranch) {
		this.empbranch = empbranch;
	}
	@Override
	public String toString() {
		return "TeachDTO [teach_id=" + teach_id + ", sub_prog_id="
				+ sub_prog_id + ", sub_prog_title=" + sub_prog_title
				+ ", prog_id=" + prog_id + ", id_card=" + id_card
				+ ", eng_name=" + eng_name + ", branch_id=" + branch_id
				+ ", branch_name=" + branch_name + "]";
	}	
}
