package controllers.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.AppointmentDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Appointments;


@WebServlet("/FetchAppointment")
public class FetchAppointments extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		List<Appointments>appointmentList = new ArrayList<>();
		
		AppointmentDAO dao= new AppointmentDAO();
		appointmentList=dao.fetchAllAppointment();
		
		request.setAttribute("appointments",appointmentList);
		
		RequestDispatcher rd =
		        request.getRequestDispatcher("/jsp/admin/ManageAppointments.jsp");
		rd.forward(request, response);
	}

}
