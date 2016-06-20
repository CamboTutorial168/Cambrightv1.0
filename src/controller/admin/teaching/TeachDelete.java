package controller.admin.teaching;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubProgramDAO;
import model.dao.TeachingDAO;

/**
 * Servlet implementation class TeachDelete
 */
@WebServlet("/TeachDelete")
public class TeachDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeachDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String teach_id=request.getParameter("teach_id");
			
			boolean check = false;
			
			check=new TeachingDAO().deleteTeach(teach_id);
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
