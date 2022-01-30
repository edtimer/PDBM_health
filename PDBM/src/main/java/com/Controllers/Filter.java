package com.Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;


/**
 * Servlet Filter implementation class Filter
 */
@WebFilter(urlPatterns = { "/Filter" }, servletNames = { "Authentication" })
public class Filter implements javax.servlet.Filter {

	/**
	 * Default constructor.
	 */
	public Filter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
	//this servlet filters input especially in search

		HttpServletRequest req = (HttpServletRequest) request;
		PrintWriter out = response.getWriter();
		
		String nameString = req.getParameter("pass");
		// pass the request along the filter chain
		if(!(nameString.contains(";"))) 
		chain.doFilter(request, response);
		
	else 
		out.print("Suspicious behaviour detected, this action will be recorded");
	
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
