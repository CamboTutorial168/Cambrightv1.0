package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ChartDTO;
import model.dto.NewStudentsDTO;
import controller.admin.Conn;

public class DashboardDAO {
	private Connection con=null;
	private PreparedStatement pst=null;
	public DashboardDAO() {
		con=new Conn().getConnection();
	}
	//For Receptionist and Manager
	public int getActiveStudent(String branch_id,int user_type) throws SQLException{
		int std = 0;
		String sql="SELECT count(id_card) FROM tb_students s"
				+ " JOIN tb_branch b"
				+ " ON b.branch_id=s.branch_id"
				+ " WHERE s.status='t' AND b.status='t'";
		
		try {
			if(user_type!=0){
				sql+="AND e.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type!=0){
				pst.setString(1, branch_id);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				std=rs.getInt(1);
			}
		} catch (Exception e) {e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return std;
	}
	
	public int getActiveEmployees(String branch_id,int user_type) throws SQLException{
		int emp=0;
		String sql="SELECT count(id_card) FROM tb_employees e"
				+ " JOIN tb_branch b"
				+ " ON b.branch_id=e.branch_id"
				+ " WHERE e.status='t' AND b.status='t'";
		try {
			if(user_type!=0){
				sql+="AND e.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type!=0){
				pst.setString(1, branch_id);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				emp=rs.getInt(1);
			}
		} catch (Exception e) {e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		return emp;
	}
	
	public String getAbsentEmp(String branch_id,int user_type) throws SQLException{
		String abemp=null;
		String sql="SELECT count(*) FROM tb_attendantemp ate"
				+ " JOIN tb_employees e"
				+ " ON e.emp_id=ate.emp_id"
				+ " WHERE is_absent IN ('a','g')"
				+ " AND att_date=NOW()::DATE ";
		try{
			if(user_type!=0){
				sql+="AND e.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type!=0){
				pst.setString(1, branch_id);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				abemp=rs.getString(1);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		return abemp;
	}
	
	//For Manager Only
	public int getClassRoomAvaliable(String branch_id,int user_type) throws SQLException{
		int disactive=0;
		String sql="SELECT COUNT(level) FROM tb_prog_type WHERE status='f';";
		try{
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				disactive=rs.getInt(1);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return disactive;
	}
	
	//Only Accountant
	public ArrayList<ChartDTO> getForChartCol(String branch_id) throws SQLException{
		ArrayList<ChartDTO> data=new ArrayList<>();
		String sql="SELECT count(s.gender='F') as quanlity ,"
				+ " CASE WHEN (s.gender = 'M') THEN 'Male' ELSE 'Female' END AS gender,"
				+ "b.branch_name"
				+ " FROM tb_branches b"
				+ " FULL JOIN tb_students s"
				+ " ON s.branch_id=b.branch_id"
				+ " WHERE b.branch_id =?::uuid GROUP BY b.branch_name,s.gender";
		try{
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				ChartDTO chart=new ChartDTO();
				chart.setBranch(rs.getString("branch_name"));
				chart.setGender(rs.getString("gender"));
				chart.setQuantity(rs.getString("quanlity"));
				data.add(chart);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return data;
	}
	public ArrayList<NewStudentsDTO> getAllNewStudent() throws SQLException{
		ArrayList<NewStudentsDTO> newlist=new ArrayList<>();
		try{
			String sql="SELECT * FROM v_new_student;";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				NewStudentsDTO newstu=new NewStudentsDTO();
				newstu.setStudent_id(rs.getString("student_id"));
				newstu.setSt_idcard(rs.getString("id_card"));
				newstu.setSt_kh_name(rs.getString("khmer_name"));
				newstu.setSt_en_name(rs.getString("english_name"));
				newstu.setSt_gender(rs.getString("gender"));
				newstu.setSt_dob(rs.getString("dob"));
				newstu.setSt_faname(rs.getString("father_name"));
				newstu.setSt_moname(rs.getString("mother_name"));
				newstu.setSt_address(rs.getString("address"));
				newstu.setSt_contact(rs.getString("contact"));
				newstu.setSt_reg(rs.getString("register_date"));
				newstu.setSt_modify(rs.getString("modify_date"));
				newstu.setSt_img(rs.getString("image_url"));
				newstu.setSt_status(rs.getString("status"));
				newstu.setSt_ch_time(rs.getString("change_time"));
				newstu.setSt_faname(rs.getString("father_name"));
				newstu.setEmp_eng_name(rs.getString("cashier"));
				newstu.setBran_name(rs.getString("branch_name"));
				newlist.add(newstu);
			}
			return newlist;
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return null;
	}

}
