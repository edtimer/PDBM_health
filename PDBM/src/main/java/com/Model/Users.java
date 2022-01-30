package com.Model;

import java.io.Serializable;

public class Users implements Serializable {
	protected String firstName, lastName, phoneNumber, email, access, password;
	protected int user_id;

	public Users() {
	}

	public Users(int user_id, String email, String firstName, String lastName, String phoneNumber, String password,
			String access) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.password = password;
		this.access = access;
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}
