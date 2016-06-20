package model.dto;

public class PeriodDTO {
	private String student_id;
	private String id_card_stu;
	private String id_card_emp;
	private String student_name;
	private String teacher_name;
	private String period_date;
	private String period_type;
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getPeriod_date() {
		return period_date;
	}
	public void setPeriod_date(String period_date) {
		this.period_date = period_date;
	}
	public String getPeriod_type() {
		return period_type;
	}
	public void setPeriod_type(String period_type) {
		this.period_type = period_type;
	}
	public String getId_card_stu() {
		return id_card_stu;
	}
	public void setId_card_stu(String id_card_stu) {
		this.id_card_stu = id_card_stu;
	}
	public String getId_card_emp() {
		return id_card_emp;
	}
	public void setId_card_emp(String id_card_emp) {
		this.id_card_emp = id_card_emp;
	}
}
