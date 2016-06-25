package model.dto;

public class ScoreDTO {
	private String score_id;
	private String vocab;
	private String gr;
	private String re;
	private String wr;
	private String li;
	private String sp;
	private String pa;
	private String ma;
	private String class_part;
	private String month;
	private String student_id;
	private String stud_name;
	private String sub_prog_id;
	private String status;
	private String num_absent;
	private String num_grant;
	private String total;
	private String rank;
	public String getVocab() {
		return vocab;
	}
	public void setVocab(String vocab) {
		this.vocab = vocab;
	}
	public String getGr() {
		return gr;
	}
	public void setGr(String gr) {
		this.gr = gr;
	}
	public String getRe() {
		return re;
	}
	public void setRe(String re) {
		this.re = re;
	}
	public String getWr() {
		return wr;
	}
	public void setWr(String wr) {
		this.wr = wr;
	}
	public String getLi() {
		return li;
	}
	public void setLi(String li) {
		this.li = li;
	}
	public String getSp() {
		return sp;
	}
	public void setSp(String sp) {
		this.sp = sp;
	}
	public String getPa() {
		return pa;
	}
	public void setPa(String pa) {
		this.pa = pa;
	}
	public String getMa() {
		return ma;
	}
	public String getScore_id() {
		return score_id;
	}
	public void setScore_id(String score_id) {
		this.score_id = score_id;
	}
	public void setMa(String ma) {
		this.ma = ma;
	}
	public String getClass_part() {
		return class_part;
	}
	@Override
	public String toString() {
		return "ScoreDTO [vocab=" + vocab + ", gr=" + gr + ", re=" + re
				+ ", wr=" + wr + ", li=" + li + ", sp=" + sp + ", pa=" + pa
				+ ", ma=" + ma + ", class_part=" + class_part + ", month="
				+ month + ", student_id=" + student_id + ", sub_prog_id="
				+ sub_prog_id + ", status=" + status + "]";
	}
	public void setClass_part(String class_part) {
		this.class_part = class_part;
	}
	public String getMonth() {
		return month;
	}
	public String getStud_name() {
		return stud_name;
	}
	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getSub_prog_id() {
		return sub_prog_id;
	}
	public String getNum_absent() {
		return num_absent;
	}
	public void setNum_absent(String num_absent) {
		this.num_absent = num_absent;
	}
	public String getNum_grant() {
		return num_grant;
	}
	public void setNum_grant(String num_grant) {
		this.num_grant = num_grant;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public void setSub_prog_id(String sub_prog_id) {
		this.sub_prog_id = sub_prog_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
