package controller.admin.promote;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.PromoteStuDAO;
import model.dto.PromotionListDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class PromoteList
 */
@WebServlet(description = "Search find specific ID or name of history student that studied", urlPatterns = { "/PromoteList" })
public class PromoteList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromoteList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			//String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			String search=request.getParameter("search");
				ArrayList<PromotionListDTO> p=new PromoteStuDAO().getListPromote(search);
				String json=new Gson().toJson(p);
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				
				response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}
