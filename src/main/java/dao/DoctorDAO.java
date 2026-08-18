package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.Doctor;
import util.DBConnection;

public class DoctorDAO {
	Connection con = DBConnection.getConnection();

	// authenticating doctor for login
	public Doctor authenticateDoctor(String email, String password) {
		Doctor doctor = null;
		try {

			String query = "select * from doctors where email=? and password=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				doctor = new Doctor();
				doctor.setFull_name(rs.getString("full_name"));
				doctor.setSpecialization(rs.getString("specialization"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return doctor;
	}
//fetch all the doctors available
	public List<Doctor> fetchAllDoctors() {
		List<Doctor> doctorList = new ArrayList<>();

		try {
			String query = "select * from doctors order by doctor_id";
			Statement sql = con.createStatement();
			ResultSet resultset = sql.executeQuery(query);

			while (resultset.next()) {
				Doctor doctor = new Doctor();
				doctor.setDoctor_id(resultset.getInt("doctor_id"));
				doctor.setFull_name(resultset.getString("full_name"));
				doctor.setPhone(resultset.getLong("phone"));
				doctor.setEmail(resultset.getString("email"));
				System.out.println(resultset.getString("email"));
				doctor.setExperience(resultset.getInt("experience"));
				doctor.setQualification(resultset.getString("qualification"));
				doctor.setSpecialization(resultset.getString("specialization"));
				doctor.setStatus(resultset.getString("status"));
				
				//add into list
				doctorList.add(doctor);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return doctorList;

	}
	
	public boolean addDoctor(Doctor doctor) {
		boolean isAdded=true;
		
		String full_name=doctor.getFull_name();
		String email=doctor.getEmail();
		String specialization=doctor.getSpecialization();
		Long phone =doctor.getPhone();
		String password=doctor.getPassword();
		
		try {
			String sql="insert into doctors(full_name,phone,email,password,specialization) values(?,?,?,?,?)";
			PreparedStatement pstmt= con.prepareStatement(sql);
			pstmt.setString(1, full_name);
			pstmt.setLong(2,phone);
			pstmt.setString(3,email);
			pstmt.setString(4,password);
			pstmt.setString(5,specialization);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			isAdded=false;
			e.printStackTrace();
		}
		return isAdded;
	}
	public boolean updateDoctor(Doctor doctor) {
		int id=doctor.getDoctor_id();
		boolean modified=true;
		String status=doctor.getStatus();
		
		String query="update doctors set status=? where doctor_id=? ";
		
		try {
			PreparedStatement pstmt= con.prepareStatement(query);
			pstmt.setString(1, status.equals("active")?"inactive":"active");
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			modified=false;
		}
		return modified;
	}
	public boolean deleteDoctorRecord(Doctor doctor) {
		int id=doctor.getDoctor_id();
		boolean isDeleted =true;
		
		String query="delete from doctors where doctor_id=?";
		
		try {
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			isDeleted=false;
		}
		return isDeleted;
	}
	

}
