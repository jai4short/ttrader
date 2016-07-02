<html>
<head>
	<style type="text/css">
		#instructions {
			display: inherit;
			background: url(images/uploaded_bkgd.png);
			background-size:contain;
            background-repeat:no-repeat;
            width: 66%;
            height: 33%;
            top: 10%;
            left: 5%;
            position: relative;
            padding: 20px;
		}

  #container {
            height: 100%;
            width: 100%;
            outline: 0px solid blue;
            background: url(images/eleanor2.png);
            background-size:cover;
            background-repeat:no-repeat;
            position: relative;
          }

    #donebutton {
			background: url(images/done_button.png);
			background-size:contain;
            background-repeat:no-repeat;
            width: 15%;
            height: 35%;
            top: 12%;
            left: 5%;
            position: relative;
            outline: 0px dotted red;
            cursor: pointer;
            display: inline-block;
            float: left;
    }

    #resulttext {
    	outline: 0px dotted orange;
    	height: 33%;
    	width: 50%;
    	display: inline-block;
    	float: left;
    	left: 10%;
    	position: relative;
    	top: 4%;
    	padding: 0px;
    	text-shadow: 2px 2px 5px black;
    }

    #result {
    	font-size: 300%;
    	font-family: Helvetica, sans-serif;
    	color: white;
    }
	</style>
	<script type="text/javascript">

	  function verifyEmail(){
		  //alert("the function was called.");
		  
		  var ajax;

		  if (window.XMLHttpRequest){
		   ajax = new XMLHttpRequest();
		  }
		  else {
		    ajax = new ActiveXObject("Microsoft.XMLHTTP");
		  }

		    var postID = document.getElementById("postID").value;
		    var token = document.getElementById("token").value;

			//alert("ajax function is preparing to begin...");

		    ajax.open("GET", "/verify?value1=" + postID + "&value2=" + token, true);
		    ajax.onreadystatechange = function (){
		      if (ajax.readyState == 4 && ajax.status == 200){
			      var response = ajax.responseText;
			      //alert(response);
			      document.getElementById("result").innerHTML=response;
			  }
		      else {
		      	//alert("ajax readyState is: " + ajax.readyState);
		      }
		    };

		    ajax.send();
	    
		    }
	</script>
</head>
<body>
<div id="container">
	<div id="instructions">
		<a href="/home.html"> <img style="height: 25%;" src="images/tuned_logo_white.png" /> </a>
		<p style="font-family: Helvetica, sans-serif;"> <span style="font-size:200%;">Cool you're almost finished.</span> <br> All you have to do now is enter in the information emailed to you below: </p>
			<input type="text" id="postID" name="value1" placeholder="Post ID"/>
			<input type="text" id="token" name="value2" placeholder="Token"/>
			
	</div>
	<div id="donebutton" onclick="verifyEmail()">
		&nbsp;
	</div>
	<div id="resulttext">
		<p id="result"></p>
	</div>
</div>
</body>
</html>
