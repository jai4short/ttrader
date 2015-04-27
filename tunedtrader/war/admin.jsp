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

<html>
<body>
<form action="/adminController" method="post">
<input type="radio" name="datakind" value="zip">Zip</input>
<input type="radio" name="datakind" value="vehicle">Vehicle</input>
<textarea rows="100" cols="100" name="input">
</textarea>
<button type="submit" value="Run" />
</form>
</body>
</html>