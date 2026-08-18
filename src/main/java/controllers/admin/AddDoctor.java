package controllers.admin;

import java.io.IOException;
import java.security.SecureRandom;

import dao.DoctorDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Doctor;

/**
 * Servlet implementation class AddDoctor
 */
@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String full_name = request.getParameter("dName");
		String specialization=request.getParameter("specialization");
		String email = request.getParameter("email");
		Long phone = Long.parseLong(request.getParameter("phone"));
		
		Doctor doctor= new Doctor();
		doctor.setFull_name(full_name);
		doctor.setEmail(email);
		doctor.setSpecialization(specialization);
		doctor.setPhone(phone);
		String tempPassword=generateTempPassword();
		doctor.setPassword(tempPassword);
		
		DoctorDAO dao= new DoctorDAO();
		boolean isAdded=dao.addDoctor(doctor);
		
		if (isAdded) {
		    request.getSession().setAttribute(
		        "success-msg",
		        "Doctor added successfully"
		    );
		} else {
		    request.getSession().setAttribute(
		        "error-msg",
		        "Something went wrong!"
		    );
		}

		response.sendRedirect(request.getContextPath() + "/FetchDoctor");
	}
	
	String generateTempPassword() {
		SecureRandom random = new SecureRandom();
		StringBuilder password= new StringBuilder();
		
		String chars= "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		for(int i=0;i<8;i++) {
			int index=random.nextInt(chars.length());
			password.append(chars.charAt(index));
		}
		return password.toString();
		
	}

}
