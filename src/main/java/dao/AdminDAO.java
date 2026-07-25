package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Admin;
import util.DBConnection;

public class AdminDAO {
	Connection con= DBConnection.getConnection();
	
	public Admin adminAuthentication(String email ,String password) {
		Admin admin=null;
		
		try {
			PreparedStatement pstmt= con.prepareStatement("select admin_id ,full_name from admins where "
					+ "email=? and password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				admin= new Admin();
				admin.setAdminId(rs.getString("admin_id"));
				admin.setFullName(rs.getString("full_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
}
