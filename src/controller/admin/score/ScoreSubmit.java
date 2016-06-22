package controller.admin.score;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ScoreDAO;
import model.dto.ScoreDTO;

/**
 * Servlet implementation class ScoreSubmit
 */
@WebServlet("/ScoreSubmit")
public class ScoreSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			ScoreDTO s=new ScoreDTO();
			s.setVocab(request.getParameter("vo"));
			s.setGr(request.getParameter("gr"));
			s.setRe(request.getParameter("re"));
			s.setWr(request.getParameter("wr"));
			s.setLi(request.getParameter("li"));
			s.setSp(request.getParameter("sp"));
			s.setPa(request.getParameter("pa"));
			s.setMa(request.getParameter("ma"));
			s.setClass_part(request.getParameter("cl"));
			s.setMonth(request.getParameter("month"));
			s.setStudent_id(request.getParameter("student_id"));
			s.setSub_prog_id(request.getParameter("sub_prog_id"));
			if(new ScoreDAO().submitScoreStudent(s)==true)
				response.getWriter().write("true");
			else
				response.getWriter().write("false");
		}catch(Exception e){e.printStackTrace();}
	}

}
