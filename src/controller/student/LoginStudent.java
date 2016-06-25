package controller.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.student.LoginStudentDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/LoginStudent")
public class LoginStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String email=request.getParameter("st_email").trim();
			String pwd=request.getParameter("st_password");
			UserDTO st=new LoginStudentDAO().login(email, pwd);
			System.out.println(request.getRemoteAddr());
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			if(st!=null){
				HttpSession session=request.getSession();
				session.removeAttribute("adminsession");
				
				session.setAttribute("st_id", st.getStudent_id());
				session.setAttribute("st_name", st.getEng_name());
				session.setAttribute("st_image_url", st.getImg_url());
				
				session.setAttribute("studentsession", st);
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
