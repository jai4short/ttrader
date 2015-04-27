package com.tunedtrader.admin;

import java.util.Scanner;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.tunedtrader.vehicle.vehicle;

public class adminUpload extends HttpServlet {

public void doPost(HttpServletRequest req, HttpServletResponse res){
	String input = req.getParameter("input");
	String datakind = req.getParameter("datakind");

	if (datakind.equalsIgnoreCase("Vehicle")){
		System.out.println("vehicle input received");
		loadVehicles(input);}
	else if (datakind.equalsIgnoreCase("Zip"))
		loadZips(input);
}

public static void loadVehicles(String input){
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	String[] list;
	int i = 0;
		System.out.println("Attempting to read input.");
		Scanner scanner = new Scanner(input);
		while (scanner.hasNextLine()){
			Entity vehicles = new Entity("VehicleList");
			String line = scanner.nextLine();
			System.out.println(line);
			list = line.split(" ", 3);
			int year = Integer.parseInt(list[0]);
			String make = list[1];
			String model = list[2];
			vehicle vehicle = new vehicle();
			vehicle.setYear(year);
			vehicle.setMake(make);
			vehicle.setModel(model);
			
			vehicles.setProperty("Year", vehicle.getYear());
			vehicles.setProperty("Make", vehicle.getMake());
			vehicles.setProperty("Model", vehicle.getModel());
			datastore.put(vehicles);
			i++;
		}
		scanner.close();
	
	System.out.println("Finished reading file.  Cars have been saved.");
	//return list;
	
}

public static void loadZips(String input){
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	String[] list;
	boolean nullCheck;
		System.out.println("Attempting to read input.");
		Scanner scanner = new Scanner(input);
		while (scanner.hasNextLine()){
			nullCheck = false;
			Entity zips = new Entity("zipCodes");
			String line = scanner.nextLine();
			System.out.println(line);
			list = line.split(",", 6);
			for (int j = 0; j < list.length; j++){
				if (list[j].isEmpty())
					nullCheck = true;
			}
			
			System.out.println("nullCheck: " + nullCheck);
			
			if (!nullCheck){
				System.out.println("Starting upload..");
				int zip = Integer.parseInt(list[0]);
				double latitude = Double.parseDouble(list[1]);
				double longitude = Double.parseDouble(list[2]);
				String city = list[3];
				String state = list[4];
				String county = list[5];
			
				zips.setProperty("zip", zip);
				zips.setProperty("Latitude", latitude);
				zips.setProperty("Longitude", longitude);
				zips.setProperty("City", city);
				zips.setProperty("State", state);
				zips.setProperty("County", county);

				datastore.put(zips);
				System.out.println("Upload completed..");
			}
			
		}
		scanner.close();
	
	System.out.println("Finished reading file.");
	//return list;
	
}
	/**
	 * @param args
	 */


}
