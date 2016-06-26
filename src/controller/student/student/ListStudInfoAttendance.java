package controller.student.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.student.StudentDAO;
import model.dto.ListStudInfoDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListStudInfoAttendance
 */
@WebServlet("/ListStudInfoAttendance")
public class ListStudInfoAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListStudInfoAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String student_id=((UserDTO)(request.getSession().getAttribute("studentsession"))).getStudent_id();
			ArrayList<ListStudInfoDTO> list = new StudentDAO().listStudInfo(student_id);
			String json = new Gson().toJson(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
			
		}catch(Exception e){e.printStackTrace();}
	}

}
