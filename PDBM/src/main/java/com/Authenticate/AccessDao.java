package com.Authenticate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccessDao {

	public int accessCheck(String email, String password) {

		try {

			String url = "jdbc:mysql://localhost:3306/netzilla?useSSL=false";
			String unameString = "root";
			String pass = "pass";
			String access = "select user_id from users where email=? and password=?";
			Class.forName("com.mysql.jdbc.Driver");

			// creating connection object
			Connection connection = DriverManager.getConnection(url, unameString, pass);
			// creating statement
			PreparedStatement statement = connection.prepareStatement(access);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("user_id");
				return id;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 404;
	}

}
