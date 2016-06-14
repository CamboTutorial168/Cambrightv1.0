package controller.admin.branch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BranchDAO;
import model.dto.BranchDTO;

/**
 * Servlet implementation class BranchUpdate
 */
@WebServlet("/BranchUpdate")
public class BranchUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchUpdate() {
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
			BranchDTO branch=new BranchDTO();
			branch.setBranch_id(request.getParameter("branch_id"));
			branch.setBranch_name(request.getParameter("branch_name"));
			branch.setAddress(request.getParameter("address"));
			branch.setContact(request.getParameter("contact"));
			if(new BranchDAO().updateBranch(branch)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			//NOT YET CONFIG WEB.XML
		}catch(Exception e){e.printStackTrace();}
	}
	

}
