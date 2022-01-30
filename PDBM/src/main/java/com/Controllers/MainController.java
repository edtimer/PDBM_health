package com.Controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.UserDao;
import com.Dao.patientDao;
import com.Dao.staffDao;
import com.Model.Staff;
import com.Model.Users;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainController() {
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
		Users user = new Users();
		UserDao dao = new UserDao();
		patientDao pDao = new patientDao();
		HttpSession session = request.getSession(true);
		try {
			int id = (int) session.getAttribute("id");

			user = dao.selectUser(id);

		// to-do add staff object to session

//		session.setAttribute("staff", staff);
		String access = user.getAccess();

		session.setAttribute("token", user);

		switch (access) {
		case "staff":
			RequestDispatcher rd = request.getRequestDispatcher("PatientController");
			rd.forward(request, response);
			break;
		case "doctor":
			rd = request.getRequestDispatcher("DoctorController");
			rd.forward(request, response);
			break;
		case "admin":
			rd = request.getRequestDispatcher("AdminController");
			rd.forward(request, response);
			break;
		case "Logout":
			rd = request.getRequestDispatcher("/Login_page.jsp");
			rd.forward(request, response);
			break;
		default:
			rd = request.getRequestDispatcher("/Login_page.jsp");
			rd.forward(request, response);
			break;
		}
	}
	catch (Exception e) {
		response.sendRedirect("Login_page.jsp");
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
