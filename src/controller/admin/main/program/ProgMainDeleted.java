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
 * Servlet implementation class ProgMainDeleted
 */
@WebServlet("/ProgMainDeleted")
public class ProgMainDeleted extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgMainDeleted() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			
			String branch_id=request.getParameter("branch_id");
			String prog_id=request.getParameter("prog_id");
			boolean check = false;
			if(user_level==0){
				check=new ProgramDAO().deleteProgMain(branch_id,prog_id);
			}
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
