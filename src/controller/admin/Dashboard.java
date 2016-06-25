package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.DashboardDAO;
import model.dto.ChartDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			request.setAttribute("getactivestud",new DashboardDAO().getActiveStudent(branch_id,user_level));
			request.setAttribute("getactiveemp",new DashboardDAO().getActiveEmployees(branch_id,user_level));
			request.setAttribute("getabsentemp",new DashboardDAO().getAbsentEmp(branch_id,user_level));
		//	request.setAttribute("getdiscourse",					new DashboardDAO().getDiactiveCourse());
			//request.setAttribute("getallnewstu", new DashboardDAO().getAllNewStudent());
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			ArrayList<ChartDTO> chartCol = new DashboardDAO().getForChartCol(branch_id);
			String json = new Gson().toJson(chartCol);
			request.setAttribute("chartCol", json);
			request.getRequestDispatcher("dashboard.jsp").forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
