package com.tunedtrader.vehicle;

public class vehicle {
	private String vclass;
	private String make;
	private String model;
	private int year;
	private int mileage;
	private int horsepower;
	private String trans ;
	private String intake ;
	private String exhaust;
	private String sus ;
	private String brakes;
	private String wheels ;
	private String range;
	private int price;
	private int zip;
	private String desc;
	
	public vehicle (){
		
	}
	
	public vehicle (String vclass, String make, String model, int year, int mileage,
					int horsepower, String trans, String intake, String exhaust, String sus, String brakes, String wheels,
					int price, String Seller, String range, int zip, String desc){
		
		this.vclass = vclass;
		this.make = make;
		this.model = model;
		this.year = year;
		this.mileage = mileage;
		this.horsepower = horsepower;
		this.trans = trans;
		this.intake = intake;
		this.exhaust = exhaust;
		this.sus = sus;
		this.brakes = brakes;
		this.wheels = wheels;
		this.range = range;
		this.price = price;
		this.zip = zip;
		this.desc = desc;
	}
	
	public void setZip(int zip){
		this.zip = zip;
	}
	
	public void setVclass(String vclass){
		this.vclass = vclass;
	}
	
	public void setMake(String make){
		this.make = make;
	}
	
	public void setModel(String model){
		this.model = model;
	}
	
	public void setYear(int year){
		this.year = year;
	}
	
	public void setMileage(int mileage){
		this.mileage = mileage;
	}
	
	public void setHorsepower(int horsepower){
		this.horsepower = horsepower;
	}
	
	public void setTrans(String trans){
		this.trans = trans;
	}
	
	public void setIntake(String intake){
		this.intake = intake;
	}
	
	public void setExhaust(String exhaust){
		this.exhaust = exhaust;
	}
	
	public void setSus(String sus){
		this.sus = sus;
	}
	
	public void setBrakes(String brakes){
		this.brakes = brakes;
	}
	
	public void setWheels(String wheels){
		this.wheels = wheels;
	}
	
	public void setPrice(int price){
		this.price = price;
	}
	
	public void setRange(String range){
		this.range = range;
	}
	
	public void setDesc(String desc){
		this.desc = desc;
	}
	
	public int getZip(){
		return zip;
	}
	
	public String getVclass(){
		return vclass;
	}
	
	public String getMake(){
		return make;
	}
	
	public String getModel(){
		return model;
	}
	
	public String getRange(){
		return range;
	}
	
	public int getYear(){
		return year;
	}
	
	public int getMileage(){
		return mileage;
	}
	
	public int getHorsepower(){
		return horsepower;
	}
	
	public String getTrans(){
		return trans;
	}
	
	public String getIntake(){
		return intake;
	}
	
	public String getExhaust(){
		return exhaust;
	}
	
	public String getSus(){
		return sus;
	}
	
	public String getBrakes(){
		return brakes;
	}
	public String getWheels(){
		return wheels;
	}
	
	public int getPrice(){
		return price;
	}
	
	public String getDesc(){
		return desc;
	}
	
}
