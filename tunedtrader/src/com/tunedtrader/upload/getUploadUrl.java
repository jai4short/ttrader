package com.tunedtrader.upload;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

public class getUploadUrl extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		blobstoreService.createUploadUrl("/Upload");
		
		System.out.println(blobstoreService.createUploadUrl("/Upload"));
		System.out.println(blobstoreService.createUploadUrl("/Upload").toString());
	}

}
