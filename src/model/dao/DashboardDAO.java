package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ChartDTO;
import model.dto.NewStudentsDTO;
import model.dto.StudentRemainExpireDTO;
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
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=s.branch_id"
				+ " WHERE s.status='t' AND b.status='t'";
		
		try {
			if(user_type==2 && user_type!=3){
				sql+="AND b.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type==2 && user_type!=3){
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
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=e.branch_id"
				+ " JOIN tb_users_level u"
				+ " ON u.user_id=e.user_id"
				+ " WHERE e.status='t' AND b.status='t' AND u.user_level <> 0 ";
		try {
			if(user_type==2 && user_type!=3){
				sql+="AND e.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type==2 && user_type!=3){
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
			if(user_type==2 && user_type!=3){
				sql+="AND e.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type==2 && user_type!=3){
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
	
	
	public int getClassRoomAvaliable(String branch_id,int user_type) throws SQLException{
		int i=0;
		String sql="SELECT count(*) num_of_class FROM tb_classes cl"
				+ " JOIN tb_sub_programs sub"
				+ " ON sub.sub_prog_id=cl.sub_prog_id"
				+ " JOIN tb_programs pr"
				+ " ON pr.prog_id=sub.prog_id"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=pr.branch_id"
				+ " WHERE cl.class_id NOT IN(SELECT te.class_id FROM tb_teaching te )"
				+ " AND sub.is_deleted='f' AND pr.is_deleted='f' AND sub.is_deleted='f' AND b.status='t'";
				
		try{
			if(user_type==2 && user_type!=3){
				sql+="AND b.branch_id=?::uuid";
			}
			pst=con.prepareStatement(sql);
			if(user_type==2 && user_type!=3){
				pst.setString(1, branch_id);
			}
			
			ResultSet rs=pst.executeQuery();
			rs.next();
			return rs.getInt("num_of_class");
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		return i;
		
	}
	
	//Only Accountant
	public ArrayList<ChartDTO> getForChartCol(String branch_id,int user_type) throws SQLException{
		ArrayList<ChartDTO> data=new ArrayList<>();
		String sql="SELECT count(s.gender='F') as quanlity ,"
				+ " CASE WHEN (s.gender = 'M') THEN 'Male' ELSE 'Female' END AS gender,"
				+ "b.branch_name"
				+ " FROM tb_branches b"
				+ " JOIN tb_students s"
				+ " ON s.branch_id=b.branch_id";
		try{
			if(user_type==2 && user_type!=3){
				sql+=" WHERE b.branch_id=?::uuid";
			}
			sql+=" GROUP BY b.branch_name,s.gender";
			pst=con.prepareStatement(sql);
			if(user_type==2 && user_type!=3){
				pst.setString(1, branch_id);
			}
			ResultSet rs=pst.executeQuery();
			boolean ck=false;
			while(rs.next()){
				ck=true;
				ChartDTO chart=new ChartDTO();
				chart.setBranch(rs.getString("branch_name"));
				chart.setGender(rs.getString("gender"));
				chart.setQuantity(rs.getString("quanlity"));
				data.add(chart);
			}
			if(ck==false){
				ChartDTO chart=new ChartDTO();
				chart.setBranch("N/A");
				chart.setGender("N/A");
				chart.setQuantity("0");
				data.add(chart);
				System.out.println("EMPTY");
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		
		
		
		return data;
	}
	//Only Manager
	public ArrayList<String> getForChatLine() throws SQLException{
		ArrayList<String> data=new ArrayList<>();
		String sql="SELECT SUM(total) total,TO_CHAR(date_paid,'YYYY,MM') as month_ofyear FROM tb_payment"
				+ " WHERE (SELECT EXTRACT(year FROM date_paid))=(SELECT EXTRACT(year FROM NOW()::DATE))"
				+ " GROUP BY month_ofyear ORDER BY month_ofyear ASC ";
		try{
			
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			boolean ck=false;
			while(rs.next()){
				ck=true;
				
				data.add("[new Date("+rs.getString("month_ofyear")+"),"+rs.getString("total")+"]");
				
			}
			if(ck==false){
				
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		return data;
	}
	public static void main(String[] args) throws SQLException {
		System.out.println(new DashboardDAO().getForChatLine());;
	}
	public ArrayList<NewStudentsDTO> getAllNewStudent(String branch,int user_level) throws SQLException{
		ArrayList<NewStudentsDTO> newlist=new ArrayList<>();
		try{
			String sql="SELECT s.id_card,s.english_name,s.image_url,b.branch_name,b.color,"
					+ "(NOW()::DATE - register_date::DATE) as just_reg"
					+ " FROM tb_students s"
					+ " JOIN tb_branches b"
					+ " ON b.branch_id=s.branch_id"
					+ " WHERE (NOW()::DATE - register_date::DATE)<15 ";
			
			if(user_level==2 && user_level!=3){
				sql+=" AND b.branch_id=?::uuid";
			}
			sql+=" ORDER BY just_reg ASC";
			pst=con.prepareStatement(sql);
			if(user_level==2 && user_level!=3){
				pst.setString(1, branch);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				NewStudentsDTO n=new NewStudentsDTO();
				n.setId_card(rs.getString("id_card"));
				n.setEn_name(rs.getString("english_name"));
				n.setBranch_name(rs.getString("branch_name"));
				n.setImg_url(rs.getString("image_url"));
				n.setBranch_color(rs.getString("color"));
				n.setJust_reg(rs.getString("just_reg"));
				newlist.add(n);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return newlist;
	}
	
	public ArrayList<StudentRemainExpireDTO> getNearlyExpired(String branch,int user_level) throws SQLException{
		ArrayList<StudentRemainExpireDTO> newlist=new ArrayList<>();
		try{
			String sql="SELECT *,(pay.expire_date::DATE - NOW()::DATE) as remain_day"
					+ " FROM tb_payment pay"
					+ " JOIN tb_students s"
					+ " ON s.student_id=pay.student_id"
					+ " JOIN tb_branches b"
					+ " ON b.branch_id=s.branch_id"
					+ " WHERE (pay.expire_date::DATE - NOW()::DATE) <16 AND s.status='t' AND b.status='t' AND pay.status='t' ";
			if(user_level!=0){
				sql+=" AND s.branch_id=?::uuid";
			}
			sql+=" ORDER BY remain_day ASC";
			pst=con.prepareStatement(sql);
			if(user_level!=0){
				pst.setString(1, branch);
			}
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				StudentRemainExpireDTO l=new StudentRemainExpireDTO();
				l.setId_card(rs.getString("id_card"));
				l.setEn_name(rs.getString("english_name"));
				l.setKh_name(rs.getString("khmer_name"));
				l.setBranch_name(rs.getString("branch_name"));
				l.setBranch_color(rs.getString("color"));
				l.setRemain_date(rs.getString("remain_day"));
				l.setExpried_date(rs.getString("expire_date"));
				l.setStatus(rs.getString("status"));
				l.setImg_url(rs.getString("image_url"));
				newlist.add(l);
			}
			return newlist;
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return null;
	}
	//END ADMIN SESSION
	//TEACHER SESSION
	public String getClassRoom(String branch_id,int user_type,String emp_id) throws SQLException{
		String classroom="[]";
		String sql="SELECT cl.class_title,"
				+ "	(SELECT count(st.study_id) FROM tb_studying st WHERE st.teach_id In (te.teach_id) GROUP BY te.teach_id) as num_of_student "
				+ " FROM tb_employees e"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=e.branch_id"
				+ " JOIN tb_teaching te"
				+ " ON te.emp_id=e.emp_id"
				+ " JOIN tb_classes cl"
				+ " ON cl.class_id=te.class_id"
				+ " WHERE e.status='t'"
				+ " AND b.status='t' AND te.is_deleted='f' AND te.status='t'"
				+ " AND e.emp_id=?::uuid GROUP BY cl.class_title,teach_id";
		
		try {
			pst=con.prepareStatement(sql);
			pst.setString(1, emp_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				classroom="[{'class_title':'"+rs.getString("class_title")+"','num_of_student':'"+rs.getString("num_of_student")+"'}]";
			}
		} catch (Exception e) {e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return classroom;
	}
	//Teacher get number of absent this month
	public int getNumAbsent(String branch_id,int user_type,String emp_id) throws SQLException{
		int classroom=0;
		String sql="SELECT count(is_absent)	as num_absent"
				+ " FROM tb_attendantemp atstu1	WHERE is_absent='a' "
				+ "	AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM NOW()::DATE ))"
				+ " AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM NOW()::DATE )) AND emp_id=?::uuid";
		
		try {
			pst=con.prepareStatement(sql);
			pst.setString(1, emp_id);
			ResultSet rs=pst.executeQuery();
			rs.next();
			return rs.getInt("num_absent");
		} catch (Exception e) {e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		return classroom;
	}
	//Teacher get Level of teacher
	public String getLevelTeach(String branch_id,int user_type,String emp_id) throws SQLException{
		String s="N/A";
		String sql="SELECT sub.sub_prog_title FROM tb_employees e"
				+ " JOIN tb_teaching te"
				+ " ON te.emp_id=e.emp_id"
				+ " JOIN tb_classes cl"
				+ " ON cl.class_id=te.class_id"
				+ " JOIN tb_sub_programs sub"
				+ " ON sub.sub_prog_id=cl.sub_prog_id"
				+ " WHERE e.emp_id=?::uuid AND te.status='t' AND e.status='t' AND sub.is_deleted='f'";
		
		try {
			pst=con.prepareStatement(sql);
			pst.setString(1, emp_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			return rs.getString("sub_prog_title");
		} catch (Exception e) {e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		return s;
	}
	
	//GET student list absent
	public ArrayList<NewStudentsDTO> getMyStudentListAbsent(String emp_id) throws SQLException{
		ArrayList<NewStudentsDTO> l=new ArrayList<>();
		try{
			String sql="SELECT s.id_card,s.english_name,s.image_url,ats.is_absent"
					+ " FROM tb_students s"
					+ " JOIN tb_attendantstu ats"
					+ " ON ats.student_id=s.student_id"
					+ " JOIN tb_studying st"
					+ " ON st.student_id=s.student_id"
					+ " JOIN tb_teaching te"
					+ " ON te.teach_id=st.teach_id"
					+ " WHERE s.status='t' AND st.status='t' AND te.status='t' AND is_absent='p'"
					+ " AND ats.att_date=(SELECT NOW()::DATE) AND te.emp_id=?::UUID ORDER BY s.id_card ASC";
			pst=con.prepareStatement(sql);
			pst.setString(1, emp_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				NewStudentsDTO n=new NewStudentsDTO();
				n.setId_card(rs.getString("id_card"));
				n.setEn_name(rs.getString("english_name"));
				n.setImg_url(rs.getString("image_url"));
				n.setIs_absent(rs.getString("is_absent"));
				l.add(n);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con!=null)con.close();
		}
		
		return l;
	}
	

}
