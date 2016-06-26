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
import model.dto.NewStudentsDTO;
import model.dto.StudentRemainExpireDTO;
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
			String branch_id=null;
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			if(user_level==2 || user_level==3){
				branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			}
			//FOR ADMIN
			if(user_level==0 || user_level==2){
				System.out.println(user_level);
				request.setAttribute("getactivestud",new DashboardDAO().getActiveStudent(branch_id,user_level));
				request.setAttribute("getactiveemp",new DashboardDAO().getActiveEmployees(branch_id,user_level));
				request.setAttribute("getabsentemp",new DashboardDAO().getAbsentEmp(branch_id,user_level));
				request.setAttribute("getclassAval",new DashboardDAO().getClassRoomAvaliable(branch_id,user_level));
				ArrayList<ChartDTO> chartCol = new DashboardDAO().getForChartCol(branch_id,user_level);
				ArrayList<StudentRemainExpireDTO> expiredStud = new DashboardDAO().getNearlyExpired(branch_id,user_level);
				ArrayList<NewStudentsDTO> newStud= new DashboardDAO().getAllNewStudent(branch_id,user_level);
				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				String jsonChat = new Gson().toJson(chartCol);
				String jsonExp=new Gson().toJson(expiredStud);
				String jsonNewStud=new Gson().toJson(newStud);
				request.setAttribute("chartCol", jsonChat);
				request.setAttribute("expriedStudent", jsonExp);
				request.setAttribute("getallnewstu", jsonNewStud);
				if(user_level==0){
					request.setAttribute("chartLine",new DashboardDAO().getForChatLine().toString().replaceAll("\"", ""));
				}
				
			}else{ 
				//FORTEACHER
				request.setAttribute("getClassNStudent",new DashboardDAO().getClassRoom(branch_id, user_level, emp_id).toString().replaceAll("'", "\""));
				request.setAttribute("getNumAbsent",new DashboardDAO().getNumAbsent(branch_id, user_level, emp_id));
				request.setAttribute("getLevelTeach",new DashboardDAO().getLevelTeach(branch_id, user_level, emp_id));
				request.setAttribute("getMyStudentListAbsent",new DashboardDAO().getMyStudentListAbsent(emp_id));
				
			}
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
