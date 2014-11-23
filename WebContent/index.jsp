<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Blue Commerce</title>
<link rel=stylesheet type='text/css' href='/BC_style.css'>
<script type="text/javascript">

document.oncontextmenu = function(){return false}
if(document.layers) 
	{
		window.captureEvents(Event.MOUSEDOWN);
		window.onmousedown = function(e){if(e.target==document)return false;}
	}
	else 
	{
		document.onmousedown = function(){return false}
	}

function right(e) 
	{
		var msg = "©  IBM India Pvt Ltd";
		if (navigator.appName == 'Netscape' && e.which == 3) 
			{
				alert(msg);
				return false;
			}
		else
		if (navigator.appName == 'Microsoft Internet Explorer' && event.button==2) 
			{
	        	alert(msg);
				return false;
			}
		// Checking if Shift Key is Pressed
		 /*var shiftPressed = (window.Event) ? event.modifiers & Event.SHIFT_MASK : event.shiftKey;
		 if (shiftPressed) 
			{
		    	alert("The Shift Key is not supported on this site");
				return false;
		  	}	*/
		return true;
	}

document.onmousedown = right;
var count = 0;
var bbsWindow = "";
</script>
<style type='text/css'>
ul {list-style: none;padding: 0px;margin: 0px; width: 600px; margin-left: auto; margin-right: auto;}
	ul li {display: block;position: relative;float: left;border:1px solid #000}
li ul {display: none;}
	ul li a {display: block;background: #000;padding: 5px 10px 5px 10px;text-decoration: none; white-space: nowrap;color: #fff;}
	ul li a:hover {background: #f62;}
	li:hover ul {display: block; position: absolute;}
	li:hover li {float: none; width: 140px}
	li:hover a {background: #f62;}
	li:hover li a:hover {background: #000;}
#drop-nav li ul li {border-top: 0px;}

h2 {text-decoration:blink} 
</style>
</head>
<form action="login1.jsp">
<body  LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<table border=0 cellpadding="3" cellspacing="2" width="100%" bgcolor="#46AEE1">
	<tr>
        <td height="100" valign="middle" align="center">
		<font face="Times New Roman" size="16px"><i><b><font color="Blue">Blue</font>&nbsp;<font color="#Fff">Commerce</font></b></i></font>
		</td>
	
        </tr>
	<tr>
    	 <td height="5" valign="right" align="right">
		<font face="Times New Roman" size="4px"><i><b><font color="white"><marquee behavior=alternate scrollamount=5 >-Time Being of Essence</marquee></b></i></font>
		</td>
       	</tr>
	</table>
       		<table border="0" cellspacing="3" cellpadding="4" width="100%">
	  	<tr><td>&nbsp;</td></tr>
		<tr>
           		<td valign="top" class="template" align="center">Blue Commerce (A Banking Application) by IBM Blue Team	<br><br>
			<a href="login1.jsp"><font color="#336699">Click here</font></a> to Start the application</td>
       		</tr>
		</table>
		<br><br><br><br><br><br>
		<center><img src="IBMlogo1.jpg"></center>
		<br>
		<table width="100%" height="1" border="0" cellspacing="0" cellpadding="0" align="center">
        	<tr><td width="75%" height="25"  valign="middle" align="center" class="footer">
		
		</table>
                
       </td>
       <td>&nbsp;</td>
    </tr>
</table>	
</form>
</body>
</html>
