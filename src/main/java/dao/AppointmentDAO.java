package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.Appointments;
import util.DBConnection;

public class AppointmentDAO {
	Connection con=DBConnection.getConnection();
	
	public List<Appointments> fetchAllAppointment(){
		List<Appointments>appointments=new ArrayList<>();
		
		try {
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select patientid,doctor_id,appointment_date,"
					+ "appointment_time,status from appointments");
			while(rs.next()) {
				Appointments appointment=new Appointments();
				
				appointment.setPatientid(rs.getInt("patientid"));
				appointment.setDoctor_id(rs.getInt("doctor_id"));
				appointment.setAppointment_date(rs.getDate("appointment_date"));
				appointment.setAppointment_time(rs.getTime("appointment_time"));
				
				appointments.add(appointment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return appointments;
	}

}
