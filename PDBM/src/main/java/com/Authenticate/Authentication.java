package com.Authenticate;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Authentication extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

//		PrintWriter writer = res.getWriter();
		String emailString = req.getParameter("email");
		String password = req.getParameter("pass");
//we need to use equals because String is not a primitive data type in java
		if (emailString.equals("test@test.com") && password.equals("pass")) {

			RequestDispatcher view = req.getRequestDispatcher("main_Page.jsp");
//TODO:
//			writer.print(view);
			view.forward(req, res);
//			writer.print("okay");
		} else {

			res.sendRedirect("Login_page.jsp");		
			
//			if Weak need to redirect with the whole session
//			RequestDispatcher nologin_view = req.getRequestDispatcher("Login_page.jsp");
//			nologin_view.forward(req, res);
			
		}
	}
}
