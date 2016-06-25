package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.TeachDTO;
import controller.admin.Conn;

public class TeachingDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public TeachingDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	public ArrayList<TeachDTO> getListTeaching(String branch_id,int user_type) throws SQLException{
		ArrayList<TeachDTO> list=new ArrayList<TeachDTO>();
		String sql="SELECT te.*,cl.*,sub_prog_title,e.english_name,id_card,pr.prog_id,b.branch_id,b.branch_name,b.color, te.status,"
				+ "(SELECT b.branch_name FROM tb_branches b WHERE b.branch_id=e.branch_id) as empbranch,"
				+ "(SELECT count(s.student_id) FROM tb_studying stdy JOIN tb_students s ON s.student_id=stdy.student_id WHERE stdy.teach_id=te.teach_id AND s.status='t' AND stdy.status='t') as student_num"
				+ " FROM tb_teaching te"
				+ " JOIN tb_classes cl"
				+ " ON te.class_id=cl.class_id"
				+ " JOIN tb_sub_programs sub"
				+ " ON sub.sub_prog_id=cl.sub_prog_id"
				+ " JOIN tb_programs pr"
				+ " ON pr.prog_id=sub.prog_id"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=pr.branch_id"
				+ " JOIN tb_employees e"
				+ " ON e.emp_id = te.emp_id"
				+ " WHERE sub.is_deleted='f' AND b.status='t' AND e.status='t' AND te.is_deleted='f' AND pr.is_deleted='f' ";
		try{
			if(user_type!=0){
				sql+=" AND b.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type!=0){
				pst.setString(1, branch_id);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				TeachDTO t=new TeachDTO();
				t.setTeach_id(rs.getString("teach_id"));
				t.setSub_prog_id(rs.getString("sub_prog_id"));
				t.setSub_prog_title(rs.getString("sub_prog_title"));
				t.setProg_id(rs.getString("prog_id"));
				t.setEmp_id(rs.getString("emp_id"));
				t.setId_card(rs.getString("id_card"));
				t.setEng_name(rs.getString("english_name"));
				t.setBranch_id(rs.getString("branch_id"));
				t.setBranch_name(rs.getString("branch_name"));
				t.setBranch_color(rs.getString("color"));
				t.setClass_name(rs.getString("class_title"));
				t.setClass_color(rs.getString("class_color"));
				t.setStudent_num(rs.getString("student_num"));
				t.setStatus(rs.getString("status"));
				t.setClass_id(rs.getString("class_id"));
				t.setEmpbranch(rs.getString("empbranch"));
				list.add(t);
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
	public boolean assignTask(TeachDTO t) throws SQLException{
		String sql="INSERT INTO tb_teaching VALUES(uuid_generate_v1(),?::uuid,?::uuid,?::char,'f');";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, t.getEmp_id());
			pst.setString(2, t.getClass_id());
			pst.setString(3, t.getStatus());
			
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
	public boolean checkStatus(String teaching,String status) throws SQLException{
		String sql="UPDATE tb_teaching SET status=? WHERE teach_id=CAST(? AS UUID);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, teaching);
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
	public boolean deleteTeach(String teach_id) throws SQLException{
		try{
			String sql="UPDATE tb_teaching SET is_deleted='t' WHERE teach_id=CAST(? AS UUID);";
			pst=con.prepareStatement(sql);
			pst.setString(1, teach_id);
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
}

