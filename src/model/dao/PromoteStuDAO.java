package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.PromotionListDTO;
import model.dto.StudentDTO;
import controller.admin.Conn;

public class PromoteStuDAO {
	Connection con=null;
	PreparedStatement pst=null;
	
	public PromoteStuDAO() {
		con=new Conn().getConnection();
	}
	public Boolean promoteClass(StudentDTO s) throws SQLException{
		PreparedStatement pstDisableStudying=null;
		PreparedStatement pstInsertNewStudy=null;
		PreparedStatement pstDisablePay=null;
		PreparedStatement pstInsertNewPay=null;
		String expr=null;
		switch(s.getFee_type()){
		case "term_fee":
			expr=" (SELECT (NOW() + INTERVAL '3 month'))";
			break;
		case "sem_fee":
			expr=" (SELECT (NOW() + INTERVAL '6 month'))";
			break;
		case "year_fee":
			expr=" (SELECT (NOW() + INTERVAL '1 year'))";
			break;
		}
		s.setExpired(expr);
		try{
			con.setAutoCommit(false);
			//Disabled Current Study
			String sqlDisableStudying="UPDATE tb_studying SET status='f' WHERE student_id=?::uuid;";
			pstDisableStudying=con.prepareStatement(sqlDisableStudying);
			pstDisableStudying.setString(1, s.getStudent_id());
			pstDisableStudying.executeUpdate();
			
			//Insert New Subject that promoted
			String sqlInsertNewStudy="INSERT INTO tb_studying VALUES(uuid_generate_v1(),?::uuid,?::uuid,'t');";
			pstInsertNewStudy=con.prepareStatement(sqlInsertNewStudy);
			pstInsertNewStudy.setString(1, s.getTeach_id());
			pstInsertNewStudy.setString(2, s.getStudent_id());
			pstInsertNewStudy.executeUpdate();
			
			//Disable current payment;
			String sqlDisablePay="UPDATE tb_payment SET status='f' WHERE student_id=?::uuid";
			pstDisablePay=con.prepareStatement(sqlDisablePay);
			pstDisablePay.setString(1, s.getStudent_id());
			pstDisablePay.executeUpdate();
			
			//Insert new payment;
			String sqlPay="INSERT INTO tb_payment VALUES(uuid_generate_v1(),?,?::decimal,?::date,?::uuid,?::uuid,"+s.getExpired()+"::date,?::decimal,'t',?::uuid);";
			pstInsertNewPay=con.prepareStatement(sqlPay);
			pstInsertNewPay.setString(1, s.getFee_type());
			pstInsertNewPay.setString(2, s.getDiscount());
			pstInsertNewPay.setString(3, s.getDate_paid());
			pstInsertNewPay.setString(4, s.getStudent_id());
			pstInsertNewPay.setString(5, s.getSubprog_id());
			pstInsertNewPay.setString(6, s.getTotal());
			pstInsertNewPay.setString(7, s.getEmp_id());
			pstInsertNewPay.executeUpdate();
			con.commit();
			return true;
		}catch(Exception e){con.rollback();e.printStackTrace();}
		finally{
			if(pstDisableStudying!=null)pstDisableStudying.close();
			if(pstInsertNewStudy!=null)pstInsertNewStudy.close();
			if(pstDisablePay!=null)pstDisablePay.close();
			if(pstInsertNewPay!=null)pstInsertNewPay.close();
			if(con !=null )
			con.close();
		}
		return false;
	}
	
	public ArrayList<PromotionListDTO> getListPromote(String search) throws SQLException{
		
		ArrayList<PromotionListDTO> pr=new ArrayList<PromotionListDTO>();
		String sql="";
		try{
			
			sql="SELECT cl.*,sub.sub_prog_title,e.english_name,st.status,s.id_card,s.english_name as student_name"
					+ " FROM tb_studying st"
					+ " JOIN tb_teaching te"
					+ " ON st.teach_id=te.teach_id"
					+ " JOIN tb_classes cl"
					+ " ON cl.class_id = te.class_id"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=cl.sub_prog_id"
					+ " JOIN tb_employees e"
					+ " ON e.emp_id=te.emp_id"
					+ " JOIN tb_students s"
					+ " ON s.student_id=st.student_id"
					+ " WHERE s.id_card=? ORDER BY st.status DESC";
			pst=con.prepareStatement(sql);
			pst.setString(1, search);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				PromotionListDTO p=new PromotionListDTO();
				p.setClass_id(rs.getString("class_id"));
				p.setClass_title(rs.getString("class_title"));
				p.setClass_color(rs.getString("class_color"));
				p.setSub_prog_id(rs.getString("sub_prog_id"));
				p.setSub_prog_title(rs.getString("sub_prog_title"));
				p.setEnglish_name(rs.getString("english_name"));
				p.setStatus(rs.getString("status"));
				p.setId_card(rs.getString("id_card"));
				p.setStudent_name(rs.getString("student_name"));
				pr.add(p);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return pr;
	}
}
