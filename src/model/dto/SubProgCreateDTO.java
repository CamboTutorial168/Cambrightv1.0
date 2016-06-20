package model.dto;

public class SubProgCreateDTO {
	private String subprog_id;
	private String sub_prog_title;
	private String term_fee;
	private String sem_fee;
	private String year_fee;
	private String amstart;
	private String amend;
	private String pmstart;
	private String pmend;
	private String prog_id;
	private String is_deleted;
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
	public String getSubprog_id() {
		return subprog_id;
	}
	public void setSubprog_id(String subprog_id) {
		this.subprog_id = subprog_id;
	}
	public String getSub_prog_title() {
		return sub_prog_title;
	}
	public void setSub_prog_title(String sub_prog_title) {
		this.sub_prog_title = sub_prog_title;
	}
	public String getTerm_fee() {
		return term_fee;
	}
	public void setTerm_fee(String term_fee) {
		this.term_fee = term_fee;
	}
	public String getSem_fee() {
		return sem_fee;
	}
	public void setSem_fee(String sem_fee) {
		this.sem_fee = sem_fee;
	}
	public String getYear_fee() {
		return year_fee;
	}
	public void setYear_fee(String year_fee) {
		this.year_fee = year_fee;
	}
	public String getProg_id() {
		return prog_id;
	}
	public void setProg_id(String prog_id) {
		this.prog_id = prog_id;
	}
	public String getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	@Override
	public String toString() {
		return "SubProgCreateDTO [subprog_id=" + subprog_id
				+ ", sub_prog_title=" + sub_prog_title + ", term_fee="
				+ term_fee + ", sem_fee=" + sem_fee + ", year_fee=" + year_fee
				+ ", amstart=" + amstart + ", amend=" + amend + ", pmstart="
				+ pmstart + ", pmend=" + pmend + ", prog_id=" + prog_id
				+ ", is_deleted=" + is_deleted + "]";
	}
	
	
}
