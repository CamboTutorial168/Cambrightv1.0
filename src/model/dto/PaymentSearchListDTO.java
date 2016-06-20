package model.dto;

public class PaymentSearchListDTO {
 private String student_id;
 private String id_card_stu;
 private String id_card_emp;
 private String student_name;
 private String receiver;
 private String date_paid;
 private String expire_date;
 private String sub_prog_title;
 private String status;
 private String type_fee;
public String getStudent_id() {
	return student_id;
}
public void setStudent_id(String student_id) {
	this.student_id = student_id;
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

public String getReceiver() {
	return receiver;
}
public void setReceiver(String receiver) {
	this.receiver = receiver;
}
public String getDate_paid() {
	return date_paid;
}
public void setDate_paid(String date_paid) {
	this.date_paid = date_paid;
}
public String getExpire_date() {
	return expire_date;
}
public void setExpire_date(String expire_date) {
	this.expire_date = expire_date;
}
public String getSub_prog_title() {
	return sub_prog_title;
}
public void setSub_prog_title(String sub_prog_title) {
	this.sub_prog_title = sub_prog_title;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getStudent_name() {
	return student_name;
}
public void setStudent_name(String student_name) {
	this.student_name = student_name;
}
public String getType_fee() {
	return type_fee;
}
public void setType_fee(String type_fee) {
	this.type_fee = type_fee;
}
}
