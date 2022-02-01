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

import com.Dao.bedDao;
import com.Dao.patientDao;
import com.Model.Bed;
import com.Model.Doctor;
import com.Model.Patient;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/bedController")
public class bedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private bedDao bdao;

	public void init() throws ServletException {
		bdao = new bedDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bedController() {
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
			option = pathInfo[1]; // get bedController
		}
		switch ((option)) {
//		switch (option) {
		case ("delete"):
			deleteBedAssign(request, response);
			break;
		case ("update"):
			try {
				updateBedAssign(request, response);
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case ("updateBS"):
			try {
				updateBedStatus(request, response);
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case ("select"):
			try {
				selectBedByNo(request, response);
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		case ("admin"):
			// we add an if statement to check if the session has an admin attribute or not
			denied(request, response);
			break;

		default:
			listBedAssignment(request, response);

		}

	}
	
	private void displayBedAssignment(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/bedAssignment.jsp");
		dispatcher.forward(req, res);
	}
	
	private void selectBedByNo(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		int bedNo = Integer.parseInt(req.getParameter("bedNo"));
		bdao.selectBed(bedNo);
		res.sendRedirect("bedAssignment.jsp");

	}
	
	private void denied(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("404.jsp");
		rd.forward(req, res);
	}

	private void deleteBedAssign(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("patientId"));
        try {
            bdao.deletePatientId(id);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        listBedAssignment(req, res);
	}

	private void updateBedAssign(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		int patientId = Integer.parseInt(req.getParameter("patientId"));
		bdao.updatePatientId(patientId);
		res.sendRedirect("bedAssignment.jsp");

	}
	
	private void updateBedStatus(HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException, ServletException {
		String bedStatus = req.getParameter("bedStatus");
		int bedNo = Integer.parseInt(req.getParameter("bedNo"));
		bdao.updateBedStatus(bedStatus,bedNo);
		res.sendRedirect("bedList.jsp");
		listBedAssignment(req,res);
		//RequestDispatcher rd = req.getRequestDispatcher("/bedAssignment.jsp");
		//req.setAttribute("patient", existingPatient);
		//rd.forward(req, res);
	}

	private void listBedAssignment(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ArrayList<Bed> listBedAssignment = (ArrayList<Bed>) bdao.selectAllBed();
//        request.setAttribute("bedlist", listBedAssignment);

		HttpSession session = request.getSession();
		session.setAttribute("bedlist", listBedAssignment);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("main_Page.jsp");
//        dispatcher.forward(request, response);
//		response.sendRedirect(request.getContextPath() + "/main_Page.jsp");
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
