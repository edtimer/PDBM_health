package com.Model;

public class Report {

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public String getPrescribedMeds() {
		return prescribedMeds;
	}

	public void setPrescribedMeds(String prescribedMeds) {
		this.prescribedMeds = prescribedMeds;
	}

	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	/**
	 * @param diagnosis
	 * @param prescribedMeds
	 * @param allergies
	 * @param patientId
	 */
	public Report(String diagnosis, String prescribedMeds, String allergies, int patientId) {
		this.diagnosis = diagnosis;
		this.prescribedMeds = prescribedMeds;
		this.allergies = allergies;
		this.patientId = patientId;
	}

	public Report() {
		// TODO Auto-generated constructor stub
	}

	private String diagnosis, prescribedMeds, allergies;
	private int patientId;
	public Doctor doctor;

}
