package model.dto;

import java.util.Arrays;

public class ProgramCreateDTO {
	
	
	private String prog_id;
	private String prog_title;
	private String is_delete;
	private String[] branch_id;
	
	public ProgramCreateDTO(){
		
	}

	public String getProg_id() {
		return prog_id;
	}

	public void setProg_id(String prog_id) {
		this.prog_id = prog_id;
	}

	public String getProg_title() {
		return prog_title;
	}

	public void setProg_title(String prog_title) {
		this.prog_title = prog_title;
	}

	public String getIs_delete() {
		return is_delete;
	}

	public void setIs_delete(String is_delete) {
		this.is_delete = is_delete;
	}

	public String[] getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(String[] branch_id) {
		this.branch_id = branch_id;
	}

	@Override
	public String toString() {
		return "ProgramCreateDTO [prog_id=" + prog_id + ", prog_title="
				+ prog_title + ", is_delete=" + is_delete + ", branch_id="
				+ Arrays.toString(branch_id) + "]";
	}
	 
	
}
