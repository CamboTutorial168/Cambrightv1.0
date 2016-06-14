package model.dto;

import java.sql.Time;

public class SubProgramListDTO {

	private String subprog_id;
	private String subprog_title;
	private String term;
	private String year;
	private String sem;
	private String branch_id;
	private String prog_id;
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
	private String prog_title;
	private String branch_name;
	public String getSubprog_id() {
		return subprog_id;
	}
	public void setSubprog_id(String subprog_id) {
		this.subprog_id = subprog_id;
	}
	public String getSubprog_title() {
		return subprog_title;
	}
	public void setSubprog_title(String subprog_title) {
		this.subprog_title = subprog_title;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
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
		return "SubProgramListDTO [subprog_id=" + subprog_id
				+ ", subprog_title=" + subprog_title + ", term=" + term
				+ ", year=" + year + ", sem=" + sem + ", branch_id="
				+ branch_id + ", branch_name=" + branch_name + "]";
	}
	
	

}
