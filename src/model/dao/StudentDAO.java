package model.dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.dto.ListStudInfoDTO;
import model.dto.StudentDTO;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import controller.admin.Conn;

public class StudentDAO {
	Connection con=null;
	PreparedStatement pst=null;
	
	public StudentDAO() {
		con=new Conn().getConnection();
	}
	
	/*
	 * checked
	 */
	public boolean checkStatus(String stud_id,String status) throws SQLException{
		String sql="UPDATE tb_students SET status=? WHERE student_id=CAST(? AS UUID)";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, stud_id);
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
	/*
	 * checked
	 */
	public Boolean createStud(StudentDTO s) throws SQLException{
		PreparedStatement pstInfo=null;
		PreparedStatement pstStudy=null;
		PreparedStatement pstPay=null;
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
			String sqlInfo="INSERT INTO tb_students VALUES(uuid_generate_v1(),?,?,?,?,?::char,?::date,?,?,?,?,?::date,?::date,?,?::char,?::uuid,?::uuid,?::char,?::uuid,?::uuid);";	
			pstInfo=con.prepareStatement(sqlInfo,Statement.RETURN_GENERATED_KEYS);
			pstInfo.setString(1, s.getId_card());
			pstInfo.setString(2, s.getPassword());
			pstInfo.setString(3, s.getKh_name());
			pstInfo.setString(4, s.getEn_name());
			pstInfo.setString(5, s.getGender());
			pstInfo.setString(6, s.getDob());
			pstInfo.setString(7, s.getFa_name());
			pstInfo.setString(8, s.getMa_name());
			pstInfo.setString(9, s.getAddr());
			pstInfo.setString(10, s.getPhone());
			pstInfo.setString(11, s.getReg_date());
			pstInfo.setString(12, s.getMod_date());
			pstInfo.setString(13, s.getImg_url());
			pstInfo.setString(14, s.getStatus());
			pstInfo.setString(15, s.getEmp_id());
			pstInfo.setString(16, s.getMod_by());
			pstInfo.setString(17, s.getIs_graduate());
			pstInfo.setString(18, s.getUser_id());
			pstInfo.setString(19, s.getBranch_id());
			pstInfo.executeUpdate();
			ResultSet stu_key=pstInfo.getGeneratedKeys();
			stu_key.next();
			String student_id=stu_key.getString(1);
			//Studying
			
			String sqlStudy="INSERT INTO tb_studying VALUES(uuid_generate_v1(),?::uuid,?::uuid,?::char);";
			pstStudy=con.prepareStatement(sqlStudy);
			pstStudy.setString(1, s.getTeach_id());
			pstStudy.setString(2, student_id);
			pstStudy.setString(3, "t");
			pstStudy.executeUpdate();
			//Payment
			
			String sqlPay="INSERT INTO tb_payment VALUES(uuid_generate_v1(),?,?::decimal,?::date,?::uuid,?::uuid,"+s.getExpired()+"::date,?::decimal,'t',?::uuid);";
			pstPay=con.prepareStatement(sqlPay);
			
			pstPay.setString(1, s.getFee_type());
			pstPay.setString(2, s.getDiscount());
			pstPay.setString(3, s.getDate_paid());
			pstPay.setString(4, student_id);
			pstPay.setString(5, s.getSubprog_id());
			pstPay.setString(6, s.getTotal());
			pstPay.setString(7, s.getEmp_id());
			pstPay.executeUpdate();
			
			//Period
			String sqlPeriod="INSERT INTO tb_period VALUES(uuid_generate_v1(),?::DATE,?,?::uuid,?::char);";
			pst=con.prepareStatement(sqlPeriod);
			pst.setString(1, s.getDate_paid());
			pst.setString(2, s.getPeriod());
			pst.setString(3, student_id);
			pst.setString(4, s.getStatus());
			pst.executeUpdate();
			
			con.commit();
			return true;
		}catch(Exception e){con.rollback();e.printStackTrace();}
		finally{
			if(pstInfo!=null)pstInfo.close();
			if(pstStudy!=null)pstStudy.close();
			if(pstPay!=null)pstPay.close();
			if(con !=null )
			con.close();
		}
		return false;
	}
	/*
	 * checked
	 */
	public ArrayList<ListStudInfoDTO> listStudInfo(String branch_id) throws SQLException{
		ArrayList<ListStudInfoDTO> list=new ArrayList<>();
		String sql=null;
		try{
			/*sql="SELECT *,e.english_name as registered  FROM tb_students s"
					+ " JOIN tb_branches b"
					+ " ON s.branch_id=b.branch_id"
					+ " JOIN tb_users_level u"
					+ " ON u.user_id=s.user_id JOIN tb_employees e ON e.emp_id = s.registered_by WHERE b.status='t'";*/
			sql="SELECT	s.*,u.*, e.english_name AS registered,sub.sub_prog_id,sub.sub_prog_title,cl.class_color,cl.class_id,cl.class_title,per.period_type,b.branch_id,b.color,b.branch_name"
					+ " FROM tb_students s"
					+ " JOIN tb_branches b"
					+ " ON s.branch_id = b.branch_id"
					+ " JOIN tb_users_level u"
					+ " ON u.user_id = s.user_id"
					+ " JOIN tb_employees e"
					+ " ON e.emp_id = s.registered_by"
					+ " JOIN tb_period per"
					+ " ON per.student_id = s.student_id"
					+ " JOIN tb_studying std"
					+ " ON std.student_id=s.student_id"
					+ " JOIN tb_teaching te"
					+ " ON te.teach_id=std.teach_id"
					+ " JOIN tb_classes cl"
					+ " ON cl.class_id=te.class_id"
					+ " JOIN tb_sub_programs sub"
					+ " ON sub.sub_prog_id=cl.sub_prog_id"
					+ " WHERE b.status = 't' AND per.status='t' AND std.status='t' AND te.status='t' AND te.is_deleted='f' AND sub.is_deleted='f' ";
			if(branch_id!=null)sql+=" AND b.branch_id=?::uuid;";
			pst=con.prepareStatement(sql);
			if(branch_id!=null)pst.setString(1, branch_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				ListStudInfoDTO info=new ListStudInfoDTO();
				info.setStudent_id(rs.getString("student_id"));
				info.setId_card(rs.getString("id_card"));
				info.setKh_name(rs.getString("khmer_name"));
				info.setEn_name(rs.getString("english_name"));
				info.setPassword(rs.getString("password"));
				info.setGender(rs.getString("gender"));
				info.setDob(rs.getString("dob"));
				info.setFa_name(rs.getString("father_name"));
				info.setMa_name(rs.getString("mother_name"));
				info.setAddr(rs.getString("address"));
				info.setPhone(rs.getString("contact"));
				info.setReg_date(rs.getString("register_date"));
				info.setMod_date(rs.getString("modify_date"));
				info.setImg_url(rs.getString("image_url"));
				info.setStatus(rs.getString("status"));
				info.setReg_by(rs.getString("registered"));
				info.setUser_id(rs.getString("user_id"));
				info.setUser_type(rs.getString("user_type"));
				info.setBranch_id(rs.getString("branch_id"));
				info.setBranch_name(rs.getString("branch_name"));
				info.setSubprog_title(rs.getString("sub_prog_title"));
				info.setCla_num(rs.getString("class_title"));
				info.setCla_color(rs.getString("class_color"));
				info.setPeriod(rs.getString("period_type"));
				info.setBranch_color(rs.getString("color"));
				info.setSubprog_id(rs.getString("sub_prog_id"));
				info.setCla_id(rs.getString("class_id"));
				list.add(info);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return list;
	}
/*
 * checked
 */
	public Boolean updateStudent(ListStudInfoDTO s) throws SQLException{
		String sql="UPDATE tb_students SET id_card=?,password=?,khmer_name=?,english_name=?,gender=?,dob=?::date,"
				+ "father_name=?,mother_name=?,address=?,contact=?,modify_date=?::date,image_url=?,mod_by=?::uuid,user_id=?::uuid"
				+ " WHERE student_id=?::uuid";
		try{
			pst=con.prepareStatement(sql);
			pst.setString(1, s.getId_card());
			pst.setString(2, s.getPassword());
			pst.setString(3, s.getKh_name());
			pst.setString(4, s.getEn_name());
			pst.setString(5, s.getGender());
			pst.setString(6, s.getDob());
			pst.setString(7, s.getFa_name());
			pst.setString(8, s.getMa_name());
			pst.setString(9, s.getAddr());
			pst.setString(10, s.getPhone());
			pst.setString(11, s.getMod_date());
			pst.setString(12, s.getImg_url());
			pst.setString(13, s.getMod_by());
			pst.setString(14, s.getUser_id());
			pst.setString(15, s.getStudent_id());
			if(pst.executeUpdate()>0)
				return true;
			
		}catch(Exception e){ e.printStackTrace();}
		finally{
			pst.close();
			if(con !=null )
			con.close();
		}
		return false;
	}
	
	public void export(String path) throws SQLException, IOException{
		HSSFWorkbook workbook = new HSSFWorkbook();
	    HSSFSheet sheet = workbook.createSheet("lawix10");
	    HSSFRow rowhead = sheet.createRow((short) 0);
	    rowhead.createCell((short) 0).setCellValue("ID CARD");
	    rowhead.createCell((short) 1).setCellValue("KH NAME");
	    rowhead.createCell((short) 2).setCellValue("EN NAME");
	    rowhead.createCell((short) 2).setCellValue("GENDER");
	    rowhead.createCell((short) 2).setCellValue("DOB");
	    rowhead.createCell((short) 2).setCellValue("FATHER");
	    rowhead.createCell((short) 2).setCellValue("MOTHER");
	    rowhead.createCell((short) 2).setCellValue("ADDRESS");
	    rowhead.createCell((short) 2).setCellValue("CONTACT");
	    rowhead.createCell((short) 2).setCellValue("REGISTER DATE");
	    rowhead.createCell((short) 2).setCellValue("REGISTED BY");
	    int i = 1;
	    pst=con.prepareStatement("SELECT s.id_card,s.khmer_name,s.english_name,s.gender,s.dob,s.father_name,s.mother_name,s.address,s.contact,s.register_date, "
	    		+ "e.english_name FROM tb_students s JOIN tb_employees e ON e.emp_id=s.registered_by ORDER BY s.id_card ASC");
	    ResultSet rs=pst.executeQuery();
	    while (rs.next()){
	        HSSFRow row = sheet.createRow((short) i);
	        row.createCell((short) 0).setCellValue(rs.getString(1));
	        row.createCell((short) 1).setCellValue(rs.getString(2));
	        row.createCell((short) 2).setCellValue(rs.getString(3));
	        row.createCell((short) 3).setCellValue(rs.getString(4));
	        row.createCell((short) 4).setCellValue(rs.getString(5));
	        row.createCell((short) 5).setCellValue(rs.getString(6));
	        row.createCell((short) 6).setCellValue(rs.getString(7));
	        row.createCell((short) 7).setCellValue(rs.getString(8));
	        row.createCell((short) 8).setCellValue(rs.getString(9));
	        row.createCell((short) 9).setCellValue(rs.getString(10));
	        row.createCell((short) 10).setCellValue(rs.getString(11));
	        i++;
	    }
	    String yemi = path+"list_student.xls";
	    FileOutputStream fileOut = new FileOutputStream(yemi);
	    
	    workbook.write(fileOut);
	    fileOut.close();
	    
	}
	
	
}
