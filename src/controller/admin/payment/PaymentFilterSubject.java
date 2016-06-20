package controller.admin.payment;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PaymentDAO;
import model.dto.PaymentFilterDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class PaymentFilterClass
 */
@WebServlet("/PaymentFilterSubject")
public class PaymentFilterSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentFilterSubject() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String student_id=request.getParameter("student_id");
			ArrayList<PaymentFilterDTO> list = new PaymentDAO().getSubject(student_id);
			String json = new Gson().toJson(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
