package controllers.patient;

import java.io.IOException;

import dao.PatientDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Patient;


@WebServlet("/patientReg")
public class PatientRegServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String pName= request.getParameter("pname");
		String gender=request.getParameter("gender");
		String date_of_birth=request.getParameter("dob");
		Long mobile_no=Long.parseLong(request.getParameter("mobile_no"));
		String email_id=request.getParameter("email_id");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		
		Patient p= new Patient();
		p.setpName(pName);
		p.setGender(gender);
		p.setDate_of_birth(date_of_birth);
		p.setMobile_no(mobile_no);
		p.setEmail_id(email_id);
		p.setPassword(password);
		p.setAddress(address);
		
		PatientDAO dao= new PatientDAO();
		if(dao.registerPatient(p)) {
			//need to print patient registered successfully
			request.setAttribute("success", "patient registered !, \n Now you can do login");
			RequestDispatcher rd= request.getRequestDispatcher("PatientLogin.jsp");
			rd.forward(request, response);
			
		}
		else {
			//print email has been used by another patient
			request.setAttribute("message", "This email id has been taken");
			RequestDispatcher rd= request.getRequestDispatcher("PatientRegisteration.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
		
		
		
		
	}

}
