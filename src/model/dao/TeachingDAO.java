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
	public ArrayList<TeachDTO> getListTeaching(String branch_id,int user_type) throws SQLException{
		ArrayList<TeachDTO> list=new ArrayList<TeachDTO>();
		
		String sql="SELECT te.teach_id,sub.*,e.id_card,e.english_name,b.branch_id,b.branch_name"
				+ " FROM tb_teaching te"
				+ " JOIN tb_sub_programs sub"
				+ " ON te.sub_prog_id=sub.sub_prog_id"
				+ " JOIN tb_employees e"
				+ " ON e.emp_id = te.emp_id"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=e.branch_id"
				+ " WHERE e.status='t' AND sub.is_deleted='f'";
		try{
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				TeachDTO t=new TeachDTO();
				t.setTeach_id(rs.getString("teach_id"));
				t.setSub_prog_id(rs.getString("sub_prog_id"));
				t.setSub_prog_title(rs.getString("sub_prog_title"));
				t.setProg_id(rs.getString("prog_id"));
				t.setId_card(rs.getString("id_card"));
				t.setEng_name(rs.getString("english_name"));
				t.setBranch_id(rs.getString("branch_id"));
				t.setBranch_name(rs.getString("branch_name"));
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
	public static void main(String[] args) throws SQLException {
		System.out.println(new TeachingDAO().getListTeaching("", 3).toString());
	}
}
