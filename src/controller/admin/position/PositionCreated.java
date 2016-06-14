package controller.admin.position;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PositionDAO;
import model.dto.PositionDTO;

/**
 * Servlet implementation class PositionCreated
 */
@WebServlet("/PositionCreated")
public class PositionCreated extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionCreated() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			response.setContentType("text/plain");
			PositionDTO pos=new PositionDTO();
			pos.setPosition(request.getParameter("position"));
			pos.setSalary(Float.parseFloat(request.getParameter("salary")));
			boolean check=new PositionDAO().createPosition(pos);
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
