package controller.admin.report;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.GenerateReportDAO;
import model.dto.UserDTO;

import org.apache.commons.collections.map.HashedMap;

/**
 * Servlet implementation class CreateStudRankPDF
 */
@WebServlet("/CreateStudRankPDF")
public class CreateStudRankPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateStudRankPDF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GenerateReportDAO re=new GenerateReportDAO();
		Map<String, Object> param=new HashedMap();
		String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
		String month=request.getParameter("month");
		param.put("emp_id", emp_id);
		param.put("month_filter", month);
		String jpath=request.getServletContext().getRealPath(("/reports/StudentsRankList.jrxml"));
		try {
			re.getReport(response, param, jpath);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
