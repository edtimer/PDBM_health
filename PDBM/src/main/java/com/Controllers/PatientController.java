package com.Controllers;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dao.patientDao;
import com.Model.Patient;

/**
 * Servlet implementation class PatientController
 */
@WebServlet("/PatientController")
public class PatientController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private patientDao dao;

	public void init() throws ServletException {
		dao = new patientDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String option = request.getServletPath();

		switch (option) {
		case ("/new"):
			displayRegistrationForm(request, response);
			break;
		case ("/add"):
			addPatient(request, response);
			break;
		case ("/delete"):
			break;
		case ("/edit"):
			break;
		default:
			break;
		}

	}

	private void displayRegistrationForm(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("patient_Registration.jsp");
		dispatcher.forward(req, res);
	}

	private void addPatient(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String phoneNumber = req.getParameter("phoneNumber");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String country = req.getParameter("country");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");

		Patient patient = new Patient(firstName, lastName, phoneNumber, dob, address, address2, country, state, zip);
		dao.addPatient(patient);
		RequestDispatcher dispatcher = req.getRequestDispatcher("patient_Registration.jsp");
		dispatcher.forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
