package controller.admin.subprogram;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubProgramDAO;
import model.dto.SubProgramListDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class SubProgramListBranch
 */
@WebServlet("/SubProgramListBranch")
public class SubProgramListBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubProgramListBranch() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * For someone in specific branch
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			branch_id =request.getParameter("branch_id");
			ArrayList<SubProgramListDTO> list=new SubProgramDAO().listSubProgBranch(branch_id,user_level);
			String json=new Gson().toJson(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}
