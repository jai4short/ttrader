package com.tunedtrader.search.results;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;

public class VehiclePage extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	
	//Get vehicle info from searchresults.jsp
	String vehiclePhotoUrl = req.getParameter("vehicle");
	String vehiclekey = req.getParameter("key");
	Key key = KeyFactory.stringToKey(vehiclekey);
	System.out.println(vehiclePhotoUrl);
	System.out.println(vehiclekey);
	
	//create query to retrieve additional vehicle info
	Query q = new Query("Vehicle").addFilter(Entity.KEY_RESERVED_PROPERTY, Query.FilterOperator.EQUAL, key);
	
	PreparedQuery pq = datastore.prepare(q);
	
	//retrieve one single result for query
	Entity result = pq.asSingleEntity();
	
	System.out.println(result);
	
	String model = (String) result.getProperty("model");
	String mileage = String.valueOf(result.getProperty("mileage"));
	String intake = (String) result.getProperty("intake");
	String wheels = (String) result.getProperty("wheels");
	String suspension = (String) result.getProperty("suspension");
	String trans = (String) result.getProperty("trans");
	String price = String.valueOf(result.getProperty("price"));
	String vclass = (String) result.getProperty("vclass");
	String email = (String) result.getProperty("email");
	String year = String.valueOf(result.getProperty("year"));
	String exhaust = (String) result.getProperty("exhaust");
	String make = (String) result.getProperty("make");
	String hpRange = getHorsePower((String) result.getProperty("range"));
	String desc = (String) result.getProperty("description");
	String brakes = (String) result.getProperty("brakes");
	Long zip = (Long) result.getProperty("zip");
	BlobKey keyphoto = (BlobKey) result.getProperty("keyphoto");
	BlobKey photo2 = (BlobKey) result.getProperty("photo2");
	BlobKey photo3 = (BlobKey) result.getProperty("photo3");
	BlobKey photo4 = (BlobKey) result.getProperty("photo4");
	
	System.out.println("data successfully retrieved from datastore");
	
	//String vmileage = Integer.toString(mileage);
	//String vprice = Integer.toString(price);
	//String vyear = Integer.toString(year);
	
	String imageurl = checkBlob(keyphoto);
	String imageurl2 = checkBlob(photo2);
	String imageurl3 = checkBlob(photo3);
	String imageurl4 = checkBlob(photo4);
	String location = getLocation(zip);
	
	System.out.println("Image url is: " + imageurl);
	
	System.out.println("Non strings converted successfully");
	
	//attempt to send information to searchresults.jsp
	req.setAttribute("model", model);
	req.setAttribute("mileage", mileage);
	req.setAttribute("intake", intake);
	req.setAttribute("wheels", wheels);
	req.setAttribute("suspension", suspension);
	req.setAttribute("trans", trans);
	req.setAttribute("price", price);
	req.setAttribute("vclass", vclass);
	req.setAttribute("email", email);
	req.setAttribute("year", year);
	req.setAttribute("exhaust", exhaust);
	req.setAttribute("make", make);
	req.setAttribute("horsepower", hpRange);
	req.setAttribute("brakes", brakes);
	req.setAttribute("photo", imageurl);
	req.setAttribute("photo2", imageurl2);
	req.setAttribute("photo3", imageurl3);
	req.setAttribute("photo4", imageurl4);
	req.setAttribute("desc", desc);
	req.setAttribute("location", location);
	
	System.out.println("Attributes set");
	
	RequestDispatcher reqDispatcher = getServletConfig().getServletContext().getRequestDispatcher("/vehicleresult.jsp");
	try {
		reqDispatcher.forward(req, resp);
		System.out.println("search results sent to JSP");
	} catch (ServletException e) {
		// TODO Auto-generated catch block
		System.out.println("Search results failed to send to JSP");
		e.printStackTrace();
		}
	}
	
	public String checkBlob(BlobKey blob){
		ServingUrlOptions option;
		String image;
		ImagesService imageservice = ImagesServiceFactory.getImagesService();
		
		if (blob == null){
			image = "/images/noimage.jpg";
			System.out.println("no blob. replacing with noimage url.");
			return image;
		}
		else{
			BlobInfoFactory blobInfoFactory = new BlobInfoFactory();
			BlobInfo blobInfo = blobInfoFactory.loadBlobInfo(blob);
			Long blobSize = blobInfo.getSize();
			if (blobSize == 0){
				image = "/images/noimage.jpg";
				System.out.println("no blob. replacing with noimage url.");
				return image;
			}
			else{
			option = ServingUrlOptions.Builder.withBlobKey(blob);
			System.out.println("blob was found.");
			System.out.println("option: " + option);
			image = imageservice.getServingUrl(option);
			return image;
			}
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		String vehiclekey = req.getParameter("key");
		Key key = KeyFactory.stringToKey(vehiclekey);
		System.out.println(vehiclekey);
		
		//create query to retrieve additional vehicle info
		Query q = new Query("Vehicle").addFilter(Entity.KEY_RESERVED_PROPERTY, Query.FilterOperator.EQUAL, key);
		
		PreparedQuery pq = datastore.prepare(q);
		
		//retrieve one single result for query
		Entity result = pq.asSingleEntity();
		
		System.out.println(result);
		
		String model = (String) result.getProperty("model");
		String mileage = String.valueOf(result.getProperty("mileage"));
		String intake = (String) result.getProperty("intake");
		String wheels = (String) result.getProperty("wheels");
		String suspension = (String) result.getProperty("suspension");
		String trans = (String) result.getProperty("trans");
		String price = String.valueOf(result.getProperty("price"));
		String vclass = (String) result.getProperty("vclass");
		String email = (String) result.getProperty("email");
		String year = String.valueOf(result.getProperty("year"));
		String exhaust = (String) result.getProperty("exhaust");
		String make = (String) result.getProperty("make");
		String hpRange = getHorsePower((String) result.getProperty("range"));
		String brakes = (String) result.getProperty("brakes");
		String desc = (String) result.getProperty("description");
		BlobKey keyphoto = (BlobKey) result.getProperty("keyphoto");
		Long zip = (Long) result.getProperty("zip");
		BlobKey photo2 = (BlobKey) result.getProperty("photo2");
		BlobKey photo3 = (BlobKey) result.getProperty("photo3");
		BlobKey photo4 = (BlobKey) result.getProperty("photo4");
		String location = getLocation(zip);
		
		String imageurl = checkBlob(keyphoto);
		String imageurl2 = checkBlob(photo2);
		String imageurl3 = checkBlob(photo3);
		String imageurl4 = checkBlob(photo4);
		
		JSONObject json = new JSONObject();
		String jsonout = null;
		
		try {
			json.put("model", model);
			json.put("mileage", mileage);
			json.put("intake", intake);
			json.put("wheels", wheels);
			json.put("suspension", suspension);
			json.put("trans", trans);
			json.put("price", price);
			json.put("vclass", vclass);
			json.put("email", email);
			json.put("year", year);
			json.put("exhaust", exhaust);
			json.put("horsepower", hpRange);
			json.put("make", make);
			json.put("brakes", brakes);
			json.put("desc", desc);
			json.put("location", location);
			json.put("imageurl", imageurl);
			json.put("imageurl2", imageurl2);
			json.put("imageurl3", imageurl3);
			json.put("imageurl4", imageurl4);
			jsonout = json.toString();
			System.out.println(jsonout);
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		try {
			resp.setContentType("application/json");
		    resp.setHeader("Cache-Control", "no-cache");
			resp.getWriter().write(jsonout);
				System.out.println("The response was sent.");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("There was an error the response was not sent.");
				e.printStackTrace();
			}
		
			System.out.println("finished.");
		}
	
		public String getHorsePower(String range){
			String hpRange;
			if (range.equalsIgnoreCase("lowest"))
				hpRange = "100-200";
			else if (range.equalsIgnoreCase("low"))
				hpRange = "200-300";
			else if (range.equalsIgnoreCase("mid"))
				hpRange = "300-400";
			else if (range.equalsIgnoreCase("high"))
				hpRange = "400-500";
			else if (range.equalsIgnoreCase("highest"))
				hpRange = "500+";
			else
				hpRange = "undefined";
			
			return hpRange;
				
		}
		
		public String getLocation(Long zip){
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			
			String city, state, location;
			
			Query locationQuery = new Query("zipCodes");
			locationQuery.addFilter("zip", Query.FilterOperator.EQUAL, zip);
			PreparedQuery locationPQ = datastore.prepare(locationQuery);
			Entity resultEntity = locationPQ.asSingleEntity();
			city = (String) resultEntity.getProperty("City");
			state = (String) resultEntity.getProperty("State");
			location = city + ", " + state;
			
			return location;
		}
		
		
	}
	



