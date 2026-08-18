package controllers.doctor;

import java.io.IOException;

import dao.DoctorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Doctor;


@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		
		DoctorDAO dao=new DoctorDAO();
		Doctor doctor=dao.authenticateDoctor(email,password);
		
		if(doctor!=null) {
			//create session for doctor
			HttpSession session = request.getSession(true);
			session.setAttribute("dname", doctor.getFull_name());
			session.setAttribute("specialization", doctor.getSpecialization());
			
			response.sendRedirect("jsp/doctor/DoctorDashboard.jsp");
		}
		else {
			response.sendRedirect("jsp/doctor/DoctorLogin.jsp?error=true");
			
		}
		
	}

}
