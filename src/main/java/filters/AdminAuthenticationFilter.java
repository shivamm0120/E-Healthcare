package filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet Filter implementation class AdminAuthenticationFilter
 */
@WebFilter("/AdminDashboard.jsp")
public class AdminAuthenticationFilter extends HttpFilter implements Filter {
 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		System.out.println("admin filter");

		HttpServletRequest req= (HttpServletRequest) request;
		HttpServletResponse res= (HttpServletResponse) response;
		
		HttpSession session =req.getSession(false);
		
		if(session==null || session.getAttribute("admin")==null) {
			res.sendRedirect("AdminLogin.jsp");
			return;
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}


}
