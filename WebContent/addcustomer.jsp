<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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

</head>

<body bgcolor="#FFFFFF"  LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<div id="dvLoading"></div>
<table cellpadding=0 cellspacing=5 border=0 align="center" width="800" class="maintab" height="100%">
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
       	<ul id="drop-nav">
       			<li><a href="#"><font face="verdana" size="2">Customer Details</font></a>
  <ul>
      <li><a href="custdetails.jsp" ><font face="verdana" size="1">View Customer </font></a></li>
      <li><a href="#"><font face="verdana" size="1">Add Customer</font></a></li>
   </ul></li>
  <li><a href="#"><font face="verdana" size="2">Offer Details</font></a>
    <ul>
      <li><a href="offerdetails.jsp" ><font face="verdana" size="1">View/Modify Offer</font></a></li>
      <li><a href="addoffer.jsp"><font face="verdana" size="1">Add Offer</font></a></li>
   </ul>
  </li>
  <li><a href="instance.jsp"><font face="verdana" size="2">Report</font></a></li>
  <li><a href="#"><font face="verdana" size="2">Contact</font></a></li>
 <li><a href="login1.jsp"><font face="verdana" size="2" color="red">Logout</font></a></li>
  </ul>
                </table>


<table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800">
        <tr>
           <td valign="top" class="template">
               <form name="FrmIndex" method="post" action="registercustomer.jsp"   >
                 <table cellpadding=2 cellspacing=4 border=0 align="center" width=50%>
                <tr><td width="59%"> </td>
                </tr>
                <tr><td><span class="heading">Welcome Admin ! Add your user </span></td></tr>
                   <tr>
                      <td valign="top" colspan=2 class="heading"> </td>
                   </tr>
                     <input type="hidden" name="linkId" value="0">
                     <input type="hidden" name="id" value="38">
                     
                     <tr>
                       <td valign="top" class="template"><strong>CUSTOMER NAME </strong></td>
                          <td valign="top"><input type="text" name="cname" /></td>
                   </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CUSTOMER MOBNO </strong></td>
                       <td valign="top"><input type="text" name="cmob" /></td>
                     </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CUSTOMER EMAIL </strong></td>
                       <td valign="top"><input type="text" name="cemail" /></td>
                     </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CUSTOMER CARDTYPE </strong></td>
                       <td valign="top"><select name="cardtype" onchange="">
						<option value="">select value</option>
						<option value="credit">credit</option>
						<option value="debit">debit</option>
						</select>  </td>
                     </tr>
                     <tr>
                       <td valign="top" class="template"><strong>CUSTOMER CREDIT/DEBIT-CARDNO</strong></td>
                       <td valign="top"><input type="text" name="cardno" /></td>
                     </tr>
                     
                     <tr>
                       <td valign="top" class="template"><strong>CUSTOMER LOCATION</strong></td>
                       <td valign="top"><input type="text" name="address" /></td>
                     </tr>
                     
                      <tr>
                       <td valign="top" class="template"><strong>CUSTOMER CLASS</strong></td>
                       <td valign="top"><input type="text" name="cclass" /></td>
                     </tr>
                     
                     
                     
                     <tr>
                       <td valign="top" class="template"><strong>TRANSACTION AMOUNT</strong></td>
                       <td valign="top"><input type="text" name="tamount" /></td>
                     </tr>

					<!-- <tr>
                       <td valign="top" class="template"><strong>TRANSACTION MESSAGE</strong></td>
                       <td valign="top"><input type="text" name="msg" /></td>
                     </tr> -->
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