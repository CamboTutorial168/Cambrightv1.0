package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.AttendantStuDTO;

import org.json.JSONArray;
import org.json.JSONObject;
import org.postgresql.util.PSQLException;

import controller.admin.Conn;

public class AttendanceStuDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public AttendanceStuDAO() {
		con=new Conn().getConnection();
	}
	public ArrayList<AttendantStuDTO> getListStuCheckAttendant(String month) throws SQLException{
		ArrayList<AttendantStuDTO> list=new ArrayList<>();
		String sql="SELECT * FROM tb_attendantstu WHERE EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE )) "
				+ "ORDER BY EXTRACT(DAY from att_date) ASC;";
		try{
			pst =con.prepareStatement(sql);
			pst.setString(1, month);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				AttendantStuDTO a=new AttendantStuDTO();
				a.setAtt_id(rs.getString("att_id"));
				a.setAtt_date(rs.getString("att_date"));
				a.setIs_absent(rs.getString("is_absent"));
				a.setStudent_id(rs.getString("student_id"));
				list.add(a);
			}
			
		}catch(Exception e){e.printStackTrace();return null;}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	//To get list of student in attendant
	public boolean submitAttStudent(String list) throws SQLException {

		try {
			con.setAutoCommit(false);
			JSONArray jsonArr = new JSONArray(list);
			for (int i = 0; i < jsonArr.length(); i++) {
				JSONObject obj = jsonArr.getJSONObject(i);
				String sql = "INSERT INTO tb_attendantstu VALUES(uuid_generate_v1(),?::DATE,?,?::UUID);";
				pst = con.prepareStatement(sql);
				pst.setString(1, obj.getString("date"));
				pst.setString(2, obj.getString("is_absent"));
				pst.setString(3, obj.getString("student_id"));
				pst.executeUpdate();
			}
			con.commit();
			return true;
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			pst.close();
			if (con != null)
				con.close();
		}
		return false;
	}
}
