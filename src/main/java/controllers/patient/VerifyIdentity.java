//this servlet prog.is for to check legit user is trying to reset his password
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

@WebServlet("/VerifyIdentity")
public class VerifyIdentity extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String email_id=request.getParameter("email_id");
		String dob=request.getParameter("dob");
		
		//pass to model class -Patient class
		Patient patient =new Patient();
		
		patient.setEmail_id(email_id);
		patient.setDate_of_birth(dob);
		
		//create dao class object and pass patient object to verifyIdentity() method
		PatientDAO dao= new PatientDAO();
		
		Patient p=dao.verifyIdentity(patient);
		
		if(p!=null){//means there is a patient
			
			//created a session so i can use this email attribute also after clicking reset button
			//in ResetPassword.jsp  , we can use email attribute in ResetPassword servlet prog also 
			//Thats why i have created session .If it is request we can't get this attribute in ResetPassword 
			//servlet prog bcz a new request will be generated after clicking to the reset button.
			HttpSession hs= request.getSession(true);
			hs.setAttribute("pname", p.getpName());
			hs.setAttribute("email", p.getEmail_id());
			
			RequestDispatcher rd= request.getRequestDispatcher("ResetPassword.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd= request.getRequestDispatcher("ForgotPassword.jsp");
			request.setAttribute("message","Oops! The email address or date of birth doesn't match our records. "
					+ "Please try again.");
			rd.forward(request, response);
		}
	}

}
