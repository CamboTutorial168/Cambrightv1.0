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
 * Servlet implementation class SubProgramUpdate
 */
@WebServlet("/SubProgramUpdate")
public class SubProgramUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubProgramUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String subprog_id = request.getParameter("subprog_id");
			String prog_id = request.getParameter("prog_id");
			String subprog_title = request.getParameter("subprog_title");
			String term = request.getParameter("term");
			String sem = request.getParameter("sem");
			String year = request.getParameter("year");
			SubProgCreateDTO s=new SubProgCreateDTO();
			s.setSubprog_id(subprog_id);
			s.setProg_id(prog_id);
			s.setSub_prog_title(subprog_title);
			s.setTerm_fee(term);
			s.setSem_fee(sem);
			s.setYear_fee(year);
			boolean check = new SubProgramDAO().updateSubProgram(s);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			if (check == true) {
				response.getWriter().write("true");
			} else {
				response.getWriter().write("false");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
