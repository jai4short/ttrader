package com.tunedtrader.login;

public class Seller {
	
	private int sellerID;
	private String username;
	private String password;
	private String email;
	
	public Seller(){
		
	}
	
	public Seller (int sellerID, String username, String password, String email){
		this.sellerID = sellerID;
		this.username = username;
		this.password = password;
		this.email = email;
	}
	
	public void setID(int ID){
		this.sellerID = ID;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public int getID(){
		return sellerID;
	}
	
	public String getUsername(){
		return username;
	}
	
	public String getPassword(){
		return password;
	}
	
	public String getEmail(){
		return email;
	}

}
