package model.dto;

public class ScoreStudDTO  extends ScoreDTO{
	private String subprog_title;
	private String class_id;
	private String class_title;
	private String class_color;
	private String branch_name;
	private String branch_color;
	private String branch_contact;
	private String teacher_name;
	public String getSubprog_title() {
		return subprog_title;
	}
	public void setSubprog_title(String subprog_title) {
		this.subprog_title = subprog_title;
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
	public String getClass_color() {
		return class_color;
	}
	public void setClass_color(String class_color) {
		this.class_color = class_color;
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
	public String getBranch_contact() {
		return branch_contact;
	}
	public void setBranch_contact(String branch_contact) {
		this.branch_contact = branch_contact;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	
	
	@Override
	public String toString() {
		return "ScoreStudDTO [subprog_title=" + subprog_title + ", class_id="
				+ class_id + ", class_title=" + class_title + ", class_color="
				+ class_color + ", branch_name=" + branch_name
				+ ", branch_color=" + branch_color + ", branch_contact="
				+ branch_contact + "]";
	}
	
}
