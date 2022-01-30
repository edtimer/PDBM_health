package com.Controllers;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.Tomcat.ExistingStandardWrapper;

import com.Dao.UserDao;
import com.Dao.patientDao;

import com.Model.Patient;
import com.Model.Users;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private patientDao dao;
	private UserDao uDao;

	public void init() throws ServletException {
		dao = new patientDao();
		uDao = new UserDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
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
			option = pathInfo[1]; // get AdminController
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
		case ("/update"):
			try {
				updatePatient(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case ("changepass"):
			try {
				updatepassword(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		case ("getInfo"):
			getPatientInfo(request, response);
			break;
		case ("assign"):
			assignBed(request, response);
		break;
		case ("editingStaff"):
			editngStaff(request, response);
		break;
		case("updateStaff"):
			try {
				updateStaff(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		default:
			adminPage(request, response);

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
	private void editngStaff(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Users existingUser;
		try {
			existingUser = uDao.selectUser(id);
			System.out.println("\nhere is: " + existingUser);
			RequestDispatcher rd = req.getRequestDispatcher("/editUsers.jsp");
			req.setAttribute("User", existingUser);
			System.out.print(existingUser.getFirstName()+existingUser.getLastName()+existingUser.getEmail());
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
		res.sendRedirect("main_Page.jsp");
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

	private void adminPage(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession();
		try {
			ArrayList<Patient> listPatients = (ArrayList<Patient>) dao.selectAllPatients();
			ArrayList<Users> listUsers = (ArrayList<Users>) uDao.selectAllUsers();
			session.setAttribute("patientlist", listPatients);
			session.setAttribute("Userslist", listUsers);

			System.out.print("patient list ok\n");
			System.out.print(listPatients.size());
			System.out.print("staff list ok\n");
			System.out.print(listUsers.size());
		} catch (Exception e) {
			System.out.print("no patient list\n");
			System.out.print("no user list\n");
		}
		RequestDispatcher rd = req.getRequestDispatcher("/Management.jsp");
		rd.forward(req, res);

//		res.sendRedirect(req.getContextPath() + "/Management.jsp");

	}

	private void updatepassword(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		String newPassword = req.getParameter("password");
		System.out.print("we are here and the password that will change is"+newPassword + " and the user id is "+id+"\n");
		uDao.updatePassword(newPassword, id);
		res.sendRedirect("main_Page.jsp");
	}
	private void updateStaff(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String phoneNumber = req.getParameter("phoneNumber");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String access = req.getParameter("access");


		Users user = new Users(id, firstName, lastName, phoneNumber, email, password, access);
		uDao.updateUserInfo(user);
		res.sendRedirect("Management.jsp");
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
