package model.dto;

public class BranchDTO {
	private String branch_id;
	private String branch_name;
	private String address;
	private String contact;
	private String status;
	
	public BranchDTO() {
		// TODO Auto-generated constructor stub
	}
	public BranchDTO(String branch_name,String address,String contact, String status){
		
		this.branch_name=branch_name;
		this.address=address;
		this.contact=contact;
		this.status=status;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
