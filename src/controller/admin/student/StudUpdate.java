package controller.admin.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentDAO;
import model.dto.ListStudInfoDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class StudUpdate
 */
@WebServlet("/StudUpdate")
public class StudUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String u_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			ListStudInfoDTO s=new ListStudInfoDTO();
			s.setId_card(request.getParameter("id_card"));
			s.setPassword(request.getParameter("password"));
			s.setKh_name(request.getParameter("kh_name"));
			s.setEn_name(request.getParameter("en_name"));
			s.setGender(request.getParameter("gender"));
			s.setDob(request.getParameter("dob"));
			s.setFa_name(request.getParameter("fa_name"));
			s.setMa_name(request.getParameter("ma_name"));
			s.setAddr(request.getParameter("address"));
			s.setPhone(request.getParameter("phone"));
			s.setMod_date("NOW()");
			s.setImg_url(request.getParameter("img_url"));
			s.setMod_by(u_id);
			s.setUser_id(request.getParameter("user_id"));
			//s.setBranch_id(request.getParameter("branch_id"));
			s.setStudent_id(request.getParameter("student_id"));
			response.setContentType("text/plain");
			if(new StudentDAO().updateStudent(s)==true){
				response.getWriter().write("true");
			}else{
				response.getWriter().write("false");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
