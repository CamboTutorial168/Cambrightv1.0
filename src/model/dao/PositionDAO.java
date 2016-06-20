package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.PositionDTO;
import controller.admin.Conn;

public class PositionDAO {
	
	Connection con=null;
	PreparedStatement pst=null;
	public PositionDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	public boolean createPosition(PositionDTO pos) throws SQLException{
		String sql="INSERT INTO tb_positions VALUES(uuid_generate_v1(),?,?);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, pos.getPosition());
			pst.setFloat(2, pos.getSalary());
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
	public ArrayList<PositionDTO> getPositionList() throws SQLException{
		ArrayList<PositionDTO> list=new ArrayList<PositionDTO>();
		try{
			String sql="SELECT * FROM tb_positions ORDER BY salary DESC;";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				PositionDTO pos=new PositionDTO();
				pos.setPosition_id(rs.getString(1));
				pos.setPosition(rs.getString(2));
				pos.setSalary(rs.getFloat(3));
				list.add(pos);
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
	public boolean updatePosition(PositionDTO pos) throws SQLException{
		try{
			String sql="UPDATE tb_positions SET position=?,salary=? WHERE pos_id=?:: uuid";
			pst=con.prepareStatement(sql);
			pst.setString(1, pos.getPosition());
			pst.setFloat(2, pos.getSalary());
			pst.setString(3, pos.getPosition_id());
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
