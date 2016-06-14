package controller.admin.userlevel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserLevelDAO;
import model.dto.UserDTO;
import model.dto.UserLevelDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class UserLevelList
 */
@WebServlet("/UserLevelList")
public class UserLevelList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLevelList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String u_type=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_type();
			ArrayList<UserLevelDTO> List=new UserLevelDAO().getUserLevel(u_type);
			String json=new Gson().toJson(List);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}
