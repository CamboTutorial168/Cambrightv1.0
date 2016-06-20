package controller.admin.subprogram;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubProgramDAO;
import model.dto.SubProgCreateDTO;

/**
 * Servlet implementation class ProgramCreate
 */
@WebServlet("/SubProgramCreate")
public class SubProgramCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubProgramCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			SubProgCreateDTO prog=new SubProgCreateDTO();
			prog.setProg_id((request.getParameter("prog_id")));
			prog.setSub_prog_title(request.getParameter("subprog_title"));
			prog.setTerm_fee(request.getParameter("term"));
			prog.setSem_fee(request.getParameter("sem"));
			prog.setYear_fee(request.getParameter("year"));
			prog.setAmstart(request.getParameter("amstart"));
			prog.setAmend(request.getParameter("amend"));
			prog.setPmstart(request.getParameter("pmstart"));
			prog.setPmend(request.getParameter("pmend"));
			response.setContentType("text/plain");
			if(new SubProgramDAO().createSubProgram(prog)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		}catch(Exception e){e.printStackTrace();}
	}
	
}
