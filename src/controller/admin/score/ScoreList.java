package controller.admin.score;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.ScoreDAO;
import model.dto.ScoreDTO;

/**
 * Servlet implementation class ScoreList
 */
@WebServlet("/ScoreList")
public class ScoreList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String month=request.getParameter("month");
			ArrayList<ScoreDTO> list=new ScoreDAO().getListStuScore(month);
			response.setContentType("application/json");
			String json=new Gson().toJson(list);
			response.getWriter().write(json);
		}catch(Exception e){e.printStackTrace();}
	}

}
