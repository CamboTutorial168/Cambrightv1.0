package controller.admin.emp;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;


/**
 * Servlet implementation class UploadImgEmp
 */
@WebServlet("/UploadImgEmp")
public class UploadImgEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImgEmp() {
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
		try{
			
			SecureRandom random = new SecureRandom();
			final String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/admin/cpanel/img/emp/");
			System.out.println(UPLOAD_DIRECTORY);
	        List<FileItem> multiparts = new ServletFileUpload(
	                                 new DiskFileItemFactory()).parseRequest(request);
	        
	        String imgname=null;
	        for(FileItem item : multiparts){
	            if(!item.isFormField()){
	            	
	        		String name=new BigInteger(80, random).toString(10);
	    	        String ext= FilenameUtils.getExtension(new File(item.getName()).getName());
	                imgname="IMG_EMP_"+name+"."+ext;
	                item.write( new File(UPLOAD_DIRECTORY + File.separator + imgname));
	                
	            }
	        }
	        response.setContentType("text/plain");
	        response.setCharacterEncoding("utf-8");
	        response.getWriter().write(imgname);
			
		}catch(Exception e){e.printStackTrace();
			response.setContentType("text/plain");
	        response.setCharacterEncoding("utf-8");
	        response.getWriter().write("false");
		}
	}
	
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
	}
	
	

}
