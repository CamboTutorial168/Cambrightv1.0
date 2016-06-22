package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ProgramCreateDTO;
import controller.admin.Conn;

public class ProgramDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public ProgramDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	//Create main program
	public boolean createProgram(ProgramCreateDTO prog) throws SQLException{
		int[] check = null;
		prog.setIs_delete("f");
		String branchid[]=prog.getBranch_id();
		try{
			for(int i=0;i<branchid.length;i++){
				String sql="INSERT INTO tb_programs VALUES (uuid_generate_v1(),?,?::char,?::uuid);";
				con.setAutoCommit(false);
				pst=con.prepareStatement(sql);
				pst.setString(1, prog.getProg_title());
				pst.setString(2, prog.getIs_delete());
				pst.setString(3, branchid[i]);
				pst.addBatch();
				check=pst.executeBatch();
			}
			con.commit();
			if(check[0] > 0)return true;
		}catch(Exception e){con.rollback();e.printStackTrace();}
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
	public ArrayList<String> getListMain(String branch_id, int user_level) throws SQLException{
		ArrayList<String> list=new ArrayList<>();
		try{
			String sql="SELECT *,(SELECT COUNT(*) FROM tb_sub_programs sub WHERE sub.prog_id=p.prog_id AND sub.is_deleted='f') as num_subprog FROM tb_programs pr"
					+ " JOIN tb_branches br"
					+ " ON pr.branch_id =br.branch_id"
					+ " WHERE br.status='t' AND is_deleted='f';";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				list.add("{'prog_id':"+"'"+rs.getString("prog_id")+"'");
				list.add("'prog_title':"+"'"+rs.getString("prog_title")+"'");
				list.add("'branch_id':"+"'"+rs.getString("branch_id")+"'");
				list.add("'branch_name':"+"'"+rs.getString("branch_name")+"'");
				list.add("'num_subprog':"+"'"+rs.getString("num_subprog")+"'");
				list.add("'br_color':"+"'"+rs.getString("color")+"'}");
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
	public boolean updateMainProgram(String prog_id,String prog_title,String branch_id) throws SQLException{
		try{
			String sql="UPDATE tb_programs SET prog_title=? WHERE prog_id=CAST(? AS UUID) AND branch_id=?::UUID";
			pst=con.prepareStatement(sql);
			pst.setString(1, prog_title);
			pst.setString(2, prog_id);
			pst.setString(3, branch_id);
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
	public boolean deleteProgMain(String branch_id,String prog_id) throws SQLException{
		try{
			String sql="UPDATE tb_programs SET is_deleted='t' WHERE prog_id=CAST(? AS UUID) AND branch_id=?::UUID;";
			pst=con.prepareStatement(sql);
			pst.setString(1, prog_id);
			pst.setString(2, branch_id);
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
