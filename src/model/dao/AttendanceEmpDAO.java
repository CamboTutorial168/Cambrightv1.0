package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import controller.admin.Conn;

public class AttendanceEmpDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public AttendanceEmpDAO() {
		con=new Conn().getConnection();
	}
	//List employees only for attendant
		public ArrayList<String> getListEmpAttendance(String branch_id) throws SQLException{
			ArrayList<String> list=new ArrayList<>();
			String sql=null;
			try{
				sql="SELECT emp_id,id_card,english_name,image_url FROM tb_employees em"
						+ " JOIN tb_users_level u"
						+ " ON u.user_id=em.user_id"
						+ " JOIN tb_branches b"
						+ " ON b.branch_id=em.branch_id"
						+ " WHERE b.branch_id=?::UUID AND b.status='t' AND em.status='t' AND u.user_level <> 0 ORDER BY u.user_level ASC";
				pst=con.prepareStatement(sql);
				pst.setString(1, branch_id);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					list.add("{'emp_id':'"+rs.getString("emp_id")+"'");
					list.add("'id_card':'"+rs.getString("id_card")+"'");
					list.add("'english_name':'"+rs.getString("english_name")+"'");
					list.add("'image_url':'"+rs.getString("image_url")+"'}");
				}
				
			}catch(Exception e){e.printStackTrace();return null;}
			finally{
				pst.close();
				if(con !=null )
				con.close();
			}
			return list;
		}
		//List form attendantemp to list checking
		public ArrayList<String> getListEmpCheckAttendant(String month) throws SQLException{
			ArrayList<String> list=new ArrayList<>();
			String sql=null;
			try{
				sql="SELECT * FROM tb_attendantemp"
						+ " WHERE EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
						+ " ORDER BY EXTRACT(DAY from att_date) ASC;";
				pst=con.prepareStatement(sql);
				pst.setString(1, month);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					list.add("{'att_id':'"+rs.getString("att_id")+"'");
					list.add("'att_date':'"+rs.getString("att_date")+"'");
					list.add("'is_absent':'"+rs.getString("is_absent")+"'");
					list.add("'emp_id':'"+rs.getString("emp_id")+"'}");
				}
				
			}catch(Exception e){e.printStackTrace();return null;}
			finally{
				pst.close();
				if(con !=null )
				con.close();
			}
			return list;
		}
		public boolean submitAttEmp(String list) throws SQLException{
			
			try{
				JSONArray jsonArr=new JSONArray(list);
				con.setAutoCommit(false);
				for (int i = 0; i < jsonArr.length(); i++) {
					JSONObject obj=jsonArr.getJSONObject(i);
					String sql="INSERT INTO tb_attendantemp VALUES(uuid_generate_v1(),?::DATE,?,?::UUID);";
					pst=con.prepareStatement(sql);
					pst.setString(1, obj.getString("date"));
					pst.setString(2, obj.getString("is_absent"));
					pst.setString(3, obj.getString("emp_id"));
					pst.executeUpdate();
				}
				con.commit();
				return true;
			}catch(Exception e){con.rollback();e.printStackTrace(); }
			finally{
				pst.close();
				if(con !=null )
				con.close();
			}
			return false;
		}
		//
}
