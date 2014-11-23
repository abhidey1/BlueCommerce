<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" errorPage="" %>
<%@page import="com.dao.BlueCommerceDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Blue Commerce</title>
<style type='text/css'>
	ul {list-style: none;padding: 0px;margin: 0px; width: 600px; margin-

left: auto; margin-right: auto;}
  	ul li {display: block;position: relative;float: left;border:1px solid 

#000}
	li ul {display: none;}
  	ul li a {display: block;background: #000;padding: 5px 10px 5px 

10px;text-decoration: none; white-space: nowrap;color: #fff;}
  	ul li a:hover {background: #f62;}
  	li:hover ul {display: block; position: absolute;}
  	li:hover li {float: none; width: 155px}
  	li:hover a {background: #f62;}
  	li:hover li a:hover {background: #000;}
	#drop-nav li ul li {border-top: 0px;}

	h2 {text-decoration:blink} 
  </style>
<script language="javascript" >

function validate()
{
	if(document.FrmIndex.ufname.value=="" || document.FrmIndex.ulname.value=="" 
			|| document.FrmIndex.uemail.value=="" || document.FrmIndex.uphone.value=="" || document.FrmIndex.urole.value==""
			|| document.FrmIndex.uname.value=="")
	{
	alert("Please provide all the valid fields.");
	document.FrmIndex.ufname.focus();
	return false;  
	}
}

</script>
<!-- ToolTip -->
<script type='text/javascript' src='jquery-1.8.2.js'></script>

<script> 
$(window).load(function(){ 
$('#dvLoading').fadeOut(2000); 
}); 
</script> 
<!-- End ToolTip -->

<script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var keys=document.FrmIndex.selectloc.value;

var urls="db_fetch1.jsp?ok="+keys

if (window.XMLHttpRequest)
{// code for IE7+, Firefox, Chrome, Opera, Safari
xmlhttp=new XMLHttpRequest();
}
else
{// code for IE6, IE5
xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
}
//added
if (typeof XMLHttpRequest != "undefined"){
	   xmlHttp= new XMLHttpRequest();
	       }
	       //added end
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4)
{
var some=xmlhttp.responseXML.documentElement;
document.getElementById("a").innerHTML=some.getElementsByTagName("locname")[0].childNodes[0].nodeValue;
document.getElementById("b").innerHTML=some.getElementsByTagName("hca")[0].childNodes[0].nodeValue;
document.getElementById("c").innerHTML=some.getElementsByTagName("hcb")[0].childNodes[0].nodeValue;
document.getElementById("d").innerHTML=some.getElementsByTagName("hcc")[0].childNodes[0].nodeValue;
document.getElementById("e").innerHTML=some.getElementsByTagName("tca")[0].childNodes[0].nodeValue;
document.getElementById("f").innerHTML=some.getElementsByTagName("tcb")[0].childNodes[0].nodeValue;
/* document.getElementById("g").innerHTML=some.getElementsByTagName("offerid")[0].childNodes[0].nodeValue; */

document.getElementById("aa").value=document.getElementById("a").innerText;
document.getElementById("bb").value=document.getElementById("b").innerText;
document.getElementById("cc").value=document.getElementById("c").innerText;
document.getElementById("dd").value=document.getElementById("d").innerText;
document.getElementById("ee").value=document.getElementById("e").innerText;
document.getElementById("ff").value=document.getElementById("f").innerText;
/* document.getElementById("gg").value=document.getElementById("g").innerText; */

}
}
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>

</head>

<body bgcolor="#FFFFFF"  LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<div id="dvLoading"></div>
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

color="white"><marquee behavior=alternate scrollamount=5 >-Time Being of 

Essence</marquee></b></i></font>
		</td>
       	</tr>
       	<tr>
       	<ul id="drop-nav">
  <li><a href="#"><font face="verdana" size="2">Customer Details</font></a>
  <ul>
      <li><a href="custdetails.jsp" ><font face="verdana" size="1">View Customer </font></a></li>
      <li><a href="addcustomer.jsp"><font face="verdana" size="1">Add Customer</font></a></li>
   </ul></li>
  <li><a href="#"><font face="verdana" size="2">Offer Details</font></a>
    <ul>
      <li><a href="offerdetails.jsp" ><font face="verdana" size="1">View/Modify Offer</font></a></li>
      <li><a href="#"><font face="verdana" size="1">Add Offer</font></a></li>
   </ul>
  </li>
  <li><a href="instance.jsp"><font face="verdana" size="2">Report</font></a></li>
  <li><a href="#"><font face="verdana" size="2">Contact</font></a></li>
 <li><a href="login1.jsp"><font face="verdana" size="2" color="red">Logout</font></a></li>
  </ul></tr>
	</table>

<span id="a" style="VISIBILITY:hidden;display:none"></span>
<span id="b" style="VISIBILITY:hidden;display:none"></span>
<span id="c" style="VISIBILITY:hidden;display:none"></span>  
<span id="d" style="VISIBILITY:hidden;display:none"></span>
<span id="e" style="VISIBILITY:hidden;display:none"></span>
<span id="f" style="VISIBILITY:hidden;display:none"></span>
<!-- <span id="g" style="VISIBILITY:hidden;display:none"></span> -->
<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800">
        <tr>
           <td valign="top" class="template">
               <form name="FrmIndex" method="post" action="validatelocation.jsp"   >
                 <table cellpadding=2 cellspacing=4 border=0 align="center" width=50%>
                <tr><td width="59%"> </td>
                </tr>
                <tr><td><span class="heading">Welcome Admin !</span></td></tr>
                   <tr>
                      <td valign="top" colspan=2 class="heading"> </td>
                   </tr>
                     <input type="hidden" name="linkId" value="0">
                     <input type="hidden" name="id" value="38">
                     
                   
                     <tr>
                      
                    

                   
                       <td valign="top" class="template"><strong>SELECT LOCATION </strong></td>
                     
                       <td valign="top"><select name="selectloc" onchange="loadXMLDoc()">
                       
						<option value="">select value</option>
						  <%
                    ArrayList <String> loc =new ArrayList<String>();
                    loc=BlueCommerceDao.getLocation();
                  //  System.out.println(loc.get(1));
                    //String getloc1="";
                    for ( String getloc : loc) {
                     //   System.out.println(getloc); 
                      
                    %>
					<option value="<%=getloc%>"><%=getloc%></option> 
						<%} %>
						<!-- <option value="delhi">DELHI</option>
						<option value="mumbai">MUMBAI</option>
						<option value="chennai">CHENNAI</option>
						<option value="kolkata">KOLKATA</option> -->
						</select>  </td>
						<%--  <%} %> --%>
                     </tr>
                     
                     
                     
                     <tr>
                       <td valign="top" class="template"><label><strong>LOCATION NAME </strong></label></td>
                          <td width="41%" valign="top"><label></label>

                          <label>
                          <input type="text" name="locname" id="aa"/>
                          </label></td>
                   </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CLASS A HOTEL NAME </strong></td>
                          <td valign="top"><input type="text" name="hotelaname" id="bb" /></td>
                   </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CLASS B HOTEL NAME </strong></td>
                          <td valign="top"><input type="text" name="hotelbname" id="cc"/></td>
                   </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CLASS C HOTEL NAME </strong></td>
                          <td valign="top"><input type="text" name="hotelcname" id="dd"/></td>
                   </tr>
                   <tr>
                       <td valign="top" class="template"><strong>CLASS A TRAVEL AGENT NAME </strong></td>
                          <td valign="top"><input type="text" name="travaname" id="ee"/></td>
                   </tr>
                   <tr>
                       <td valign="top" class="template"><strong>CLASS B TRAVEL AGENT NAME </strong></td>
                          <td valign="top"><input type="text" name="travbname" id="ff" /></td>
                   </tr>
                   <tr>
                       <td valign="top" class="template"><strong>ADDITIONAL DETAILS </strong></td>
                          <td valign="top"><input type="text" name="adddetails" /></td>
                   </tr>

 <!-- <input type="hidden" name="offerid" id="gg" > -->
                     <tr>
                       <td valign="top" colspan=2 align="center"><label>
                         <input type="submit" value="Submit"  onclick="return validate()" />
                       </label></td>
                   </tr>
               </table>
               </form>

            </td>
       </tr>
</table>

	<center><img src="IBMlogo1.jpg"></center>
	<center><img src="/img/blank.gif" height=150 width=1></center>

                <table width="100%" height="1" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr></tr>
                </table>

       </td>
       <td> </td>
    </tr>
</table>
</body>
</html>