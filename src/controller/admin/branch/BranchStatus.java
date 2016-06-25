package controller.admin.branch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BranchDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class BranchStatus
 */
@WebServlet("/BranchStatus")
public class BranchStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			String status=request.getParameter("status");
			String branch_id=request.getParameter("branch_id");
			boolean check = false;
			if(user_level==0){
				if(status.equals("t") || status.equals("f")){
					check=new BranchDAO().checkStatus(branch_id,status);
				}
			}
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		}catch(Exception e){e.printStackTrace();} 
	}

}
