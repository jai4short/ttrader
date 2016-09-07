package com.tunedtrader.admin;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class adminDelete extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String input = req.getParameter("i");
		Key key;
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Query query = new Query(input);
		
		PreparedQuery pq = datastore.prepare(query);
		
		Iterable<Entity> results = pq.asIterable();
		
		for(Entity result : results){
			key = result.getKey();
			datastore.delete(key);
		}
	}
}
