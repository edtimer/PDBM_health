package com.Controllers;

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
import javax.websocket.Session;

import org.apache.catalina.connector.Response;

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
//	HttpSession permissionSession = request.getSession();
//	permissionSession = request.getAttribute(""); to di8fferentiate between admin user and doctor
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String option = request.getServletPath();

		String[] pathInfo = request.getServletPath().split("/");
		String path = "", option = "";

		if (pathInfo.length > 2) {
			option = pathInfo[2]; // get delete/edit/...
		} else {
			option = pathInfo[1]; // get PatientController
		}
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
//		case ("/update"):
//			updatePatient(request, response);
//			break;
		case ("admin"):
			// we add an if statement to check if the session has an admin attribute or not
			denied(request, response);
			break;

		case ("getInfo"):
			getPatientInfo(request, response);
			break;
		case ("assign"):
			assignBed(request, response);
		default:
			listPatients(request, response);

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
		int id = Integer.parseInt(req.getParameter("id"));

		Patient patient = new Patient(firstName, lastName, phoneNumber, dob, address, address2, country, state, zip,
				id);
		dao.addPatient(patient);
		res.sendRedirect("main_Page.jsp");

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
			RequestDispatcher rd = req.getRequestDispatcher("/editPatient.jsp");
			req.setAttribute("patient", existingPatient);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void getPatientInfo(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Patient existingPatient;
		try {
			existingPatient = dao.selectPatient(id);
			RequestDispatcher rd = req.getRequestDispatcher("/patient_information.jsp");
			req.setAttribute("patient", existingPatient);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void updatePatient(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String phoneNumber = req.getParameter("phone");
		String address = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String dob = req.getParameter("dob");
		String[] count = req.getParameterValues("country"); // country is a drop down selection
		String country = count[0];
		String[] stat = req.getParameterValues("state"); // state is a drop down selection
		String state = stat[0];
		String zip = req.getParameter("zip");

		Patient patient = new Patient(firstName, lastName, phoneNumber, dob, address, address2, country, state, zip,
				id);
		dao.updatePatientInfo(patient);
		res.sendRedirect("main_Page.jsp");
	}

	private void listPatients(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        ArrayList<Patient> listPatients = (ArrayList<Patient>) dao.selectAllPatients();
        request.setAttribute("listPatients", listPatients);
        
        HttpSession session = request.getSession();
        session.setAttribute("patientlist", listPatients);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("main_Page.jsp");
//        dispatcher.forward(request, response);
        response.sendRedirect(request.getContextPath() + "/main_Page.jsp");
    }

	private void assignBed(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Patient existingPatient;
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
