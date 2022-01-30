package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.Bed;
import com.Model.Patient;
import com.Model.Users;

public class bedDao {

	/**
	 * 
	 */

	private String url = "jdbc:mysql://localhost:3306/netzilla?serverTimezone=Asia/Seoul&useSSL=false";
	private String unameString = "root";
	private String pass = "pass";
	private String driver = "com.mysql.jdbc.Driver";

	private static final String SELECT_ALL_BED = "select * from bed";
	private static final String SELECT_BED_BY_NO = "select bedNo,floor,roomNo,bedStatus,patientId from bed where bedNo=?;";
	private static final String INSERT_BED_RESERVATION = "insert into Bed"
			+ " (bedNo, floor,roomNo, bedStatus, patientId) VALUES" + "(?,?,?,?,?);";
	private static final String DELETE_PATIENTID_BY_BED_NO = "update Bed set patientId='' where bedNo=?;";
	private static final String UPDATE_PATIENTID_BY_BED_NO = "update Bed set patientId=? where bedNo=?;";
	private static final String UPDATE_BEDSTATUS_BY_BED_NO = "update Bed set bedStatus=? where bedNo=?;";

	public bedDao() {
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

	public void addReservation(Bed bed, int id) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BED_RESERVATION)) {

			preparedStatement.setInt(1, bed.getBedNo());
			preparedStatement.setInt(2, bed.getFloor());
			preparedStatement.setInt(3, bed.getRoomNo());
			preparedStatement.setString(4, bed.getBedStatus());
			preparedStatement.setInt(5, id);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

//	Method to select by BedNo
	public Bed selectBed(int bed_No) {
		Bed bed = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BED_BY_NO)) {
			preparedStatement.setInt(1, bed_No);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				System.out.println("here");
				int bedNo = rs.getInt("bedNo");
				int floor = rs.getInt("floor");
				int roomNo = rs.getInt("roomNo");
				String bedStatus = rs.getString("bedStatus");
				int patientId = rs.getInt("patientId");
				bed = new Bed(bedNo, floor, roomNo, bedStatus, patientId);
				System.out.println("\nselectBed1: " + bed);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("database issues");
		}
		System.out.println("\nselectBed1: " + bed);
		return bed;
	}

//	Method to select all bed
	public List<Bed> selectAllBed() {
		ArrayList<Bed> beds = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BED)) {

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int bedNo = rs.getInt("bedNo");
				int floor = rs.getInt("floor");
				int roomNo = rs.getInt("roomNo");
				String bedStatus = rs.getString("bedStatus");
				int patientId = rs.getInt("patientId");
				beds.add(new Bed(bedNo, floor, roomNo, bedStatus, patientId));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return beds;
	}

	// updating patientId
	public boolean updatePatientId(int patientId) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_PATIENTID_BY_BED_NO);) {
			statement.setInt(5, patientId);
			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

	// updating bed status
	public boolean updateBedStatus(int bedStatus) throws SQLException {
		boolean updated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_BEDSTATUS_BY_BED_NO);) {
			statement.setInt(4, bedStatus);
			updated = statement.executeUpdate() > 0; // to determine if update was successful or failed.
		}
		return updated;
	}

	// deleting patientId
	public boolean deletePatientId(int bedNo) throws SQLException {
		boolean deleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PATIENTID_BY_BED_NO);) {
			statement.setInt(1, bedNo);
			deleted = statement.executeUpdate() > 0;

		}
		return deleted;
	}
}
