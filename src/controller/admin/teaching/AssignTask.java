package controller.admin.teaching;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TeachingDAO;
import model.dto.TeachDTO;

/**
 * Servlet implementation class AssignTask
 */
@WebServlet("/AssignTask")
public class AssignTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignTask() {
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
		try{
			TeachDTO t=new TeachDTO();
			t.setEmp_id(request.getParameter("emp_id"));
			t.setStatus("t");
			t.setClass_id(request.getParameter("class_id"));
			response.setContentType("text/plain");
			if(new TeachingDAO().assignTask(t)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		}catch(Exception e){e.printStackTrace();}
	}

}
