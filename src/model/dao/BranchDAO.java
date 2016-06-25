package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.BranchDTO;
import controller.admin.Conn;

public class BranchDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public BranchDAO() {
		con=new Conn().getConnection();
	}
	//Checked
	public boolean createBranch(BranchDTO branch) throws SQLException{
		String sql="INSERT INTO tb_branches VALUES(uuid_generate_v1(),?,?,?,?,?);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, branch.getBranch_name());
			pst.setString(2, branch.getAddress());
			pst.setString(3, branch.getContact());
			pst.setString(4, branch.getStatus());
			pst.setString(5, branch.getBr_color());
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
	//checked
	public boolean updateBranch(BranchDTO branch) throws SQLException{
		try{
			String sql="UPDATE tb_branches SET branch_name=?,address=?,contact=?,color=? WHERE branch_id=CAST(? AS UUID);";
			pst=con.prepareStatement(sql);
			pst.setString(1, branch.getBranch_name());
			pst.setString(2, branch.getAddress());
			pst.setString(3, branch.getContact());
			pst.setString(4, branch.getBr_color());
			pst.setString(5, branch.getBranch_id());
			
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
	//checked
	public boolean checkStatus(String branch_id,String status) throws SQLException{
		String sql="UPDATE tb_branches SET status=? WHERE branch_id=CAST(? AS UUID);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, branch_id);
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
	//checked
	public ArrayList<BranchDTO> getBranchList(String branch_id,int user_level) throws SQLException{
		
		ArrayList<BranchDTO> branchlist=new ArrayList<BranchDTO>();
		String sql="";
		try{
			
			sql="SELECT * FROM tb_branches ORDER BY branch_name ASC;";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				BranchDTO branch=new BranchDTO();
				branch.setBranch_id(rs.getString(1));
				branch.setBranch_name(rs.getString(2));
				branch.setAddress(rs.getString(3));
				branch.setContact(rs.getString(4));
				branch.setStatus(rs.getString(5));
				branch.setBr_color(rs.getString(6));
				branchlist.add(branch);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return branchlist;
	}
	//checked
	public ArrayList<BranchDTO> getBranchListActiveOnly(String branch_id,int user_level) throws SQLException{
		
		ArrayList<BranchDTO> branchlist=new ArrayList<BranchDTO>();
		String sql="";
		try{
		
			sql="SELECT * FROM tb_branches b "
					+ "WHERE b.status='t' ORDER BY branch_name ASC;";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				BranchDTO branch=new BranchDTO();
				branch.setBranch_id(rs.getString(1));
				branch.setBranch_name(rs.getString(2));
				branch.setAddress(rs.getString(3));
				branch.setContact(rs.getString(4));
				branch.setStatus(rs.getString(5));
				branch.setBr_color(rs.getString(6));
				branchlist.add(branch);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return branchlist;
	}
	public ArrayList<BranchDTO> getBranchListActiveOnlyBranch(String branch_id,int user_level) throws SQLException{
		
		ArrayList<BranchDTO> branchlist=new ArrayList<BranchDTO>();
		String sql="";
		try{
		
			sql="SELECT * FROM tb_branches b "
					+ "WHERE b.status='t' ";
			if(user_level!=0){
				sql+=" AND b.branch_id=?::uuid ";
			}
			sql+=" ORDER BY branch_name ASC";
			pst=con.prepareStatement(sql);
			if(user_level!=0){
				pst.setString(1, branch_id);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				BranchDTO branch=new BranchDTO();
				branch.setBranch_id(rs.getString(1));
				branch.setBranch_name(rs.getString(2));
				branch.setAddress(rs.getString(3));
				branch.setContact(rs.getString(4));
				branch.setStatus(rs.getString(5));
				branch.setBr_color(rs.getString(6));
				branchlist.add(branch);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return branchlist;
	}
	/*
	 * checked
	 */
	public ArrayList<BranchDTO> getBranchStatus(String branch_id,int user_level) throws SQLException{
		ArrayList<BranchDTO> branchlst=new ArrayList<>();
		String sql="";
		try{
			 sql="SELECT branch_id, branch_name FROM tb_branches WHERE status='t' AND branch_id=?::uuid";
			 pst=con.prepareStatement(sql);
			 pst.setString(1, branch_id);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				BranchDTO branch=new BranchDTO();
				branch.setBranch_id(rs.getString(1));
				branch.setBranch_name(rs.getString(2));
				branchlst.add(branch);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return branchlst;
	}
	
	
	
	
}
