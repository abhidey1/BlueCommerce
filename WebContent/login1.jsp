
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Blue Commerce</title>
	<style type='text/css'>
	ul {list-style: none;padding: 0px;margin: 0px; width: 600px; margin-left: auto; margin-right: auto;}
  	ul li {display: block;position: relative;float: left;border:1px solid #000}
	li ul {display: none;}
  	ul li a {display: block;background: #000;padding: 5px 10px 5px 10px;text-decoration: none; white-space: nowrap;color: #fff;}
  	ul li a:hover {background: #f62;}
  	li:hover ul {display: block; position: absolute;}
  	li:hover li {float: none; width: 155px}
  	li:hover a {background: #f62;}
  	li:hover li a:hover {background: #000;}
	#drop-nav li ul li {border-top: 0px;}

	h2 {text-decoration:blink} 
  </style>

<!--  <link rel=stylesheet type='text/css' href='/index_style.css'>-->
</head>
<body bgcolor="#FFFFFF"  LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<form name="login" action= "checkLogin.jsp"  method="get">
<!-- <script>
if (!(window.opener)) 
{location.href="/";}
</script> -->
<table border=0 cellpadding="3" cellspacing="2" width="100%" bgcolor="#46AEE1">
	<tr>
        <td height="100" valign="middle" align="center">
		<font face="Times New Roman" size="16px"><i><b><font 

color="Blue">Blue</font>&nbsp;<font color="#Fff">Commerce</font></b></i></font>
		</td>
	
        </tr>
	<tr>
    	 <td height="5" valign="right" align="right">
		<font face="Times New Roman" size="4px"><i><b><font 

color="white"><marquee behavior=alternate scrollamount=5 >-Time Being of Essence</marquee></b></i></font>
		</td>
       	</tr>
	</table>

<script language="javascript">

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


        function validate(Doc)
        {
		//alert("check");
		var RE = /^[a-zA-Z0-9][a-zA-Z0-9\&\-\.\(\)\\\/\s]{0,60}$/;
                if (Doc.Username.value == "")
                {
                        alert("Please enter the username");
                        Doc.Username.focus();
                        return false;
                }
		else if(!(RE.test(Doc.Username.value)))
		{
			//alert("check");
			alert("The username should not contain special charcter.");
                        Doc.Username.focus();
                        return false;
		}
		
                if (Doc.Password.value == "")
                {
                        alert("Please enter the password");
                        Doc.Password.focus();
                        return false;
                }
		var RE1 = /^([a-zA-Z0-9]){3,10}$/;
                if(!(RE1.test(Doc.Password.value)))
                {
			alert("Only alphanumerical values are allowed for Password and should be between 3 to 10 characters");
			Doc.Password.value = "";
			Doc.Password.focus();
			return false;
		}
		Doc.submit1.disabled = true;
		return true;
        }
</script>

<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="100%">
        <tr>
           <form name="FrmIndex" method="post" action="MyPage.html" onSubmit = "return validate(this)">
	</tr>
                <tr><td>&nbsp;</td><td> </td></tr>
                <tr><td> </td><td> </td></tr>
                   <tr>
                      <td valign="top" colspan="2" align="center">
                           <font face="verdana" size="3">Welcome to Blue Commerce . Please login to use the application !!!</font>
                       </td>
                   </tr>
                     <tr>
			<td valign="top" align="right" width="50%">
                           <font face="verdana" size="3" align="right">Enter your Username</font>
                       </td>
                          <td valign="top" align="left" width="50%">
                           <input type="text" name="name" size=10 maxlength="20" class="inputs">
                       </td>
                   </tr>
                     <tr>
			<td valign="top" align="right" width="50%">
                           <font face="verdana" size="3" align="right">Enter your Password</font>
                       </td>
                          <td valign="top" align="left" width="50%">
                           <input type="password" name="password" size=10 maxlength="20" class="inputs">
                       </td>
                   </tr>

                     <tr>
           <td valign="top" colspan=2 align="center">
           <input type="submit" name="submit1" value=" Login " class="bttn"> <input type="reset" name="reset" value=" Reset " class="bttn">
           </td>
           </tr>
               
<tr>
	<td align="center" colspan="2" width="50%"><center><img src="IBMlogo1.jpg"></center></td>
	
	</tr>
</table> 
</form>
<script>document.FrmIndex.Username.focus();</script>

</body>
</html> 