package com.tunedtrader.login;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tunedtrader.emailService.emailBuilder;

public class submitFeedback  extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res){
		
		String message;
		String user;
		String emailAdd;
		String subject;
		String sendTo = "admin@TunedTrader.com";
		
		emailAdd = (String) req.getParameter("eaddress");
		user = (String) req.getParameter("user");
		message = (String) req.getParameter("message");
		subject = "User Feedback: " + emailAdd;
		
		 emailBuilder email = new emailBuilder(message, subject, sendTo, user);
		 email.buildMessage();

		
	}

}
