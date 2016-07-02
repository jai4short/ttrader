<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<HTML>
<HEAD>
</HEAD>
<BODY>

<%
    HttpSession mysession = request.getSession(false);
    if (mysession.getValue("access") != "loggedin"){
    	response.sendRedirect("/Tunedtrader.html");}
    else {
    	System.out.println(mysession.getServletContext());
    	System.out.println(mysession);
    	System.out.println(mysession.getId());
    	System.out.println(mysession.getCreationTime());
    	System.out.println(mysession.getValue("access"));}
    
DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

Query query = new Query("Vehicle");
Query query1 = new Query("Vehicle").addFilter("vclass", Query.FilterOperator.EQUAL, "EURO");

List<Entity> Vehicles = datastore.prepare(query).asList(FetchOptions.Builder.withLimit(15));
pageContext.setAttribute("Results", Vehicles);
List<Entity> Vehicles1 = datastore.prepare(query1).asList(FetchOptions.Builder.withLimit(10));
pageContext.setAttribute("Results1", Vehicles1);
%>

<p> ${fn:escapeXml(Results)} </p>
<br>
<br>
<p> ${fn:escapeXml(Results1)} </p>

</BODY>
</HTML>