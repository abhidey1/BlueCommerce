<% HttpSession nsession = request.getSession(false);
String loginname=nsession.getAttribute("unm").toString();
System.out.println("herere"+loginname);
if(loginname==null)
{
	response.sendRedirect("login1.jsp");
}

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<%@page import="com.dao.BlueCommerceDao"%>

<body>



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
  <li><a href="instance_admin.jsp"><font face="verdana" size="2">Report</font></a></li>
  <li><a href="#"><font face="verdana" size="2">Contact</font></a>
	<ul>
      	<li><a href="#"><font face="verdana" size="1">Santosh:+91 9831532195</font></a></li>
      	<li><a href="#"><font face="verdana" size="1">Anirban:+91 9874522182</font></a></li>
      	<li><a href="#"><font face="verdana" size="1">Abhijit: +91 9038148510</font></a></li>
    </ul>
	</li> 
 <li><a href="login1.jsp"><font face="verdana" size="2" color="red">Logout</font></a></li>
  </ul>

<td align="right"><font face="verdana" size="2" color="blue">Welcome:<%=loginname %> </font></td>
</tr>
         </table>

<% 
String locnmcombo=request.getParameter("selectloc");
String locnmtext=request.getParameter("locname");
String hotelaname=request.getParameter("hotelaname");
String hotelbname=request.getParameter("hotelbname");
String hotelcname=request.getParameter("hotelcname");
String travaname=request.getParameter("travaname");
String travbname=request.getParameter("travbname");
String adddetails=request.getParameter("adddetails");
//String offerid=request.getParameter("offerid");


if(!locnmcombo.equals(locnmtext))
{
if(BlueCommerceDao.addLocation(locnmtext,hotelaname,hotelbname,hotelcname,travaname,travbname,adddetails)==true){ %>
	    	  
	    	  <table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800"> <tr>
	<td>&nbsp;</td>
	<td align="center"><font color="Blue" size="10"><% out.println("Offer Details successfully added");} else {out.println("Location cannot be Added.Please try again..."); }%></font>
	</td>
	<td>&nbsp;</td>
	</tr>
<%
}
else
{
	if(BlueCommerceDao.updateLocation(hotelaname,hotelbname,hotelcname,travaname,travbname,adddetails,locnmtext)==true){%>
	<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800"> <tr>
	<td align="center"><font color="Blue" size="10" ><% out.println("Data successfully updated");} else {out.println("Location cannot be Updated.Please try again..."); }%></font></td></tr></table>
<%}%>

	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
    <tr>
	<td align="left" width="20%">&nbsp;</td>
	<td valign="top" align="centre" width="60%"><center><img src="IBMlogo1.jpg"></center></td>
	<td align="left" width="20%">&nbsp;</td>
	</tr>

</table>
</body>
</head>
</html>

