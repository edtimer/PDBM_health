package com.Model;

import java.io.Serializable;

public class Staff extends Users implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Report report = new Report();

	public Staff() {}

	public Staff(int user_id, String firstName, String lastName, String phoneNumber, String email, String password, String access) {
		this.user_id = user_id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.password = password;
		this.access = access;
	}	
}
