package controllers.patient;

import java.io.IOException;

import dao.PatientDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Patient;

/**
 * Servlet implementation class ResetPassword
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password=request.getParameter("password");
		
		//pass to model class
		Patient patient= new Patient();
		patient.setPassword(password);
		
		HttpSession hs= request.getSession(false);
		String email= (String)hs.getAttribute("email");
		
		patient.setEmail_id(email);
		
		PatientDAO dao= new PatientDAO();
		boolean reset=dao.resetPassword(patient);
		
		if(reset) {
			request.setAttribute("success", "Password updated successfully. Please login.");

		   RequestDispatcher rd= request.getRequestDispatcher("PatientLogin.jsp");
		   rd.forward(request, response);

		} else {

		    request.setAttribute("error-msg", "Unable to update password.");

		    RequestDispatcher rd=request.getRequestDispatcher("ResetPassword.jsp");
		    rd.forward(request, response);
		}
		
		
		
	}

}
