package com.tunedtrader.vehicle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Projection;
import com.google.appengine.api.datastore.PropertyProjection;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class makeController extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		String key = req.getParameter("key");
		System.out.println(key);
		String results = "<option value='*'>None Specified</option>";
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = new Query("VehicleList");
		query.addProjection(new PropertyProjection("Make", String.class));
		query.setDistinct(true);
		query.addSort("Make", SortDirection.ASCENDING);
		
		PreparedQuery pq = datastore.prepare(query);
		
		List<String> makes = new ArrayList<String>();
		
		for (Entity result : pq.asIterable(FetchOptions.Builder.withChunkSize(1000))) {
			String make = (String) result.getProperty("Make");
			//System.out.println(make);
			if (!checkDuplicate(makes, make)){
				makes.add(make);
				results = results + "<option value='" + make + "'>" + make + "</option>";
				System.out.println(results);
			}
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

public boolean checkDuplicate(List<String> list, String input){
	boolean dupe = false;
	for (int i = 0; i < list.size(); i++){
		if (input.equals(list.get(i)))
			dupe = true;
		}

		System.out.println(dupe);
		return dupe;
	}
		
}

