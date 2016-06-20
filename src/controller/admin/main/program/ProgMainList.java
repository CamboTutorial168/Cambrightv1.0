package controller.admin.main.program;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProgramDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class ProgMainList
 */
@WebServlet("/ProgMainList")
public class ProgMainList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgMainList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			ArrayList<String> list=new ProgramDAO().getListMain(branch_id,user_level);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(list.toString().replaceAll("'", "\""));
		}catch(Exception e){e.printStackTrace();}
	}

}
