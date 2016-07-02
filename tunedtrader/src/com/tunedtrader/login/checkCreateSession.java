package com.tunedtrader.login;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checkCreateSession extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res){
		/** BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

	    //HttpSession mysession = request.getSession(false);
	    HttpSession mysession;
	    mysession = request.getSession(true);
	    //mysession.setMaxInactiveInterval(2700);

	    System.out.println(mysession);

	    //if (mysession.getAttribute("access")==null) {
	      //System.out.println("The session is null");
	      //response.sendRedirect("/Tunedtrader.html");

	      if (mysession.getAttribute("access")==null) {
	      %> <script type="text/javascript"> alert("Creating Session!")</script>
	      <%
	      mysession.setAttribute("access", "loggedin");
	      mysession.setMaxInactiveInterval(2700);
	      }
	      else {
	      System.out.println("Session is already created.");
	      } **/
	}
}
