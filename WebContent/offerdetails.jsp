<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<link rel="stylesheet" type="text/css" href="css/style.css" />
	<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	<script src="JS/jquery.autocomplete.js"></script>	
	
	<script>
	jQuery(function(){
		$("#country").autocomplete("db_fetch.jsp");
	});
   </script>
   
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
       	<tr>
<td align="left">&nbsp;</td>
<ul id="drop-nav">
  <li><a href="#"><font face="verdana" size="2">Customer Details</font></a>
  <ul>
      <li><a href="custdetails.jsp" ><font face="verdana" size="1">View Customer </font></a></li>
      <li><a href="addcustomer.jsp"><font face="verdana" size="1">Add Customer</font></a></li>
   </ul></li>
  <li><a href="#"><font face="verdana" size="2">Offer Details</font></a>
    <ul>
      <li><a href="#" ><font face="verdana" size="1">View/Modify Offer</font></a></li>
      <li><a href="addoffer.jsp"><font face="verdana" size="1">Add Offer</font></a></li>
   </ul>
  </li>
  <li><a href="instance.jsp"><font face="verdana" size="2">Report</font></a></li>
  <li><a href="#"><font face="verdana" size="2">Contact</font></a></li>
 <li><a href="login1.jsp"><font face="verdana" size="2" color="red">Logout</font></a></li>
  </ul>
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

<br/> <br/> <br/>

<% String err=request.getParameter("message");
if(err!=null){
	/* out.println(err); */
%>
<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800">
	<tr><td align="center"><font color="red"><%=err %></font></td></tr>
</table>
<%}%>


<table border=0 cellpadding="3" width="100%">       
        <tr>
           <td valign="top" class="template">
               <form name="FrmIndex" method="post" action="offerdetails1.jsp" >
                 <table cellpadding=4 cellspacing=4 border=0 align="center" width=50%>
                <tr><td width="59%">&nbsp;</td>
                </tr>
                <tr><td>&nbsp;</td>
                </tr>
                   <!-- <tr>
                   
                      <p>Here is the details of offers which sent to the Customer </p>
                      </tr> -->
                      <tr>
                      <td valign="top" size="30%" ><strong> Where you want to search.Please enter the location </strong></td>
                       <!-- <td valign="top" size="30%"><input type="text" name="offloc" /></td> -->
                     <td>  <input type="text" id="country" name="offloc" class="input_text"/> </td>
                     </tr>
                     <tr><td valign="top" colspan=2 align="center"><label>
                         <input type="submit" name="Submit2" value="Search"/>
                         
                       </label></td></tr>
                     
                       
                   <tr>
                       <td valign="top" colspan=2 align="center"><label></label></td>
                   </tr>
               </table>
               </form>
                 <script>document.FrmIndex.Username.focus();</script>
            </td>
       </tr>
</table>

	<table><tr>
	<td align="left" width="20%">&nbsp;</td>
	<td valign="top" align="centre" width="60%"><center><img src="IBMlogo1.jpg"></center></td>
	<td align="left" width="20%">&nbsp;</td>
	</tr>
               <tr>

       </td>
       <td>&nbsp;</td>
    </tr>
</table>
</body>
</html>
