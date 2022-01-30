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

import com.Dao.UserDao;
import com.Model.Patient;
import com.Model.Users;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDao dao;

	public void init() throws ServletException {
		dao = new UserDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	HttpSession permissionSession = request.getSession();
//	permissionSession = request.getAttribute(""); to di8fferentiate between admin Users and doctor
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String option = request.getServletPath();

		String[] pathInfo = request.getServletPath().split("/");
		String option = "";

		if (pathInfo.length > 2) {
			option = pathInfo[2]; // get delete/edit/...
		} else {
			option = pathInfo[1]; // get UserController
		}
		switch ((option)) {
//		switch (option) {
		case ("new"):
			displayRegistrationForm(request, response);
			break;
		case ("addStaff"):
			addUsers(request, response);
			break;
		case ("deleteStaff"):
			deleteUsers(request, response);
			break;
		case ("editingStaff"):
			editngUsers(request, response);
			break;
		case ("updateStaff"):
			try {
				updateUsers(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case("searchstaff"):
			getUsersInfo(request, response);
		case ("admin"):
			// we add an if statement to check if the session has an admin attribute or not
			denied(request, response);
			break;

		case ("getInfo"):
			getUsersInfo(request, response);
			break;

		default:
			listUserss(request, response);

		}

	}

	private void displayRegistrationForm(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/Users_Registration.jsp");
		dispatcher.forward(req, res);
	}

	private void addUsers(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String email = req.getParameter("email");
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String phoneNumber = req.getParameter("phoneNumber");
		String password = req.getParameter("password");
		String access = req.getParameter("access");

		Users Users = new Users(id, email, firstName, lastName, phoneNumber, password, access);
		dao.addUser(Users);
		listUserss(req, res);

	}

	private void denied(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("404.jsp");
		rd.forward(req, res);
	}

	private void deleteUsers(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			dao.deleteUser(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		listUserss(req, res);
	}

	private void editngUsers(HttpServletRequest req, HttpServletResponse res) {
		int id = Integer.parseInt(req.getParameter("id"));
		Users existingUsers;
		try {
			existingUsers = dao.selectUser(id);
			System.out.println("\nhere is: " + existingUsers);
			RequestDispatcher rd = req.getRequestDispatcher("/editUsers.jsp");
			req.setAttribute("Users", existingUsers);
			rd.forward(req, res);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void getUsersInfo(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Users existingUser;
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			existingUser = dao.selectUser(id);
			if (existingUser == null) {
				RequestDispatcher rd = req.getRequestDispatcher("/404search.jsp");
				rd.forward(req, res);
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("/patient_Information.jsp");
				req.setAttribute("patient", existingUser);
				rd.forward(req, res);
			}
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher rd = req.getRequestDispatcher("/404search.jsp");
			rd.forward(req, res);

		}

	}


	private void updateUsers(HttpServletRequest req, HttpServletResponse res)
			throws SQLException, IOException, ServletException {
		System.out.print("we are here\n");
		int id = Integer.parseInt(req.getParameter("id"));
		String email = req.getParameter("email");
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String phoneNumber = req.getParameter("phoneNumber");
		String password = req.getParameter("password");
		String access = req.getParameter("access");

		Users Users = new Users(id, email, firstName, lastName, phoneNumber, password, access);
		dao.updateUserInfo(Users);
		listUserss(req, res);
	}

	private void listUserss(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<Users> listUsers = (ArrayList<Users>) dao.selectAllUsers();
//        request.setAttribute("Userslist", listUserss);

		HttpSession session = request.getSession();
		session.setAttribute("Userslist", listUsers);
		response.sendRedirect(request.getContextPath() + "/staffList.jsp");

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
