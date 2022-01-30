package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Staff;

public class staffDao {

	/**
	 * 
	 */

	private String url = "jdbc:mysql://localhost:3306/netzilla?useSSL=false";
	private String unameString = "root";
	private String pass = "pass";
	private String driver = "com.mysql.jdbc.Driver";

	private static final String INSERT_STAFF_TO_DB = "insert into staff"
			+ " (staff_id,firstName,lastName,phoneNumber,email,password VALUES" + "(?,?,?,?,?,?);";

	private static final String SELECT_ALL_STAFF_STRING = "select * from staff";
	private static final String SELECT_STAFF_BY_ID_STRING = "select id,firstName,lastName,phoneNumber,email,password from staff where id=?";
	private static final String DELETE_STAFF_STRING = "delete from staff where id=?";
	private static final String UPDATE_STAFF_STRING = "update staff set firstName=?,lastName=?,email=?,password=? where id=?;";

	public staffDao() {
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
	public void addstaff(Staff staff) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFF_TO_DB)) {
			preparedStatement.setLong(1, staff.getId());
			preparedStatement.setString(2, staff.getFirstName());
			preparedStatement.setString(3, staff.getLastName());
			preparedStatement.setString(4, staff.getPhoneNumber());
			preparedStatement.setString(5, staff.getEmail());
			preparedStatement.setString(6, staff.getPassword());

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

//	Method to select by ID
	public Staff selectstaff(int staffId) {
		Staff staff = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID_STRING)) {
			preparedStatement.setInt(1, staffId);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
				String password = rs.getString("password");
				staff = new Staff(id, firstName, lastName, phoneNumber, email, password);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("database issues");
		}
		return staff;
	}

//	Method to select all patients
	public List<Staff> selectAllStaff() {
		List<Staff> allStaff = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF_STRING)) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
				String password = rs.getString("password");

				allStaff.add(
						new Staff(id, firstName, lastName, phoneNumber, email, password));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return allStaff;
	}

	// updating our patient info
	public boolean updatestaffInfo(Staff staff) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_STAFF_STRING);) {
			statement.setString(1, staff.getFirstName());
			statement.setString(2, staff.getLastName());
			statement.setString(3, staff.getEmail());
			statement.setString(3, staff.getPassword());
			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

	// deleting a patient
	public boolean deletestaff(int id) throws SQLException {
		boolean deleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_STAFF_STRING);) {
			statement.setInt(1, id);
			deleted = statement.executeUpdate() > 0;

		}
		return deleted;
	}
}
