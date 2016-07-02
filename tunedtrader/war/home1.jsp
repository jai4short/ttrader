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
      %>


<html class="homepage">
	<head>
		<!-- <link type="text/css" rel="stylesheet" href="Tunedtrader.css"> -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script type="text/javascript"> 



    $(document).ready(function(){
    $("#logodiv").fadeIn(5500);
    $("#menudiv").slideDown(2000);
    
    $("#menu").click(function(){
    $("#slink").animate({width: 'toggle'});
    $("#link").animate({width: 'toggle'});
    });

    $("#menu1").click(function(){
    $("#slink1").animate({width: 'toggle'});
    $("#link1").animate({width: 'toggle'});
    $("#link2").animate({width: 'toggle'});
    });
  });

function browse(value){
  document.getElementById("vclass").value=value.getAttribute("data-vclass");
  document.getElementById("browseform").submit();
}

function hideBeta(){
  document.getElementById("betaContainer").style.display="none";
  document.getElementById("fader").style.display="none";
}

function checkSess(){
      var ajax;

    if (window.XMLHttpRequest){
      ajax = new XMLHttpRequest();
    }
    else {
      ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
      
      ajax.open("GET", "/Access", true);
      ajax.onreadystatechange = function (){
        if (ajax.readyState == 4 && ajax.status == 200){
          var response = JSON.parse(ajax.responseText);
          if (response.sessionExists == true)
            hideBeta();
        }
      };
      ajax.send();
}

checkSess();

</script>

		<style type="text/css">

          #logo {
          	opacity: 1;
            width: 50%;
            height: auto;
            outline: 0px solid red;
            margin-left: 25%;
          }

          #logo1 {
            opacity: 1;
            width: auto;
            height: 85%;
            outline: 0px solid red;
            float: left;
            margin-left: 5%;
          }

          #logodiv {
          	outline: 0px solid green;
          	display: none;
            position: absolute;
            top: 35%;
            margin-top: 0px;
            transform: scale(1.1,1.1);
            -ms-transform: scale(1.1,1.1); /* IE 9 */
            -webkit-transform: scale(1.1,1.1);

          }

          #container {
            height: 130%;
            width: 100%;
            outline: 0px solid blue;
            background: url(images/tuned_home_bkgd.jpg);
            background-size:cover;
            background-repeat:no-repeat;
            position: relative;
          }

          #menudiv {
          	outline: 0px solid orange;
          	position: fixed; 
          	top: 0;
          	left: 0;
          	width: 80%;
          	background: white;
          	height: 50px;
          	opacity: 1;
            display:none;
          }

          a {
            text-decoration: none;
          }

          a:hover {
            background-color: yellow;
          }

          a:visited {
            background-color: white;
          }

          p.white {
          	color: white;
            font-family:Century Gothic, sans-serif;
          }

          p.gray {
            color: gray;
            font-family:Century Gothic, sans-serif;
          }

          #slink {
          	outline: 0px solid red;
          	display: none;
          	float: left;
          	width: 75px;
           
          }

           #link {
            outline: 0px solid red;
            display: none;
            float: left;
            width: 75px;
           
          }

          #slink1 {
            outline: 0px solid red;
            display: none;
            float: left;
            width: auto;
           
          }

           #link1 {
            outline: 0px solid red;
            display: none;
            float: left;
            width: auto
           
          }

          #link2 {
            outline: 0px solid red;
            display: none;
            float: left;
            width: auto;
           
          }

          #menu {
          	outline: 0px solid green;
          	width: 100px;
            float: left;
            cursor: pointer;
          }

          #menu1 {
            outline: 0px solid green;
            width: 100px;
            float: left;
          }

          #browse {

            outline: 0px solid yellow;
            width:auto;
            margin-left: 25%;
            cursor: pointer;

          }

          #fader {height: 130%; width: 100%; top: 0px; position: absolute; opacity: 0.5; background-color: black; z-index: 5;display: inherit;}

          #betaContainer {height: 80%; width: 80%; margin: 0 auto; background-color: white; z-index: 6; top: 10%; position: absolute; left: 10%; display: inherit;}

          .l {
            color; gray;
            font-family:Century Gothic, sans-serif;
          }

          .l1 {
            color; white;
            font-family:Century Gothic, sans-serif;
          }

          .center {
            margin: 0 auto;

          }

          .shadow {
            text-shadow: 2px 2px 5px black
          }

          .white {
            font-family: Helvetica, sans-serif;
            color: white;
          }

          .huge {
          font-size: 600%;
          }

          .large {
            font-size: 300%;
          }

          .big {
            font-size: 200%;
          }

          .medium {
            font-size: 100%;
          }

          .fb {
            font-family: Helvetica, sans-serif;
            color: black;
          }

          .show {
            outline: 1px dotted red;
          }

          .blackborder {
            outline: 1px solid gray;
          }
		</style>
		<title> TunedTrader.com </title>;
	</head>
	<body>
    <div id="fader" onclick="hideBeta()" style="cursor: pointer;">
      &nbsp;
    </div>
    <div id="betaContainer" style="padding-top:0px;">
      <div class="center" style="height: 80%; width: 80%; overflow: scroll; position: relative; top: 10%;">
        <!-- <center> <p class="white shadow huge"> Hola. </p></center> -->
          <p>
            <span class="fb large">Beta Use Agreement</span>
            <br>
            <span class="fb medium"> Welcome to the test drive! We're still in Beta which means we are still working on fixing a few bugs. Either way, you're free to use the site and would appreciate if you could give us some feedback on the functionality that has already been completed. Before you do though, go ahead and check out our Beta Use Agreement below.  If you've already read it <span style="cursor: pointer;" onclick="hideBeta()"> <b> click here to start using the site. </b> </span> </span>
          <br>
          <br>
          <span class="fb big">Terms</span>
          <br>
          <span class="fb medium">TunedTrader.com is an online classifieds application dedicated to simplifying the purchasing process for both buyers and seller's of performance enhanced used automobiles and aftermarket parts.  All software and visual elements of the site are the sole intellectual property of TunedTrader.com.  As a beta user you are granted permission to utilize the application solely for the purposes of assisting us in identifying defects as well as to find/sell great cars. You are not being offered any ownership or compensation for your use or any feedback you choose to provide.  As a beta user you are asserting that you are not an employee/contractor of any of the following companies: Autotrader or Cox Communications, Edmunds.com, Cars.com, Cardomain.com, TrueCar.com, eBay.com, cargurus.com, carsforsale.com, speedlist.com, or dupontregistry.com.  As a beta user you are consenting to the above statements and declarations and are not permitted use of TunedTrader.com if you do not consent. </span>
          <br>
          <br>
          <span class="fb big">Known Issues</span>
          <br>
          <span class="fb medium">So in case you missed it before, this release is in Beta.  That means there may be some bugs or defects in the functionality or appearance of the site.  Here are the known issues: </span>
          <br>
          <br>
          <ul>
            <li>
              <p class="fb medium">
           The appearance of certain User Interface elements may appear distorted on any browser besides Google Chrome
              </p>
            </li>
            <li>
              <p class="fb medium">
          Certain User Interface elements may appear distorted when the page or browser window is resized
        </p>
      </li>
      <li>
        <p class="fb medium">
          Certain vehicle details such as year, make, and model may not be present when selecting vehicle details in both the sell and search pages 
        </p>
      </li>
      <li>
        <p class="fb medium">
          Some vehicle detail text may include random special characters
        </p>
      </li>
      <li>
        <p class="fb medium">
          Searching for an invalid zip code may throw an error from the server
        </p>

    </ul>
    <br>
    <br>
    <span class="fb big">Privacy</span>
    <br>
    <span class="fb medium">
    At this time, TunedTrader.com is only collecting information regarding vehicles uploaded and associated email addresses.  We are not currently sharing any data with any outside entities beyond Google who is the platform host of this application.
  </span>
  <br>
  <br>
  <span class="fb big">Contact</span>
  <br>
  <span class="fb medium">Please direct all feedback, comments, questions, or suggestions via email to admin@tunedtrader.com.  We thank you for taking the time to check out the site, and encourage you to help us improve it for both you and our other users! Stay Tuned
  </span>
          

         
      </div>
    </div>
    <div id="container">
		   <div id="menudiv"> 
        <DIV>
          <a href="/home.html" > <img id="logo1" src="images/tuned_logo_white.png"> </a>
        </DIV>
        <div style="float:left; width: 30%;">
          &nbsp;
        </div>
			 <div id="menu">
				  <p class="gray"> Menu + </p>
			 </div>	
			 <div id="slink">
				  <a href="/sell.jsp" > <p class="gray"> Sell </p> </a>
			 </div>	
        <div id="link">
          <a href="/search.jsp" > <p class="gray"> Search </p> </a>
        </div>
		  </div>
		  <div id="logodiv" class="center">
			 <img class="center" id="logo" src="images/tuned_home_text.png">
       <div id="browse">
        <div id="menu1">
          <p class="white"> Browse </p>
        </div>
        <div id="slink1" >
           <p class="white" data-vclass="DOMESTIC" onclick="browse(this)"> Domestic &nbsp; || &nbsp; </p> 
       </div> 
        <div id="link1">
           <p class="white" data-vclass="IMPORT" onclick="browse(this)"> Import &nbsp; || &nbsp; </p>
        </div>
        <div id="link2">
           <p class="white" data-vclass="EURO" onclick="browse(this)"> Euro </p> 
        </div>
        <form id="browseform" action="/browseController" method="post">
          <input type="hidden" id="vclass" name="vclass">
        </form>
       </div>
		  </div>
      <div>
      </div>
    </div>
	</body>
</html>