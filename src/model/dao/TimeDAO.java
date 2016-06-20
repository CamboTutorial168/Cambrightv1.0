package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.TimeDTO;
import controller.admin.Conn;

public class TimeDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public TimeDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	public boolean createTime(TimeDTO t) throws SQLException{
		
		try{
			String sql="INSERT INTO tb_time VALUES(uuid_generate_v1(),?::time,?::time,?::time,?::time,?::UUID,?::UUID);";				
			pst=con.prepareStatement(sql);
			pst.setString(1, t.getAmstart());
			pst.setString(2, t.getAmend());
			pst.setString(3, t.getPmstart());
			pst.setString(4, t.getPmend());
			pst.setString(5, t.getClass_id());
			pst.setString(6, t.getSubprog_id());
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
	public boolean updateTime(TimeDTO t) throws SQLException{		
		try{
			String sql="UPDATE tb_time SET"
					+ " am_start=?::time,"
					+ " am_end=?::time,"
					+ " pm_start=?::time,"
					+ " pm_end=?::time,"
					+ " class_id=?::uuid,"
					+ " sub_prog_id=?::uuid"
					+ " WHERE time_id=?::uuid;";				
			pst=con.prepareStatement(sql);
			pst.setString(1, t.getAmstart());
			pst.setString(2, t.getAmend());
			pst.setString(3, t.getPmstart());
			pst.setString(4, t.getPmend());
			pst.setString(5, t.getClass_id());
			pst.setString(6, t.getSubprog_id());
			pst.setString(7, t.getTime_id());
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
	public ArrayList<TimeDTO> listTime() throws SQLException{
		ArrayList<TimeDTO> a=new ArrayList<>();
		try{
			String sql="SELECT ti.*,cl.class_title,cl.class_color,sub.sub_prog_title FROM tb_time ti"
					+ " JOIN tb_classes cl"
					+ " ON cl.class_id =ti.class_id"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=ti.sub_prog_id"
					+ " WHERE sub.is_deleted='f';";				
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				TimeDTO d=new TimeDTO();
				d.setAmstart(rs.getString("am_start"));
				d.setAmend(rs.getString("am_end"));
				d.setPmstart(rs.getString("pm_start"));
				d.setPmend(rs.getString("pm_end"));
				d.setTime_id(rs.getString("time_id"));
				d.setClass_id(rs.getString("class_id"));
				d.setSubprog_id(rs.getString("sub_prog_id"));
				d.setSubprog_title(rs.getString("sub_prog_title"));
				d.setClass_title(rs.getString("class_title"));
				d.setClass_color(rs.getString("class_color"));
				d.setTime_id(rs.getString("time_id"));
				a.add(d);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return a;
	}
}
