package controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.DoctorDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Doctor;

/**
 * Servlet implementation class FetchDoctors
 */
@WebServlet("/FetchDoctor")
public class FetchDoctors extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<Doctor>doctorList = new ArrayList<>();
		
		DoctorDAO dao= new DoctorDAO();
		doctorList=dao.fetchAllDoctors();
		
		request.setAttribute("doctors",doctorList);
		
		RequestDispatcher rd=request.getRequestDispatcher("jsp/admin/ManageDoctors.jsp");
		rd.forward(request, response);
	}

}
