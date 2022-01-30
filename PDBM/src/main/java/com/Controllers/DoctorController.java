package com.Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.SecretKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.tomcat.util.buf.CharChunk.CharOutputChannel;

import com.Dao.DoctorDao;
import com.Dao.patientDao;
import com.Model.Doctor;
import com.Model.Patient;
import com.Model.Report;

/**
 * Servlet implementation class DoctorController
 */
@WebServlet("/DoctorController")
public class DoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DoctorDao dao;

	public void init() throws ServletException {
		dao = new DoctorDao();

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DoctorController() {
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
			option = pathInfo[1]; // get DoctorController
		}
		switch ((option)) {
//		switch (option) {
		case ("new"):
			displayRegistrationForm(request, response);
			break;
		case ("add"):
			addDoctor(request, response);
			break;
		case ("delete"):
			deleteDoctor(request, response);
			break;
		case ("edit"):
			editngDoctor(request, response);
			break;
//		case ("/update"):
//			updateDoctor(request, response);
//			break;
		case ("admin"):
			// we add an if statement to check if the session has an admin attribute or not
			denied(request, response);
			break;

		case ("getInfo"):
			getDoctorInfo(request, response);
			break;
		case ("consultation"):
			consultation(request, response);
			break;
		case ("submit"):
			submitDiagnosis(request, response);
		default:
			listPatients(request, response);

		}

	}

	private void displayRegistrationForm(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("doctor_Registration.jsp");
		dispatcher.forward(req, res);
	}

	private void addDoctor(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String access = req.getParameter("access");
		int user_id = Integer.parseInt(req.getParameter("id"));

		Doctor doctor = new Doctor(user_id, email, password, access, firstName);
		dao.addDoctor(doctor);
		res.sendRedirect("main_Page.jsp");

	}

	private void denied(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("404.jsp");
		rd.forward(req, res);
	}

	private void deleteDoctor(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			dao.deleteDoctor(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		listDoctors(req, res);
	}

	private void editngDoctor(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Doctor existingDoctor;
		try {
			existingDoctor = dao.selectDoctor(id);
			System.out.println("\nhere is: " + existingDoctor);
			RequestDispatcher rd = req.getRequestDispatcher("/editDoctor.jsp");
			req.setAttribute("doctor", existingDoctor);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void getDoctorInfo(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Doctor existingDoctor;
		try {
			existingDoctor = dao.selectDoctor(id);
			RequestDispatcher rd = req.getRequestDispatcher("/doctor_information.jsp");
			req.setAttribute("doctor", existingDoctor);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void updateDoctor(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		int user_id = Integer.parseInt(req.getParameter("id"));
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String password = req.getParameter("password");
		String phoneNumber = req.getParameter("phone");
		String email = req.getParameter("email");
		String access = req.getParameter("access");

		String zip = req.getParameter("zip");

		Doctor doctor = new Doctor(user_id, email, password, access, firstName);
		dao.updateDoctorInfo(doctor);
		res.sendRedirect("main_Page.jsp");
	}

	private void listDoctors(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<Doctor> listDoctors = (ArrayList<Doctor>) dao.selectAllDoctors();
		ArrayList<Patient> listPatients = (ArrayList<Patient>) dao.selectAllPatients();

		HttpSession session = request.getSession();
		session.setAttribute("patientlist", listPatients);
		session.setAttribute("doctorlist", listDoctors);

		response.sendRedirect(request.getContextPath() + "/main_Page_doctor.jsp");
	}

	private void listPatients(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<Patient> listPatients = (ArrayList<Patient>) dao.selectAllPatients();
//        request.setAttribute("patientlist", listPatients);

		HttpSession session = request.getSession();
		session.setAttribute("patientlist", listPatients);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("main_Page.jsp");
//        dispatcher.forward(request, response);
		response.sendRedirect(request.getContextPath() + "/main_Page_doctor.jsp");
	}

	private void consultation(HttpServletRequest req, HttpServletResponse res) {
		// need to change this to session
		int patientpId = Integer.parseInt(req.getParameter("patientId"));

//		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		System.out.print("our patient id is : " + patientpId);
		;
		Doctor existingDoctor;
		Patient visitingPatient;
		HttpSession session = req.getSession();

		ArrayList<Report> reports = new ArrayList<Report>();

		try {
			visitingPatient = dao.selectPatient(patientpId);
			reports = (ArrayList<Report>) dao.selectAllreport(patientpId);
			System.out.print("the report has" + reports.size());
//			existingDoctor = dao.selectDoctor(doctorId);
			RequestDispatcher rd = req.getRequestDispatcher("/Diagnosis.jsp");
//			req.setAttribute("doctor", existingDoctor);
			req.setAttribute("patient", visitingPatient);
			req.setAttribute("reportlist", reports);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void submitDiagnosis(HttpServletRequest req, HttpServletResponse res) {
		// need to change this to session
		HttpSession session = req.getSession();
//		String patientpId = req.getParameter("patientId");
		int patientpId = (int)session.getAttribute("diagnosedPatient");
		
		System.out.print("passed patient pid from session get attribute xxxxxx: " + patientpId);
		Doctor existingDoctor;
		Patient visitingPatient = null;
//		visitingPatient = dao.selectPatient(patientpId);
		String diagnosis = req.getParameter("diagnosis");
		String medication = req.getParameter("mdeications");
		String allergy = req.getParameter("allergy");
		Report patientReport = new Report(diagnosis, allergy, medication, patientpId);
		dao.addReport(patientReport);
		System.out.print(diagnosis);

		try {

//			existingDoctor = dao.selectDoctor(doctorId);
//			RequestDispatcher rd = req.getRequestDispatcher("/Diagnosis.jsp");
//			req.setAttribute("doctor", existingDoctor);
//			req.setAttribute("patient", visitingPatient);
//			rd.forward(req, res);
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
