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
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.tunedtrader.client.*" %>
<%@ page import="com.tunedtrader.emailService.*" %>
<%@ page import="com.tunedtrader.login.*" %>
<%@ page import="com.tunedtrader.search.*" %>
<%@ page import="com.tunedtrader.search.browse.*" %>
<%@ page import="com.tunedtrader.search.results.*" %>
<%@ page import="com.tunedtrader.server.*" %>
<%@ page import="com.tunedtrader.shared.*" %>
<%@ page import="com.tunedtrader.upload.*" %>
<%@ page import="com.tunedtrader.vehicle.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    HttpSession mysession = request.getSession(false);

    System.out.println(mysession);

    if (mysession.getAttribute("access")==null) {
      System.out.println("The session is null");
      response.sendRedirect("/Tunedtrader.html");
    }
%>

<!DOCTYPE HTML>
<HTML>
<HEAD>
</HEAD>
<BODY>

<%
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