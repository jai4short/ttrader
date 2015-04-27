package com.tunedtrader.login;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;




public class Access extends HttpServlet {
	
	HttpSession mysession;
	betaUser user = new betaUser();
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

		String token = "P@$$w0rd";
		String token2 = "@cc3$$";
		boolean accessgranted;
		String accessStatus = "loggedin";
		
		mysession = req.getSession(true);
		
		final String accesstoken = req.getParameter("accesspass");
		
		System.out.println(accesstoken);
		
		if (accesstoken.equals(token)){
			user.setKey(accessStatus);
			mysession.setAttribute("access", user);
			
	    	System.out.println(mysession.getServletContext());
	    	System.out.println(mysession);
	    	System.out.println(mysession.getId());
	    	System.out.println(mysession.getCreationTime());
			resp.sendRedirect("/home.jsp");
			accessgranted = true;
			System.out.println("Access granted");
		}
		
		else if (accesstoken.equals(token2)) {
			resp.sendRedirect("/login.jsp");
			accessgranted = false;}
			
		else {
			resp.sendRedirect("/tunedtrader.html");
			accessgranted = false;
			System.out.println("Access denied");
		}
			
		
    }

	public void doGet(HttpServletRequest req, HttpServletResponse resp){
		boolean session;
		
		if (mysession == null){
			session = false;
			mysession = req.getSession(true);
			mysession.setMaxInactiveInterval(27000);
		}
	else {
		session = true;
		}
		
		JSONObject json = new JSONObject();
		String jsonout = null;
		try {
			json.put("sessionExists", session);
			jsonout = json.toString();
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
}
