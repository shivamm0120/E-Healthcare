package controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.DoctorDAO;
import dao.PatientDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Patient;

/**
 * Servlet implementation class FetchDoctor
 */
@WebServlet("/FetchPatient")
public class FetchPatients extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<Patient>patientList = new ArrayList<>();
		
		PatientDAO dao= new PatientDAO();
		patientList=dao.fetchAllPatients();
		
		request.setAttribute("doctors",patientList);
		
		System.out.println("fetch doctor");
		
		request.setAttribute("patients", patientList);
		RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/ManagePatients.jsp");
		rd.forward(request, response);
	}

}
