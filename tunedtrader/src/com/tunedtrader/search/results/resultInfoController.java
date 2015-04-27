package com.tunedtrader.search.results;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class resultInfoController extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		String resultKey = (String) req.getParameter("key");
		Key key = KeyFactory.stringToKey(resultKey);
		
		System.out.println(resultKey);
		
		Query queryInfo = new Query("Vehicle");
		
		queryInfo.addFilter(Entity.KEY_RESERVED_PROPERTY, Query.FilterOperator.EQUAL, key);
		
		System.out.println(queryInfo);
		
		PreparedQuery pq = datastore.prepare(queryInfo);
		
		System.out.println(pq);
		
		Entity result = pq.asSingleEntity();
			
			System.out.println(result);
			
			String year = String.valueOf(result.getProperty("year"));
			String make = (String) result.getProperty("make");
			String model = (String) result.getProperty("model");
			String price = String.valueOf(result.getProperty("price"));
			Long zip = (Long) result.getProperty("zip");
			String city, state, location;
			
			Query locationQuery = new Query("zipCodes");
			locationQuery.addFilter("zip", Query.FilterOperator.EQUAL, zip);
			PreparedQuery locationPQ = datastore.prepare(locationQuery);
			Entity resultEntity = locationPQ.asSingleEntity();
			city = (String) resultEntity.getProperty("City");
			state = (String) resultEntity.getProperty("State");
			location = city + ", " + state;
			
			
			System.out.println(year);
			System.out.println(make);
			System.out.println(model);
			System.out.println(price);
			
			try {
				res.setContentType("text/plain");
			    res.setHeader("Cache-Control", "no-cache");
				res.getWriter().write("<p id='displayYear'><span style='color:white; font-family:Helvetica, Arial, sans-serif; font-size:200%;'><b>" + year + "</b></span>" + 
						 "<span style='color:white; font-size: 250%; font-weight: 100; font-family: 'Helvetica Light', Helvetica, Arial, sans-serif;'> " + make + " " + model + "</span></p>" +
						"<br>" +
						"<p style='color:white; font-size: 175%;'>$" + price + "</p>" +
						"<br>" +
						"<p style='color:white; font-size: 100%;'>" + location + "</p>");
					System.out.println("The response was sent.");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					System.out.println("There was an error the response was not sent.");
					e.printStackTrace();
				}
			
				System.out.println("finished.");
			}
}
