package model.dto;

import java.sql.Time;

public class ClassDTO {
	private String class_id;
	private String class_title;
	private String class_color;
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
	@Override
	public String toString() {
		return "ClassDTO [class_id=" + class_id + ", class_title="
				+ class_title + ", class_color=" + class_color + "]";
	}
	
	
}
