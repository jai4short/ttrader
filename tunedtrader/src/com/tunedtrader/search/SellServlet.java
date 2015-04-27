package com.tunedtrader.search;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.BaseDatastoreService;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.images.Image;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.images.Transform;


public class SellServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
		//check servlet requests and responses
		if (req == null)
			System.out.println("Request is null");
		else
			System.out.println("Request is: " + req);
		
		if (resp == null)
			System.out.println("Response is null");
		else
			System.out.println("Response is: " + resp);
		
		//Initialize Blobstore 
		
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		//
		
		int YearL = 0;
		int YearH = 0;
		int MileageH = 0;
		int MileageL = 0;
		int PriceL = 0;
		int PriceH = 0;
		int zip = 0;
		double distance = 100000;
		
		//Create ArrayList to store image urls
		ArrayList images = new ArrayList();
		ArrayList ids = new ArrayList();
		
		//get input from search.jsp
		
		System.out.println("Starting to get inputs...");
		
		String vclass = req.getParameter("vclass");
		String make = req.getParameter("make");
		String model = req.getParameter("model");
		String yearL = req.getParameter("YEARL");
		
		String Zip = req.getParameter("zip");
		
		zip = Integer.parseInt(Zip);
		
		String Distance = req.getParameter("distance");
		
		if (!Distance.equals("*"))
			distance = Double.parseDouble(Distance);
		
		if (!yearL.equals("*"))
			YearL = Integer.parseInt(yearL);
		
		System.out.println(YearL);
		
		String yearH = req.getParameter("YEARH");
		if (!yearH.equals("*"))
			YearH = Integer.parseInt(yearH);
		
		System.out.println(YearH);
		
		String mileageL = req.getParameter("mileageL");
		if (!mileageL.equals("*"))
			MileageL = Integer.parseInt(mileageL);
		
		System.out.println(MileageL);
		
		String mileageH = req.getParameter("mileageH");
		if (!mileageH.equals("*"))
			MileageH = Integer.parseInt(mileageH);
		
		System.out.println(MileageH);
		
		String trans = req.getParameter("TRANS");
		String intake = req.getParameter("INTAKE");
		String exhaust = req.getParameter("EXHAUST");
		String HP = req.getParameter("HP");
		String sus = req.getParameter("SUSPENSION");
		String brakes = req.getParameter("BRAKES");
		String wheels = req.getParameter("WHEELS");
		String priceL = req.getParameter("priceL");
		
		PriceL = Integer.parseInt(priceL);
		
		System.out.println(PriceL);
		
		String priceH = req.getParameter("priceH");
		if (!priceH.equals("*"))
			PriceH = Integer.parseInt(priceH);
		else
			PriceH = 1000000000;
		
		System.out.println(PriceH);
		
		
		String forTrade = req.getParameter("trade");
		String forSwap = req.getParameter("swap");
		
		if (forTrade == null)
			forTrade = "No";
		if (forSwap == null)
			forSwap = "No";
		
		//String[] inputs = {trans, intake, exhaust, HP, sus, brakes, wheels, forTrade, forSwap, vclass, make, model};
		System.out.println("Input data received");
		
		//feed input from search.jsp into datastore query/add appropriate filters
		
		Query query1 = new Query("Vehicle");
		query1.addFilter("status", Query.FilterOperator.EQUAL, "active");
		if (!vclass.equals("*"))
			query1.addFilter("vclass", Query.FilterOperator.EQUAL, vclass);
		if (!make.equals("*"))
			query1.addFilter("make", Query.FilterOperator.EQUAL, make);
		if (!model.equals("*"))
			query1.addFilter("model", Query.FilterOperator.EQUAL, model);
		//if (!yearL.equals("*"))
			//query1.addFilter("year", Query.FilterOperator.GREATER_THAN_OR_EQUAL, YearL);
		//if (!yearH.equals("*"))
			//query1.addFilter("year", Query.FilterOperator.LESS_THAN_OR_EQUAL, YearH);
		//if (!mileageL.equals("*"))
			//query1.addFilter("mileage", Query.FilterOperator.GREATER_THAN_OR_EQUAL, MileageL);
		//if (!mileageH.equals("*"))
			//query1.addFilter("mileage", Query.FilterOperator.LESS_THAN_OR_EQUAL, MileageH);
		if (!trans.equals("*"))
			query1.addFilter("trans", Query.FilterOperator.EQUAL, trans);
		if (!intake.equals("*"))
			query1.addFilter("intake", Query.FilterOperator.EQUAL, intake);
		if (!exhaust.equals("*"))
			query1.addFilter("exhaust", Query.FilterOperator.EQUAL, exhaust);
		if (!sus.equals("*"))
			query1.addFilter("suspension", Query.FilterOperator.EQUAL, sus);
		if (!HP.equals("*"))
			query1.addFilter("HP", Query.FilterOperator.EQUAL, HP);
		if (!brakes.equals("*"))
			query1.addFilter("brakes", Query.FilterOperator.EQUAL, brakes);
		if (!wheels.equals("*"))
			query1.addFilter("wheels", Query.FilterOperator.EQUAL, wheels);
		//query1.addFilter("status", Query.FilterOperator.EQUAL, "active");
		if (forTrade.equals("Yes"))
			query1.addFilter("trade", Query.FilterOperator.EQUAL, forTrade);
		if (forSwap.equals("Yes"))
			query1.addFilter("swap", Query.FilterOperator.EQUAL, forSwap);
		
		/** if (isPriceOnly(inputs)){
			query1.addFilter("price", Query.FilterOperator.GREATER_THAN_OR_EQUAL, PriceL);
			query1.addFilter("price", Query.FilterOperator.LESS_THAN_OR_EQUAL, PriceH);
		} **/

		
		System.out.println(query1);
		
		PreparedQuery pq = datastore.prepare(query1);
		
		
		
		//if the result has a photo serve that photo
		
		for (Entity result : pq.asIterable()) {
			  BlobKey blobkey = (BlobKey) result.getProperty("keyphoto");
			  Key id = result.getKey();
			  String stringID = KeyFactory.keyToString(id);
			  
			  
		        if (blobkey == null) {
		            System.out.println("Blobkey is null.");
		        } else {
		        	
		        	ImagesService imageservice = ImagesServiceFactory.getImagesService();
		        	String imageurl = imageservice.getServingUrl(blobkey);
		        	
		        	long year = (Long) result.getProperty("year");
		        	System.out.println("year: " + year);
		        	
		        	long mileage = (Long) result.getProperty("mileage");
		        	System.out.println("mileage: " + mileage);
		        	
		        	long resultzip = (Long) result.getProperty("zip");
		        	
		        	long resultprice = (Long) result.getProperty("price");
		        	
		        	System.out.println("zip: " + resultzip);
		        	
		        	if ((inRange(year, YearL, YearH)) & inRange(resultprice, PriceL, PriceH) & inRange(mileage, MileageL, MileageH) & checkDistance(zip, resultzip, distance)){
		        		images.add(imageurl);
		        		ids.add(stringID);
		        		System.out.println(result);
		        		System.out.println(imageurl);
		        		}
		        		
		        	//blobstoreService.serve(blobkey, resp);
		            //System.out.println(result);
		        }
			  
			}
		
		System.out.println(images.size());
		System.out.println(images);
		
		//attempt to send information to searchresults.jsp
		req.setAttribute("searchresults", images);
		req.setAttribute("resultkeys", ids);
		
		System.out.println("Attribute set");
		
		RequestDispatcher reqDispatcher = getServletConfig().getServletContext().getRequestDispatcher("/searchresults.jsp");
		try {
			reqDispatcher.forward(req, resp);
			System.out.println("search results sent to JSP");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("Search results failed to send to JSP");
			e.printStackTrace();
		}
		
		//redirect to searchresults.jsp
		//resp.sendRedirect("/searchresults.jsp");
		
		//End Servlet
		
    }
	
	public boolean isPriceOnly(String[] inputs){
		boolean priceOnly = true;
		
		for (int i = 0; i < inputs.length; i++){
			if (!inputs[i].equalsIgnoreCase("*"))
				priceOnly = false;
		}
		return priceOnly;
	}
	
	//number= 5000 low =6000 hi=10000
	
	public boolean inRange(long number, int low, int hi){
		System.out.println("number: " + number);
		System.out.println("low: " + low);
		System.out.println("hi: " + hi);
		
		if (low == 0 & hi == 0)
			return true;
		else if (number >= low & number <= hi )
			return true;
		else
			return false;
		
	}
	
	public boolean checkDistance(long zip1, long zip2, double range){
		boolean inRange;
		double lat1, lat2, long1, long2, distance;
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Query query = new Query("zipCodes");
		Filter qFilter1 = new Query.FilterPredicate("zip", Query.FilterOperator.EQUAL, zip1);
		//query.addFilter("zip", Query.FilterOperator.EQUAL, zip1);
		query.setFilter(qFilter1);
		//System.out.println("Query: " + query);
		PreparedQuery pq1 = datastore.prepare(query);
		Entity result1 = pq1.asSingleEntity();
		
		//debug
		//System.out.println("zip1: " + zip1 + " zip2: " + zip2 + " range: " + range);
		//System.out.println("result1: " + result1);
		
		lat1 = (Double) result1.getProperty("Latitude");
		long1 = (Double) result1.getProperty("Longitude");
		
		System.out.println("result1: " + result1);
		
		Query query2 = new Query("zipCodes");
		Filter qFilter2 = new Query.FilterPredicate("zip", Query.FilterOperator.EQUAL, zip2);
		//query.addFilter("zip", Query.FilterOperator.EQUAL, zip2);
		query2.setFilter(qFilter2);
		PreparedQuery pq2 = datastore.prepare(query2);
		Entity result2 = pq2.asSingleEntity();
		lat2 = (Double) result2.getProperty("Latitude");
		long2 = (Double) result2.getProperty("Longitude");
		
		System.out.println("result2: " + result2);
		
		/**
		 * This is the implementation Haversine Distance Algorithm between two places
		 * @author ananth
		 *  R = earth’s radius (mean radius = 6,371km)
		    Δlat = lat2− lat1
		    Δlong = long2− long1
		    a = sin²(Δlat/2) + cos(lat1).cos(lat2).sin²(Δlong/2)
		    c = 2.atan2(√a, √(1−a))
		    d = R.c
		    
		// TODO Auto-generated method stub
        final int R = 6371; // Radious of the earth
        Double lat1 = Double.parseDouble(args[0]);
        Double lon1 = Double.parseDouble(args[1]);
        Double lat2 = Double.parseDouble(args[2]);
        Double lon2 = Double.parseDouble(args[3]);
        Double latDistance = toRad(lat2-lat1);
        Double lonDistance = toRad(lon2-lon1);
        Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) + 
                   Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * 
                   Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        Double distance = R * c;
         
        System.out.println("The distance between two lat and long is::" + distance);
 
    }
     
    private static Double toRad(Double value) {
        return value * Math.PI / 180;
    }
		 *
		 */
		
		final int R = 6371;
        Double latDistance = toRad(lat2-lat1);
        Double lonDistance = toRad(long2-long1);
        Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) + 
                   Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * 
                   Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        Double zipdistance = R * c;
         
        System.out.println("The distance between two lat and long is::" + zipdistance);
        
        int retval = Double.compare(zipdistance, range);
        
        if (retval < 0)
        	inRange = true;
        else if (retval == 0)
        	inRange = true;
        else
        	inRange = false;
		return inRange;
	}
	
    private static Double toRad(Double value) {
        return value * Math.PI / 180;
    }


}
