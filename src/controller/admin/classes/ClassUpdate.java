package controller.admin.classes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ClassesDAO;
import model.dto.ClassDTO;

/**
 * Servlet implementation class ClassUpdate
 */
@WebServlet("/ClassUpdate")
public class ClassUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassUpdate() {
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
		try{
			ClassDTO clas=new ClassDTO();
			clas.setClass_id(request.getParameter("class_id"));
			clas.setClass_title(request.getParameter("class_title"));
			clas.setClass_color(request.getParameter("class_color"));
			clas.setSub_prog_id(request.getParameter("sub_prog_id"));
			if(new ClassesDAO().updateClass(clas)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}
	

}
