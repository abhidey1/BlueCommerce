<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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
<table border=0 cellpadding="3" width="100%">
<tr>
<td align="left">&nbsp;</td>

<ul id="drop-nav">
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
  <li><a href="#"><font face="verdana" size="2">Contact</font></a></li>
 <li><a href="login1.jsp"><font face="verdana" size="2" color="red">Logout</font></a></li>
  </ul></tr>
        <tr>
           <td valign="top" class="template">
               <form name="FrmIndex" method="post" action="adduserregister.jsp"   >
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
                       <td valign="top" class="template"><label><strong>FIRST NAME </strong></label></td>
                          <td width="41%" valign="top"><label></label>

                          <label>
                          <input type="text" name="ufname" />
                          </label></td>
                   </tr>
                     <tr>
                       <td valign="top" class="template"><strong>LAST NAME </strong></td>
                          <td valign="top"><input type="text" name="ulname" /></td>
                   </tr>
                     <tr>
                       <td valign="top" class="template"><strong>EMAIL ID </strong></td>
                       <td valign="top"><input type="text" name="uemail" /></td>
                     </tr>
                     <tr>
                       <td valign="top" class="template"><strong>PHONE NO. </strong></td>
                       <td valign="top"><input type="text" name="uphone" /></td>
                     </tr>
                     <tr>
                       <td valign="top" class="template"><strong>USER TYPE</strong></td>
                       <td valign="top"><select name="urole" onchange="">
						<option value="">select value</option>
						<option value="admin">admin</option>
						<option value="user">mis</option>
						</select>  </td>
                     </tr>
                     <tr>
                       <td valign="top" class="template"><strong>USERNAME</strong></td>
                       <td valign="top"><input type="text" name="uname" /></td>
                     </tr>

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