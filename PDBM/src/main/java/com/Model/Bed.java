package com.Model;

import java.util.UUID;

public class Bed {

	private UUID bid;
	private int bedNo;
	private int floor;
	private int roomNo;
	private String bedStatus;
	private int patientId;
	
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getPatientID() {
		return patientId;
	}

	public Bed(int bedNo, int floor, int roomNo, String bedStatus, int patientId) {
		this.bedNo = bedNo;
		this.floor = floor;
		this.roomNo = roomNo;
		this.bedStatus = bedStatus;
		this.patientId = patientId;
	}
	
	public void setBedNo(int bedNo) {
		this.bedNo = bedNo;
	}

	public int getBedNo() {
		return bedNo;
	}
	
	public void setFloor(int floor) {
		this.floor = floor;
	}

	public int getFloor() {
		return floor;
	}
	
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getRoomNo() {
		return roomNo;
	}
	
	public void setBedStatus(String bedStatus) {
		this.bedStatus = bedStatus;
	}

	public String getBedStatus() {
		return bedStatus;
	}
	
	public UUID getUid() {
		return bid;
	}

	public void setUid(UUID uid) {
		this.bid = uid;
	}

}
