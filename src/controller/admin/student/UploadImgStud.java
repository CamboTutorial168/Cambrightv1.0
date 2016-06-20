package controller.admin.student;

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
 * Servlet implementation class UploadImgStud
 */
@WebServlet("/UploadImgStud")
public class UploadImgStud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImgStud() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			SecureRandom random = new SecureRandom();
			final String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/admin/cpanel/img/stud/");
			System.out.println(UPLOAD_DIRECTORY);
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

			String imgname = null;
			for (FileItem item : multiparts) {
				if (!item.isFormField()) {

					String name = new BigInteger(80, random).toString(10);
					String ext = FilenameUtils.getExtension(new File(item.getName()).getName());
					imgname = "IMG_STUD_" + name + "." + ext;
					item.write(new File(UPLOAD_DIRECTORY + File.separator+ imgname));

				}
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(imgname);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
