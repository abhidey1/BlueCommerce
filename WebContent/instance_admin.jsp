<% HttpSession nsession = request.getSession(false);
String loginname=nsession.getAttribute("unm").toString();
System.out.println("herere"+loginname);
if(loginname==null)
{
	response.sendRedirect("login1.jsp");
}

%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.model.ReadFileData"%>
<%@page import="com.dao.BlueCommerceDao"%>
<%@page import="com.model.Message"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Blue Commerce</title>
<script language="javascript" type="text/javascript" src="datetimepicker.js">
 </script>
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
<table border=0 cellpadding="3" width="100%">
<tr>
<td align="left">&nbsp;</td>

<ul id="drop-nav">
  <li><a href="#"><font face="verdana" size="2" >User management</font></a>
   <ul>
      <li><a href="adduser_admin.jsp"><font face="verdana" size="1">Add User</font></a></li>
      <li><a href="#"><font face="verdana" size="1" >Delete User</font></a></li>
      <li><a href="#"><font face="verdana" size="1">View User</font></a></li>
    </ul>
  </li>
  <li><a href="#"><font face="verdana" size="2">Customer Details</font></a>
  <ul>
      <li><a href="custdetails_admin.jsp" ><font face="verdana" size="1">View Customer </font></a></li>
      <li><a href="addcustomer_admin.jsp"><font face="verdana" size="1">Add Customer</font></a></li>
   </ul></li>
  <li><a href="#"><font face="verdana" size="2">Offer Details</font></a>
    <ul>
      <li><a href="offerdetails_admin.jsp" ><font face="verdana" size="1">View/Modify Offer</font></a></li>
      <li><a href="addoffer_admin.jsp"><font face="verdana" size="1">Add Offer</font></a></li>
   </ul>
  </li>
  <li><a href="#"><font face="verdana" size="2">Report</font></a></li>
  <li><a href="#"><font face="verdana" size="2">Contact</font></a>
	<ul>
      	<li><a href="#"><font face="verdana" size="1">Santosh:+91 9831532195</font></a></li>
      	<li><a href="#"><font face="verdana" size="1">Anirban:+91 9874522182</font></a></li>
      	<li><a href="#"><font face="verdana" size="1">Abhijit: +91 9038148510</font></a></li>
    </ul>
	</li> 
 <li><a href="login1.jsp"><font face="verdana" size="2" color="red">Logout</font></a></li>
  </ul>
       <td align="right"><font face="verdana" size="2" color="blue">Welcome:<%=loginname %> </font></td>	</tr>
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
<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800"><tr>
           <td valign="top" class="template">
               <form name="FrmIndex" method="post" action="instance1_admin.jsp">
               
               <% String err=request.getParameter("message");
if(err!=null){
	/* out.println(err); */
%>
<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800">
	<tr><td align="center"><font color="red"><%=err %></font></td></tr>
</table>
<%}%>
                 
                 <table cellpadding=2 cellspacing=4 border=0 align="center" width=50%>
                
                <tr><td>&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
                         <td>&nbsp;</td>             
                       <td valign="top" class="template"><strong>From Date </strong></td>
                       <td valign="top"><!-- <input type="text" name="misdate" /> -->
                       <input id="demo1" name="misdate" type="text" size="10"><a href="javascript:NewCal('demo1','ddMMyyyy')"><img src="calendar.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                       
                       <td valign="top" class="template"><strong>To Date </strong></td>
                       <td valign="top"><input id="demo2" name="todate" type="text" size="10"><a href="javascript:NewCal('demo2','ddMMyyyy')"><img src="calendar.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                     </tr>
                     
                     <tr>
                       <td valign="top" colspan=2 align="center"><label>
                         <input type="submit" name="Submit7" value="Get Details"/>
                         
                       </label></td>
                   </tr>
                    
                   <tr>
                       <td valign="top" class="template">&nbsp;</td>
                       <td valign="top">&nbsp;</td>
                     </tr>
                     <tr>
                       <td valign="top" colspan=2 align="center"><label></label></td>
                   </tr>
               </table>
               </form>
                 <script>document.FrmIndex.Username.focus();</script>
          </td>
       </tr>
</table>

<%-- <%String fromdate=request.getParameter("misdate"); 
String todate=request.getParameter("todate"); 
if(fromdate !=null && todate!=null )
{
	 ArrayList<Message> list=BlueCommerceDao.getMisData(fromdate,todate);
	  session.setAttribute("offerdetails", list);
	  System.out.println(list);
System.out.println(fromdate);
System.out.println(todate);
}
%> --%>

 
		
</tbody>
</table> 

	<center><img src="IBMlogo1.jpg"></center>
	<center><img src="/img/blank.gif" height=150 width=1></center>

             
</body>
</html>
