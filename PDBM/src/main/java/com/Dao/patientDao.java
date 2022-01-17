package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Patient;

public class patientDao {

	/**
	 * 
	 */

	private String url = "jdbc:mysql://localhost:3306/netzilla?useSSL=false";
	private String unameString = "root";
	private String pass = "pass";
	private String driver = "com.mysql.jdbc.Driver";

	private static final String INSERT_PATIENT_TO_DB = "insert into patients"
			+ " (firstName,lastName ,phoneNumber,dob,address,address2,country,state,zip VALUES"
			+ "(?,?,?,?,?,?,?,?,?);";

	private static final String SELECT_ALL_PATIENT_STRING = "select * from patients";
	private static final String SELECT_PATIENT_BY_ID_STRING = "select id,firstName,lastName,phoneNumber,country,dob from patients where id=?";
	private static final String DELETE_PATIENT_STRING = "delete from patients where id=?";
	private static final String UPDATE_PATIENT_STRING = "update patients set firstName=?,lastName=?,address=?,phoneNumber=? where id=?;";

	public patientDao() {
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
	public void addPatient(Patient patient) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PATIENT_TO_DB)) {
			preparedStatement.setString(1, patient.getFirstName());
			preparedStatement.setString(2, patient.getLastName());
			preparedStatement.setString(3, patient.getPhoneNumber());
			preparedStatement.setString(4, patient.getDob());
			preparedStatement.setString(5, patient.getAddress());
			preparedStatement.setString(6, patient.getAddress2());
			preparedStatement.setString(7, patient.getCountry());
			preparedStatement.setString(8, patient.getState());
			preparedStatement.setString(9, patient.getZip());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

//	Method to select by ID
	public Patient selectPatient(int patientId) {
		Patient patient = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PATIENT_BY_ID_STRING)) {
			preparedStatement.setInt(1, patientId);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String phoneNumber = rs.getString("phoneNumber");
				String country = rs.getString("country");
				String address = rs.getString("address");
				String address2 = rs.getString("address2");
				String dob = rs.getString("dob");
				String state = rs.getString("state");
				String zip = rs.getString("zip");
				patient = new Patient(firstName, lastName, phoneNumber, dob, address, address2, country, state, zip,
						id);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("database issues");
		}
		return patient;
	}

//	Method to select all patients
	public List<Patient> selectAllPatients() {
		List<Patient> patients = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PATIENT_STRING)) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String phoneNumber = rs.getString("phoneNumber");
				String country = rs.getString("country");
				String address = rs.getString("address");
				String address2 = rs.getString("address2");
				String dob = rs.getString("dob");
				String state = rs.getString("state");
				String zip = rs.getString("zip");
				patients.add(
						new Patient(firstName, lastName, phoneNumber, dob, address, address2, country, state, zip, id));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return patients;
	}

	// updating our patient info
	public boolean updatePatientInfo(Patient patient) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_PATIENT_STRING);) {
			statement.setString(1, patient.getFirstName());
			statement.setString(2, patient.getLastName());
			statement.setString(3, patient.getAddress());
			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

	// deleting a patient
	public boolean deletePatient(int id) throws SQLException {
		boolean deleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PATIENT_STRING);) {
			statement.setInt(1, id);
			deleted = statement.executeUpdate() > 0;

		}
		return deleted;
	}
}
