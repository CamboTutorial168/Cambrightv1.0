package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.Application;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import controller.admin.Conn;

public class GenerateReportDAO {
	Connection con=null;
	public GenerateReportDAO() {
		con=new Conn().getConnection();
	}
	//Teacher Report Rank Students of Each class
	public void getReport(HttpServletResponse res, Map<String, Object> param ,String jpath) throws SQLException{
		try{
			FileInputStream in=new FileInputStream(new File(jpath));
			JasperReport jas=JasperCompileManager.compileReport(in);
			JasperPrint print= JasperFillManager.fillReport(jas, param,con);
			JasperExportManager.exportReportToPdfStream(print,res.getOutputStream());
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(con!=null)con.close();
		}
		
		
	}
	public static void main(String[] args) throws SQLException {
		//init report first
		GenerateReportDAO r=new GenerateReportDAO();
		r.getReport(null, null, null);
	}
}
