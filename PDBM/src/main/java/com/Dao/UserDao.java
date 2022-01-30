package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Users;

public class UserDao {

	/**
	 * 
	 */

	private String url = "jdbc:mysql://localhost:3306/netzilla?useSSL=false";
	private String unameString = "root";
	private String pass = "pass";
	private String driver = "com.mysql.cj.jdbc.Driver";

	private static final String INSERT_USER_TO_DB = "insert into users"
			+ " (user_id,email,firstName,lastName,phoneNumber,password,access) VALUES" + "(?,?,?,?,?,?,?);";

	private static final String SELECT_ALL_USER_STRING = "select * from users";
	private static final String SELECT_USER_BY_ID_STRING = "select user_id,firstName, lastName,phoneNumber,email,password,access from users where user_id=?;";
	private static final String DELETE_USER_STRING = "delete from users where user_id=?";
	private static final String UPDATE_USER_STRING = "update users set user_id=?,email=?,firstName=?,lastName=?,phoneNumber=?,password=?,access=? where user_id=?;";
	private static final String UPDATE_USER_PASSWORD = "update users set password=? where user_id=?;";

	public UserDao() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(driver);

			// creating connection object
			connection = DriverManager.getConnection(url, unameString, pass);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return connection;
	}

//	Method to add patient
	public void addUser(Users user) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_TO_DB)) {
			preparedStatement.setInt(1, user.getUser_id());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getFirstName());
			preparedStatement.setString(4, user.getLastName());
			preparedStatement.setString(5, user.getPhoneNumber());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setString(7, user.getAccess());

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

//	Method to select by ID
	public Users selectUser(int user_id) {
		Users user = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID_STRING)) {
			preparedStatement.setInt(1, user_id);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				System.out.println("here");
				int id = rs.getInt("user_id");
				String email = rs.getString("email");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String phoneNumber = rs.getString("phoneNumber");
				String password = rs.getString("password");
				String access = rs.getString("access");
				user = new Users(id, email, firstName, lastName, phoneNumber, password, access);

			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("database issues");
		}
		return user;
	}

//	Method to select all patients
	public List<Users> selectAllUsers() {
		List<Users> allUsers = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER_STRING)) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String email = rs.getString("email");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String phoneNumber = rs.getString("phoneNumber");
				String password = rs.getString("password");
				String access = rs.getString("access");

				allUsers.add(new Users(id, email, firstName, lastName, phoneNumber, password, access));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allUsers;
	}

	// updating our patient info
	public boolean updateUserInfo(Users user) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();

				PreparedStatement statement = connection.prepareStatement(UPDATE_USER_STRING);) {
			statement.setInt(1, user.getUser_id());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getFirstName());
			statement.setString(4, user.getLastName());
			statement.setString(5, user.getPhoneNumber());
			statement.setString(6, user.getPassword());
			statement.setString(7, user.getAccess());
			statement.setInt(8, user.getUser_id());
			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

//updating user password
	public boolean updatePassword(String pass, int id) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USER_PASSWORD);) {
			statement.setString(1, pass);
			statement.setInt(2, id);
			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

	// deleting a patient
	public boolean deleteUser(int id) throws SQLException {
		boolean deleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USER_STRING);) {
			statement.setInt(1, id);
			deleted = statement.executeUpdate() > 0;

		}
		return deleted;
	}
}
