package model.dto;

public class AttendantStuDTO {
	private String att_id;
	private String att_date;
	private String is_absent;
	private String student_id;
	private String prog_type_id;
	public String getAtt_id() {
		return att_id;
	}
	public void setAtt_id(String att_id) {
		this.att_id = att_id;
	}
	public String getAtt_date() {
		return att_date;
	}
	public void setAtt_date(String att_date) {
		this.att_date = att_date;
	}
	public String getIs_absent() {
		return is_absent;
	}
	public void setIs_absent(String is_absent) {
		this.is_absent = is_absent;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getProg_type_id() {
		return prog_type_id;
	}
	public void setProg_type_id(String prog_type_id) {
		this.prog_type_id = prog_type_id;
	}
	@Override
	public String toString() {
		return "AttendantStuDTO [att_id=" + att_id + ", att_date=" + att_date
				+ ", is_absent=" + is_absent + ", student_id=" + student_id
				+ ", prog_type_id=" + prog_type_id + "]";
	}
	
}
