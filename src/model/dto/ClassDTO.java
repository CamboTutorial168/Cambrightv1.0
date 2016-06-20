package model.dto;

public class ClassDTO {
	private String class_id;
	
	private String class_title;
	private String class_color;
	private String sub_prog_id;
	private String sub_prog_title;
	private String branch_id;
	private String branch_name;
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
	@Override
	public String toString() {
		return "ClassDTO [class_id=" + class_id + ", class_title="
				+ class_title + ", class_color=" + class_color
				+ ", sub_prog_id=" + sub_prog_id + ", sub_prog_title="
				+ sub_prog_title + "]";
	}
	
	
	
}
