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

<html class="homepage">
	<head>
		<!-- <link type="text/css" rel="stylesheet" href="Tunedtrader.css"> -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script> $(document).ready(function(){
    $().fadeIn(5500);
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

</script>

<script type="text/javascript" >

  function getModels(value){
    //alert(document.write(ajaxReq));
  var ajax;

  if (window.XMLHttpRequest){
    ajax = new XMLHttpRequest();
  }
  else {
    ajax = new ActiveXObject("Microsoft.XMLHTTP");
  }

    
    ajax.open("GET", "/modelController?make=" + value, true);
    ajax.onreadystatechange = function (){
      if (ajax.readyState == 4 && ajax.status == 200){
        var response = ajax.responseText;
        document.getElementById("model").innerHTML=response;
      }
    };
    ajax.send();
    //ajax.onreadystatechange = processReq(ajax);


  }

  function testAlert(){
    alert("This is a test function.");
  }
</script>


		<style type="text/css">

          html {

          }

          #logo {
          	opacity: 1;
            width: 50%;
            height: auto;
            outline: 1px solid red;
            margin-left: 25%;
          }

          #logo1 {
            opacity: 1;
            width: auto;
            height: 85%;
            outline: 1px solid red;
            float: left;
            margin-left: 5%;
          }

          #logodiv {
          	outline: 1px solid green;
            position: absolute;
            width: 100%;
            height: 50%;
            top: 55%;
            margin-top: 0px;
            transform: scale(1.1,1.1);
            -ms-transform: scale(1.1,1.1); /* IE 9 */
            -webkit-transform: scale(1.1,1.1);

          }

          #container {
            top: 0px;
            height: 100%;
            width: 100%;
            outline: 1px solid blue;
            background: url(images/tunes_sell3.jpg);
            background-size:cover;
            background-repeat:no-repeat;
            position: relative;
          }

          #menudiv {
          	outline: 1px solid orange;
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

          p {
            color: white;
            font-family:Helvetica, sans-serif;
          }

          p.gray {
            color: gray;
            font-family:Helvetica, sans-serif;
          }

          #slink {
          	outline: 1px solid red;
          	display: none;
          	float: left;
          	width: 75px;
           
          }

           #link {
            outline: 1px solid red;
            display: none;
            float: left;
            width: 75px;
           
          }

          #slink1 {
            outline: 1px solid red;
            display: none;
            float: left;
            width: auto;
           
          }

           #link1 {
            outline: 1px solid red;
            display: none;
            float: left;
            width: auto
           
          }

          #link2 {
            outline: 1px solid red;
            display: none;
            float: left;
            width: auto;
           
          }

          #menu {
          	outline: 1px  solid green;
          	width: 100px;
            float: left;
          }

          #menu1 {
            outline: 1px  solid green;
            width: 100px;
            float: left;
          }

          #browse {

            outline: 1px  solid yellow;
            width:auto;
            margin-left: 25%;

          }

          #content {
            width:45%; 
            height: 100%; 
            outline: 1px  solid blue; 
            float: right; 
            background: url(images/tuned_stang_drift.jpg); 
            background-size: cover;
            opacity: 0.5;
          }

          .l {
            color: white;
            font-family:Helvetica, sans-serif;
          }

          .l1 {
            color: white;
            font-family:Helvetica, sans-serif;
          }

          .center {
            margin: 0 auto;

          }

          select {
            background-color: white;
          }
		</style>
		<title> TunedTrader.com </title>
	</head>
	<body>
    <div id="container">
		  <div id="menudiv"> 
        <DIV>
          <a href="/home.jsp"> <img id="logo1" src="images/tuned_logo_white.png"> </a>
        </div>
        <div style="float:left; width: 30%;">
          &nbsp;
        </div>
        <div id="menu">
				  <p class="gray"> Menu + </P>
			 </div>	
			 <div id="slink">
				  <a href="/sell.jsp" > <p class="gray"> Sell </p> </a>
			 </div>
       <div id="link">
        <a href="/search.jsp" > <p class="gray"> Search </p> </a>
       </div>
		  </div>
      <div style="height: 30%;">
        &nbsp;
      </div>
      <div style="margin: 0 auto; outline: 1px solid white; width: 40%;">
        <img style="height: auto; width: 100%;" src="images/share_sell.png" />
      </div>
      <div id="logodiv">
          <div style="float: left; width: 10%;">
            &nbsp;
          </div>
          <div style="float:left; outline: 1px solid orange;">
            <form action="<%= blobstoreService.createUploadUrl("/Upload") %>" enctype="multipart/form-data" method="post">
              <table border="1" style="margin: 0 auto;">
                <tr>
                  <td>
                    <p> Upload Photo:
                  </td>
                  <td>
                    <input type="file" name="myFile">
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
                </tr>

                <tr>
                  <td>
                  <p> Year:
                  </td>
                  <td>                                                    
                    <select name="YEAR">
                      <option value="1990">1990</option>
                      <option value="1991">1991</option>
                      <option value="1992">1992</option>
                      <option value="1993">1993</option>
                      <option value="1994">1994</option>
                      <option value="1995">1995</option>
                      <option value="1996">1996</option>
                      <option value="1997">1997</option>
                      <option value="1998">1998</option>
                      <option value="1999">1999</option>
                      <option value="2000">2000</option>
                      <option value="2001">2001</option>
                      <option value="2002">2002</option>
                      <option value="2003">2003</option>
                      <option value="2004">2004</option>
                      <option value="2005">2005</option>
                      <option value="2006">2006</option>
                      <option value="2007">2007</option>
                      <option value="2008">2008</option>
                      <option value="2009">2009</option>
                      <option value="2010">2010</option>
                      <option value="2011">2011</option>
                      <option value="2012">2012</option>
                      <option value="2013">2013</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Make:
                  </td>
                  <td>                                                    
                    <select name="make" onchange="getModels(this.value)">
                      <option value="*">Make</option>
                      <option value="ACURA">Acura</option>
                      <option value="ALFA">Alfa Romeo</option>
                      <option value="AMC">AMC</option>
                      <option value="ASTON">Aston Martin</option> 
                      <option value="AUDI">Audi</option>
                      <option value="BENTL">Bentley</option>
                      <option value="BMW">BMW</option>
                      <option value="BUICK">Buick</option>
                      <option value="CAD">Cadillac</option>
                      <option value="CHEV">Chevrolet</option>
                      <option value="CHRY">Chrysler</option>
                      <option value="DAEW">Daewoo</option>
                      <option value="DATSUN">Datsun</option>
                      <option value="DELOREAN">DeLorean</option>  
                      <option value="DODGE">Dodge</option>  
                      <option value="EAGLE">Eagle</option>
                      <option value="FER">Ferrari</option>
                      <option value="FIAT">FIAT</option>  
                      <option value="FISK">Fisker</option>
                      <option value="FORD">Ford</option>  
                      <option value="FREIGHT">Freightliner</option>
                      <option value="GEO">Geo</option>  
                      <option value="GMC">GMC</option>
                      <option value="HONDA">Honda</option>
                      <option value="AMGEN">HUMMER</option>
                      <option value="HYUND">Hyundai</option>  
                      <option value="INFIN">Infiniti</option>
                      <option value="ISU">Isuzu</option>
                      <option value="JAG">Jaguar</option>
                      <option value="JEEP">Jeep</option>  
                      <option value="KIA">Kia</option>  
                      <option value="LAM">Lamborghini</option>
                      <option value="ROV">Land Rover</option> 
                      <option value="LEXUS">Lexus</option>
                      <option value="LINC">Lincoln</option> 
                      <option value="LOTUS">Lotus</option>  
                      <option value="MAS">Maserati</option> 
                      <option value="MAYBACH">Maybach</option>
                      <option value="MAZDA">Mazda</option>
                      <option value="MCLAREN">McLaren</option>
                      <option value="MB">Mercedes-Benz</option> 
                      <option value="MERC">Mercury</option> 
                      <option value="MINI">MINI</option>
                      <option value="MIT">Mitsubishi</option>
                      <option value="NISSAN">Nissan</option>  
                      <option value="OLDS">Oldsmobile</option>
                      <option value="PLYM">Plymouth</option>  
                      <option value="PONT">Pontiac</option> 
                      <option value="POR">Porsche</option>  
                      <option value="RAM">RAM</option>  
                      <option value="RR">Rolls-Royce</option>
                      <option value="SAAB">Saab</option>  
                      <option value="SATURN">Saturn</option>
                      <option value="SCION">Scion</option>
                      <option value="SMART">smart</option>
                      <option value="SRT">SRT</option>  
                      <option value="SUB">Subaru</option> 
                      <option value="SUZUKI">Suzuki</option>  
                      <option value="TESLA">Tesla</option>  
                      <option value="TOYOTA">Toyota</option>  
                      <option value="VOLKS">Volkswagen</option> 
                      <option value="VOLVO">Volvo</option>  
                      <option value="YUGO">Yugo</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Model:
                  </td>
                  <td>
                    <select type="text" id="model" name="model">
                      <option value="*">None specified</option>
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
                </tr>
              </table>
          </div>
          <div style="float: left; outline: 1px dotted red;">
              <table border="1">
                <tr>
                  <td>
                    <p> Intake:
                  </td>
                  <td>
                    <select mame="intake">
                      <option value="STOCK">STOCK</option>
                      <option value="COLD">AFTERMARKET</option>
                      <option value="FORCED INDUCTION">SUPERCHARGED/TURBO</option>
                    </select>
                  </td>
                </tr>
                <tr>
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
                    <p> *Horsepower:
                  </td>
                  <td>
                    <select name="HP">
                      <option value="lowest">100-200HP</option>
                      <option value="low">200-300HP</option>
                      <option value="mid">300-400HP</option>
                      <option value="high">400-500HP</option>
                      <option value="highest">500+HP</option>
                    </select>
                  </td>
                </tr>
              </table>
            </div>
            <div style="float: left; outline: 1px solid blue;">
              <table border="1">
                <tr>
                  <td>
                    <p> Photo 2:
                  </td>
                  <td>
                    <input type="file" name="myfile2">
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Photo 3:
                  </td>
                  <td>
                    <input type="file" name="myfile3">
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Photo 4:
                  </td>
                  <td>
                    <input type="file" name="myfile4">
                  </td>
                </tr>
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
                    <p> Contact Email:
                  </td>
                  <td>
                    <input type="text" name="contactemail" value="CONTACT EMAIL">
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp;
                  </td>
                </tr>
              </table> 
          </div>
          </div>
          <div style="outline: 1px  dotted purple; top: 85%; position: absolute; left:25%;">
            <table border="1">
              <tr>
                <td>
                  <p> Are you interested in trading this vehicle?
                </td>
                <td>
                  <select name="trade">
                    <option value="No">No</option>
                    <option value="Yes">Yes</option>
                  </td>
                  <td>
                  <p> Are you interested in swapping this vehicle?
                </td>
                <td>
                  <select name="swap">
                    <option value="No">No</option>
                    <option value="Yes">Yes</option>
                  </td>
              </tr>
              <tr>
                <td>
                  <input type="submit" value="Submit" />
                </td>
              </tr>
            </table>
          </div>
        </form>
      </div>
      <div style="height: 5%;">
        &nbsp;
      </div>
      <div style="outline: 1px dashed green; float: left; width: 60%;">
        <img style="width: 100%; height: auto;" src="images/tuned_text2.png" /> 
      </div>
      <div style="width:5%; float: left;">
        &nbsp;
      </div>
      <div style="width: 30%; outline: 1px dashed yellow; float: left;">
        <p style="color: black;"> <b> Sell your ride in just a few clicks! </b>  Tell us a little bit about your car.  Potential buyers will be able to search based on the information you provide so give us all the details. <br> <br> *Estimated Horsepower
         </p>
      </div>
    </div>
	</body>
</html>