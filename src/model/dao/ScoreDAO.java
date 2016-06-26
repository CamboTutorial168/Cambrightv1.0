package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ScoreDTO;
import controller.admin.Conn;

public class ScoreDAO {
	Connection con=null;
	PreparedStatement pst=null;
	public ScoreDAO() {
		con=new Conn().getConnection();
	}
	public boolean submitScoreStudent(ScoreDTO s) throws SQLException {
		con.setAutoCommit(false);
		try {			
			String sql = "WITH upsert AS"
					+ " (UPDATE tb_scores SET vocab=?::float,grammar=?::float,read=?::float,write=?::float,listen=?::float,speak=?::float,paint=?::float,math=?::float,class_part=?::float,"
					+ " month=?::DATE,status='f'"
					+ " WHERE (SELECT EXTRACT(month FROM month::DATE ))=(SELECT EXTRACT(month FROM ?::DATE ))"
					+ " AND (SELECT EXTRACT(year FROM month::DATE ))=(SELECT EXTRACT(year FROM ?::DATE ))"
					+ " AND student_id=?::uuid"
					+ " AND sub_prog_id=?::uuid RETURNING *)"
					+ " INSERT INTO tb_scores"
					+ " SELECT uuid_generate_v1(),?::float,?::float,?::float,?::float,?::float,?::float,?::float,?::float,?::float,?::DATE,?::uuid,?::uuid,'f'"
					+ " WHERE NOT EXISTS (SELECT * FROM upsert)";
			pst = con.prepareStatement(sql);
			pst.setString(1, s.getVocab());
			pst.setString(2, s.getGr());
			pst.setString(3, s.getRe());
			pst.setString(4, s.getWr());
			pst.setString(5, s.getLi());
			pst.setString(6, s.getSp());
			pst.setString(7, s.getPa());
			pst.setString(8, s.getMa());
			pst.setString(9, s.getClass_part());
			pst.setString(10, s.getMonth());
			
			pst.setString(11, s.getMonth());
			pst.setString(12, s.getMonth());
			pst.setString(13, s.getStudent_id());
			pst.setString(14, s.getSub_prog_id());
			
			pst.setString(15, s.getVocab());
			pst.setString(16, s.getGr());
			pst.setString(17, s.getRe());
			pst.setString(18, s.getWr());
			pst.setString(19, s.getLi());
			pst.setString(20, s.getSp());
			pst.setString(21, s.getPa());
			pst.setString(22, s.getMa());
			pst.setString(23, s.getClass_part());
			pst.setString(24, s.getMonth());
			pst.setString(25, s.getStudent_id());
			pst.setString(26, s.getSub_prog_id());
			pst.executeUpdate();
			System.out.println(s);
			con.commit();
			return true;
		} catch (Exception e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			if(pst!=null)pst.close();
			if (con != null)
				con.close();
		}
		return false;
	}
	
	public ArrayList<ScoreDTO> getListStuScore(String month) throws SQLException{
		ArrayList<ScoreDTO> list=new ArrayList<>();
		String sql=null;
		try{
			/*sql="SELECT * FROM tb_scores"
					+ " WHERE EXTRACT(month FROM month)=(SELECT EXTRACT(month FROM ?::DATE ))"
					+ " ORDER BY EXTRACT(DAY from month) ASC;";*/
			sql="SELECT *,( big_tb.total - big_tb.num_absent-(big_tb.num_grant/2)) as real_rs,"
						+ "(RANK() OVER(ORDER BY (big_tb.total - big_tb.num_absent-(big_tb.num_grant/2)) DESC)) as rank"
						+ " FROM "
						+ " (SELECT sc.*,SUM(vocab+grammar+read+write+listen+speak+paint+math+class_part) as total,"
						+ "	(SELECT count(is_absent) FROM tb_attendantstu atstu1 WHERE is_absent='a'"
						+ " AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
						+ " AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM ?::DATE ))"
						+ "	AND atstu1.student_id=sc.student_id) as num_absent,	(SELECT count(is_absent)"
						+ " FROM tb_attendantstu atstu2	WHERE is_absent='g'"
						+ "	AND EXTRACT(month FROM att_date)=(SELECT EXTRACT(month FROM ?::DATE ))"
						+ "	AND EXTRACT(year FROM att_date)=(SELECT EXTRACT(year FROM ?::DATE ))"
						+ "	AND atstu2.student_id=sc.student_id) as num_grant"
						+ "	FROM tb_scores sc"
						+ "	JOIN tb_sub_programs sub"
						+ "	ON sub.sub_prog_id=sc.sub_prog_id"
						+ "	WHERE EXTRACT(month FROM month)=(SELECT EXTRACT(month FROM ?::DATE ))"
				//		+ "	AND sub.sub_prog_id='d9c326f4-394e-11e6-9c70-eb1b3b246fab'"
						+ "	GROUP BY sc.score_id,sc.vocab,sc.grammar,sc.read,sc.write,sc.listen,sc.speak,sc.paint,sc.math,sc.class_part,sc.month,"
						+ "	sc.student_id,sc.sub_prog_id,sub.sub_prog_id"
					+ ")"
					+ " AS big_tb";
			pst=con.prepareStatement(sql);
			pst.setString(1, month);
			pst.setString(2, month);
			pst.setString(3, month);
			pst.setString(4, month);
			pst.setString(5, month);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				ScoreDTO sc=new ScoreDTO();
				sc.setScore_id(rs.getString("score_id"));
				sc.setVocab(rs.getString("vocab"));
				sc.setGr(rs.getString("grammar"));
				sc.setRe(rs.getString("read"));
				sc.setWr(rs.getString("write"));
				sc.setLi(rs.getString("listen"));
				sc.setSp(rs.getString("speak"));
				sc.setPa(rs.getString("paint"));
				sc.setMa(rs.getString("math"));
				sc.setClass_part(rs.getString("class_part"));
				sc.setMonth(rs.getString("month"));
				sc.setStudent_id(rs.getString("student_id"));
				sc.setSub_prog_id(rs.getString("sub_prog_id"));
				sc.setStatus(rs.getString("status"));
				sc.setNum_absent(rs.getString("num_absent"));
				sc.setNum_grant(rs.getString("num_grant"));
				sc.setTotal(rs.getString("total"));
				sc.setRank(rs.getString("rank"));
				list.add(sc);
			}
			
		}catch(Exception e){e.printStackTrace();return null;}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
	public boolean checkStatus(String score_id,String status) throws SQLException{
		String sql="UPDATE tb_scores SET status=? WHERE score_id=CAST(? AS UUID);";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, score_id);
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
}
