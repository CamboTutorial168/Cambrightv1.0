package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.SubProgramListDTO;
import model.dto.SubProgCreateDTO;
import controller.admin.Conn;

public class SubProgramDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public SubProgramDAO() {
		con=new Conn().getConnection();
	}
	/*
	 * checked
	 */
	public boolean createSubProgram(SubProgCreateDTO prog) throws SQLException{
		prog.setIs_deleted("f");
		try{
			String sql="INSERT INTO tb_sub_programs VALUES(uuid_generate_v1(),?,?::decimal,?::decimal,?::decimal,?::uuid,?::char,?::time,?::time,?::time,?::time);";				
			pst=con.prepareStatement(sql);
			pst.setString(1, prog.getSub_prog_title());
			pst.setString(2, prog.getTerm_fee());
			pst.setString(3, prog.getSem_fee());
			pst.setString(4, prog.getYear_fee());
			pst.setString(5, prog.getProg_id());
			pst.setString(6, prog.getIs_deleted());
			pst.setString(7, prog.getAmstart());
			pst.setString(8, prog.getAmend());
			pst.setString(9, prog.getPmstart());
			pst.setString(10, prog.getPmend());
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
	public ArrayList<SubProgramListDTO> listSubProg(String branch_id,int user_level) throws SQLException{
		ArrayList<SubProgramListDTO> data=new ArrayList<>();
		String sql="";
		
		try{
			sql="SELECT br.*,sub.*,pro.* FROM tb_sub_programs sub"
					+ " JOIN tb_programs pro"
					+ " ON sub.prog_id=pro.prog_id"
					+ " JOIN tb_branches br"
					+ " ON br.branch_id=pro.branch_id"
					+ " WHERE pro.is_deleted='f' AND br.status='t' AND sub.is_deleted='f';";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				SubProgramListDTO l=new SubProgramListDTO();
				l.setBranch_id(rs.getString("branch_id"));
				l.setBranch_name(rs.getString("branch_name"));
				l.setSubprog_id(rs.getString("sub_prog_id"));
				l.setSub_prog_title(rs.getString("sub_prog_title"));
				l.setProg_id(rs.getString("prog_id"));
				l.setProg_title(rs.getString("prog_title"));
				l.setTerm_fee(rs.getString("term_fee"));
				l.setSem_fee(rs.getString("sem_fee"));
				l.setYear_fee(rs.getString("year_fee"));
				l.setAmstart(rs.getString("am_start"));
				l.setAmend(rs.getString("am_end"));
				l.setPmstart(rs.getString("pm_start"));
				l.setPmend(rs.getString("pm_end"));
				data.add(l);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return data;
	}
	/*
	 * checked
	 */
	//List Sub program in specific branch
	public ArrayList<SubProgramListDTO> listSubProgBranch(String branch_id,int user_level) throws SQLException{
		ArrayList<SubProgramListDTO> data=new ArrayList<>();
		String sql="";
		
		try{
			sql="SELECT br.*,sub.* FROM tb_sub_programs sub"
					+ " JOIN tb_programs pro"
					+ " ON sub.prog_id=pro.prog_id"
					+ " JOIN tb_branches br"
					+ " ON br.branch_id=pro.branch_id"
					+ " WHERE pro.is_deleted='f' AND br.status='t' AND sub.is_deleted='f' AND br.branch_id=?::uuid;";
			pst=con.prepareStatement(sql);
			pst.setString(1, branch_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				SubProgramListDTO l=new SubProgramListDTO();
				l.setBranch_id(rs.getString("branch_id"));
				l.setBranch_name(rs.getString("branch_name"));
				l.setSubprog_id(rs.getString("sub_prog_id"));
				l.setSub_prog_title(rs.getString("sub_prog_title"));
				l.setProg_id(rs.getString("prog_id"));
				l.setTerm_fee(rs.getString("term_fee"));
				l.setSem_fee(rs.getString("sem_fee"));
				l.setYear_fee(rs.getString("year_fee"));
				data.add(l);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return data;
	}
	/*
	 * checked
	 */
	public boolean deleteSubProg(String subprog_id,String prog_id) throws SQLException{
		try{
			String sql="UPDATE tb_sub_programs SET is_deleted='t' WHERE prog_id=CAST(? AS UUID) AND sub_prog_id=?::UUID;";
			pst=con.prepareStatement(sql);
			pst.setString(1, prog_id);
			pst.setString(2, subprog_id);
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
	
	public boolean updateSubProgram(SubProgCreateDTO s) throws SQLException{
		try{
			String sql="UPDATE tb_sub_programs SET"
					+ " sub_prog_title=?,"
					+ "term_fee=?::decimal,"
					+ "sem_fee=?::decimal,"
					+ "year_fee=?::decimal,"
					+ "am_start=?::time,"
					+ "am_end=?::time,"
					+ "pm_start=?::time,"
					+ "pm_end=?::time,"
					+ "prog_id=?::uuid"
					+ " WHERE sub_prog_id=?::UUID";
			pst=con.prepareStatement(sql);
			pst.setString(1, s.getSub_prog_title());
			pst.setString(2, s.getTerm_fee());
			pst.setString(3, s.getSem_fee());
			pst.setString(4, s.getYear_fee());
			pst.setString(5, s.getAmstart());
			pst.setString(6, s.getAmend());
			pst.setString(7, s.getPmstart());
			pst.setString(8, s.getPmend());
			pst.setString(9, s.getProg_id());
			pst.setString(10, s.getSubprog_id());
			
			
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

