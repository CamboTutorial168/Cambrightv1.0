package model.dto;

public class StudentDTO extends PaymentDTO{
	private String student_id;
	private String id_card;
	private String password;
	private String kh_name;
	private String en_name;
	private String gender;
	private String dob;
	private String fa_name;
	private String ma_name;
	private String addr;
	private String phone;
	private String reg_date;
	private String mod_date;
	private String img_url;
	private String status;
	private String time_type;
	private String emp_id;
	private String is_graduate;
	private String user_id;
	private String user_type;
	private String branch_id;
	private String branch_color;
	private String mod_by;
	private String teach_id;
	private String period;
	
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getKh_name() {
		return kh_name;
	}
	public void setKh_name(String kh_name) {
		this.kh_name = kh_name;
	}
	public String getEn_name() {
		return en_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public String getBranch_color() {
		return branch_color;
	}
	public void setBranch_color(String branch_color) {
		this.branch_color = branch_color;
	}
	public String getImg_url() {
		return img_url;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getTeach_id() {
		return teach_id;
	}
	public void setTeach_id(String teach_id) {
		this.teach_id = teach_id;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getMod_by() {
		return mod_by;
	}
	public void setMod_by(String mod_by) {
		this.mod_by = mod_by;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}
	public String getStatus() {
		return status;
	}
	public String getIs_graduate() {
		return is_graduate;
	}
	public void setIs_graduate(String is_graduate) {
		this.is_graduate = is_graduate;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTime_type() {
		return time_type;
	}
	public void setTime_type(String time_type) {
		this.time_type = time_type;
	}
}
