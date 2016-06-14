package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ClassDTO;
import controller.admin.Conn;
/**
 * NOT YET IMPLEMENT ALL
 * @author Sub-Cyber
 *
 */
public class ClassesDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public ClassesDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	public boolean createClass(ClassDTO clas) throws SQLException{
		try{
				String sql="INSERT INTO tb_classes VALUES(uuid_generate_v1(),?,?);";
				pst=con.prepareStatement(sql);
				pst.setString(1, clas.getClass_title());
				pst.setString(2, clas.getClass_color());
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
	public boolean updateClass(ClassDTO clas) throws SQLException{
		
		try{
				String sql="UPDATE tb_classes SET class_title=?,class_color=? WHERE class_id=?::uuid";
				pst=con.prepareStatement(sql);
				pst.setString(1, clas.getClass_title());
				pst.setString(2, clas.getClass_color());
				pst.setString(3, clas.getClass_id());
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
	public ArrayList<ClassDTO> listClass() throws SQLException{
		ArrayList<ClassDTO> c=new ArrayList<>();
		try{
				String sql="SELECT * FROM tb_classes;";
				pst=con.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					ClassDTO cl=new ClassDTO();
					cl.setClass_id(rs.getString("class_id"));
					cl.setClass_title(rs.getString("class_title"));
					cl.setClass_color(rs.getString("class_color"));
					c.add(cl);
				}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return c;
	}
	
}
