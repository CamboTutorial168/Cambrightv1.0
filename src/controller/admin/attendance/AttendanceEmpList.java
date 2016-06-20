package controller.admin.attendance;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AttendanceEmpDAO;

/**
 * Servlet implementation class AttendanceEmpList
 */
@WebServlet("/AttendanceEmpList")
public class AttendanceEmpList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceEmpList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String branch_id=request.getParameter("branch_id");
			ArrayList<String> list =new AttendanceEmpDAO().getListEmpAttendance(branch_id);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(list.toString().replaceAll("'", "\""));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
