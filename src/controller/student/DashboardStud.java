package controller.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.DashboardDAO;
import model.dao.student.DashboardStudDAO;
import model.dto.ChartDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/DashboardStud")
public class DashboardStud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardStud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String student_id=((UserDTO)(request.getSession().getAttribute("studentsession"))).getStudent_id();
			
			ArrayList<String> rankabsent =new DashboardStudDAO().getRankNAbsent(student_id);
			String jsonrank=new Gson().toJson(rankabsent.toString().replaceAll("'", "\""));
			
			request.setAttribute("rankAbsent",jsonrank);
			request.setAttribute("schedulePeriod",new DashboardStudDAO().getSchedulePeriod(student_id));
			request.setAttribute("getExpiredDate",new DashboardStudDAO().getExpiredDate(student_id));
			request.setAttribute("getPaymentHis", new DashboardStudDAO().getPaymetHistory(student_id));
		//	request.setAttribute("getdiscourse",					new DashboardDAO().getDiactiveCourse());
			//request.setAttribute("getallnewstu", new DashboardDAO().getAllNewStudent());
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			//ArrayList<ChartDTO> chartCol = new DashboardDAO().getForChartCol();
			/*String json = new Gson().toJson(chartCol);
			request.setAttribute("chartCol", json);
			System.out.println("ChartCol: " + json);*/
			request.getRequestDispatcher("dashboardstud.jsp").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
