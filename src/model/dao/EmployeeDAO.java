package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.UserDTO;
import controller.admin.Conn;

public class EmployeeDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public EmployeeDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	public Boolean createEmp(UserDTO u) throws SQLException{
		
		String sql="INSERT INTO tb_employees VALUES"
				+ "(uuid_generate_v1(),?,?,?,?,?::char,?,?,?,?,?::date,?::date,?::char,?,?,?::uuid,?::uuid,?::uuid,?::date);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, u.getId_card());
			pst.setString(2, u.getPwd());
			pst.setString(3, u.getKh_name());
			pst.setString(4, u.getEng_name());
			pst.setString(5, u.getGender());
			pst.setString(6, u.getNationality());
			pst.setString(7, u.getNational_id());
			pst.setString(8, u.getImg_url());
			pst.setString(9, u.getPhone());
			pst.setString(10,  u.getHire_date());
			pst.setString(11,  u.getMod_date());
			pst.setString(12, u.getStatus());
			pst.setString(13, u.getEmail());
			pst.setString(14, u.getConfirm());
			pst.setString(15, u.getUser_id());
			pst.setString(16, u.getPos_id());
			pst.setString(17, u.getBranch_id());
			pst.setString(18,  u.getDob());
			if(pst.executeUpdate()>0)
				return true;
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return false;
	}
	/*
	 * checked
	 */
	public boolean updateEmp(UserDTO u) throws SQLException{
		
		String sql="UPDATE tb_employees SET"
				+ " id_card=?,password=?,khmer_name=?,english_name=?,gender=?::char,nationality=?,"
				+ "nation_id=?,image_url=?,phone_num=?,modify_date=?::date,user_id=?::uuid,pos_id=?::uuid,"
				+ "branch_id=?::uuid,dob=?::date"
				+ " WHERE emp_id=?::uuid";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, u.getId_card());
			pst.setString(2, u.getPwd());
			pst.setString(3, u.getKh_name());
			pst.setString(4, u.getEng_name());
			pst.setString(5,  u.getGender());
			pst.setString(6, u.getNationality());
			pst.setString(7, u.getNational_id());
			pst.setString(8, u.getImg_url());
			pst.setString(9,  u.getPhone());
			pst.setString(10,  u.getMod_date());
			pst.setString(11, u.getUser_id());
			pst.setString(12, u.getPos_id());
			pst.setString(13,  u.getBranch_id());
			pst.setString(14, u.getDob());
			pst.setString(15, u.getEmp_id());
			if(pst.executeUpdate()>0)return true;
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return false;
	}
	public boolean checkStatus(String emp_id,String status) throws SQLException{
		String sql="UPDATE tb_employees SET status=? WHERE emp_id=CAST(? AS UUID);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, emp_id);
			if(pst.executeUpdate()>0){
				return true;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		
		return false;
	}
	/*
	 * checked
	 */
	public ArrayList<UserDTO> getEmpList(String branch_id,int user_type) throws SQLException{
		ArrayList<UserDTO> list=new ArrayList<UserDTO>();
		
		String sql="SELECT e.emp_id,e.id_card,e.english_name,e.khmer_name,e.gender,e.dob,e.nationality,e.nation_id,e.image_url,e.hire_date,e.modify_date,e.status,e.phone_num,e.email,"
				+ " b.branch_id,b.branch_name,po.pos_id,po.position,u.user_id,u.user_level,u.user_type,e.password"
				+ " FROM tb_employees e"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=e.branch_id"
				+ " JOIN tb_positions po"
				+ " ON po.pos_id=e.pos_id"
				+ " JOIN tb_users_level u"
				+ " ON u.user_id=e.user_id WHERE b.status='t'";
		try{
			pst=con.prepareStatement(sql);			
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
				UserDTO u=new UserDTO();
				u.setEmp_id(rs.getString("emp_id"));
				u.setId_card(rs.getString("id_card"));
				u.setEng_name(rs.getString("english_name"));
				u.setKh_name(rs.getString("khmer_name"));
				u.setGender(rs.getString("gender"));
				u.setDob(rs.getString("dob"));
				u.setNationality(rs.getString("nationality"));
				u.setNational_id(rs.getString("nation_id"));
				u.setImg_url(rs.getString("image_url"));
				u.setHire_date(rs.getString("hire_date"));
				u.setMod_date(rs.getString("modify_date"));
				u.setStatus(rs.getString("status"));
				u.setPhone(rs.getString("phone_num"));
				u.setEmail(rs.getString("email"));
				u.setBranch_id(rs.getString("branch_id"));
				u.setBranch_name(rs.getString("branch_name"));
				u.setPos_id(rs.getString("pos_id"));
				u.setPosition(rs.getString("position"));
				u.setUser_id(rs.getString("user_id"));
				u.setUser_level(rs.getInt("user_level"));
				u.setUser_type(rs.getString("user_type"));
				u.setPwd(rs.getString("password"));
				list.add(u);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	
	public ArrayList<UserDTO> getEmpListActiveOnly(String branch_id,int user_type) throws SQLException{
		ArrayList<UserDTO> list=new ArrayList<UserDTO>();
		
		String sql="SELECT e.emp_id,e.id_card,e.english_name,e.khmer_name,e.gender,e.dob,e.nationality,e.nation_id,e.image_url,e.hire_date,e.modify_date,e.status,e.phone_num,e.email,"
				+ " b.branch_id,b.branch_name,po.pos_id,po.position,u.user_id,u.user_level,u.user_type"
				+ " FROM tb_employees e"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=e.branch_id"
				+ " JOIN tb_positions po"
				+ " ON po.pos_id=e.pos_id"
				+ " JOIN tb_users_level u"
				+ " ON u.user_id=e.user_id WHERE e.status='t'";
		try{
			pst=con.prepareStatement(sql);			
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
				UserDTO u=new UserDTO();
				u.setEmp_id(rs.getString("emp_id"));
				u.setId_card(rs.getString("id_card"));
				u.setEng_name(rs.getString("english_name"));
				u.setKh_name(rs.getString("khmer_name"));
				u.setGender(rs.getString("gender"));
				u.setDob(rs.getString("dob"));
				u.setNationality(rs.getString("nationality"));
				u.setNational_id(rs.getString("nation_id"));
				u.setImg_url(rs.getString("image_url"));
				u.setHire_date(rs.getString("hire_date"));
				u.setMod_date(rs.getString("modify_date"));
				u.setStatus(rs.getString("status"));
				u.setPhone(rs.getString("phone_num"));
				u.setEmail(rs.getString("email"));
				u.setBranch_id(rs.getString("branch_id"));
				u.setBranch_name(rs.getString("branch_name"));
				u.setPos_id(rs.getString("pos_id"));
				u.setPosition(rs.getString("position"));
				u.setUser_id(rs.getString("user_id"));
				u.setUser_level(rs.getInt("user_level"));
				u.setUser_type(rs.getString("user_type"));
				list.add(u);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	
	public ArrayList<UserDTO> getEmpListActiveOnlyBranch(String branch_id,int user_type) throws SQLException{
		ArrayList<UserDTO> list=new ArrayList<UserDTO>();
		
		String sql="SELECT e.emp_id,e.id_card,e.english_name,e.khmer_name,e.gender,e.dob,e.nationality,e.nation_id,e.image_url,e.hire_date,e.modify_date,e.status,e.phone_num,e.email,"
				+ " b.branch_id,b.branch_name,po.pos_id,po.position,u.user_id,u.user_level,u.user_type"
				+ " FROM tb_employees e"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=e.branch_id"
				+ " JOIN tb_positions po"
				+ " ON po.pos_id=e.pos_id"
				+ " JOIN tb_users_level u"
				+ " ON u.user_id=e.user_id WHERE e.status='t' AND e.branch_id=?::uuid";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, branch_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
				UserDTO u=new UserDTO();
				u.setEmp_id(rs.getString("emp_id"));
				u.setId_card(rs.getString("id_card"));
				u.setEng_name(rs.getString("english_name"));
				u.setKh_name(rs.getString("khmer_name"));
				u.setGender(rs.getString("gender"));
				u.setDob(rs.getString("dob"));
				u.setNationality(rs.getString("nationality"));
				u.setNational_id(rs.getString("nation_id"));
				u.setImg_url(rs.getString("image_url"));
				u.setHire_date(rs.getString("hire_date"));
				u.setMod_date(rs.getString("modify_date"));
				u.setStatus(rs.getString("status"));
				u.setPhone(rs.getString("phone_num"));
				u.setEmail(rs.getString("email"));
				u.setBranch_id(rs.getString("branch_id"));
				u.setBranch_name(rs.getString("branch_name"));
				u.setPos_id(rs.getString("pos_id"));
				u.setPosition(rs.getString("position"));
				u.setUser_id(rs.getString("user_id"));
				u.setUser_level(rs.getInt("user_level"));
				u.setUser_type(rs.getString("user_type"));
				list.add(u);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	
	/*
	 * checked
	 */
	public boolean changePassword(String emp_id,String old,String new_pw) throws SQLException{
		String sql="SELECT changepwd(?:: uuid,?,?)";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, emp_id);
			pst.setString(2, old);
			pst.setString(3, new_pw);
			ResultSet rs= pst.executeQuery();
			while(rs.next()){
				if(rs.getInt(1)>0){
					return true;
				}
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		
		return false;
	}
	
}
