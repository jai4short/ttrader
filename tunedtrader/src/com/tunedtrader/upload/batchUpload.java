package com.tunedtrader.upload;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Text;

public class batchUpload extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		if (req.getParameter("jobName").equalsIgnoreCase("buyavette"))
			buyaVette(req);
	}

	public static void buyaVette(HttpServletRequest req){
		String make, model, contactemail, image, status;
		String descr;
		Text description;
		
		int year, zip, price;
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity vehicle = new Entity("Vehicle");
		
		year = Integer.parseInt(req.getParameter("year"));
		contactemail = req.getParameter("contactemail");
		image = req.getParameter("image");
		price = Integer.parseInt(req.getParameter("price"));
		zip = 30340;
		make = "Chevrolet";
		model = "Corvette";
		descr = req.getParameter("descr");
		description = new Text(descr);
		status = "active";
		
		
		vehicle.setProperty("make", make);
		vehicle.setProperty("model", model);
		vehicle.setProperty("year", year);
		vehicle.setProperty("keyphoto", image);
		vehicle.setProperty("zip", zip);
		vehicle.setProperty("year", year);
		vehicle.setProperty("email", contactemail);
		vehicle.setProperty("price", price);
		vehicle.setProperty("descr", description);
		vehicle.setProperty("status", status);
		vehicle.setProperty("vclass", "DOMESTIC");


		datastore.put(vehicle);
		
		System.out.println("vehicle loaded into datasore");
	}
}
