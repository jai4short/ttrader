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


<html >
	<head>
		<link type="text/css" rel="stylesheet" href="vehicle_Tunedtrader.css">
		<title>Search Results </title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script > $(document).ready(function(){
            
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
        </script>
        <style type="text/css">
        img.photos {
        	height:auto;
        	width:auto;
        	outline: 0px solid green;
        }
        </style>
        <script type="text/javascript">
        	function changeImage(id){
        		var photo = "url('" + id.src + "')";
        		document.getElementById("imageviewer").style.backgroundImage=photo;
        		
        	}
        </script>
	</head>
	<body>
		<div id="container">
			<div id="menudiv"> 
                <div>
                    <img id="logo1" src="images/tuned_logo_white.png">
                </div>
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
            <div style="height: 5%">
            	&nbsp;
            </div>
			<div class="content">
			<br>
			<%
				String model = (String) request.getAttribute("model");
				String mileage = (String) request.getAttribute("mileage");
				String intake = (String) request.getAttribute("intake");
				String wheels = (String) request.getAttribute("wheels");
				String suspension = (String) request.getAttribute("suspension");
				String trans = (String) request.getAttribute("trans");
				String price = (String) request.getAttribute("price");
				String vclass = (String) request.getAttribute("vclass");
				String email = (String) request.getAttribute("email");
				String year = (String) request.getAttribute("year");
				String exhaust = (String) request.getAttribute("exhaust");
				String make = (String) request.getAttribute("make");
				String brakes = (String) request.getAttribute("brakes");
				String keyphoto = (String) request.getAttribute("photo");
				String photo2 = (String) request.getAttribute("photo2");
				String photo3 = (String) request.getAttribute("photo3");
				String photo4 = (String) request.getAttribute("photo4");
			%>
			<div id="imageviewer" style=" width: 50%; height: 75%; outline: 1px dotted blue; background-image:url(<% out.println(keyphoto); %>); float:left; background-size:cover;">
				&nbsp;
			</div>
			<div id="vehicleimages" style="width:25%; height:75%; outline:1px dashed red; float:left; overflow-y:scroll;">
				<table>
					<tr>
						<td>
							<img id="mainphoto" onclick="changeImage(this)" src=" <% out.println(keyphoto); %>" />
						</td>
					</tr>
					<tr>
						<td>
							<img class="photos" id="photo1" onclick="changeImage(this)" src=" <% out.println(photo2); %>" />
						</td>
					</tr>
					<tr>
						<td>
							<img class="photos" id="photo2" onclick="changeImage(this)" src=" <% out.println(photo3); %>" />
						</td>
					</tr>
					<tr>
						<td>
							<img class="photos" id="photo3" onclick="changeImage(this)" src=" <% out.println(photo4); %>" />
						</td>
					</tr>
				</table>
			</div>
			<div id="vehicleinfo" style="width:25%; height:75%; outline: 1px dotted green; float:right; overflow-y:scroll;">
				<table width="100%" border="0" style="border: 1px dotted gray; margin: 0 auto;">
					<tr>
						<td>
							<h1>$ <% out.println(price); %> </h1>
						</td>
					</tr>
						<td>
							<p> Contact: <% out.println(email); %> </p>
						</td>
					</tr>
						<!-- <td>
							<img class="photos" src=" <% out.println(photo3); %>" />
						</td>
						<td>
							<img class="photos" src=" <% out.println(photo4); %>" />
						</td> -->
					<tr>
						<td>
							<p> Class: <% out.println(vclass); %> </p>
						</td>
					</tr>
						<td>
							<p> Year: <% out.println(year); %> </p>	
						</td>
					</tr>
					<tr>
						<td>
							<p> Make: <% out.println(make); %> </p>
						</td>
					</td>
					<tr>
						<td>
							<p> Model: <% out.println(model); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Mileage: <% out.println(mileage); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Intake: <% out.println(intake); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Transmission: <% out.println(trans); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Exhaust: <% out.println(exhaust); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Suspension: <% out.println(suspension); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Brakes: <% out.println(brakes); %> </p>
						</td>
					</tr>
					<tr>
						<td>
							<p> Wheels: <% out.println(wheels); %> </p>
						</td>
					</tr>
				</table>
				<br> <br> <br> <br> <br> <br>
			</div>
				
			<%
			%>
				
			</div>
		</div>
	</body>
</html>