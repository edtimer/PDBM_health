package com.Model;

import java.io.Serializable;

public class Doctor extends Users implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Doctor(int user_id, String email, String password, String access,String firstName) {
		this.user_id = user_id;
		this.email = email;
		this.password = password;
		this.access = access;
		this.firstName = firstName;
	}
}
