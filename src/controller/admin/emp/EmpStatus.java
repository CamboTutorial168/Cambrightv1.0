package controller.admin.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.EmployeeDAO;

/**
 * Servlet implementation class EmpStatus
 */
@WebServlet("/EmpStatus")
public class EmpStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String status=request.getParameter("status");
			String emp_id=request.getParameter("emp_id");
			boolean check = false;
			if(status.equals("t") || status.equals("f")){
				check=new EmployeeDAO().checkStatus(emp_id,status);
			}
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		}catch(Exception e){e.printStackTrace();} 
	}

}
