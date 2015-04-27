<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    HttpSession mysession = request.getSession(false);
    if (mysession.getValue("access") != "loggedin")
    	response.sendRedirect("/Tunedtrader.html");
    else
    	System.out.println(mysession.getServletContext());
    	System.out.println(mysession);
    	System.out.println(mysession.getId());
    	System.out.println(mysession.getCreationTime());
    	System.out.println(mysession.getValue("access"));
    
%>



<html>
	<head>
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
			<script> $(document).ready(function(){
    											$("#container").fadeIn(5500);
    										});
			</script>

                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script > $(document).ready(function(){
    $("#menudiv").slideDown(2000);
    
    $("#menu").click(function(){
    $("#slink").animate({width: 'toggle'});
    $("#link").animate({width: 'toggle'});
    });
  });
</script>
		<style type="text/css">
			html { 
          		background: url(images/IMG_1072.jpg) no-repeat center center fixed; 
          		-webkit-background-size: cover;
          		-moz-background-size: cover;
          		-o-background-size: cover;
          		background-size: cover;
          	}

         

			form {
				color:white;
				font-family:Century Gothic, sans-serif;
			}

			select, input {
				background-color: black;
				font-family:Century Gothic, sans-serif;
				color:white;
				opacity:1.0;
				width:25%;
			}

/** Classes */

			.center {margin:0 auto; }


			.outline {outline:0px solid orange;}

			.content {
				height: auto; 
				width: 75%; 
				outline: 0px dotted blue;
				margin: 0 auto;
                background-color: black;
                opacity: .80;
                padding: 15px;
			}

/** I.D. */
          #menudiv {
            outline: 0px solid red;
            position: absolute; 
            top: 0;
            left: 0;
            width: 100%;
            background: none;
            height: 50px;
            opacity: 0.75;
            display:none;
          }

			#image1 {height:100%; width:100%;}

			#container {
				height:1200px;
				width:1200px;
				margin: 0 auto;
				outline:0px solid red;
			}

			#access {
				height:auto;
				width:400px;
				outline:0px dotted yellow;
			}

			#wrapper {
				height: 100%; 
				width: 75%; 
				outline: 0px dotted green;
				margin: 0 auto;

			}

			#logo {
				height:150px;
				width:auto;
                opacity: 0.5;
			}

/** Other */

			table {
				border: 0px solid purple;
			}

			h1 {
 				font-size: 2em;
  				font-weight: bold;
  				font-family:Century Gothic, sans-serif;
  				color: white;
  				margin: 40px 0px 70px;
  				text-align: center;
			}

			p {
				color: white;
				font-family:Century Gothic, sans-serif;
			}

			.sendButton {
  				display: block;
  				font-size: 16pt;
			}

			input {
					width: 200px;
			}

			select {
					width: 200px;
			}

/** Most GWT widgets already have a style name defined */
			.gwt-DialogBox {
  				width: 400px;
			}

			.dialogVPanel {
 				margin: 5px;
			}

			.serverResponseLabelError {
 				color: red;
			}

/** Set ids using widget.getElement().setId("idOfElement") */
			#closeButton {
  				margin: 15px 6px 6px;
			}
		</style>
		<title>Sell/Trade your car </title>
	</head>
	<body>
		<div id="container">
			<div id="wrapper">
                           <div id="menudiv"> 
             <div id="menu">
                  <p> Menu + </P>
             </div> 
             <div id="slink">
                  <a href="/sell.jsp" > <p class="l"> Sell </p> </a>
             </div> 
        <div id="link">
          <a href="/search.jsp" > <p class="l"> Search </p> </a>
        </div>
          </div>
				<center> <img id="logo" class="outline" src="images/tunedlogo_blk.png" > </center>

				<div class="content">
					<h1> Is it stock??? </h1>
					<p> Use the drop down menus to describe your car.  The more information provided, the higher your chances of selling/trading.
					For those who provide HP estimates please upload a copy of your latest dyno or have information regarding your HP estimate
					readily available.  For any aftermarket mods, please have documentation or information on hand regarding these modifications for potential buyers upon request.
					</p>
					<br>
					<p> <b> Vehicle Information </b> </p>
					<form action="<%= blobstoreService.createUploadUrl("/Upload") %>" enctype="multipart/form-data" method="post">
                        <table border="0">
                                <tr>
                                    <td>
                                        <table border="0">
                                            <tr>
                                                <td>
                                                    <p> Upload Key Photo:
                                                </td>
                                                <td>
                                                    <input type="file" name="myFile">;
                                                </td>
                                                <td>
                                                    <p> Transmission:
                                                </td>
                                                <td>
                                                    <select name="TRANS">
                                                        <option value="AUTO">AUTOMATIC</option>
                                                        <option value="MANUAL">MANUAL</option>
                                                        <option value="PADDLE">PADDLE</option>
                                                    </select> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   <p> Class:
                                                </td>
                                                <td>
                                                    <select name="vclass" value="class">
                                                        <option value="IMPORT">IMPORT</option>
                                                        <option value="DOMESTIC">DOMESTIC</option>
                                                        <option value="EURO">EURO</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <p> Intake:
                                                </td>
                                                <td>
                                                    <select>
                                                        <option value="STOCK">STOCK</option>
                                                        <option value="COLD">AFTERMARKET</option>
                                                        <option value="FORCED INDUCTION">SUPERCHARGED/TURBO</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   <p> Year:
                                                </td>
                                                <td>
                                                    <select name="YEAR">
                                                        <option value="2008">2008</option>
                                                        <option value="2003">2003</option>
                                                        <option value="2000">2000</option>
                                                     </select> 
                                                </td>
                                                <td>
                                                    <p> Exhaust:
                                                </td>
                                                <td>
                                                    <select name="EXHAUST">
                                                        <option value="STOCK">STOCK</option>
                                                        <option value="AFTERMARKET1"> FULL AFTERMARKET</option>
                                                        <option value="AFTERMARKET2">AFTERMARKET--HEADERS ONLY</option>
                                                    </select> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p> Make:
                                                </td>
                                                <td>
                                                    <select name="make" value="make">
                                                        <option value="BMW">BMW</option>
                                                        <option value="FORD">FORD</option>
                                                        <option value="INFINITI">INFINITI</option>
                                                        <option value="HONDA">HONDA</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <p> Suspension:
                                                </td>
                                                <td>
                                                    <select name="SUSPENSION">
                                                        <option value="STOCK">STOCK</option>
                                                        <option value="AFTERMARKET1"> LOWERED--SPRINGS ONLY</option>
                                                        <option value="AFTERMARKET2">FULL SUSPENSION</option>
                                                    </select> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p> Model:
                                                </td>
                                                <td>
                                                    <input type="text" name="model" value="MODEL"> 
                                                </td>
                                                <td>
                                                    <p> Brakes:
                                                </td>
                                                <td>
                                                    <select name="BRAKES">
                                                        <option value="STOCK">STOCK</option>
                                                        <option value="AFTERMARKET1"> AFTERMARKET</option>
                                                        <option value="AFTERMARKET2">RACING</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   <p> Mileage:
                                                </td>
                                                <td>
                                                    <input type="text" name="mileage" value="MILEAGE">
                                                </td>
                                                <td>
                                                    <p> Wheels:
                                                </td>
                                                <td>
                                                    <select name="WHEELS">
                                                        <option value="STOCK">STOCK</option>
                                                        <option value="AFTERMARKET1"> AFTERMARKET</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p> Horsepower:
                                                </td>
                                                <td>
                                                    <select name="HP">
                                                        <option value="LOW">200-300HP*</option>
                                                        <option value="MED">300-400HP*</option>
                                                        <option value="HIGH">400-500HP*</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    
                                                </td>
                                                <td>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0">
                                            <tr>
                                                <td>
                                                   <p> Price:
                                                </td>
                                                <td>
                                                    <input type="text" name="price" value="PRICE">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p> Email:
                                                </td>
                                                <td>
                                                    <input type="text" name="contactemail" value="CONTACT EMAIL">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="submit" value="Submit" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                        </table>    
					</form> 
				</div>
			</div>
		</div>
	</body>
</html>