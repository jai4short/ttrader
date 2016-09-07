package com.tunedtrader.admin;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.tunedtrader.vehicle.vehicle;

public class adminUpload extends HttpServlet {

public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
	String input = req.getParameter("input");
	String datakind = req.getParameter("datakind");
	String response = "";

	if (datakind.equalsIgnoreCase("Vehicle")){
		System.out.println("vehicle input received");
		response = loadVehicles(input);
		}
	else if (datakind.equalsIgnoreCase("Zip"))
		response = loadZips(input);
	else if (datakind.equalsIgnoreCase("Vehicle_JSON"))
		try {
			response = loadVehicleJSON(input);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	res.getWriter().write(response);
}

public static String loadVehicles(String input){
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
	
	return "Finished reading file.  Cars have been saved.";
	//return list;
	
}

public static String loadZips(String input){
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
	
	return "Finished reading file.";
	//return list;
	
}
	/**
	 * @param args
	 * @throws JSONException 
	 */
public static String loadVehicleJSON(String input) throws JSONException{
	JSONObject vehicle = new JSONObject(input);
	persistVehicle(vehicle);
	return input;
}

public static void persistVehicle(JSONObject vehicle){
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	Entity vehicleObj = new Entity("VehicleList_v2");
	String property;
	
	Iterator<String> vehicleIterator = vehicle.keys();
	
	while(vehicleIterator.hasNext()){
		property = (String) vehicleIterator.next();
		try {
			vehicleObj.setProperty(property, vehicle.get(property));
			
			//System.out.println(property + " : " + vehicle.get(property));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	datastore.put(vehicleObj);
	}
}
