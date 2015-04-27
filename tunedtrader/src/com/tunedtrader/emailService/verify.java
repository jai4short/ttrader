package com.tunedtrader.emailService;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

@SuppressWarnings("serial")
public class verify extends HttpServlet {


public void doGet(HttpServletRequest req, HttpServletResponse res){

	
	try {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		String key = req.getParameter("value1");
		System.out.println("String is: " + key);
		Key postID = KeyFactory.stringToKey(key);
		System.out.println("Key is: " + postID);
		Long token = new Long(req.getParameter("value2"));
		Entity result;
		try {
			result = datastore.get(postID);
			Object resultToken = (Long) result.getProperty("verificationtoken");
			
			System.out.println("token is: " + token);
			System.out.println("verfication token is: " + resultToken);
			
			if (token.equals(resultToken)){
				try {
					res.setContentType("text/plain");
				    res.setHeader("Cache-Control", "no-cache");
				    //<option value="*">Make</option>
				    result.setProperty("status", "active");
				    datastore.put(result);
					res.getWriter().write("Thanks for verifying your email!  Your vehicle has been uploaded");
					System.out.println("The response was sent.");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println("The response was not sent.");
					e.printStackTrace();
				}
			}
			
			else {
				try {
					res.setContentType("text/plain");
				    res.setHeader("Cache-Control", "no-cache");
				    //<option value="*">Make</option>
					res.getWriter().write("Your email was not validated successfully.  Check the post ID and token we sent to your email and try again.");
					System.out.println("The response was sent.");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println("The response was not sent.");
					e.printStackTrace();
				}
			}
			
		} catch (EntityNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	catch (IllegalArgumentException e){
		try {
			res.setContentType("text/plain");
		    res.setHeader("Cache-Control", "no-cache");
		    //<option value="*">Make</option>
			res.getWriter().write("Something went wrong. Try again.");
			System.out.println("The response was sent.");
		} catch (IOException d) {
			// TODO Auto-generated catch block
			System.out.println("The response was not sent.");
			d.printStackTrace();
		}
	}

	
	/** Query query = new Query("Vehicle")
		.addFilter(Entity.KEY_RESERVED_PROPERTY, Query.FilterOperator.EQUAL, postID);
	
	PreparedQuery pq = datastore.prepare(query); **/
	
	

		
}

}
