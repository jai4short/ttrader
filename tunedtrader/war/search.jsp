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
<%@ page import="com.tunedtrader.vehicle.*" %><%@ page import="com.tunedtrader.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
    /**HttpSession mysession = request.getSession(false);

    System.out.println(mysession);

    if (mysession.getAttribute("access")==null) {
      System.out.println("The session is null");
      response.sendRedirect("/Tunedtrader.html"); 
    } **/
%>




<html>
  <head>
    <title>Sell/Trade your car </title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/search.css">
    <!-- <link type="text/css" media="screen" rel="stylesheet" href="/zurb-responsive-tables-0d34bc6/responsive-tables.css" />
    <script type="text/javascript" src="/zurb-responsive-tables-0d34bc6/responsive-tables.js"></script> -->
  </head>
  <body onload="getMakes()">
        <!-- <div id="divLoader"> &nbsp;</div> -->
    <div id="container">
      <div id="menudiv"> 
          <div>
              <a href="/home.jsp" > <img id="logo1" src="images/tuned_logo_white.png"> </a>
          </div>
          <div style="float:left; width: 30%;">
              &nbsp;
          </div>
          <div id="menu" style="cursor:pointer;">
              <p class="gray"> Menu + </p>
          </div> 
          <div id="slink" style="cursor:pointer;">
              <a href="/sell.jsp" > <p class="gray"> Sell </p> </a>
          </div>
          <div id="link" style="cursor:pointer;">
              <a href="/search.jsp" > <p class="gray"> Search </p> </a>
          </div>
      </div>
      <div id="vicebox" class="">
        <p> &nbsp;   </p>
        <img id="viceimage" class="" src="images/vice.png" />
      </div>
      <div id="content">
        <p class=""> Search for a ride to buy or trade</p>
      
        <form id="searchForm" action="/SellServlet" method="post">
          <div id="tables">
            <div id="tbl1">
              <table border="0" class="center responsive">
                <tr>
                  <td>
                      <p> Class: &nbsp;
                  </td>
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
                  <td valign="top">
                    <p> Min. Price:
                  </td>
                  <td>
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
                  </td>
                  <td valign="top">
                    <p> Max. Price:
                  </td>
                  <td>
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
                  <td colspan="1">
                      <p> Min. Year: &nbsp; 
                  </td>
                  <td>
                    <select id="yearl" name="YEARL">
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
                  <td colspan="1">
                    <p style="white-space:nowrap;"> Max. Year: &nbsp; 
                  </td>
                  <td>
                    <select id="yearh" name="YEARH">
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
                    <p> Make: &nbsp; 
                  </td>
                  <td>
                    <select id="make" name="make" onchange="getModels(this.value)">
                      <option value="*">Make</option>
                    </select>
                  </td>  
                </tr>
                <tr>
                  <td>
                    <p> Model: &nbsp; 
                  </td>
                  <td>
                    <select type="text" id="model" name="model">
                      <option value="*">None specified</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td valign="top">
                      <p> Min. Mileage: &nbsp;
                  </td>
                  <td>
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
                  </td>
                  <td valign="top">
                      <p> Max. Mileage: &nbsp;
                  </td>
                  <td>
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
                </tr>
                <tr>                           
                  <td>
                    <p> Horsepower: &nbsp;
                  </td>
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
                  <td>
                    <p> Intake:
                  </td>
                  <td>
                    <select name="INTAKE">
                      <option value="*">ALL</option>
                      <option value="STOCK">STOCK</option>
                      <option value="AFTERMARKET COLD AIR INTAKE">AFTERMARKET CAI</option>
                      <option value="AFTERMARKET INTAKE MANIFORLD">AFTERMARKET INTAKE MANIFOLD</option>
                      <option value="FORCED INDUCTION">SUPERCHARGED/TURBO</option>
                    </select> 
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Transmission: &nbsp;
                  </td>
                  <td>
                    <select name="TRANS">
                      <option value="*">ALL</option>
                      <option value="AUTO">AUTOMATIC</option>
                      <option value="MANUAL">MANUAL</option>
                      <option value="SEMIAUTO">SEMI AUTOMATIC (PADDLE)</option>
                    </select> 
                  </td>
                  <td>
                    <p> Exhaust:
                  </td>
                  <td colspan="0">
                    <select name="EXHAUST">
                      <option value="*">ALL</option>
                      <option value="STOCK">STOCK</option>
                      <option value="AFTERMARKET EXHAUST MANI/HEADERS">AFTERMARKET EXHAUST MANI/HEADERS</option>
                      <option value="AFTERMARKET CAT CONV">AFTERMARKET CAT CONV</option>
                      <option value="AFTERMARKET MUFFLER">AFTERMARKET MUFFLER</option>
                      <option value="FULLY CUSTOM">FULLY CUSTOM EXHAUST</option>
                      <option value="OTHER">OTHER</option>
                    </select> 
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Suspension:
                  </td>
                  <td>
                    <select name="SUSPENSION">
                      <option value="*">ALL</option>
                      <option value="STOCK">STOCK</option>
                      <option value="LOWERED ON SPRINGS"> LOWERED ON SPRINGS</option>
                      <option value="LOWERED ON COILOVERS">LOWERED ON COILOVERS</option>
                      <option value="OTHER">OTHER</option>
                    </select> 
                  </td>
                  <td>
                    <p> Brakes:
                  </td>
                  <td>
                    <select name="BRAKES">
                      <option value="*">ALL</option>
                      <option value="STOCK">STOCK</option>
                      <option value="AFTERMARKET"> AFTERMARKET</option>
                    </select> 
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Wheels:
                  </td>
                  <td>
                    <select name="WHEELS">
                        <option value="*">ALL</option>
                        <option value="STOCK">STOCK</option>
                        <option value="AFTERMARKET"> AFTERMARKET</option>
                    </select> 
                  </td>
                </tr>
              </table>
            </div>
            <!-- <div id="tbl2">
              <table border="1" class="responsive">
                <tr>
                  <td>
                    &nbsp;
                  </td>
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  <td>
                    &nbsp;
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp;
                  </td>
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  
                </tr>
                <tr>
                  <td>
                    &nbsp;
                  </td>
                </tr>
              </table>
            </div> -->
            <div id="tbl3">
              <table class="responsive">
                <tr>
                  <td>
                    <p> Cars for trade:
                  </td>
                  <td>
                    <input type="checkbox" name="trade" value="Yes" />
                  </td>
                  <td>
                    <!-- <p> Cars to swap: -->
                  </td>
                  <td>
                    <!-- <input type="checkbox" name="swap" value="Yes" /> -->
                  </td>
                </tr>
                <tr>
                  <td>
                    <p> Location:
                  </td>
                  <td>
                    <select name="distance">
                      <option value="25"> Within 25 miles of</option>
                      <option value="50"> Within 50 miles of</option>
                      <option value="100">Within 100 miles of</option>
                      <option value="250">Within 250 miles of</option>
                      <option value="500">Within 500 miles of</option>
                      <option value="*">Within Any Distance of</option>
                    </select>  
                  </td>
                  <td>
                    <input id="zip" placeholder="ex. 30043" name="zip" type="input" onchange="changeBorder(this.id)" maxlength="5" minlength="5"/>
                  </td>
                </tr>
              </table>
            </div>
          </div>
          <!-- <div id="smallscreentables">
            <table border="0" class="">
              <tr>
                <td>
                    <p> Class: &nbsp;
                </td>
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
                <td valign="top">
                  <p> Min. Price: </p>
                </td>
                <td>
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
                </td>    
              </tr>
              <tr>
                <td valign="top">
                  <p> Max. Price:
                </td>
                <td>
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
                <td colspan="1">
                  <p> Min. Year: &nbsp; </p>
                </td>
                <td>
                  <select id="yearl" name="YEARL">
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
                <td colspan="1">
                  <p style="white-space:nowrap;"> Max. Year: &nbsp; 
                </td>
                <td>
                  <select id="yearh" name="YEARH">
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
                  <p> Make: &nbsp; 
                </td>
                <td>
                  <select id="smake" name="make" onchange="getModels(this.value)">
                    <option value="*">Make</option>
                  </select>
                </td>  
              </tr>
              <tr>
                <td>
                  <p> Model: &nbsp; 
                </td>
                <td>
                  <select type="text" id="smodel" name="model">
                    <option value="*">None specified</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td valign="top">
                    <p> Min. Mileage: &nbsp;
                </td>
                <td>
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
                </td>
              </tr>
              <tr>
                <td valign="top">
                  <p> Max. Mileage: &nbsp;
                </td>
                <td>
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
              </tr>
              <tr>                           
                <td>
                  <p> Horsepower: &nbsp;
                </td>
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
                  <p> Transmission: &nbsp;
                </td>
                <td>
                  <select name="TRANS">
                    <option value="*">ALL</option>
                    <option value="AUTO">AUTOMATIC</option>
                    <option value="MANUAL">MANUAL</option>
                    <option value="SEMIAUTO">SEMI AUTOMATIC (PADDLE)</option>
                  </select> 
                </td>
              </tr>
              <tr>
                <td>
                  <p> Suspension:
                </td>
                <td>
                  <select name="SUSPENSION">
                    <option value="*">ALL</option>
                    <option value="STOCK">STOCK</option>
                    <option value="LOWERED ON SPRINGS"> LOWERED ON SPRINGS</option>
                    <option value="LOWERED ON COILOVERS">LOWERED ON COILOVERS</option>
                    <option value="OTHER">OTHER</option>
                  </select> 
                </td>
              </tr>
              <tr>
                <td>
                  <p> Wheels:
                </td>
                <td>
                  <select name="WHEELS">
                      <option value="*">ALL</option>
                      <option value="STOCK">STOCK</option>
                      <option value="AFTERMARKET"> AFTERMARKET</option>
                  </select> 
                </td>
              </tr>
              <tr>
                <td>
                  <p> Intake:
                </td>
                <td>
                  <select name="INTAKE">
                    <option value="*">ALL</option>
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET COLD AIR INTAKE">AFTERMARKET CAI</option>
                    <option value="AFTERMARKET INTAKE MANIFORLD">AFTERMARKET INTAKE MANIFOLD</option>
                    <option value="FORCED INDUCTION">SUPERCHARGED/TURBO</option>
                  </select> 
                </td>
              </tr>
              <tr>
                <td>
                  <p> Exhaust:
                </td>
                <td colspan="0">
                  <select name="EXHAUST">
                    <option value="*">ALL</option>
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET EXHAUST MANI/HEADERS">AFTERMARKET EXHAUST MANI/HEADERS</option>
                    <option value="AFTERMARKET CAT CONV">AFTERMARKET CAT CONV</option>
                    <option value="AFTERMARKET MUFFLER">AFTERMARKET MUFFLER</option>
                    <option value="FULLY CUSTOM">FULLY CUSTOM EXHAUST</option>
                    <option value="OTHER">OTHER</option>
                  </select> 
                </td>
              </tr>
              <tr>
                <td>
                  <p> Brakes:
                </td>
                <td>
                  <select name="BRAKES">
                    <option value="*">ALL</option>
                    <option value="STOCK">STOCK</option>
                    <option value="AFTERMARKET"> AFTERMARKET</option>
                  </select> 
                </td>
              </tr>
              <tr>
                <td>
                  &nbsp;
                </td>
              </tr>
              <tr>
                <td>
                  <p> Cars for trade:
                </td>
                <td>
                  <input type="checkbox" name="trade" value="Yes" />
                </td>
                <td>
                  <p> Cars to swap:
                </td>
                <td>
                  <input type="checkbox" name="swap" value="Yes" /> 
                </td>
              </tr>
              <tr>
                <td>
                  <p> Location:
                </td>
                <td>
                  <select name="distance">
                    <option value="25"> Within 25 miles of</option>
                    <option value="50"> Within 50 miles of</option>
                    <option value="100">Within 100 miles of</option>
                    <option value="250">Within 250 miles of</option>
                    <option value="500">Within 500 miles of</option>
                    <option value="*">Within Any Distance of</option>
                  </select>  
                </td>
              </tr>
              <tr>
                <td>
                  <input id="szip" placeholder="ex. 30043" name="zip" type="input" onchange="changeBorder(this.id)" maxlength="5" minlength="5"/>
                </td>
              </tr>
            </table>
          </div> -->
          <br><br>
          <input type="button" style="outline:none; cursor: pointer; border: none; height: 125px; width: 350px; background:url(images/search_button.png); background-size:contain; background-repeat: no-repeat;" onclick="submitSearch()" />
        </form>
      </div>
    </div>
    <script> 
      $(window).load(function(){
        $('#divLoader').fadeOut(5000);
        });
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
        });
    </script>
    <script type="text/javascript">
      function changeBorder(value){
        document.getElementById(value).style.outline="none";
        }
      function submitSearch(){
        var validated = validateInput();

        if (validated){
          document.getElementById("searchForm").submit();;
          }
        else {
          //alert("There are errors");
          }
        }
      function validateInput(){

        var zipinput = document.getElementById("zip").value;

        var validated = true;

        if (((zipinput%1) != 0) || (zipinput.length < 1)){
          document.getElementById("zip").style.outline="2px solid red";
          var validated = false;
        }
        
        return validated;
        }
      function getModels(value){
        //alert(document.write(ajaxReq));
        var ajax;

        if (window.XMLHttpRequest){
          ajax = new XMLHttpRequest();
          }
        else {
          ajax = new ActiveXObject("Microsoft.XMLHTTP");
          }

        ajax.open("GET", "/modelController?make=" + value + "&yearl=" + document.getElementById("yearl").value + "&yearh=" + document.getElementById("yearh").value, true);
        ajax.onreadystatechange = function (){
          if (ajax.readyState == 4 && ajax.status == 200){
            var response = ajax.responseText;
            document.getElementById("model").innerHTML=response;
            }
          };
        ajax.send();
        //ajax.onreadystatechange = processReq(ajax);
        }

          function getMakes(){
            //alert("ajax function is starting");
          
          var ajax;
          var value = "*";


          if (window.XMLHttpRequest){
            ajax = new XMLHttpRequest();
          }
          else {
            ajax = new ActiveXObject("Microsoft.XMLHTTP");
          }

            
            ajax.open("GET", "/makeController?key=" + value, true);
            ajax.onreadystatechange = function (){
              //alert("readyState: " + ajax.readyState);
              if (ajax.readyState == 4 && ajax.status == 200){
                //alert("response received");
                var response = ajax.responseText;
                document.getElementById("make").innerHTML=response;
              }
            };
            ajax.send();
            //ajax.onreadystatechange = processReq(ajax);
              }
    </script>
  </body>
</html>