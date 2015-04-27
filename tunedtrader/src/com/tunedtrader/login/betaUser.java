package com.tunedtrader.login;

import java.io.Serializable;

public class betaUser implements Serializable {
	
	private String user;
	private String fName;
	private String lName;
	private String key;
	private String email;
	private String ipAddress;
	
	public betaUser(){
		
	}
	
	public betaUser(String user, String fName, String lName, String key, String email, String ipAddress){
		this.user = user;
		this.fName = fName;
		this.lName = lName;
		this.key = key;
		this.email = email;
		this.ipAddress = ipAddress;
	}
	
	//set methods
	
	public void setUser(String user){
		this.user = user;
	}
	
	public void setfName(String fName){
		this.fName = fName;
	}
	
	public void setlName(String lName){
		this.lName = lName;
	}
	
	public void setKey(String key){
		this.key = key;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public void setipAddress(String ipAddress){
		this.ipAddress = ipAddress;
	}
	
	//get methods
	
	public String getUser(){
		return user;
	}
	
	public String getfName(){
		return fName;
	}
	
	public String getlName(){
		return lName;
	}
	
	public String getKey(){
		return key;
	}
	
	public String getEmail(){
		return email;
	}
	
	public String getipAddress(){
		return ipAddress;
	}

}
