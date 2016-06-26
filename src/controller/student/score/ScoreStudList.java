package controller.student.score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.student.ScoreStudDAO;
import model.dto.ScoreStudDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ScoreStudList
 */
@WebServlet("/ScoreStudList")
public class ScoreStudList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreStudList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String month=request.getParameter("month");
			String student_id=((UserDTO)(request.getSession().getAttribute("studentsession"))).getStudent_id();
			String json=null;
			System.out.println(student_id);
			System.out.println(month);
			ArrayList<ScoreStudDTO> s = new ScoreStudDAO().getListStudentScore(student_id, month);
			System.out.println(s);
			json= new Gson().toJson(s);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
