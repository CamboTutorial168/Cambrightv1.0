package controller.admin.teaching;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TeachingDAO;
import model.dto.TeachDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class TeachingList
 */
@WebServlet("/TeachingList")
public class TeachingList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeachingList() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String branch_id=null;
			int user_type=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			if(user_type!=0){
				branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			}
			ArrayList<TeachDTO> t = new TeachingDAO().getListTeaching(branch_id,user_type);
			String json = new Gson().toJson(t);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
			
		}catch(Exception e){e.printStackTrace();}
	}

}
