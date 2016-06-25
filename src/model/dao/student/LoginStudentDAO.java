package model.dao.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.dto.UserDTO;
import controller.admin.Conn;

public class LoginStudentDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public LoginStudentDAO() {
		con=new Conn().getConnection();
	}
	
	public UserDTO login(String id_card,String pwd) throws SQLException{
		
		UserDTO admin=new UserDTO();
		try{
			String sql="SELECT * FROM tb_students as s"
					+ " LEFT JOIN tb_users_level as ty"
					+ " ON s.user_id=ty.user_id"
					+ " LEFT JOIN tb_branches b"
					+ " ON b.branch_id=s.branch_id"
					+ " WHERE id_card=? AND password=? AND s.status='t';";
			pst=con.prepareStatement(sql);
			pst.setString(1, id_card);
			pst.setString(2, pwd);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				admin.setStudent_id(rs.getString("student_id"));
				admin.setKh_name(rs.getString("khmer_name"));
				admin.setEng_name(rs.getString("english_name"));
				admin.setImg_url(rs.getString("image_url"));
				admin.setUser_type(rs.getString("user_type"));
				admin.setUser_level(rs.getInt("user_level"));
				admin.setUser_type(rs.getString("user_type"));
				admin.setBranch_id(rs.getString("branch_id"));
				admin.setBranch_name(rs.getString("branch_name"));
				return admin;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return null;		
	}
	
}
