package com.Model;

import java.sql.Date;
import java.util.UUID;

public class Bed {

	private UUID bid;
	
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescriptionString() {
		return descriptionString;
	}

	public void setDescriptionString(String descriptionString) {
		this.descriptionString = descriptionString;
	}

	public Date getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}

	public Date getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}

	private double price;
	private String descriptionString;
	private Date start_Date;
	private Date end_Date;

	public UUID getUid() {
		return bid;
	}

	public void setUid(UUID uid) {
		this.bid = uid;
	}

}
