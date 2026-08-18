package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.Patient;
import util.DBConnection;

public class PatientDAO {
	Connection con=DBConnection.getConnection();
	
	public boolean registerPatient(Patient p) {
		int patientId 		 = p.getPatientId();
		String pName         = p.getpName();
		String gender        = p.getGender();
		String date_of_birth = p.getDate_of_birth();
		Long mobile_no       = p.getMobile_no();
		String email_id 	 = p.getEmail_id();
		String password 	 = p.getPassword();
		String address 	 	 = p.getAddress();
		
		String query="insert into patients(pname,gender,date_of_birth,mobile_no,"
				+ "email_id,password,address)values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt= con.prepareStatement(query);
			pstmt.setString(1, pName);
			pstmt.setString(2, gender);
			pstmt.setString(3, date_of_birth);
			pstmt.setLong  (4, mobile_no);
			pstmt.setString(5, email_id);
			pstmt.setString(6, password);
			pstmt.setString(7, address);
			
			int rows=pstmt.executeUpdate();
			return rows>0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	public Patient patientAuthentication (String email,String password) {
		Patient patient = null;
		try {
			PreparedStatement pstmt= con.prepareStatement("select patientid , pname from patients "
					+ "where email_id=? and password =?");
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()) {
				patient=new Patient();
				patient.setPatientId(rs.getInt("patientid"));
				patient.setpName(rs.getString("pname"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return patient;
	}
	
	//verify identity for password reset 
	public Patient verifyIdentity(Patient patient) {
		String email_id=patient.getEmail_id();
		String dob=patient.getDate_of_birth();
		
		String query= "select pname from patients where email_id =? and date_of_birth=?";
		
			try {
				PreparedStatement pstmt= con.prepareStatement(query);
				pstmt.setString(1, email_id);
				pstmt.setString(2, dob);
				
				ResultSet rs=pstmt.executeQuery();
				
				//patient with given email and dob exists in the database
				if(rs.next()) {
					Patient p = new Patient();
					p.setpName(rs.getString(1));
					p.setEmail_id(email_id);
					return p;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;//when there is no patient
	}

	public boolean resetPassword(Patient patient) {
		String email_id=patient.getEmail_id();
		String newPassword=patient.getPassword();
		
		String query="UPDATE patients SET password = ? WHERE email_id = ?";
		
			try {
				PreparedStatement pstmt= con.prepareStatement(query);
				pstmt.setString(1, newPassword);
				pstmt.setString(2, email_id);
				
				int rows=pstmt.executeUpdate();
				if(rows>0)return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
				
		return false;
		
	}
	public List<Patient> fetchAllPatients() {
		List<Patient>patients=new ArrayList<>();
		
		try {
			Statement stmt= con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from patients order by patientid");
			
			while(rs.next()) {
				Patient patient= new Patient();
				patient.setPatientId(rs.getInt("patientid"));
				patient.setpName(rs.getString("pname"));
				patient.setGender(rs.getString("gender"));
				patient.setDate_of_birth(rs.getString("date_of_birth"));
				patient.setEmail_id(rs.getString("email_id"));
				patient.setMobile_no(rs.getLong("mobile_no"));
				
				patients.add(patient);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return patients ;
	}
	

}
