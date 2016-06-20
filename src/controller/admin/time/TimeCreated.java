package controller.admin.time;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TimeDAO;
import model.dto.TimeDTO;

/**
 * Servlet implementation class TimeCreated
 */
@WebServlet("/TimeCreated")
public class TimeCreated extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeCreated() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			TimeDTO t=new TimeDTO();
			t.setAmstart(request.getParameter("amstart"));
			t.setAmend(request.getParameter("amend"));
			t.setPmstart(request.getParameter("pmstart"));
			t.setPmend(request.getParameter("pmend"));
			t.setClass_id(request.getParameter("class_id"));
			t.setSubprog_id(request.getParameter("subprog_id"));
			response.setContentType("text/plain");
			if(new TimeDAO().createTime(t)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
