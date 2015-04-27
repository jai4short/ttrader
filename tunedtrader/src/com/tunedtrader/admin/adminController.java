package com.tunedtrader.admin;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.tunedtrader.vehicle.vehicle;

import static com.google.appengine.api.taskqueue.TaskOptions.Builder.*;

public class adminController extends HttpServlet {

public void doPost(HttpServletRequest req, HttpServletResponse res){
	
	String datakind = req.getParameter("datakind");
	System.out.println("datakind is : " + datakind);
	String input = req.getParameter("input");
	String queueName = "VehicleListUpload";
	int threshold;
	
	if (datakind.equalsIgnoreCase("Vehicle"))
		threshold = 2499;
	else if (datakind.equalsIgnoreCase("Zip"))
		threshold = 999;
	else
		threshold = 0;
	
	System.out.println("threshold is: " + threshold);
	
	String taskInput = null;
	
	Scanner scanner = new Scanner(input);
	int i = 0;
	int k = 0;
	while (scanner.hasNextLine()){
		//System.out.println("Loop has started and the datakind is: " + datakind + ". count is: " + i);
		if (taskInput == null)
			taskInput = scanner.nextLine();
		else 
			taskInput = taskInput + "\n" + scanner.nextLine();
		i++;
		k++;
		if (i > threshold & threshold > 0){
			System.out.println(taskInput);
			addTask(taskInput, queueName, datakind);
			taskInput = null;
			i = 0;
			System.out.println("Values have been reset. Count is: " + k);
		}
	}
	
	System.out.println(taskInput);
	addTask(taskInput, queueName, datakind);
	
	System.out.println("The number of inputs is " + k);
	
	try {
		res.sendRedirect("/");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	

	/** else if (data.equalsIgnoreCase("Zip"))
		readInput2(input); **/

	//System.out.println(input);
	

	
	}

	public static void storeVehicle(int year, String make, String model, Entity vehicles){
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		vehicle vehicle = new vehicle();
		vehicle.setYear(year);
		vehicle.setMake(make);
		vehicle.setModel(model);
		
		vehicles.setProperty("Year", vehicle.getYear());
		vehicles.setProperty("Make", vehicle.getMake());
		vehicles.setProperty("Model", vehicle.getModel());
		
		datastore.put(vehicles);
	}
	
	public static void addTask(String taskInput, String queueName, String dataKind){
		TaskOptions options = TaskOptions.Builder.withUrl("/adminUpload");
		options.param("input", taskInput);
		options.param("datakind", dataKind);
		Queue queue = QueueFactory.getQueue(queueName);
		queue.add(options);
		System.out.println("Task has been added to the queue");
	}
	
}
