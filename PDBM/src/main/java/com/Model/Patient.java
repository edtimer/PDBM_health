
package com.Model;

import java.io.Serializable;
import java.sql.Date;
import java.util.UUID;

public class Patient implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String gender;
	private int id;

	public Patient(int id, String firstName, String lastName, String gender, String phoneNumber, String dob, String address, String address2,
			String country, String state, String zip) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.dob = dob;
		this.address = address;
		this.address2 = address2;
		this.country = country;
		this.state = state;
		this.zip = zip;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	@Override
	public String toString() {
		return "Patient [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", phoneNumber="
				+ phoneNumber + ", dob=" + dob + ", address=" + address + ", address2=" + address2 + ", country="
				+ country + ", state=" + state + ", zip=" + zip + "]";
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