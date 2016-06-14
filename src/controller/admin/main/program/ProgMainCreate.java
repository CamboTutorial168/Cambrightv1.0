package controller.admin.main.program;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProgramDAO;
import model.dto.ProgramCreateDTO;

/**
 * Servlet implementation class ProgMainCreate
 */
@WebServlet("/ProgMainCreate")
public class ProgMainCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgMainCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doCmd(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			ProgramCreateDTO p=new ProgramCreateDTO();
			p.setProg_title(request.getParameter("prog_title"));
			p.setBranch_id((request.getParameter("branch_id")).split(","));
			boolean check=new ProgramDAO().createProgram(p);
			response.setContentType("text/plain");
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
