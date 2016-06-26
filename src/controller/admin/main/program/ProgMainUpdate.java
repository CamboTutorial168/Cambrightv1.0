package controller.admin.main.program;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProgramDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class ProgMainUpdate
 */
@WebServlet("/ProgMainUpdate")
public class ProgMainUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgMainUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			
			String prog_id=request.getParameter("prog_id");
			String prog_title=request.getParameter("prog_title");
			String branch_id=request.getParameter("branch_id");
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			boolean check=false;
			if(user_level==0){
				check=new ProgramDAO().updateMainProgram(prog_id, prog_title,branch_id);
			}
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		}catch(Exception e){e.printStackTrace();}
	}
	
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
