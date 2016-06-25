package model.dao.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ScoreStudDTO;
import controller.admin.Conn;

public class ScoreStudDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public ScoreStudDAO() {
		con=new Conn().getConnection();
	}
	public ArrayList<ScoreStudDTO> getListStudentScore(String student_id,String month) throws SQLException{
		ArrayList<ScoreStudDTO> l=new ArrayList<ScoreStudDTO>();
		/*String sql="SELECT sc.*,sub.sub_prog_title,b.*,cl.class_title,cl.class_color,e.english_name,"
				
				+ " (SELECT count(is_absent) FROM tb_attendantstu"
				+ " WHERE is_absent='a' AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
				+ " AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM ?::DATE ))"
				+ " AND student_id=?::uuid) as num_absent,"
				
				+ " (SELECT count(is_absent) FROM tb_attendantstu"
				+ " WHERE is_absent='g' AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
				+ " AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM ?::DATE ))"
				+ " AND student_id=?::uuid) as num_grant"
				
				+ " FROM tb_studying st"
				+ " JOIN tb_teaching te"
				+ " ON te.teach_id=st.teach_id"
				+ " JOIN tb_classes cl"
				+ " ON cl.class_id=te.class_id"
				+ " JOIN tb_sub_programs sub"
				+ " ON sub.sub_prog_id=cl.sub_prog_id"
				+ " JOIN tb_scores sc"
				+ " ON sc.sub_prog_id=sub.sub_prog_id"
				+ " JOIN tb_programs pr"
				+ " ON pr.prog_id=sub.prog_id"
				+ " JOIN tb_branches b"
				+ " ON b.branch_id=pr.branch_id"
				+ " JOIN tb_employees e ON e.emp_id=te.emp_id"
				+ " WHERE st.status='t' AND sc.status='t' AND st.student_id=?::uuid AND"
				+ " (SELECT EXTRACT(month FROM month::DATE ))=(SELECT EXTRACT(month FROM ?::DATE )) AND"
				+ " (SELECT EXTRACT(year FROM month::DATE ))=(SELECT EXTRACT(year FROM ?::DATE ))";*/
		String sql="SELECT *,(big_tb.total - big_tb.num_absent-(big_tb.num_grant/2)) as real_rs,(RANK() OVER(ORDER BY (big_tb.total - big_tb.num_absent-(big_tb.num_grant/2)) DESC)) as rank FROM ("
						+"SELECT sc.*,e.english_name,s.english_name as stu_name,sub.sub_prog_title,b.branch_name,b.color,cl.class_title,class_color,SUM(vocab+grammar+read+write+listen+speak+paint+math+class_part) as total,"
						+" (SELECT count(is_absent)"
						+" FROM tb_attendantstu atstu1"
						+" WHERE is_absent='a'"
						+" AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
						+" AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM ?::DATE ))"
						+" AND atstu1.student_id=sc.student_id) as num_absent,"
					
						+" (SELECT count(is_absent)"
						+" FROM tb_attendantstu atstu2"
						+" WHERE is_absent='g'"
						+" AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
						+" AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM ?::DATE ))"
						+" AND atstu2.student_id=sc.student_id) as num_grant"
					
						+" FROM tb_scores sc"
						+" JOIN tb_sub_programs sub"
						+" ON sub.sub_prog_id=sc.sub_prog_id"
						+" JOIN tb_programs pr"
						+" ON pr.prog_id=sub.prog_id"
						+" JOIN tb_branches b"
						+" ON b.branch_id=pr.branch_id"
						+" JOIN tb_classes cl"
						+" ON cl.sub_prog_id=sub.sub_prog_id"
						+" JOIN tb_teaching te"
						+" ON te.class_id=cl.class_id"
						/*+" JOIN tb_studying st"
						+" ON st.teach_id=te.teach_id"*/
						+" JOIN tb_employees e"
						+" ON e.emp_id=te.emp_id JOIN tb_students s"
						+" ON s.student_id=sc.student_id"
						+" WHERE EXTRACT(month FROM month)=(SELECT EXTRACT(month FROM ?::DATE )) AND sc.status='t' "
						+" GROUP BY sc.score_id,sc.vocab,sc.grammar,sc.read,sc.write,sc.listen,sc.speak,sc.paint,sc.math,sc.class_part,sc.month,"
						+" sc.student_id,sc.sub_prog_id,sub.sub_prog_id,b.branch_name,b.color,cl.class_title,class_color,e.english_name,sub.sub_prog_title,s.english_name"
					+") AS big_tb";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, month);
			pst.setString(2, month);
			pst.setString(3, month);
			pst.setString(4, month);
			pst.setString(5, month);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				ScoreStudDTO s=new ScoreStudDTO();
				s.setScore_id(rs.getString("score_id"));
				s.setVocab(rs.getString("vocab"));
				s.setGr(rs.getString("grammar"));
				s.setRe(rs.getString("read"));
				s.setWr(rs.getString("write"));
				s.setLi(rs.getString("listen"));
				s.setSp(rs.getString("speak"));
				s.setPa(rs.getString("paint"));
				s.setMa(rs.getString("math"));
				s.setClass_part(rs.getString("class_part"));
				s.setSubprog_title(rs.getString("sub_prog_title"));
				s.setBranch_name(rs.getString("branch_name"));
				s.setBranch_color(rs.getString("color"));
				s.setClass_title(rs.getString("class_title"));
				s.setClass_color(rs.getString("class_color"));
				s.setTeacher_name(rs.getString("english_name"));
				s.setStud_name(rs.getString("stu_name"));
				s.setNum_absent(rs.getString("num_absent"));
				s.setNum_grant(rs.getString("num_grant"));
				s.setTotal(rs.getString("total"));
				s.setRank(rs.getString("rank"));
				l.add(s);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return l;
	}
}
