package com.Authenticate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.AuthenticationDao;

@SuppressWarnings("serial")
public class Authentication extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

//		PrintWriter writer = res.getWriter();
		String email = req.getParameter("email");
		String password = req.getParameter("pass");
//we need to use equals because String is not a primitive data type in java
		PrintWriter out = res.getWriter();
		AuthenticationDao dao = new AuthenticationDao();
		if (dao.credentialCheck(email, password)) {

			RequestDispatcher view = req.getRequestDispatcher("/PatientController");
//TODO:
//			writer.print(view);
			HttpSession session = req.getSession();
			ArrayList<String> itemsList = new ArrayList<String>();
			itemsList.add(email);
			itemsList.add(password);
			session.setAttribute("credentials", itemsList);
			view.forward(req, res);
//			writer.print("okay");
		} else {
			out.println("<div class='alert alert-danger' role='alert'>Invalid email and or password!</div>");
			out.println("you will be redirected to the login page in 2 seconds");
			out.println("<meta http-equiv='refresh' content='2;URL=Login_page.jsp'>");

//			res.sendRedirect("Login_page.jsp");

//			if Weak need to redirect with the whole session
//			RequestDispatcher nologin_view = req.getRequestDispatcher("Login_page.jsp");
//			nologin_view.forward(req, res);

		}
	}
}
