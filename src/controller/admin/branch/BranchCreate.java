package controller.admin.branch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BranchDAO;
import model.dto.BranchDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class Branch
 */
@WebServlet("/Branch")
public class BranchCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchCreate() {
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
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			BranchDTO branch=new BranchDTO(
					request.getParameter("branch_name"),
					request.getParameter("address"),
					request.getParameter("contact"),
					"t",
					request.getParameter("color")
					);
			response.setContentType("text/plain");
			
			
			if(user_level==0){
				if(new BranchDAO().createBranch(branch)==true){
					response.getWriter().write("true");
				}else{
					response.getWriter().write("false");
				}
			}
			
		}catch(Exception e){e.printStackTrace();}
	}
	

}
