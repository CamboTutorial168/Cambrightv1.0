package model.dto;

public class AdminDTO {
	private String admin_id;
	private String admin_id_card;
	private String admin_password;
	private String admin_eng_name;
	private String admin_kh_name;
	private String admin_img_url;
	private int admin_level;
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_id_card() {
		return admin_id_card;
	}
	public void setAdmin_id_card(String admin_id_card) {
		this.admin_id_card = admin_id_card;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_eng_name() {
		return admin_eng_name;
	}
	public void setAdmin_eng_name(String admin_eng_name) {
		this.admin_eng_name = admin_eng_name;
	}
	public String getAdmin_kh_name() {
		return admin_kh_name;
	}
	public void setAdmin_kh_name(String admin_kh_name) {
		this.admin_kh_name = admin_kh_name;
	}
	public String getAdmin_img_url() {
		return admin_img_url;
	}
	public void setAdmin_img_url(String admin_img_url) {
		this.admin_img_url = admin_img_url;
	}
	public int getAdmin_level() {
		return admin_level;
	}
	public void setAdmin_level(int admin_level) {
		this.admin_level = admin_level;
	}
}
