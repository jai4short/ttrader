package com.tunedtrader.vehicle;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class modelController extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		System.out.println(req.getParameter("make"));
		System.out.println(req.getParameter("yearl"));
		String yearl = req.getParameter("yearl");
		String yearh = req.getParameter("yearh");
		String make = (String) req.getParameter("make");
		String results = "<option value='*'>None Specified</option>";
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query1 = new Query("VehicleList");
		query1.addSort("Year", SortDirection.ASCENDING);
		query1.addFilter("Make", Query.FilterOperator.EQUAL, make);
		if (!yearl.equals("*")){
			int yearLow = Integer.parseInt(yearl);
			query1.addFilter("Year", Query.FilterOperator.GREATER_THAN_OR_EQUAL, yearLow);
			}
		if (!yearh.equals("*")){
			int yearHi = Integer.parseInt(yearh);
			query1.addFilter("Year", Query.FilterOperator.LESS_THAN_OR_EQUAL, yearHi);
		}
		query1.addSort("Model", SortDirection.ASCENDING);
		PreparedQuery pq = datastore.prepare(query1);
		
		for (Entity result : pq.asIterable()) {
			System.out.println(result);
			String model = (String) result.getProperty("Model");
			System.out.println(model);
			results = results + "<option value='" + model + "'>" + model + "</option>";
		}
		
		
				try {
					res.setContentType("text/plain");
				    res.setHeader("Cache-Control", "no-cache");
				    //<option value="*">Make</option>
					res.getWriter().write(results);
					System.out.println("The response was sent.");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println("The response was not sent.");
					e.printStackTrace();
				}
			}
	
		
}



