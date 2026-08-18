package models;

import java.sql.Date;
import java.sql.Time;

public class Appointments {
	private int appointment_id;
	private int patientid;
	private int doctor_id;
	private Date appointment_date;
	private Time appointment_time;
	private String reason;
	private String status;
	private Date booked_at;
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	public int getPatientid() {
		return patientid;
	}
	public void setPatientid(int patientid) {
		this.patientid = patientid;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public Date getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(Date appointment_date) {
		this.appointment_date = appointment_date;
	}
	public Time getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(Time appointment_time) {
		this.appointment_time = appointment_time;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getBooked_at() {
		return booked_at;
	}
	public void setBooked_at(Date booked_at) {
		this.booked_at = booked_at;
	}
	
	

}
