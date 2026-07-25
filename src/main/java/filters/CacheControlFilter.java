package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class CacheControlFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    	
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // Set standard HTTP/1.1 cache control headers
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
        
        // Set HTTP/1.0 legacy header
        httpResponse.setHeader("Pragma", "no-cache"); 
        
        // Set Proxies header
        httpResponse.setDateHeader("Expires", 0); 

        chain.doFilter(request, response);
    }
}