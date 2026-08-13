package controllers.admin;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Admin;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password= request.getParameter("password");
		
		AdminDAO dao= new AdminDAO();
		Admin admin=dao.adminAuthentication(email, password);
		
		if(admin!=null) {
			HttpSession session =request.getSession();
			session.setAttribute("admin", admin);
			
			System.out.println(admin.getFullName());
			
			response.sendRedirect("AdminDashboard.jsp");
			
		}
		else {
			System.out.println("admin not found");
			
			response.sendRedirect("AdminLogin.jsp?error=true");
		}
		
		
		
		
		
		
		
		
		
		
	}

}
