package controller.student;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/StudentFilter")
public class StudentFilter implements Filter {

    /**
     * Default constructor. 
     */
    public StudentFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try{
		
			((HttpServletResponse) response).setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
			((HttpServletResponse) response).setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
			((HttpServletResponse) response).setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
			((HttpServletResponse) response).setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
			
			HttpSession session= ((HttpServletRequest)request).getSession();
			if(session.getAttribute("studentsession")!=null){
				chain.doFilter(request, response);
			}else{
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/");
			}
		
		}catch(Exception e){e.printStackTrace();}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
