package controller.admin.attendance;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AttendanceEmpDAO;

/**
 * Servlet implementation class AttendanceEmpSubmit
 */
@WebServlet("/AttendanceEmpSubmit")
public class AttendanceEmpSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceEmpSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String list=request.getParameter("ckatt");
			response.setContentType("text/plain");
			if(new AttendanceEmpDAO().submitAttEmp(list)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
