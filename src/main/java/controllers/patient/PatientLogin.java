package controllers.patient;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.PatientDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Patient;


@WebServlet("/PatientLogin")
public class PatientLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email_id =request.getParameter("email_id");
		String password= request.getParameter("password");
		
		PatientDAO dao= new PatientDAO();
		Patient patient= dao.patientAuthentication(email_id, password);
		
		if(patient!=null) {
			//create session for patient 
			HttpSession hs= request.getSession(true);
			hs.setAttribute("pname",patient.getpName());
			
			response.sendRedirect("PatientDashboard.jsp");
			
		}
		else {
			response.sendRedirect("PatientLogin.jsp?error=true");
		}
	
	}

}
