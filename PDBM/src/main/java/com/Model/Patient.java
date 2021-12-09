package com.Model;

import java.sql.Date;
import java.util.UUID;

public class Patient {
	

	public Patient(String firstName, String lastName, String phoneNumber, String dob, String address,
			String address2, String country, String state, String zip) {
		super();
		String uuid = UUID.randomUUID().toString();
		this.id = uuid;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.dob = dob;
		this.address = address;
		this.address2 = address2;
		this.country = country;
		this.state = state;
		this.zip = zip;
	}

	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	private String firstName;
	private String lastName;
	private String phoneNumber;
	private String dob;
	private String address;
	private String address2;
	private String country;
	private String state;
	private String zip;
}
