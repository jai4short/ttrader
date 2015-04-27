package com.tunedtrader.upload;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Map;


import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.KeyFactory;
import com.tunedtrader.emailService.emailBuilder;
import com.tunedtrader.login.Seller;
import com.tunedtrader.vehicle.vehicle;

@SuppressWarnings("serial")
public class Upload extends HttpServlet {
	
	//Create datastore objects and initialize
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
       
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		
	//create vehicle object
	vehicle Vehicle = new vehicle();
	Seller user = new Seller();
		
		
		
	//doPost method where actions take place
    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
    	
    	//mileage and price must be numbers
		int mileage;
		int price;
		int zip;
		//int horsepower;
		
		//If the mileage is left blank it should be converted from the placeholder text to 0 miles
		if (!req.getParameter("mileage").equals("MILEAGE"))
			mileage = Integer.parseInt(req.getParameter("mileage"));
		else
			mileage = 0;
		
		//price should operate based on the same principles as mileage
		if (!req.getParameter("price").equals("PRICE"))
			price = Integer.parseInt(req.getParameter("price"));
		else
			price = 0;
		
		if (!req.getParameter("zip").equals("ZIP"))
			zip = Integer.parseInt(req.getParameter("zip"));
		else
			zip = 0;
		
		/** if (!req.getParameter("HP").equals("HP"))
			horsepower = Integer.parseInt(req.getParameter("HP"));
		else
			horsepower = 0; **/
		
		/**
		//get blob size
		Map<String, List<BlobInfo>> blobsi = blobstoreService.getBlobInfos(req);
		long blobsize2 = ((BlobInfo) blobsi.get(1)).getSize();
		long blobsize3 = ((BlobInfo) blobsi.get(2)).getSize();
		long blobsize4 = ((BlobInfo) blobsi.get(3)).getSize();
		
		**/
    	
		//This is where the photos are uploaded.  They are stored in the datastore as blobs
    	Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
        BlobKey blobKey = blobs.get("myFile");
        
        //set other blobs to null 
        BlobKey blobKey2 = blobs.get("myfile2");
        BlobKey blobKey3 = blobs.get("myfile3");
        BlobKey blobKey4 = blobs.get("myfile4");
        
        /**
        //if blob size is greater than 0 then blob must be null: delete blob
        if (blobsize2 == 0){
        	((BlobstoreService) blobs).delete(blobKey2);
        	blobKey2 = null;
        }
        if (blobsize3 == 0){
        	((BlobstoreService) blobs).delete(blobKey3);
        	blobKey3 = null;
        }
        if (blobsize4 == 0){
        	((BlobstoreService) blobs).delete(blobKey4);
        	blobKey4 = null;
        }
        **/
        
        //Check if vehicle is for trade/swap
        String trade = req.getParameter("trade");
        String swap = req.getParameter("swap");
        
        System.out.println("Blobs: " + blobs);
        
		//Transfer input into the vehicle object
		 Vehicle.setVclass(vehClass(req.getParameter("make"))); 
		 Vehicle.setMake(req.getParameter("make"));
		 Vehicle.setModel(req.getParameter("model"));
		 Vehicle.setYear(Integer.parseInt(req.getParameter("YEAR")));
		 Vehicle.setMileage(mileage);
		 Vehicle.setRange(req.getParameter("HP"));
		 Vehicle.setTrans(req.getParameter("TRANS"));
		 Vehicle.setIntake(req.getParameter("intake"));
		 Vehicle.setExhaust(req.getParameter("EXHAUST"));
		 Vehicle.setSus(req.getParameter("SUSPENSION"));
		 Vehicle.setBrakes(req.getParameter("BRAKES"));
		 Vehicle.setWheels(req.getParameter("WHEELS"));
		 Vehicle.setPrice(price);
		 Vehicle.setZip(zip);
		 Vehicle.setDesc(req.getParameter("descr"));
		 user.setEmail(req.getParameter("contactemail"));
		 
		 //if the blobkey is null send them to an error page (homepage for now)
        if (blobKey == null) {
            res.sendRedirect("/");
        } 
        
        else {
        	putVehicle(Vehicle, user, blobKey, blobKey2, blobKey3, blobKey4, trade, swap);
   		 	
   		 	System.out.println("BlobKey: " + blobKey);
   		 	System.out.println("BlobKey 2: " + blobKey2);
   		 	System.out.println("BlobKey 3: " + blobKey3);
   		 	System.out.println("BlobKey 4: " + blobKey4);
            res.sendRedirect("/uploaded.jsp");
        }
    }
    
    /** METHODS **/
    
    //putvehicle persists vehicle object data into the datastore
    public void putVehicle(vehicle Vehicle, Seller user, BlobKey blobKey, BlobKey blobKey2, BlobKey blobKey3, BlobKey blobKey4, String trade, String swap){
		 int hash = ((int) System.currentTimeMillis() % 100) + user.getEmail().hashCode();
		 System.out.println("the hashcode is: " + hash);
		 
		Entity vehicle = new Entity("Vehicle");
		
		vehicle.setProperty("vclass", Vehicle.getVclass());
		vehicle.setProperty("make", Vehicle.getMake());
		vehicle.setProperty("model", Vehicle.getModel());
		vehicle.setProperty("year", Vehicle.getYear());
		vehicle.setProperty("mileage", Vehicle.getMileage());
		//vehicle.setProperty("horsepower", Vehicle.getHorsepower());
		vehicle.setProperty("trans", Vehicle.getTrans());
		vehicle.setProperty("intake", Vehicle.getIntake());
		vehicle.setProperty("exhaust", Vehicle.getExhaust());
		vehicle.setProperty("suspension", Vehicle.getSus());
		vehicle.setProperty("brakes", Vehicle.getBrakes());
		vehicle.setProperty("wheels", Vehicle.getWheels());
		vehicle.setProperty("price", Vehicle.getPrice());
		vehicle.setProperty("range", Vehicle.getRange());
		vehicle.setProperty("email", user.getEmail());
		vehicle.setProperty("keyphoto", blobKey);
		vehicle.setProperty("photo2", blobKey2);
		vehicle.setProperty("photo3", blobKey3);
		vehicle.setProperty("photo4", blobKey4);
		vehicle.setProperty("trade", trade);
		vehicle.setProperty("swap", swap);
		vehicle.setProperty("description", Vehicle.getDesc());
		vehicle.setProperty("zip", Vehicle.getZip());
		vehicle.setProperty("verificationtoken", hash);
		vehicle.setProperty("status", "inactive");
		

		
		datastore.put(vehicle);
		
		//post ID
		com.google.appengine.api.datastore.Key vehicleKey = vehicle.getKey();
		String vehicleID = KeyFactory.keyToString(vehicleKey);
		System.out.println(vehicleID);
		
		 //send a verification email to the user
		 String message = "Please verify your email by going to www.tunedtrader.com/uploaded.jsp" +
				 			" and Entering your post ID and verification token. " +
				 			"Your verfication token is: " + hash + " " +
				 			"Your post ID is: " + vehicleID;
		 
		 System.out.println(message);
		 
		 emailBuilder email = new emailBuilder(message, "Thanks for posting your vehicle!", user.getEmail(), "Tuned Trader User");
		 email.buildMessage();

    	
    }
    
    //This method is intended to check whether a blob is empty or not and set a default image if none is set initially
    public BlobKey checkBlob(BlobKey blob){
    	if (blob == null){
    		blob = blobstoreService.createGsBlobKey("/gs/images/noimage.jpg");
    		return blob;
    	}
    	else{
    		return blob;
    	}  		
    }
    
    //this method will determine what class the vehicle is
    public String vehClass(String make){
    	String vClass = "";
    	String[] domestic = {"Buick", "Cadillac", "Chevrolet", "Chrysler", "Dodge", "Ford", "Mercury", "Pontiac" };
    	String[] euro = {"Audi", "BMW", "Bentley", "Bugatti", "Ferrari", "Fiat", "Jaguar", "Lamborghini", "Lotus", "Maserati", "Maybach", "Porsche", "Saab", "Volkswagen"};
    	String[] imp = {"Acura", "Honda", "Hyundai", "Infiniti", "Kia", "Lexus", "Mazda", "Mitsubishi", "Nissan", "Subaru", "Suzuki", "Toyota" };
    	
    	
    	if (inClass(make, domestic))
    		vClass = "DOMESTIC";
    	if (inClass(make, euro))
    		vClass = "EURO";
    	if (inClass(make, imp))
    		vClass = "IMPORT";

    	System.out.println("vehicle class: " + vClass);
    	return vClass;
    	
    }
    
    public boolean inClass(String make, String[] vClass){
    	boolean found = false;
    	for (int i = 0; i < vClass.length; i++){
    		if (make.equalsIgnoreCase(vClass[i]))
    			found = true;
    	}
    	return found;
    }
}
