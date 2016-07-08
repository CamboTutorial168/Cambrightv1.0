package controller.admin.payment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PaymentDAO;
import model.dto.PaymentSearchListDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class PaymentSearchList
 */
@WebServlet("/PaymentSearchList")
public class PaymentSearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentSearchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			//String emp_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getEmp_id();
			//String branch_id=((UserDTO)(request.getSession().getAttribute("adminsession"))).getBranch_id();
			String search=request.getParameter("search");
			ArrayList<PaymentSearchListDTO> p=new PaymentDAO().getPaymentSearch(search);
				String json=new Gson().toJson(p);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}
