package com.Controllers;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.SecretKeyCallback.Request;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.Session;

import org.apache.catalina.connector.Response;

import com.Dao.bedDao;
import com.Dao.patientDao;
import com.Model.Bed;
import com.Model.Patient;

/**
 * Servlet implementation class PatientController
 */
@WebServlet("/PatientController")
public class PatientController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private patientDao dao;
	private bedDao bDao;

	public void init() throws ServletException {
		dao = new patientDao();
		bDao = new bedDao();
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
//	HttpSession permissionSession = request.getSession();
//	permissionSession = request.getAttribute(""); to di8fferentiate between admin user and doctor
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String option = request.getServletPath();

		String[] pathInfo = request.getServletPath().split("/");
		String option = "";

		if (pathInfo.length > 2) {
			option = pathInfo[2]; // get delete/edit/...
		} else {
			option = pathInfo[1]; // get PatientController
		}
		System.out.print("top of controller" + option);
		switch ((option)) {
//		switch (option) {
		case ("new"):
			displayRegistrationForm(request, response);
			break;
		case ("add"):
			addPatient(request, response);
			break;
		case ("delete"):
			deletePatient(request, response);
			break;
		case ("edit"):
			editngPatient(request, response);
			break;
		case ("update"):
			try {
				System.out.print("in the controller");
				updatePatient(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case ("admin"):
			// we add an if statement to check if the session has an admin attribute or not
			denied(request, response);
			break;

		case ("search"):
			getPatientInfo(request, response);
			break;
		case ("assign"):
			assignBed(request, response);
		case ("reservation"):
			reservation(request, response);

		default:
			listPatients(request, response);

		}

	}

	private void displayRegistrationForm(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/patient_Registration.jsp");
		dispatcher.forward(req, res);
	}

	private void addPatient(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String gender = req.getParameter("gender");
		String phoneNumber = req.getParameter("phoneNumber");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String country = req.getParameter("country");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");
		int id = Integer.parseInt(req.getParameter("id"));

		Patient patient = new Patient(id, firstName, lastName, gender, phoneNumber, dob, address, address2, country,
				state, zip);
		dao.addPatient(patient);
		listPatients(req, res);

	}

	private void denied(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("404.jsp");
		rd.forward(req, res);
	}

	private void deletePatient(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			dao.deletePatient(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		listPatients(req, res);
	}

	private void editngPatient(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Patient existingPatient;
		try {
			existingPatient = dao.selectPatient(id);
			System.out.println("\nhere is: " + existingPatient);
			RequestDispatcher rd = req.getRequestDispatcher("/editPatient.jsp");
			req.setAttribute("patient", existingPatient);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void getPatientInfo(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		Patient existingPatient;
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			existingPatient = dao.selectPatient(id);
			if (existingPatient == null) {
				RequestDispatcher rd = req.getRequestDispatcher("/404search.jsp");
				rd.forward(req, res);
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("/editPatient.jsp");
				req.setAttribute("patient", existingPatient);
				rd.forward(req, res);
			}
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher rd = req.getRequestDispatcher("/404search.jsp");
			rd.forward(req, res);

		}

	}

	private void updatePatient(HttpServletRequest req, HttpServletResponse res)
			throws SQLException, IOException, ServletException {
		System.out.print("we are here\n");
		HttpSession session = req.getSession();
		Patient patienta = (Patient) session.getAttribute("patient");

		int id = patienta.getId();
		System.out.print(id);
		String firstName = req.getParameter("firstName");
		System.out.print(firstName);
		String lastName = req.getParameter("lastName");
		String dob = req.getParameter("dob");
		String gender = req.getParameter("gender");
		String phoneNumber = req.getParameter("phoneNumber");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String country = req.getParameter("country");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");
		Patient patient = new Patient(id, firstName, lastName, gender, phoneNumber, dob, address, address2, country,
				state, zip);
		dao.updatePatientInfo(patient);
		System.out.print("\nsuccess");

		listPatients(req, res);
	}

	private void listPatients(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<Patient> listPatients = (ArrayList<Patient>) dao.selectAllPatients();
//        request.setAttribute("patientlist", listPatients);

		HttpSession session = request.getSession();
		session.setAttribute("patientlist", listPatients);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("main_Page.jsp");
//        dispatcher.forward(request, response);
		response.sendRedirect(request.getContextPath() + "/main_Page.jsp");
	}
	private void assignBed(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Patient existingPatient;
//we need to assign the rest in the modal page
		try {
			existingPatient = dao.selectPatient(id);
			RequestDispatcher rd = req.getRequestDispatcher("/bedAssignment.jsp");
			req.setAttribute("patient", existingPatient);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	private void reservation(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		int bid = Integer.parseInt(req.getParameter("bedId"));
		int floor = Integer.parseInt(req.getParameter("bedId"));
		int roomNumber = Integer.parseInt(req.getParameter("bedId"));
		String bedStatus = "";
		System.out.print(id);
		System.out.print("bedNo, floor,roomNo, bedStatus, patientId");
		Patient existingPatient;
//we need to assign the rest in the modal page
		Bed bed = new Bed(bid, 0, 0, "statu test", id);

		try {
			existingPatient = dao.selectPatient(id);
			bDao.addReservation(bed, id);
			RequestDispatcher rd = req.getRequestDispatcher("/bedAssignment.jsp");
			req.setAttribute("patient", existingPatient);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

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
