<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Blue Commerce</title>
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

<link rel=stylesheet type='text/css' href='/index_style.css'>
</head>
<body bgcolor="#FFFFFF"  LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
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
         /* function submitForm(action)
        {
            document.getElementById('form3').action = action;
            document.getElementById('form3').submit();
        }  */
</script>

<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800"><tr>
<td align="left"><a href="javascript:history.back()"><font color="Blue">Back</font></a></td>
<td align="right"><a href="login1.jsp"><font color="red">Logout</font></a></td> </tr>
        <tr>
           <td valign="top" class="template">
               <form name="form3" method="post" action="instance.jsp">
                 <table cellpadding=2 cellspacing=4 border=0 align="center" width=50%>
                <tr><td width="50%">&nbsp;</td>
                </tr>
                
                   <tr>
                      <td valign="top" colspan=2 class="heading">&nbsp;</td>
                   </tr>
                     
                     <!-- <tr>
                           
                       <td valign="top" class="template"><input type="submit" name="Submit11" value="MONTHLY DETAILS"/></td>
                     
                          <td width="50%" valign="top"><label></label>&nbsp;
                          <input type="submit" name="Submit33" value="DAILY DETAILS" /></td>
                   
                     <tr>
                       <td valign="top" class="template">&nbsp;</td>
                          <td valign="top">&nbsp;</td>
                   </tr> -->
                     <tr>
                       <td valign="top" colspan=2 align="center"><input type="submit" name="Submit44" value="INSTANCE DETAILS" /></td>
                       
                   </tr>
               </table>
               </form>
                 <script>document.FrmIndex.Username.focus();</script>
            </td>
       </tr>
</table>

	<center><img src="IBMlogo1.jpg"></center>
	<center><img src="/img/blank.gif" height=150 width=1></center>

                <table width="100%" height="1" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr></tr>
                </table>

       </td>
       <td>&nbsp;</td>
    </tr>
</table>
</body>
</html>
