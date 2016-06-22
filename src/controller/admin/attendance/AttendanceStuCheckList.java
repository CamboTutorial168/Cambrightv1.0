package controller.admin.attendance;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.AttendanceStuDAO;
import model.dto.AttendantStuDTO;

/**
 * Servlet implementation class AttendanceStuCheckList
 */
@WebServlet(name = "AttendanceStudCheckList", urlPatterns = { "/AttendanceStudCheckList" })
public class AttendanceStuCheckList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceStuCheckList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String month = request.getParameter("date");
			ArrayList<AttendantStuDTO> list = new AttendanceStuDAO().getListStuCheckAttendant(month);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			String json=new Gson().toJson(list);
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
