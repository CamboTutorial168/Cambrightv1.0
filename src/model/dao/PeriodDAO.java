package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.PeriodDTO;

import org.json.JSONArray;
import org.json.JSONObject;

import controller.admin.Conn;

public class PeriodDAO {
	Connection con=null;
	PreparedStatement pst=null;
	
	public PeriodDAO() {
		con=new Conn().getConnection();
	}
	public ArrayList<PeriodDTO> getListPeriod(String period,String teach_id,String branch_id) throws SQLException{
		ArrayList<PeriodDTO> per=new ArrayList<PeriodDTO>();
		String sql="";
		try{
			sql="SELECT s.student_id,s.id_card as id_stu,s.english_name as student_name,e.id_card as id_emp,e.english_name as teacher,per.period_date,per.period_type"
					+ " FROM tb_students s"
					+ " JOIN tb_period per"
					+ " ON per.student_id=s.student_id"
					+ " JOIN tb_studying st"
					+ " ON st.student_id=s.student_id"
					+ " JOIN tb_teaching te"
					+ " ON te.teach_id=st.teach_id"
					+ " JOIN tb_employees e"
					+ " ON e.emp_id=te.emp_id"
					+ " WHERE s.status='t' AND s.is_graduate='f'"
					+ " AND per.status='t'"
					+ " AND st.status='t'"
					+ " AND te.status='t'"
					+ " AND e.status='t'"
					+ " AND te.teach_id=?::uuid; ";
			pst=con.prepareStatement(sql);
			//pst.setString(1, period);
			pst.setString(1, teach_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				PeriodDTO p=new PeriodDTO();
				p.setStudent_id(rs.getString("student_id"));
				p.setId_card_emp(rs.getString("id_emp"));
				p.setId_card_stu(rs.getString("id_stu"));
				p.setStudent_name(rs.getString("student_name"));
				p.setTeacher_name(rs.getString("teacher"));
				p.setPeriod_date(rs.getString("period_date"));
				p.setPeriod_type(rs.getString("period_type"));
				per.add(p);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return per;
	}
	
	public boolean changePeriod(String json) throws SQLException{
		PreparedStatement pstDisableStatus=null;
		PreparedStatement pstInsertPeriod=null;
		try{
			JSONObject obj=new JSONObject(json);
			JSONArray jarr=obj.getJSONArray("data");
			con.setAutoCommit(false);
			for(int i=0;i<jarr.length();i++){
			
				JSONObject p=jarr.getJSONObject(i);
				String sqlDisableStatus="UPDATE tb_period SET status='f' WHERE student_id=?::uuid;";
				pstDisableStatus=con.prepareStatement(sqlDisableStatus);
				pstDisableStatus.setString(1, p.getString("student_id"));
				pstDisableStatus.executeUpdate();
				
				String sqlInsertPeriod="INSERT INTO tb_period VALUES(uuid_generate_v1(),NOW(),?,?::uuid,'t');";
				pstInsertPeriod=con.prepareStatement(sqlInsertPeriod);
				pstInsertPeriod.setString(1, p.getString("period_type"));
				pstInsertPeriod.setString(2, p.getString("student_id"));
				System.out.println(p.getString("period_type"));
				pstInsertPeriod.executeUpdate();		
			}
			con.commit();
			return true;
		}catch(Exception e){con.rollback();e.printStackTrace();}
		finally{
			if(pstDisableStatus!=null)pstDisableStatus.close();
			if(pstInsertPeriod!=null)pstInsertPeriod.close();
			if(con !=null )con.close();
		}
		return false;
	}
}
