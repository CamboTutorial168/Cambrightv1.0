package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.UserLevelDTO;
import controller.admin.Conn;

public class UserLevelDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public UserLevelDAO() {
		con=new Conn().getConnection();
	}
	public ArrayList<UserLevelDTO> getUserLevel(String branch_id,int user_level) throws SQLException{
		ArrayList<UserLevelDTO> list=new ArrayList<UserLevelDTO>();
		String sql="";
		try{
			sql="SELECT * FROM tb_users_level ";
			if(user_level!=0){
				sql+=" WHERE user_level>1 ";
			}
			sql+=" ORDER BY user_level ASC";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				UserLevelDTO u=new UserLevelDTO();
				u.setUser_id(rs.getString(1));
				u.setUser_type(rs.getString(2));
				u.setUser_level(rs.getString(3));
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
}
