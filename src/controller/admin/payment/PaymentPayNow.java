package controller.admin.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PaymentDAO;
import model.dto.StudentDTO;
import model.dto.UserDTO;

/**
 * Servlet implementation class PaymentPayNow
 */
@WebServlet("/PaymentPayNow")
public class PaymentPayNow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentPayNow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			//String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
				StudentDTO s=new StudentDTO();
				s.setStudent_id(request.getParameter("student_id"));
				//tb_payment
				s.setFee_type(request.getParameter("fee_type"));
				s.setDiscount(request.getParameter("discount"));
				s.setDate_paid("NOW()");
				s.setSubprog_id(request.getParameter("sub_prog_id"));
				s.setTotal(request.getParameter("total"));
				s.setEmp_id(emp_id);
				
				s.setTeach_id(request.getParameter("teach_id"));
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				if(new PaymentDAO().payNow(s)==true){
					response.getWriter().write("true");
				}else{
					response.getWriter().write("false");
				}
		}catch(Exception e){e.printStackTrace();}
	}

}
