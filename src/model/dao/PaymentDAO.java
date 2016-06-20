package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.PaymentFilterDTO;
import model.dto.PaymentSearchListDTO;
import model.dto.StudentDTO;
import controller.admin.Conn;

public class PaymentDAO {
	Connection con=null;
	PreparedStatement pst=null;
	
	public PaymentDAO() {
		con=new Conn().getConnection();
	}
	//Student Payments Get filter subject after select student
	public ArrayList<PaymentFilterDTO> getSubject(String id) throws SQLException{
		ArrayList<PaymentFilterDTO> pa=new ArrayList<PaymentFilterDTO>();
		String sql="";
		try{
			
			sql="SELECT s.student_id,s.id_card,cl.class_id,cl.class_title,st.teach_id,sub.*"
					+ " FROM tb_studying st"
					+ " JOIN tb_teaching te"
					+ " ON st.teach_id=te.teach_id"
					+ " JOIN tb_classes cl"
					+ " ON cl.class_id=te.class_id"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=cl.sub_prog_id"
					+ " JOIN tb_students s"
					+ " ON s.student_id=st.student_id"
					+ " WHERE s.student_id=?::uuid"
					+ " AND st.status='t' AND te.is_deleted='f' AND te.status='t' AND sub.is_deleted='f'";
			pst=con.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				PaymentFilterDTO p=new PaymentFilterDTO();
				p.setStudent_id(rs.getString("student_id"));
				p.setId_card(rs.getString("id_card"));
				p.setClass_id(rs.getString("class_id"));
				p.setClass_title(rs.getString("class_title"));
				p.setTeach_id(rs.getString("teach_id"));
				p.setSub_prog_id(rs.getString("sub_prog_id"));
				p.setSub_prog_title(rs.getString("sub_prog_title"));
				p.setTerm_fee(rs.getString("term_fee"));
				p.setSem_fee(rs.getString("sem_fee"));
				p.setYear_fee(rs.getString("year_fee"));
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
	//Students continue their Subject but extend period of expired date by paying money more only 1 TERM or 1 SEMESTER
	public Boolean payNow(StudentDTO s) throws SQLException{
		PreparedStatement pstDisablePay=null;
		PreparedStatement pstInsertNewPay=null;
		PreparedStatement pstDisableStudying=null;
		PreparedStatement pstInsertNewStudy=null;
		String expr=null;
		switch(s.getFee_type()){
		case "term_fee":
			expr=" (SELECT (NOW() + INTERVAL '3 month'))";
			break;
		case "sem_fee":
			expr=" (SELECT (NOW() + INTERVAL '6 month'))";
			break;
		}
		s.setExpired(expr);
		try{
			con.setAutoCommit(false);
			
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
			
			//insert new tb_studying for who change classroom but the same Subject
			//Disabled Current Study
			String sqlDisableStudying="UPDATE tb_studying SET status='f' WHERE student_id=?::uuid;";
			pstDisableStudying=con.prepareStatement(sqlDisableStudying);
			pstDisableStudying.setString(1, s.getStudent_id());
			pstDisableStudying.executeUpdate();
			
			//Insert new teaching means new class if their change class but the same Subject
			String sqlInsertNewStudy="INSERT INTO tb_studying VALUES(uuid_generate_v1(),?::uuid,?::uuid,'t');";
			pstInsertNewStudy=con.prepareStatement(sqlInsertNewStudy);
			pstInsertNewStudy.setString(1, s.getTeach_id());
			pstInsertNewStudy.setString(2, s.getStudent_id());
			pstInsertNewStudy.executeUpdate();
			
			con.commit();
			return true;
		}catch(Exception e){con.rollback();e.printStackTrace();}
		finally{
			if(pstDisablePay!=null)pstDisablePay.close();
			if(pstInsertNewPay!=null)pstInsertNewPay.close();
			if(pstDisableStudying!=null)pstDisableStudying.close();
			if(pstInsertNewStudy!=null)pstInsertNewStudy.close();
			if(con !=null )
			con.close();
		}
		return false;
	}
	public ArrayList<PaymentSearchListDTO> getPaymentSearch(String search) throws SQLException{
		ArrayList<PaymentSearchListDTO> pr=new ArrayList<PaymentSearchListDTO>();
		String sql="";
		try{
			
			sql="SELECT s.student_id,s.id_card,e.id_card as emp_id_card,s.english_name,e.english_name as receiver,pa.type_fee,pa.date_paid,pa.expire_date,sub.sub_prog_title,pa.status"
					+ " FROM tb_payment pa"
					+ " JOIN tb_students s"
					+ " ON pa.student_id = s.student_id"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=pa.sub_prog_id"
					+ " JOIN tb_employees e"
					+ " ON e.emp_id = pa.recieved_by"
					+ " WHERE s.id_card=? ORDER BY pa.status DESC";
			pst=con.prepareStatement(sql);
			pst.setString(1, search);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				PaymentSearchListDTO p=new PaymentSearchListDTO();
				p.setStudent_id(rs.getString("student_id"));
				p.setId_card_stu(rs.getString("id_card"));
				p.setId_card_emp(rs.getString("emp_id_card"));
				p.setStudent_name(rs.getString("english_name"));
				p.setReceiver(rs.getString("receiver"));
				p.setDate_paid(rs.getString("date_paid"));
				p.setExpire_date(rs.getString("expire_date"));
				p.setSub_prog_title(rs.getString("sub_prog_title"));
				p.setStatus(rs.getString("status"));
				p.setType_fee(rs.getString("type_fee"));
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
