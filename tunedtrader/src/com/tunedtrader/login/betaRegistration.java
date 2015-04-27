package com.tunedtrader.login;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class betaRegistration extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		//Define variables
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		HttpSession mysession;
		java.util.Date date= new java.util.Date();
		betaUser user = new betaUser();
		Entity betaUser = new Entity("betaUser");
		boolean accessgranted;
		
		//get beta user information from login.jsp
		
		user.setEmail(req.getParameter("email"));
		user.setfName(req.getParameter("first"));
		//user.setipAddress(ipAddress);
		user.setlName(req.getParameter("last"));
		
		//DataStore persistence
		betaUser.setProperty("firstName", user.getfName());
		betaUser.setProperty("lastName", user.getlName());
		betaUser.setProperty("email", user.getEmail());
		betaUser.setProperty("registration", date);
		
		//homepage redirect
		mysession = req.getSession(true);
		mysession.putValue("access", "loggedin");
		mysession.setMaxInactiveInterval(2700);
    	System.out.println(mysession.getServletContext());
    	System.out.println(mysession);
    	System.out.println(mysession.getId());
    	System.out.println(mysession.getCreationTime());
		resp.sendRedirect("/home.jsp");
		accessgranted = true;
		System.out.println("Access granted");
		
	}
}
	
