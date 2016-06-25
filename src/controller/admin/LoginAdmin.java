package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.LoginAdminDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://192.168.43.92/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String email=request.getParameter("admin_email").trim();
			String pwd=request.getParameter("admin_password");
			UserDTO admin=new LoginAdminDAO().login(email, pwd);
			System.out.println(request.getRemoteAddr());
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			if(admin!=null){
				HttpSession session=request.getSession();
				session.removeAttribute("studentsession");
				session.setAttribute("emp_id", admin.getEmp_id());
				session.setAttribute("english_name", admin.getEng_name());
				session.setAttribute("image_url", admin.getImg_url());
				session.setAttribute("adminsession", admin);
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
