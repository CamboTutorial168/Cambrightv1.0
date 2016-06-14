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

		//	request.setAttribute("getactivestud",					new DashboardDAO().getActiveStudent());
		//	request.setAttribute("getactiveemp",					new DashboardDAO().getActiveEmployees());
			//request.setAttribute("getabsentemp",	new DashboardDAO().getAbsentEmp());
		//	request.setAttribute("getdiscourse",					new DashboardDAO().getDiactiveCourse());
			//request.setAttribute("getallnewstu", new DashboardDAO().getAllNewStudent());
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			ArrayList<ChartDTO> chartCol = new DashboardDAO().getForChartCol();
			String json = new Gson().toJson(chartCol);
			request.setAttribute("chartCol", json);
			System.out.println("ChartCol: " + json);
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
