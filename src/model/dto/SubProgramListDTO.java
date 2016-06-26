package model.dto;

public class SubProgramListDTO extends SubProgCreateDTO{

	private String branch_id;
	private String prog_title;
	private String branch_name;
	private String branch_color;
	public String getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}
	public String getProg_title() {
		return prog_title;
	}
	public void setProg_title(String prog_title) {
		this.prog_title = prog_title;
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
	
}
