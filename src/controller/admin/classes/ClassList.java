package controller.admin.classes;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ClassesDAO;
import model.dto.ClassDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ClassList
 */
@WebServlet("/ClassList")
public class ClassList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			String branch_id=null;
			
			if(user_level!=0){
				 branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			}
			
			if(user_level<4){	
				ArrayList<ClassDTO> clas = new ClassesDAO().listClass(branch_id,user_level);
				String json = new Gson().toJson(clas);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().write(json);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
