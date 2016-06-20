package controller.admin.subprogram;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.SubProgramDAO;
import model.dto.SubProgramListDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class SubProgramList
 */
@WebServlet("/SubProgramList")
public class SubProgramList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubProgramList() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			
			ArrayList<SubProgramListDTO> list=new SubProgramDAO().listSubProg(branch_id,user_level);
			String json=new Gson().toJson(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}