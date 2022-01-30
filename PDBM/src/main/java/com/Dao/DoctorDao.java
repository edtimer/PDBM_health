package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Doctor;
import com.Model.Patient;
import com.Model.Report;

public class DoctorDao {

	/**
	 * 
	 */

	private String url = "jdbc:mysql://localhost:3306/netzilla?useSSL=false";
	private String unameString = "root";
	private String pass = "pass";
	private String driver = "com.mysql.jdbc.Driver";

	private static final String INSERT_Doctor_TO_DB = "insert into doctors"
			+ " (firstName,lastName ,phoneNumber,dob,address,address2,country,state,zip VALUES"
			+ "(?,?,?,?,?,?,?,?,?);";
	private static final String INSERT_REPORT_TO_DB = "insert into report"
			+ " (diagnosis, allergy,prescribedmeds,patientId) VALUES" + "(?,?,?,?);";
	private static final String SELECT_ALL_Doctor_STRING = "select * from doctor";
	private static final String SELECT_Doctor_BY_ID_STRING = "select user_id,email,password,access from doctor where user_id=?;";
	private static final String DELETE_Doctor_STRING = "delete from doctor where user_id=?;";
	private static final String UPDATE_Doctor_STRING = "update doctor set firstName=?,lastName=?,address=?,phoneNumber=? where user_id=?;";
	private static final String SELECT_ALL_PATIENT_STRING = "select * from patients";
	private static final String SELECT_PATIENT_BY_ID_STRING = "select ID,firstName,lastName,gender,phoneNumber,address,address2,country,dob,state,zip from patients where ID=?;";
	private static final String SELECT_ALL_REPORT_STRING = "select * from report where patientId=?;";

	public DoctorDao() {
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

//	Method to add Doctor
	public void addDoctor(Doctor Doctor) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_Doctor_TO_DB)) {
			preparedStatement.setString(1, Doctor.getFirstName());
			preparedStatement.setString(2, Doctor.getLastName());
			preparedStatement.setString(3, Doctor.getPhoneNumber());

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

//	Method to select by ID
	public Doctor selectDoctor(int DoctorId) {
		Doctor Doctor = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_Doctor_BY_ID_STRING)) {
			preparedStatement.setInt(1, DoctorId);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String firstName = rs.getString("firstName");
//				String phoneNumber = rs.getString("phone"); we might need to add a number
				String password = rs.getString("password");
				String email = rs.getString("email");
				String access = rs.getString("access");

				Doctor = new Doctor(id, email, password, access, firstName);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("\nselectDoctor: " + Doctor);
		return Doctor;
	}

//	Method to select all Doctors
	public List<Doctor> selectAllDoctors() {
		List<Doctor> Doctors = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_Doctor_STRING)) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("user_id");
				String name = rs.getString("firstName");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String access = rs.getString("country");

				Doctors.add(new Doctor(id, email, password, access, name));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return Doctors;
	}

	// updating our Doctor info
	public boolean updateDoctorInfo(Doctor Doctor) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_Doctor_STRING);) {
			statement.setString(1, Doctor.getFirstName());
			statement.setString(2, Doctor.getLastName());

			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

	// deleting a Doctor
	public boolean deleteDoctor(int id) throws SQLException {
		boolean deleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_Doctor_STRING);) {
			statement.setInt(1, id);
			deleted = statement.executeUpdate() > 0;

		}
		return deleted;
	}

	// patient related part
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
				System.out.println("\nName: " + firstName);
				String lastName = rs.getString("lastName");
				String gender = rs.getString("gender");
				String phoneNumber = rs.getString("phoneNumber");
				String country = rs.getString("country");
				String address = rs.getString("address");
				String address2 = rs.getString("address2");
				String dob = rs.getString("dob");
				String state = rs.getString("state");
				String zip = rs.getString("zip");
				patient = new Patient(id, firstName, lastName, gender, phoneNumber, dob, address, address2, country,
						state, zip);
				System.out.println("\nselectPatient1: " + patient);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("\nselectPatient: " + patient);
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
				String gender = rs.getString("gender");
				String phoneNumber = rs.getString("phoneNumber");
				String country = rs.getString("country");
				String address = rs.getString("address");
				String address2 = rs.getString("address2");
				String dob = rs.getString("dob");
				String state = rs.getString("state");
				String zip = rs.getString("zip");
				patients.add(new Patient(id, firstName, lastName, gender, phoneNumber, dob, address, address2, country,
						state, zip));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return patients;
	}

	public void addReport(Report REPORT) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REPORT_TO_DB)) {

			preparedStatement.setString(1, REPORT.getDiagnosis());
			preparedStatement.setString(2, REPORT.getPrescribedMeds());
			preparedStatement.setString(3, REPORT.getAllergies());
			preparedStatement.setInt(4, REPORT.getPatientId());

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public List<Report> selectAllreport(int id) {

		List<Report> reports = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_REPORT_STRING)) {
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
//				String reportId = rs.getString("report_id");
				String diagnosis = rs.getString("diagnosis");
				String allergy = rs.getString("allergy");
				String prescribedMeds = rs.getString("prescribedmeds");
				int patientId = rs.getInt("patientId");

				reports.add(new Report(diagnosis, allergy, prescribedMeds, patientId));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return reports;
	}
}
