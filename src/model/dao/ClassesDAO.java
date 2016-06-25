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
				String sql="INSERT INTO tb_classes VALUES(uuid_generate_v1(),?,?,?::uuid);";
				pst=con.prepareStatement(sql);
				pst.setString(1, clas.getClass_title());
				pst.setString(2, clas.getClass_color());
				pst.setString(3, clas.getSub_prog_id());
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
				String sql="UPDATE tb_classes SET class_title=?,class_color=?,sub_prog_id=?::uuid WHERE class_id=?::uuid";
				pst=con.prepareStatement(sql);
				pst.setString(1, clas.getClass_title());
				pst.setString(2, clas.getClass_color());
				pst.setString(3, clas.getSub_prog_id());
				pst.setString(4, clas.getClass_id());
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
	public ArrayList<ClassDTO> listClass(String branch_id,int user_level) throws SQLException{
		ArrayList<ClassDTO> c=new ArrayList<>();
		try{
				String sql="SELECT * FROM tb_classes cl"
						+ " JOIN tb_sub_programs s"
						+ " ON cl.sub_prog_id=s.sub_prog_id"
						+ " JOIN tb_programs pr"
						+ " ON pr.prog_id=s.prog_id"
						+ " JOIN tb_branches b"
						+ " ON b.branch_id=pr.branch_id WHERE b.status='t' AND s.is_deleted='f' AND pr.is_deleted='f' ";
				
				if(user_level==2 && user_level<3){
					sql+=" AND b.branch_id=?::uuid";
				}
				pst=con.prepareStatement(sql);
				if(user_level==2 && user_level<3){
					pst.setString(1, branch_id);
				}
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					ClassDTO cl=new ClassDTO();
					cl.setClass_id(rs.getString("class_id"));
					cl.setClass_title(rs.getString("class_title"));
					cl.setClass_color(rs.getString("class_color"));
					cl.setSub_prog_id(rs.getString("sub_prog_id"));
					cl.setSub_prog_title(rs.getString("sub_prog_title"));
					cl.setBranch_id(rs.getString("branch_id"));
					cl.setBranch_name(rs.getString("branch_name"));
					cl.setBranch_color(rs.getString("color"));
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
