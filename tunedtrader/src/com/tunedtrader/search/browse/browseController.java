package com.tunedtrader.search.browse;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;

public class browseController extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		//create array to hold images
		ArrayList images = new ArrayList();
		//create array to hold imaged ids
		ArrayList ids = new ArrayList();
		//get vehicle class from home page
		String vclass = (String) req.getParameter("vclass");
		System.out.println(vclass);
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query1 = new Query("Vehicle");
		query1.addFilter("vclass", Query.FilterOperator.EQUAL, vclass);
		PreparedQuery pq = datastore.prepare(query1);
		for (Entity result : pq.asIterable()) {
			  BlobKey blobkey = (BlobKey) result.getProperty("keyphoto");
			  Key id = result.getKey();
			  String stringID = KeyFactory.keyToString(id);
			  
			  
		        if (blobkey == null) {
		            System.out.println("Blobkey is null.");
		        } else {
		        	
		        	ImagesService imageservice = ImagesServiceFactory.getImagesService();
		        	String imageurl = imageservice.getServingUrl(blobkey);
	        		images.add(imageurl);
	        		ids.add(stringID);
		        }
		}
		
		req.setAttribute("searchresults", images);
		req.setAttribute("resultkeys", ids);
		RequestDispatcher reqDispatcher = getServletConfig().getServletContext().getRequestDispatcher("/searchresults.jsp");
		try {
			reqDispatcher.forward(req, res);
			System.out.println("search results sent to JSP");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("Search results failed to send to JSP");
			e.printStackTrace();
		}
	}

}
