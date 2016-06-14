package model.dto;

public class TeachDTO  {
	private String teach_id;
	private String sub_prog_id;
	private String sub_prog_title;
	private String prog_id;
	private String id_card;
	private String eng_name;
	private String branch_id;
	private String branch_name;
	public String getTeach_id() {
		return teach_id;
	}
	public void setTeach_id(String teach_id) {
		this.teach_id = teach_id;
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
	public String getProg_id() {
		return prog_id;
	}
	public void setProg_id(String prog_id) {
		this.prog_id = prog_id;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
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
		return "TeachDTO [teach_id=" + teach_id + ", sub_prog_id="
				+ sub_prog_id + ", sub_prog_title=" + sub_prog_title
				+ ", prog_id=" + prog_id + ", id_card=" + id_card
				+ ", eng_name=" + eng_name + ", branch_id=" + branch_id
				+ ", branch_name=" + branch_name + "]";
	}	
}
