<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.model.ReadFileData"%>
<%@ page language="java" session="false"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body bgcolor="#FFFFFF"  LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<table cellpadding=0 cellspacing=5 border=0 align="center" width="800" class="maintab" height="100%">
    <tr>
       <td> </td>
       <td valign="top">
                <table width="100%" bgcolor="#46AEE1">
                        <tr>
                                <td height="100" valign="middle" align="center"><font face="Times New Roman" size="16px"><i><b><font color="red">Blue </font><font color="blue">Commerce  </font>
			<font color="white"></b></i></font><td>
                        </tr>
			<tr>
       				<td height="5" valign="right" align="right"><font face="Times New Roman" size="4px"><i><b><font color="white">-Time Being of Essence</b></i></font><td>
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

<br/> <br/> 

<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="1000">
<tr>
<td align="left"><a href="javascript:history.back()"><font color="Blue">Back</font></a></td>
<td align="right"><a href="login1.jsp"><font color="red">Logout</font></a></td></tr>
</table>
<br/> <br/> 
<%
String misdate =request.getParameter("misdate");
System.out.println(misdate);

ReadFileData mno= new ReadFileData();
Map<String,String> misd ;



  misd = mno.getMISDetails(misdate);

  %>
<% 
  if(misd.isEmpty())
  {
	String message="No Transaction happen on this date or invalid date!!! ";
	response.sendRedirect("instance.jsp?message="+message);


  }

  %>
 <table border="1" dir="ltr" height="131" width="944">
   
	<tbody>
		<tr>
			<td style="width: 114px; text-align: center;"><strong>MIS ID</strong></td>
			<td style="width: 149px; text-align: center;"><strong>Customer ID</strong></td>
			<td style="width: 149px; text-align: center;"><strong>Customer Mobile Number</strong></td>
			<td style="width: 190px; text-align: center;"><strong>Last Transaction Date(DD-MM-YY)</strong></td>
			<td style="width: 126px; text-align: center;"><strong>Time</strong></td>
			<td style="width: 126px; text-align: center;"><strong>Description</strong></td>

		</tr>
		<tr>
			<td style="width: 114px; text-align: center;"><%= misd.get("msgid") %></td>
			<td style="width: 149px; text-align: center;"><%= misd.get("custid") %></td>
			<td style="width: 149px; text-align: center;"><%= misd.get("phn") %></td>
			<td style="width: 326px; text-align: justify;"><%= misd.get("date") %></td>
			<td style="width: 190px; text-align: center;"><%= misd.get("time") %></td>
			<td style="width: 126px; text-align: center;"><%= misd.get("desp") %></td>
		

		</tr>
		
	
		
			</tbody>
</table>

<center><img src="IBMlogo1.jpg"></center>
	<center><img src="/img/blank.gif" height=150 width=1></center>


</body>
</html>