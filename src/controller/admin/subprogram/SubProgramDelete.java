package controller.admin.subprogram;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubProgramDAO;

/**
 * Servlet implementation class SubProgramDelete
 */
@WebServlet("/SubProgramDelete")
public class SubProgramDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubProgramDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String subprog_id=request.getParameter("subprog_id");
			String prog_id=request.getParameter("prog_id");
			boolean check = false;
			
			check=new SubProgramDAO().deleteSubProg(subprog_id, prog_id);
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
