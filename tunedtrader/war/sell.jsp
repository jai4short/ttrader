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
    /** HttpSession mysession = request.getSession(false);

    System.out.println(mysession);

    if (mysession.getAttribute("access")==null) {
      System.out.println("The session is null");
      response.sendRedirect("/Tunedtrader.html");
    } **/
%>

<html class="homepage">
	<head>
		<link type="text/css" rel="stylesheet" href="css/sell.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://www.carqueryapi.com/js/carquery.0.3.4.js"></script>
		<title> TunedTrader.com </title>
	</head>
	<body>
    <div id="partsinfo" style="display:none; background-color:white; position:absolute; top 10%; left:5%; height:80%; width:90%; z-index:3;">
      <div style="height:33%;">
        &nbsp;
      </div> 
      <div style="outline: 0px solid red; margin:0 auto;">
        <center> <p> <b> So yeah to be honest...not quite done with this part yet... (O_o) </b> </p> <br> <p> For now, send us an email to admin@tunedtrader.com and tell us what part sales features you'd like to see. </p> </center>
      </div>
    </div>
    <div id ="fader" onclick="hideFader()" style="cursor:pointer; height:101%; width:100%; background-color:black; opacity:.5; z-index:2; display:none; position:absolute; top:0px; left:0px;">
      &nbsp;
    </div>
    <div id="sellinfo" style="display:none; background-color:white; position:absolute; top:10%; left:5%; height:80%; width:90%; z-index:3;">
      <div style="height:5%;">
        &nbsp;
      </div>
      <div style="height:90%; width:90%; margin: 0 auto; outline:0px dotted orange; overflow-x:scroll;" >
        <div id="m3">
          <img style="height:120%; width:auto;" src="images/m3.png" />
        </div>
        <div style="width:5%; float:right; outline:0px dashed yellow;">
          &nbsp;
        </div>
        <div id="bluebird" >
          <div style="height:8%">&nbsp;</div>
          <img style="width: 100%; height: auto;" src="images/tuned_text2.png" /> 
        </div>
        <div style="width: 100%; outline: 0px dashed yellow; float:right;">
          <p style="color: black;"> <b> Sell your ride in just a few clicks! </b>  Tell us a little bit about your car.  Potential buyers will be able to search based on the details you provide.
        </div>




        <form id="vehicleForm" action="<%= blobstoreService.createUploadUrl("/Upload") %>" enctype="multipart/form-data" method="post">
          <div id="formtbl1">
            <table border="0" style="margin: 0 auto;">
              <tr>
                <td>
                  <p> Upload Photo:
                </td>
                <td>
                  <input id="file1" type="file" name="myFile">
                </td>
              </tr>
              <!-- <tr>
                <td>
                  <p> Class:
                </td>
                <td>
                  <div class="selectContainer"><select name="vclass" value="class">
                    <option value="IMPORT">IMPORT</option>
                    <option value="DOMESTIC">DOMESTIC</option>
                    <option value="EURO">EURO</option>
                  </select></span>
                </td>
              </tr> -->

              <tr>
                <td>
                <p> Year:
                </td>
                <td>                                                    
                  <!-- <div class="selectContainer"><select id="year" name="YEAR" onchange="getMakes(this.value)"> -->
                  <div class="selectContainer"><select id="car-years" name="YEAR">
                    <!--<option value='2015'>2015</option>
                    <option value='2014'>2014</option>
                    <option value='2013'>2013</option>
                    <option value='2012'>2012</option>
                    <option value='2011'>2011</option>
                    <option value='2010'>2010</option>
                    <option value='2009'>2009</option>
                    <option value='2008'>2008</option>
                    <option value='2007'>2007</option>
                    <option value='2006'>2006</option>
                    <option value='2005'>2005</option>
                    <option value='2004'>2004</option>
                    <option value='2003'>2003</option>
                    <option value='2002'>2002</option>
                    <option value='2001'>2001</option>
                    <option value='2000'>2000</option>
                    <option value='1999'>1999</option>
                    <option value='1998'>1998</option>
                    <option value='1997'>1997</option>
                    <option value='1996'>1996</option>
                    <option value='1995'>1995</option>
                    <option value='1994'>1994</option>
                    <option value='1993'>1993</option>
                    <option value='1992'>1992</option>
                    <option value='1991'>1991</option>
                    <option value='1990'>1990</option>
                    <option value='1989'>1989</option>
                    <option value='1988'>1988</option>
                    <option value='1987'>1987</option>
                    <option value='1986'>1986</option>
                    <option value='1985'>1985</option>
                    <option value='1984'>1984</option>
                    <option value='1983'>1983</option>
                    <option value='1982'>1982</option>
                    <option value='1981'>1981</option>
                    <option value='1980'>1980</option>
                    <option value='1979'>1979</option>
                    <option value='1978'>1978</option>
                    <option value='1977'>1977</option>
                    <option value='1976'>1976</option>
                    <option value='1975'>1975</option>
                    <option value='1974'>1974</option>
                    <option value='1973'>1973</option>
                    <option value='1972'>1972</option>
                    <option value='1971'>1971</option>
                    <option value='1970'>1970</option>
                    <option value='1969'>1969</option>
                    <option value='1968'>1968</option>
                    <option value='1967'>1967</option>
                    <option value='1966'>1966</option>
                    <option value='1965'>1965</option>
                    <option value='1964'>1964</option>
                    <option value='1963'>1963</option>
                    <option value='1962'>1962</option>
                    <option value='1961'>1961</option>
                    <option value='1960'>1960</option>
                    <option value='1959'>1959</option>
                    <option value='1958'>1958</option>
                    <option value='1957'>1957</option>
                    <option value='1956'>1956</option>
                    <option value='1955'>1955</option>
                    <option value='1954'>1954</option>
                    <option value='1953'>1953</option>
                    <option value='1952'>1952</option>
                    <option value='1951'>1951</option>
                    <option value='1950'>1950</option>
                    <option value='1949'>1949</option>
                    <option value='1948'>1948</option>
                    <option value='1947'>1947</option>
                    <option value='1946'>1946</option>
                    <option value='1945'>1945</option>
                    <option value='1944'>1944</option>
                    <option value='1943'>1943</option>
                    <option value='1942'>1942</option>
                    <option value='1941'>1941</option>
                    <option value='1940'>1940</option>
                    <option value='1939'>1939</option>
                    <option value='1938'>1938</option>
                    <option value='1937'>1937</option>
                    <option value='1936'>1936</option>
                    <option value='1935'>1935</option>
                    <option value='1934'>1934</option>
                    <option value='1933'>1933</option>
                    <option value='1932'>1932</option>
                    <option value='1931'>1931</option>
                    <option value='1930'>1930</option>-->
                  </select></span>
                </td>
              </tr>
              <tr>
                <td>
                  <p> Make:
                </td>
                <td>                                                    
                  <!--<div class="selectContainer"><select id="make" name="make" onchange="getModels(this.value)">-->
                  <div class="selectContainer"><select id="car-makes" name="make">
                    <option value="*">Make</option>
                  </select></span>
                </td>
              </tr>
              <tr>
                <td>
                  <p> Model:
                </td>
                <td>
                  <!--<div class="selectContainer"><select type="text" id="model" name="model">-->
                  <div class="selectContainer"><select type="text" id="car-models" name="model">
                    <option value="*">None specified</option>
                  </select></span>
                </td>
              </tr>
              <tr>
                <td>
                  <p> Mileage:
                </td>
                <td>
                  <input id="mileage" type="text" name="mileage" placeholder="ex. 50000" maxlength="6" onchange="changeBorder(this.id)">
                </td>
              </tr>
              <tr>
                <td>
                  <p> Transmission:
                </td>
                <td>
                  <div class="selectContainer"><select type="text" id="trans" name="TRANS">
                    <option value="AUTO">AUTOMATIC</option>
                    <option value="MANUAL">MANUAL</option>
                    <option value="SEMIAUTO">SEMI AUTOMATIC (PADDLE)</option>
                  </select></span>
              </tr>
            </table>
          </div>
          <div id="formtbl2">
            <table border="0">
              <tr>
                <td>
                  <p> Intake:
                </td>
                <td>
                  <div class="selectContainer"><select name="intake">
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET COLD AIR INTAKE">AFTERMARKET CAI</option>
                    <option value="AFTERMARKET INTAKE MANIFORLD">AFTERMARKET INTAKE MANIFOLD</option>
                    <option value="FORCED INDUCTION">SUPERCHARGED/TURBO</option>
                  </select></span>
                </td>
              </tr>
              <tr>
                <td>
                  <p> Exhaust:
                </td>
                <td>
                  <div class="selectContainer"><select name="EXHAUST">
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET EXHAUST MANI/HEADERS">AFTERMARKET HEADERS</option>
                    <option value="AFTERMARKET CAT CONV">AFTERMARKET CAT CONV</option>
                    <option value="AFTERMARKET MUFFLER">AFTERMARKET MUFFLER</option>
                    <option value="FULLY CUSTOM">FULLY CUSTOM EXHAUST</option>
                    <option value="OTHER">OTHER</option>
                  </select></span>
                </td>
              </tr>

              <tr>
                <td>
                  <p> Suspension:
                </td>
                <td>
                  <div class="selectContainer"><select name="SUSPENSION">
                    <option value="STOCK">STOCK</option>
                    <option value="LOWERED ON SPRINGS"> LOWERED ON SPRINGS</option>
                    <option value="LOWERED ON COILOVERS">LOWERED ON COILOVERS</option>
                    <option value="OTHER">OTHER</option>
                  </select></span>
                </td>
              </tr>

              <tr>
                <td>
                  <p> Brakes:
                </td>
                <td>
                  <div class="selectContainer"><select name="BRAKES">
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET"> AFTERMARKET</option>
                  </select></span>
                </td>
              </tr>

              <tr>
                <td>
                  <p> Wheels:
                </td>
                <td>
                  <div class="selectContainer"><select name="WHEELS">
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET"> AFTERMARKET</option>
                  </select></span>
                </td>
              </tr>
              <tr>
                <td>
                  <p> *Horsepower:
                </td>
                <td>
                  <div class="selectContainer"><select name="HP">
                    <option value="lowest">100-200HP</option>
                    <option value="low">200-300HP</option>
                    <option value="mid">300-400HP</option>
                    <option value="high">400-500HP</option>
                    <option value="highest">500+HP</option>
                  </select></span>
                </td>
              </tr>
            </table>
          </div>
          <div id="formtbl3">
            <table border="0">
              <tr>
                <td>
                  <p> Photo 2:
                </td>
                <td>
                  <input id="file2" type="file" name="myfile2">
                </td>
              </tr>
              <tr>
                <td>
                  <p> Photo 3:
                </td>
                <td>
                  <input id="file3" type="file" name="myfile3">
                </td>
              </tr>
              <tr>
                <td>
                  <p> Photo 4:
                </td>
                <td>
                  <input id="file4" type="file" name="myfile4">
                </td>
              </tr>
              <tr>
                <td>
                  <p> Price:
                </td>
                <td>
                  <input id="price" type="text" name="price" placeholder="ex. 50000" maxlength="7" onchange="changeBorder(this.id)">
                </td>
              </tr>
              <tr>
                <td>
                  <p> Zip Code:
                </td>
                <td>
                  <input id="zip" type="text" name="zip" placeholder="ex. 30043" maxlength="5" onchange="changeBorder(this.id)">
                </td>
              </tr>
              <tr>
                <td>
                  <p> Contact Email:
                </td>
                <td>
                  <input id="contactemail" type="email" name="contactemail" placeholder="ex. your@email.com">
                </td>
              </tr>
            </table> 
          </div>

          <div id="formtbl4" style="">
            <table border="0" width="100%">
              <tr>
                <td colspan="4">
                  <textarea name="descr" placeholder="add details here if you want" rows="1" style="width:100%;" maxlength="5000" id="description" onkeyup="expand()"></textarea>
                </td>
              </tr>
              <tr>
                <td >
                  <p>Are you interested in trading this vehicle?
                </td>
              </tr>
              <tr>
                <td >
                  <div class="selectContainer"><select name="trade">
                    <option value="No">No</option>
                    <option value="Yes">Yes</option>
                  </td>
                </tr>
                <tr>
                  <td >
                  <!-- <p> Are you interested in swapping this vehicle? -->
                
                </td>
                <td >
                  <!-- <div class="selectContainer"><select name="swap">
                    <option value="No">No</option>
                    <option value="Yes">Yes</option> -->
                    
                  </td>
              </tr>
              <tr>
                <td>
                  <input type="button" onclick="submitVehicle()" value="" style=" outline:none; border: none; padding:; background:url(images/sell_button.png); height:60px; width:230px; background-size:cover; cursor:pointer;" />
                </td>
              </tr>
            </table>
          </div>
            </form>
          
        
    </div>
    </div>
    <div id="container">
      <div id="menudiv"> 
        <div>
          <a href="/home.html"> <img id="logo1" src="images/tuned_logo_white.png"> </a>
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
      <div id="share">
        <img onclick="showFader()" style="height: auto; width: 100%;" src="images/share_sell.png" />
      </div>
      <div id="sellcar">
        <p style="font-family: Helvetica, Arial; color: white;"> Click here to sell a car. </p>
        <!-- <img onclick="showFader()" style="" src="images/350silhouette2.png" /> -->
        <img onclick="showFader()" id="sellicon" src="images/350silhouette2.png" />
      </div>
      <div id="sellpart">
        <p style="font-family: Helvetica, Arial; color: white;"> Click here to sell a part. </p>
        <!-- <img onclick="showFader2()" style="" src="images/350exhaust.png;" /> -->
        <img onclick="showFader2()" id="particon" src="images/350exhaust.png;" />
      </div>

      <div style="height: 5%;">
        &nbsp;
      </div>

    </div>

    <script type="text/javascript" >

        function expand(){
          //alert("the function is starting..");
          var val = document.getElementById("description").value;
          var rows = document.getElementById("description").rows;

          //alert(rows + " " + val);

          if (val.length < 1){
            document.getElementById("description").rows=1;
          }
          else {
            document.getElementById("description").rows=10;
          }

          //alert("value: " + val + " length: " + val.length);
        }

        function changeBorder(value){
          document.getElementById(value).style.outline="none";
        }

        function submitVehicle(){
          var validated = validateInput();

          if (validated){
            document.getElementById("vehicleForm").submit();;
          }
          else {
            //alert("There are errors");
            null;
          }
        }

        function validateInput(){

          var mileageinput = document.getElementById("mileage").value;
          var emailinput = document.getElementById("contactemail").value;
          var priceinput = document.getElementById("price").value;
          var zipinput = document.getElementById("zip").value;
          var file = document.getElementById("file1").value;

          var validated = true;

          

          if (((zipinput%1) != 0) || (zipinput.length < 1)){
            document.getElementById("zip").style.outline="1px dotted red";
            var validated = false;
          }

          if (((mileageinput%1) != 0) || (mileageinput.length < 1)){
            document.getElementById("mileage").style.outline="1px dotted red";
            var validated = false;
          }

          if (((priceinput%1) != 0) || (priceinput.length < 1)){
            document.getElementById("price").style.outline="1px dotted red";
            var validated = false;
          }

          if (emailinput.length < 1){
            document.getElementById("contactemail").style.outline="1px dotted red";
            var validated = false;
          }

          if (file == ''){
            document.getElementById("file1").style.outline="1px dotted red";
            var validated = false;
          }

          return validated;

        }

        function getMakes(value){
          //alert(document.write(ajaxReq));
          var ajax;

          if (window.XMLHttpRequest){
            ajax = new XMLHttpRequest();
          }
          else {
            ajax = new ActiveXObject("Microsoft.XMLHTTP");
          }

            
            ajax.open("GET", "/yearController?year=" + value, true);
            ajax.onreadystatechange = function (){
              if (ajax.readyState == 4 && ajax.status == 200){
                var response = ajax.responseText;
                document.getElementById("make").innerHTML=response;
              }
            };
            ajax.send();
            //ajax.onreadystatechange = processReq(ajax);
        }

        function getModels(value){
          //alert(document.write(ajaxReq));
          var ajax;
          var year = document.getElementById("year").value;

          if (window.XMLHttpRequest){
            ajax = new XMLHttpRequest();
          }
          else {
            ajax = new ActiveXObject("Microsoft.XMLHTTP");
          }

          
          ajax.open("GET", "/modelController?yearl=" + year +  "&yearh=" + year + "&make=" + value, true);
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

        function showFader(){
          document.getElementById("fader").style.display="block";
          document.getElementById("sellinfo").style.display="block";
        }

        function showFader2(){
          document.getElementById("fader").style.display="block";
          document.getElementById("partsinfo").style.display="block";
        }

        function hideFader(){
          document.getElementById("fader").style.display="none";
          document.getElementById("sellinfo").style.display="none";
         document.getElementById("partsinfo").style.display="none";

        }

        function getYears(){
          function getYearsAPI(){
            sendAjax("http://www.carqueryapi.com/api/0.3/?cmd=getYears");
          }

          getYearsAPI();
        }

        function sendAjax(url){
          var ajax;

          if (window.XMLHttpRequest){
            ajax = new XMLHttpRequest();
          }
          else {
            ajax = new ActiveXObject("Microsoft.XMLHTTP");
          }

          ajax.open("GET", url, true);
            ajax.onreadystatechange = function (){
              if (ajax.readyState == 4 && ajax.status == 200){
                var response = ajax.responseText;
                alert(response);
              }
            };
          ajax.send();
        }

        //getYears();

    </script>
    <script> 
      $(document).ready(function(){
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

        var carquery = new CarQuery();
        carquery.init();
        carquery.initYearMakeModelTrim('car-years', 'car-makes', 'car-models', 'car-model-trims');
      });
    </script>
	</body>
</html>