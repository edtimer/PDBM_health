package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Report;

public class ReportDao {

	/**
	 * 
	 */

	private String url = "jdbc:mysql://localhost:3306/netzilla?useSSL=false";
	private String unameString = "root";
	private String pass = "pass";
	private String driver = "com.mysql.jdbc.Driver";

	private static final String INSERT_REPORT_TO_DB = "insert into report"
			+ " (diagnosis, allergy,prescribedmeds,patienId) VALUES" + "(?,?,?,?);";

	private static final String SELECT_ALL_REPORT_STRING = "select * from report";
	private static final String SELECT_REPORT_BY_ID_STRING = "select ID,firstName,lastName,gender,phoneNumber,address,address2,country,dob,state,zip from report where ID=?;";
	private static final String DELETE_REPORT_STRING = "delete from report where ID=?;";
	private static final String UPDATE_REPORT_STRING = "update report set firstName=?,lastName=?,address=?,phoneNumber=? where ID=?;";

	public ReportDao() {
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

//	Method to add REPORT
	public void addReport(Report REPORT) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REPORT_TO_DB)) {

			preparedStatement.setString(1, REPORT.getDiagnosis());
			preparedStatement.setString(2, REPORT.getAllergies());
			preparedStatement.setString(3, REPORT.getPrescribedMeds());
			preparedStatement.setInt(4, REPORT.getPatientId());

			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

//	Method to select by ID
//	public Report selectREPORT(int REPORTId) {
//		Report REPORT = null;
//		try (Connection connection = getConnection();
//				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORT_BY_ID_STRING)) {
//			preparedStatement.setInt(1, REPORTId);
//
//			ResultSet rs = preparedStatement.executeQuery();
//			while (rs.next()) {
//				int id = rs.getInt("id");
//				String firstName = rs.getString("firstName");
//				System.out.println("\nName: " + firstName);
//				String lastName = rs.getString("lastName");
//				String gender = rs.getString("gender");
//				String phoneNumber = rs.getString("phoneNumber");
//				String country = rs.getString("country");
//				String address = rs.getString("address");
//				String address2 = rs.getString("address2");
//				String dob = rs.getString("dob");
//				String state = rs.getString("state");
//				String zip = rs.getString("zip");
//				REPORT = new Report(id, firstName, lastName, gender, phoneNumber, dob, address, address2, country,state, zip);
//				System.out.println("\nselectREPORT1: " + REPORT);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		System.out.println("\nselectREPORT: " + REPORT);
//		return REPORT;
//	}

//	Method to select all report
	public List<Report> selectAllreport() {
		List<Report> report = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_REPORT_STRING)) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String diagnosis = rs.getString("diagnosis");
				String allergy = rs.getString("allergy");
				String prescribedMeds = rs.getString("prescribedmeds");
				int patientId = rs.getInt("aptientId");

				report.add(new Report(diagnosis, allergy, prescribedMeds, patientId));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return report;
	}

	// updating our REPORT info
//	public boolean updateREPORTInfo(Report REPORT) throws SQLException {
//		boolean updated;
//		try (Connection connection = getConnection();
//				PreparedStatement statement = connection.prepareStatement(UPDATE_REPORT_STRING);) {
//			statement.setString(1, REPORT.getFirstName());
//			statement.setString(2, REPORT.getLastName());
//			statement.setString(3, REPORT.getAddress());
//			statement.setString(4, REPORT.getPhoneNumber());
//			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
//		}
//		return updated;
//	}

	// deleting a REPORT
	public boolean deleteREPORT(int id) throws SQLException {
		boolean deleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_REPORT_STRING);) {
			statement.setInt(1, id);
			deleted = statement.executeUpdate() > 0;

		}
		return deleted;
	}
}
