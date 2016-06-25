package model.dao.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.admin.Conn;
import model.dto.ListStudInfoDTO;

public class StudentDAO {
	Connection con=null;
	PreparedStatement pst=null;
	
	public StudentDAO() {
		con=new Conn().getConnection();
	}
	
	public ArrayList<ListStudInfoDTO> listStudInfo(String student_id) throws SQLException{
		ArrayList<ListStudInfoDTO> list=new ArrayList<>();
		String sql=null;
		try{
			sql="SELECT	s.*,u.*, e.english_name AS registered,sub.sub_prog_id,sub.sub_prog_title,cl.class_color,cl.class_id,cl.class_title,per.period_type,b.branch_id,b.color,b.branch_name"
					+ " FROM tb_students s"
					+ " JOIN tb_branches b"
					+ " ON s.branch_id = b.branch_id"
					+ " JOIN tb_users_level u"
					+ " ON u.user_id = s.user_id"
					+ " JOIN tb_employees e"
					+ " ON e.emp_id = s.registered_by"
					+ " JOIN tb_period per"
					+ " ON per.student_id = s.student_id"
					+ " JOIN tb_studying std"
					+ " ON std.student_id=s.student_id"
					+ " JOIN tb_teaching te"
					+ " ON te.teach_id=std.teach_id"
					+ " JOIN tb_classes cl"
					+ " ON cl.class_id=te.class_id"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=cl.sub_prog_id"
					+ " WHERE b.status = 't' AND per.status='t' AND std.status='t' AND te.status='t' AND te.is_deleted='f' AND sub.is_deleted='f'"
					+ " AND s.student_id=?::uuid";
			
			pst=con.prepareStatement(sql);
			pst.setString(1, student_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				ListStudInfoDTO info=new ListStudInfoDTO();
				info.setStudent_id(rs.getString("student_id"));
				info.setId_card(rs.getString("id_card"));
				info.setKh_name(rs.getString("khmer_name"));
				info.setEn_name(rs.getString("english_name"));
				info.setGender(rs.getString("gender"));
				info.setDob(rs.getString("dob"));
				info.setFa_name(rs.getString("father_name"));
				info.setMa_name(rs.getString("mother_name"));
				info.setAddr(rs.getString("address"));
				info.setPhone(rs.getString("contact"));
				info.setReg_date(rs.getString("register_date"));
				info.setMod_date(rs.getString("modify_date"));
				info.setImg_url(rs.getString("image_url"));
				info.setStatus(rs.getString("status"));
				info.setReg_by(rs.getString("registered"));
				info.setUser_id(rs.getString("user_id"));
				info.setUser_type(rs.getString("user_type"));
				info.setBranch_id(rs.getString("branch_id"));
				info.setBranch_name(rs.getString("branch_name"));
				info.setSubprog_title(rs.getString("sub_prog_title"));
				info.setCla_num(rs.getString("class_title"));
				info.setCla_color(rs.getString("class_color"));
				info.setPeriod(rs.getString("period_type"));
				info.setBranch_color(rs.getString("color"));
				info.setSubprog_id(rs.getString("sub_prog_id"));
				info.setCla_id(rs.getString("class_id"));
				list.add(info);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	public boolean changePassword(String student_id,String old,String new_pw) throws SQLException{
		String sql="SELECT changepwdstud(?:: uuid,?,?)";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, student_id);
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
