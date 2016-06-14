package controller.admin.branch;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BranchDAO;
import model.dto.BranchDTO;
import model.dto.UserDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class BranchListActiveOnly
 */
@WebServlet("/BranchListActiveOnly")
public class BranchListActiveOnly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchListActiveOnly() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			
			int user_level=((UserDTO)(request.getSession().getAttribute("adminsession"))).getUser_level();
			ArrayList<BranchDTO> branchList = new BranchDAO().getBranchListActiveOnly(branch_id,user_level);
			String json = new Gson().toJson(branchList);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
