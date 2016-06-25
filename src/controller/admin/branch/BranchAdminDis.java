package controller.admin.branch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.UserDTO;

/**
 * Servlet implementation class BranchAdmin
 */
@WebServlet("/BranchAdmin")
public class BranchAdminDis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchAdminDis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doCmd(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doCmd(request, response);
	}
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			if(user_level==0)
				request.getRequestDispatcher("branchmgnt.jsp").forward(request, response);
		}catch(Exception e){e.printStackTrace();}
	}

}
