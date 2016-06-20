package controller.admin.position;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.PositionDAO;
import model.dto.PositionDTO;

import com.google.gson.Gson;

/**
 * Servlet implementation class PositionList
 */
@WebServlet("/PositionList")
public class PositionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionList() {
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
		try {

			ArrayList<PositionDTO> list = new PositionDAO().getPositionList();
			String json = new Gson().toJson(list);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
