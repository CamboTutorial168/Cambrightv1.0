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
 * Servlet implementation class PositionUpdate
 */
@WebServlet("/PositionUpdate")
public class PositionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionUpdate() {
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
		try{
			PositionDTO pos= new PositionDTO();
			pos.setPosition_id(request.getParameter("pos_id"));
			pos.setPosition(request.getParameter("position"));
			pos.setSalary(Float.parseFloat(request.getParameter("salary")));
			boolean check=new PositionDAO().updatePosition(pos);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
			
		}catch(Exception e){e.printStackTrace();}
	}
	
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
