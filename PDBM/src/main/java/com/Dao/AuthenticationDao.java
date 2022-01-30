package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AuthenticationDao {

	public boolean credentialCheck(String email, String password) {

		try {

			String url = "jdbc:mysql://localhost:3306/netzilla";
			String unameString = "root";
			String pass = "pass";
			String sql = "select * from users where email=? and pass=?";
			Class.forName("com.mysql.jdbc.Driver");

			// creating connection object
			Connection connection = DriverManager.getConnection(url, unameString, pass);
			// creating statement
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

}
