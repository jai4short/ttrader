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
<%@page import="java.util.ArrayList" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    /** HttpSession mysession = request.getSession(false);

    System.out.println(mysession);

    if (mysession.getAttribute("access")==null) {
      System.out.println("The session is null");
      response.sendRedirect("/Tunedtrader.html");
    } **/
%>




<html>
	<head>
		<link type="text/css" rel="stylesheet" href="css/Results_Tunedtrader.css">
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
<script type="application/javascript">
    function showInfo(value){
        //document.getElementById("displayYear").innerHTML="This is a test";
        var key = value;
        getInfo(key);
    }

    function getInfo(value){
      //alert(document.write(ajaxReq));
        var ajax;

        if (window.XMLHttpRequest){
          ajax = new XMLHttpRequest();
        }
        else {
          ajax = new ActiveXObject("Microsoft.XMLHTTP");
        }
          
          ajax.open("GET", "/resultInfoController?key=" + value, true);
          ajax.onreadystatechange = function (){
            if (ajax.readyState == 4 && ajax.status == 200){
                var response = ajax.responseText;
                document.getElementById("resInfo").innerHTML=response;
              //alert("The request was received and a response was sent.");
              //document.getElementById("model").innerHTML=response;
            }
          };
          ajax.send();
      //ajax.onreadystatechange = processReq(ajax);
      }

          function getResult(value){
      //alert(document.write(ajaxReq));
        var ajax;

        if (window.XMLHttpRequest){
          ajax = new XMLHttpRequest();
        }
        else {
          ajax = new ActiveXObject("Microsoft.XMLHTTP");
        }
          
          ajax.open("GET", "/VehiclePage?key=" + value, true);
          ajax.onreadystatechange = function (){
            if (ajax.readyState == 4 && ajax.status == 200){
                var response = JSON.parse(ajax.responseText);
                var mainimage = "url('" + response.imageurl + "')";
                document.getElementById("displayimage").src=response.imageurl;
                document.getElementById("image1").src=response.imageurl;
                document.getElementById("image2").src=response.imageurl2;
                document.getElementById("image3").src=response.imageurl3;
                document.getElementById("image4").src=response.imageurl4;
                document.getElementById("cartitle").innerHTML=response.year + " " + response.make + " " + response.model;
                document.getElementById("price").innerHTML="$" + response.price;
                document.getElementById("horsepower").innerHTML=response.horsepower;
                document.getElementById("intake").innerHTML=response.intake;
                document.getElementById("exhaust").innerHTML=response.exhaust;
                document.getElementById("suspension").innerHTML=response.suspension;
                document.getElementById("brakes").innerHTML=response.brakes;
                document.getElementById("wheels").innerHTML=response.wheels;
                document.getElementById("contact").innerHTML=response.email;
                document.getElementById("mileage").innerHTML=response.mileage;
                document.getElementById("trans").innerHTML=response.trans;
                document.getElementById("description").innerHTML=response.desc;
                document.getElementById("location").innerHTML=response.location;

                showResult();
              
              //document.getElementById("model").innerHTML=response;
            }
          };
          ajax.send();
      //ajax.onreadystatechange = processReq(ajax);
      }

      function showResult(){
        document.getElementById("fader").style.display="block";
        document.getElementById("result").style.display="block";
      }

      function hideResult(){
        document.getElementById("fader").style.display="none";
        document.getElementById("result").style.display="none";
      }

    function changeImage(src){
    var photo = src;
    document.getElementById("displayimage").src=photo;
    
}
</script>
        <style type="text/css">
            img.photos {
            height:auto;
            width:auto;
            outline: 0px solid green;
        }

        .content1 {
    height: auto; 
    width: 100%; 
    border: 0px dotted orange;
    
    background-color: none;
    opacity: 1;
    padding: 15px;
    
}

    .resultimg{
        height: 100%;
        width: auto;
        display: inline-block;
        max-width: 40%;
        cursor: pointer;
    }
        </style>
	</head>
	<body>
        <div onclick="hideResult()" id="fader" style="display:none; outline:0px solid green; position:absolute; top: 0px; left: 0px; opacity:0.75; height:100%; width:100%; z-index:20; background-color:black; cursor:pointer;">
            &nbsp;
        </div>
        <div id="result" style="display: none; z-index:21; position:absolute; top: 15%; left: 15%; height: 75%; width: 75%; ">
            <div style="float: left; width:50%; height: 100%; outline:0px dotted red; background:transparent;">        
            <img id="displayimage" style="position: relative; vertical-align:middle; width:100%; height: auto; outline:0px dotted white;" />
            
            <!-- <p style="color:white;"> Click the edge of the screen to go back </p> -->
            <br>
            <p style="color:white;" id="description"></p>
            </div>
            <div id="resultcontainer" style="float:right; width:50%; height: 100%; outline: 0px solid green; background:transaparent;">
                <div id="imageslider" style="height: 25%; width: 100%; overflow-x:auto; overflow-y:auto; outline: 0px dashed blue; white-space:nowrap;">
                    <img id="image1" class="resultimg" onclick="changeImage(this.src)"/>
                    <img id="image2" class="resultimg" onclick="changeImage(this.src)"/>
                    <img id="image3" class="resultimg" onclick="changeImage(this.src)"/>
                    <img id="image4" class="resultimg" onclick="changeImage(this.src)"/>
                    
                </div>
                <!-- <p style="color:white;"> &nbsp; Scroll right for more pics --> </p> -->
                <div id="resultcontent" style="height: 75%; width: 100%; outline: 0px solid white; background:transparent;">
                    <center>
                        <h2 id="cartitle" style="color:white;"></h2>
                        <p id="location" style="color:white;"></p>
                    
                    <table style="border:0px black; font-color:black;">
                        <tr>
                            <td>
                                <p class="white"><b>price: </b></p>
                            </td>
                            <td>
                                <p class="white" id="price">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>horsepower: </b></p>
                            </td>
                            <td>
                                <p class="white" id="horsepower">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>mileage: </b></p>
                            </td>
                            <td>
                                <p class="white" id="mileage">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>intake:</b> </p>
                            </td>
                            <td>
                                <p class="white" id="intake">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>exhaust: </b></p>
                            </td>
                            <td>
                                <p class="white" id="exhaust">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>suspension: </b></p>
                            </td>
                            <td>
                                <p class="white" id="suspension">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>transmission: </b></p>
                            </td>
                            <td>
                                <p class="white" id="trans">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>brakes: </b></p>
                            </td>
                            <td>
                                <p class="white" id="brakes">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>wheels: </b></p>
                            </td>
                            <td>
                                <p class="white" id="wheels">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="white"><b>contact: </b></p>
                            </td>
                            <td>
                                <p class="white" id="contact">&nbsp;</p>
                            </td>
                        </tr>
                    </table>
                    </center>
                </div>
            </div>
        </div>
		<div id="container">
			<div id="menudiv"> 
                <div>
                    <a href="/home.jsp"> <img id="logo1" src="images/tuned_logo_white.png"> </a>
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
            <div style="height:5%">
                &nbsp;
            </div>
            
            <div style="float:left; border: 0px dotted red; border-radius: 0px; background-color: white; box-shadow: 5px 5px 25px 5px #585858; padding:5px; display:none;">
                    <form action="/SellServlet" method="post">
                    <table border="0" style="margin: 0 auto;">
                        <tr>
                            <td>
                                <h1> Modify search </h1>
                                <hr width="100%">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Class: &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="vclass" value="class">
                                    <option value="*">ALL</option>
                                    <option value="IMPORT">IMPORT</option>
                                    <option value="DOMESTIC">DOMESTIC</option>
                                    <option value="EURO">EURO</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Transmission: &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="TRANS">
                                    <option value="*">ALL</option>
                                    <option value="AUTO">AUTOMATIC</option>
                                    <option value="MANUAL">MANUAL</option>
                                    <option value="PADDLE">PADDLE</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <p> Year: &nbsp; 
                            </td>
                        </tr>
                            <td>
                              <p> Min: <br>
                              <select name="YEARL">
                                <option value="*">None</option>
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
 
                              <p> Max: <br>
                              <select name="YEARH">
                                <option value="*">None</option>
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
                                <p> Intake:
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <select name="INTAKE">
                                    <option value="*">ALL</option>
                                    <option value="STOCK">STOCK</option>
                                    <option value="COLD">AFTERMARKET</option>
                                    <option value="FORCED INDUCTION">SUPERCHARGED/TURBO</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Make: &nbsp; 
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <select name="make" value="make">
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
                                <p> Exhaust:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="EXHAUST">
                                    <option value="*">ALL</option>
                                    <option value="STOCK">STOCK</option>
                                    <option value="AFTERMARKET1"> FULL AFTERMARKET</option>
                                    <option value="AFTERMARKET2">AFTERMARKET--HEADERS ONLY</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Model: &nbsp; 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="model" value="MODEL"> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Suspension:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="SUSPENSION">
                                    <option value="*">ALL</option>
                                    <option value="STOCK">STOCK</option>
                                    <option value="AFTERMARKET1"> LOWERED--SPRINGS ONLY</option>
                                    <option value="AFTERMARKET2">FULL SUSPENSION</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Mileage: &nbsp;
                            </td>
                        <tr>
                            <td>
                              <p> Min: <br>
                              <select name="mileageL">
                                <option value="0">0</option>
                                <option value="10000">10,000</option>
                                <option value="20000">20,000</option>
                                <option value="30000">30,000</option>
                                <option value="40000">40,000</option>
                                <option value="50000">50,000</option>
                                <option value="60000">60,000</option>
                                <option value="70000">70,000</option>
                                <option value="80000">80,000</option>
                                <option value="90000">90,000</option>
                                <option value="100000">100,000</option>
                              </select>
                            
                              <p> Max: <br>
                              <select name="mileageH">
                                <option value="*">No max</option>
                                <option value="0">0</option>
                                <option value="10000">10,000</option>
                                <option value="20000">20,000</option>
                                <option value="30000">30,000</option>
                                <option value="40000">40,000</option>
                                <option value="50000">50,000</option>
                                <option value="60000">60,000</option>
                                <option value="70000">70,000</option>
                                <option value="80000">80,000</option>
                                <option value="90000">90,000</option>
                                <option value="100000">100,000</option>
                              </select>
                            </td>
                        </tr>cc
                        </tr>
                        <tr>
                            <td>
                                <p> Brakes:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="BRAKES">
                                    <option value="*">ALL</option>
                                    <option value="STOCK">STOCK</option>
                                    <option value="AFTERMARKET1"> AFTERMARKET</option>
                                    <option value="AFTERMARKET2">RACING</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Horsepower: &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="HP">
                                    <option value="*">ALL</option>
                                    <option vlaue="LOWEST">100-200HP</option>
                                    <option value="LOW">200-300HP</option>
                                    <option value="MED">300-400HP</option>
                                    <option value="HIGH">400-500HP</option>
                                    <option value="HIGHEST">500+HP</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Wheels:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="WHEELS">
                                    <option value="*">ALL</option>
                                    <option value="STOCK">STOCK</option>
                                    <option value="AFTERMARKET1"> AFTERMARKET</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p> Price:
                            </td>
                        </tr>
                        <tr>
                            <td>
                              <p> Min: <br>
                                <select name="priceL">
                                  <option value="0">$0</option>
                                  <option value="1000">$1,000</option>
                                  <option value="2000">$2,000</option>
                                  <option value="3000">$3,000</option>
                                  <option value="4000">$4,000</option>
                                  <option value="5000">$5,000</option>
                                  <option value="6000">$6,000</option>
                                  <option value="7000">$7,000</option>
                                  <option value="8000">$8,000</option>
                                  <option value="9000">$9,000</option>
                                  <option value="10000">$10,000</option>
                                  <option value="11000">$11,000</option>
                                  <option value="12000">$12,000</option>
                                  <option value="13000">$13,000</option>
                                  <option value="14000">$14,000</option>
                                  <option value="15000">$15,000</option>
                                  <option value="16000">$16,000</option>
                                  <option value="17000">$17,000</option>
                                  <option value="18000">$18,000</option>
                                  <option value="19000">$19,000</option>
                                  <option value="20000">$20,000</option>
                                  <option value="21000">$21,000</option>
                                  <option value="22000">$22,000</option>
                                  <option value="23000">$23,000</option>
                                  <option value="24000">$24,000</option>
                                  <option value="25000">$25,000</option>
                                  <option value="30000">$30,000</option>
                                  <option value="35000">$35,000</option>
                                  <option value="40000">$40,000</option>
                                  <option value="45000">$45,000</option>
                                  <option value="50000">$50,000</option>
                                  <option value="55000">$55,000</option>
                                  <option value="60000">$60,000</option>
                                  <option value="65000">$65,000</option>
                                  <option value="70000">$70,000</option>
                                  <option value="75000">$75,000</option>
                                  <option value="80000">$80,000</option>
                                  <option value="85000">$85,000</option>
                                  <option value="90000">$90,000</option>
                                  <option value="95000">$95,000</option>
                                  <option value="100000">$100,000</option>
                                </select>
                              
                                <p> Max: <br>
                                <select name="priceH">
                                  <option value="*">No Max</option>
                                  <option value="1000">$1,000</option>
                                  <option value="2000">$2,000</option>
                                  <option value="3000">$3,000</option>
                                  <option value="4000">$4,000</option>
                                  <option value="5000">$5,000</option>
                                  <option value="6000">$6,000</option>
                                  <option value="7000">$7,000</option>
                                  <option value="8000">$8,000</option>
                                  <option value="9000">$9,000</option>
                                  <option value="10000">$10,000</option>
                                  <option value="11000">$11,000</option>
                                  <option value="12000">$12,000</option>
                                  <option value="13000">$13,000</option>
                                  <option value="14000">$14,000</option>
                                  <option value="15000">$15,000</option>
                                  <option value="16000">$16,000</option>
                                  <option value="17000">$17,000</option>
                                  <option value="18000">$18,000</option>
                                  <option value="19000">$19,000</option>
                                  <option value="20000">$20,000</option>
                                  <option value="21000">$21,000</option>
                                  <option value="22000">$22,000</option>
                                  <option value="23000">$23,000</option>
                                  <option value="24000">$24,000</option>
                                  <option value="25000">$25,000</option>
                                  <option value="30000">$30,000</option>
                                  <option value="35000">$35,000</option>
                                  <option value="40000">$40,000</option>
                                  <option value="45000">$45,000</option>
                                  <option value="50000">$50,000</option>
                                  <option value="55000">$55,000</option>
                                  <option value="60000">$60,000</option>
                                  <option value="65000">$65,000</option>
                                  <option value="70000">$70,000</option>
                                  <option value="75000">$75,000</option>
                                  <option value="80000">$80,000</option>
                                  <option value="85000">$85,000</option>
                                  <option value="90000">$90,000</option>
                                  <option value="95000">$95,000</option>
                                  <option value="100000">$100,000</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="Submit" />
                            </td>
                        </tr>
                    </table> 
                    </form>
                </div>
			

				<div class="content">
				<%
					ArrayList resultimages = (ArrayList) request.getAttribute("searchresults");
					ArrayList resultkeys = (ArrayList) request.getAttribute("resultkeys"); %>

                    <br>

                    <p> <% out.println(resultimages.size()); %> ride(s) matched your search. </p>
                        <hr width="100%">
					
					<% for (int i = 0; i < resultimages.size(); i++){
					
						%> 
						
						<center>
						<!-- <form action="/VehiclePage" method="post"> -->
						<input type="image" name="vehicle" onclick="getResult(this.value)" onmouseover="showInfo(this.value)" value="<% out.println(resultkeys.get(i)); %>" src="<% out.println(resultimages.get(i)); %>" />
						<!-- <input type="hidden" name="vehicle" value="<% out.println(resultimages.get(i)); %>" />
						<input type="hidden" name="key"  value="<% out.println(resultkeys.get(i)); %>" /> -->
						<!-- <p color="white"> <% out.println(resultimages.get(i)); %> </p> -->
                        <hr width="100%">
                         <!-- </form> --> </center> <%
					};
				%>
				
				</div>
                <div id="background" style="width: 80%; height: 100%; top: 0px; right: 0px; position:absolute; z-index: -1; float:right; background-size:cover; background-image:url('/images/IMG_1072.JPG'); outline: 0px dashed orange;" >
                    <!-- <img style="height:auto; width:100%; outline: 3px dashed purple;" src="/images/IMG_1072.JPG" /> -->
                    <div id="resInfo" style="margin: 0 auto; outline: 0px dotted red; width:auto; width:99%; left: 5%; top: 50%; position: absolute; ">
                        <!-- <p id="displayYear" style="color:white; font-size:300%;"> Year </p>
                        <br>
                        <p style="color:white; font-size: 250%;"> Make </p>
                        <br>
                        <p style="color:white; font-weight: 100; font-size: 250%; font-family: “Helvetica Light”, Helvetica, Arial, sans-serif;"> Model </p>
                        <br>
                        <p style="color:white; font-size:175%;"> Price </p>
                        <br> -->
                        &nbsp;
                    </div>
                </div>
                <div style="width: auto; height: 7%; outline: 0px dashed blue; position:absolute; z-index: 5; top: 20%; left: 33%;">
                    <img onclick="showResult()" style="posiiton: relative; width:auto; height: 100%; outline: 0px solid purple;" src="images/results_image.png" />
                </div>

		</div>
	</body>
</html>