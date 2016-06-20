package model.dto;

public class TimeDTO {
	private String time_id;
	
	private String subprog_id;
	private String class_id;
	private String subprog_title;
	private String class_title;
	private String class_color;
	private String amstart;
	private String amend;
	private String pmstart;
	private String pmend;
	public String getTime_id() {
		return time_id;
	}
	public void setTime_id(String time_id) {
		this.time_id = time_id;
	}
	public String getSubprog_id() {
		return subprog_id;
	}
	public void setSubprog_id(String subprog_id) {
		this.subprog_id = subprog_id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getAmstart() {
		return amstart;
	}
	public void setAmstart(String amstart) {
		this.amstart = amstart;
	}
	public String getAmend() {
		return amend;
	}
	public void setAmend(String amend) {
		this.amend = amend;
	}
	public String getPmstart() {
		return pmstart;
	}
	public void setPmstart(String pmstart) {
		this.pmstart = pmstart;
	}
	public String getPmend() {
		return pmend;
	}
	public void setPmend(String pmend) {
		this.pmend = pmend;
	}
	public String getSubprog_title() {
		return subprog_title;
	}
	public void setSubprog_title(String subprog_title) {
		this.subprog_title = subprog_title;
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
	@Override
	public String toString() {
		return "TimeDTO [time_id=" + time_id + ", subprog_id=" + subprog_id
				+ ", class_id=" + class_id + ", subprog_title=" + subprog_title
				+ ", class_title=" + class_title + ", class_color="
				+ class_color + ", amstart=" + amstart + ", amend=" + amend
				+ ", pmstart=" + pmstart + ", pmend=" + pmend + "]";
	}
	
}
