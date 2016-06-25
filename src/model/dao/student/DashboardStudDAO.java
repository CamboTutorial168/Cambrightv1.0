package model.dao.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.PaymentDTO;
import model.dto.PaymentHistory;
import controller.admin.Conn;

public class DashboardStudDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public DashboardStudDAO() {
		con=new Conn().getConnection();
	}
	
	public ArrayList<String> getRankNAbsent(String student_id) throws SQLException{
		ArrayList<String> list=new ArrayList<>();
		try{
			String sql="SELECT *,(big_tb.total - big_tb.num_absent-(big_tb.num_grant/2)) as real_rs,(RANK() OVER(PARTITION BY class_id ORDER BY (big_tb.total - big_tb.num_absent-(big_tb.num_grant/2)) DESC)) FROM ("+
			"SELECT sc.*,TO_CHAR(sc.month,'Mon, YYYY') as of_month,cl.class_id,SUM(vocab+grammar+read+write+listen+speak+paint+math+class_part) as total,"+
			"(SELECT count(is_absent)"+
			" FROM tb_attendantstu atstu1"+
			" WHERE is_absent='a'"+
			" AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM NOW()::DATE ))"+
			" AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM NOW()::DATE ))"+
			" AND atstu1.student_id=sc.student_id) as num_absent,"+
		
			" (SELECT count(is_absent)"+
			" FROM tb_attendantstu atstu2"+
			" WHERE is_absent='g'"+
			" AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM NOW()::DATE ))"+
			" AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM NOW()::DATE ))"+
			" AND atstu2.student_id=sc.student_id) as num_grant"+
		
			" FROM tb_scores sc"+
			" JOIN tb_sub_programs sub"+
			" ON sub.sub_prog_id=sc.sub_prog_id"+
			" JOIN tb_classes cl"+
			" ON cl.sub_prog_id=sub.sub_prog_id"+
			" JOIN tb_students s"+
			" ON s.student_id=sc.student_id"+
		
			" WHERE EXTRACT(month FROM month)=(SELECT EXTRACT(month FROM NOW()::DATE )) AND sc.status='t' "+
			" GROUP BY sc.score_id,sc.vocab,sc.grammar,sc.read,sc.write,sc.listen,sc.speak,sc.paint,sc.math,sc.class_part,sc.month,"+
			" sc.student_id,sc.sub_prog_id,sub.sub_prog_id,cl.class_id,s.id_card,s.english_name,s.gender"+
			") AS big_tb";
			pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				if(student_id.equals(rs.getString("student_id"))){
					
					list.add("{'rank':"+"'"+rs.getString("rank")+"'");
					list.add("'absent':"+"'"+rs.getString("num_absent")+"'");
					list.add("'of_month':"+"'"+rs.getString("of_month")+"'}");
					break;
				}
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	public String getSchedulePeriod(String student_id) throws SQLException{
		
		try{
			String sql="SELECT pp.period_type FROM tb_students s"
					+ " JOIN tb_period pp"
					+ " ON pp.student_id = s.student_id"
					+ " WHERE pp.status='t' AND s.student_id=?::uuid";
			pst=con.prepareStatement(sql);
			pst.setString(1, student_id);
			ResultSet rs=pst.executeQuery();
			rs.next();
			return rs.getString("period_type");
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return null;
	}
	public String getExpiredDate(String student_id) throws SQLException{
		
		try{
			String sql="SELECT expire_date FROM tb_payment WHERE student_id=?::uuid AND status='t'";
			pst=con.prepareStatement(sql);
			pst.setString(1, student_id);
			ResultSet rs=pst.executeQuery();
			rs.next();
			return rs.getString("expire_date");
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return null;
	}
	public ArrayList<PaymentHistory> getPaymetHistory(String student_id) throws SQLException{
		ArrayList<PaymentHistory> pa=new ArrayList<PaymentHistory>();
		try{
			String sql="SELECT type_fee,discount,date_paid,pa.expire_date,total,recieved_by,sub.sub_prog_title,b.branch_name,b.color,e.english_name"
					+ " FROM tb_payment pa"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=pa.sub_prog_id"
					+ " JOIN tb_employees e"
					+ " ON e.emp_id=pa.recieved_by"
					+ " JOIN tb_branches b"
					+ " ON b.branch_id=e.branch_id"
					+ " WHERE student_id=?::uuid ORDER BY date_paid DESC";
			pst=con.prepareStatement(sql);
			pst.setString(1, student_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				PaymentHistory p=new PaymentHistory();
				p.setFee_type(rs.getString("type_fee"));
				p.setDiscount(rs.getString("discount"));
				p.setDate_paid(rs.getString("date_paid"));
				p.setExpired(rs.getString("expire_date"));
				p.setTotal(rs.getString("total"));
				p.setRecept_name(rs.getString("english_name"));
				p.setSubprog_title(rs.getString("sub_prog_title"));
				p.setBranch_color(rs.getString("color"));
				p.setBranch_name(rs.getString("branch_name"));
				pa.add(p);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return pa;
	}
	
}
