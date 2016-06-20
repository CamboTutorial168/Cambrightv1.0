package controller.admin.period;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PeriodDAO;
import model.dto.PeriodDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class PeriodList
 */
@WebServlet("/PeriodList")
public class PeriodList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeriodList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			String teach_id=request.getParameter("teach_id");
			
			//NOT USE PERIOD 
			String period=request.getParameter("period");
			if(period.equals("am") || period.equals("pm")){
				 period=request.getParameter("period");
			}else{
				 period=null;
			}
				ArrayList<PeriodDTO> p=new PeriodDAO().getListPeriod(period, teach_id, branch_id);
				String json=new Gson().toJson(p);
				request.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}
