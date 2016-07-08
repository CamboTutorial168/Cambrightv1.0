package controller.admin.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.EmployeeDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class EmpCreate
 */
@WebServlet("/EmpCreate")
public class EmpCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			UserDTO u=new UserDTO();
			u.setId_card(request.getParameter("id_card"));
			u.setKh_name(request.getParameter("kh_name"));
			u.setEng_name(request.getParameter("en_name"));
			u.setGender(request.getParameter("gender"));
			u.setDob(request.getParameter("dob"));
			u.setNationality(request.getParameter("nationality"));
			u.setNational_id(request.getParameter("national_id"));
			u.setPhone(request.getParameter("phone"));
			u.setPos_id(request.getParameter("pos_id"));
			u.setUser_id(request.getParameter("user_id"));
			u.setEmail(request.getParameter("email").toLowerCase());
			u.setPwd(request.getParameter("password"));
			u.setImg_url(request.getParameter("img_url"));
			u.setBranch_id(request.getParameter("branch_id"));
			u.setConfirm(null);
			u.setStatus("t");
			u.setMod_date(null);
			u.setHire_date("NOW()");
			boolean check=new EmployeeDAO().createEmp(u);
			response.setContentType("text/plain");
			if(check==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}

		}catch(Exception e){e.printStackTrace();}
	}

}
