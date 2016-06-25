package controller.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.EmployeeDAO;
import model.dao.student.StudentDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePasswordStud")
public class ChangePasswordStud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordStud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String uid=((UserDTO)(request.getSession().getAttribute("studentsession"))).getStudent_id();
			String old=request.getParameter("old_pw");
			String new_pw=request.getParameter("new_pw");
			response.setContentType("text/plain");
			boolean check=new StudentDAO().changePassword(uid, old, new_pw);
			
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}
