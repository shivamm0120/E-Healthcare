package controllers.admin;

import java.io.IOException;

import dao.DoctorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Doctor;

/**
 * Servlet implementation class RemoveDoctor
 */
@WebServlet("/Modify")
public class ModifyDoctor extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action= request.getParameter("action");
		int doctor_id=Integer.parseInt(request.getParameter("id"));
		
		Doctor doctor= new Doctor();
		doctor.setDoctor_id(doctor_id);
		
		DoctorDAO dao=new DoctorDAO();
		
		HttpSession session= request.getSession();
		
		if(action.equals("TOGGLE_STATUS")) {
			String currentStatus= request.getParameter("currentStatus");
			doctor.setStatus(currentStatus);
			
			boolean isUpdated =dao.updateDoctor(doctor);
			
			if(isUpdated)
			session.setAttribute("success-msg","status of the # "+doctor_id+" changed.");
			else {
				session.setAttribute("error-msg","something went wrong in the backend side");
			}
		}
		else {
			boolean isDeleted=dao.deleteDoctorRecord(doctor);
				if(isDeleted)
					session.setAttribute("success-msg","#"+doctor_id+" removed successfully");
				else {
					session.setAttribute("error-msg","something went wrong in the backend side");
				}
		}
		response.sendRedirect(request.getContextPath() + "/FetchDoctor");
	}

}
