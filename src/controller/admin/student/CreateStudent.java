package controller.admin.student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentDAO;
import model.dto.StudentDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class CreateStudent
 */
@WebServlet("/CreateStudent")
public class CreateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
				StudentDTO s=new StudentDTO();
				s.setId_card(request.getParameter("id_card"));
				s.setPassword(request.getParameter("password"));
				s.setKh_name(request.getParameter("kh_name"));
				s.setEn_name(request.getParameter("en_name"));
				s.setGender(request.getParameter("gender"));
				s.setDob(request.getParameter("dob"));
				s.setFa_name(request.getParameter("fa_name"));
				s.setMa_name(request.getParameter("ma_name"));
				s.setAddr(request.getParameter("addr"));
				s.setPhone(request.getParameter("phone"));
				s.setReg_date("NOW()");
				s.setImg_url(request.getParameter("img_url"));
				s.setStatus("t");
				s.setEmp_id(emp_id);
				s.setIs_graduate("f");
				s.setUser_id(request.getParameter("user_id"));
				s.setBranch_id(branch_id);
				//tb_studying
				s.setTeach_id(request.getParameter("teach_id"));
				//tb_payment
				s.setFee_type(request.getParameter("fee_type"));
				s.setDiscount(request.getParameter("discount"));
				s.setDate_paid("NOW()");
				s.setSubprog_id(request.getParameter("sub_prog_id"));
				s.setTotal(request.getParameter("total"));
				String period=request.getParameter("period");
				if(period.equals("am") || period.equals("pm")){
					s.setPeriod(period);
				}
				System.out.println(s.getPeriod());
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				if(new StudentDAO().createStud(s)==true){
					response.getWriter().write("true");
				}else{
					response.getWriter().write("false");
				}
		}catch(Exception e){e.printStackTrace();}
	}

}
