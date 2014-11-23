<% HttpSession nsession = request.getSession(false);
String loginname=nsession.getAttribute("unm").toString();
System.out.println("herere"+loginname);
if(loginname==null)
{
	response.sendRedirect("login1.jsp");
}

%>

<%@page import="com.dao.BlueCommerceDao"%><jsp:useBean id="obj" class="com.model.Login"></jsp:useBean>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.model.ReadFileData"%>
<%@page import="com.model.Offer"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:setProperty property="*" name="obj"/>
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
  </ul><td align="right"><font face="verdana" size="2" color="blue">Welcome:<%=loginname %> </font></td></tr>
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
		<br/><br/>
		<%

		String cname=request.getParameter("cname");
		String cmob=request.getParameter("cmob");
		String cemail=request.getParameter("cemail");
		String cardtype=request.getParameter("cardtype");
		String cardno=request.getParameter("cardno");
		String address=request.getParameter("address");
		String cclass=request.getParameter("cclass");
		String ttype=request.getParameter("ttype");
		String tamount=request.getParameter("tamount");
		String msg=request.getParameter("msg");
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		String date = sdf.format(new Date()); 
		System.out.println(date);

		//String upassword=request.getParameter("upassword");
		/* String all_details=ufname+","+ulname+","+uname+","+uname+","+urole+","+uphone+","+date+","+uemail;
		String content = all_details;

		try{
	          File file =new File("/bc_user_details.txt");
	    	  if(!file.exists()){
	    	 	file.createNewFile();
	    	  }
	    	  FileWriter fw = new FileWriter(file,true);
	    	  BufferedWriter bw = new BufferedWriter(fw);
	    	  PrintWriter pw = new PrintWriter(bw); */
	          //This will add a new line to the file content
	    	//  pw.println("");
	          /* Below three statements would add three 
	           * mentioned Strings to the file in new lines.
	           */
	 //   	  pw.println(content);

	 //   	  pw.close();
	 
	 String firstsms="";
	 firstsms= "Dear " +cname+ " you have made a transaction of Rs " +tamount+"/- at makemytrip.com for travelling to kolkata";
	 if(BlueCommerceDao.addCustomer(cname,cmob,cemail,cardtype,cardno,address,cclass,tamount,date,firstsms)==true ) 
	 {
		 ReadFileData efg= new ReadFileData();
		 //String firstsms= "Dear " +cname+ " you have made a transaction of Rs " +tamount+"/- at makemytrip.com for travelling to kolkata";
		 efg.SendSMS(cmob,firstsms);
				 
				 
		 
		 String hotela="";
		 String discount="";
		 String helplineno="";
		 
		 ArrayList<Offer> list=BlueCommerceDao.getOffer(cmob,address);
		  session.setAttribute("offerdetails", list);
		  List list1 = (List) session.getAttribute("offerdetails"); 
          for (int i = 0; i < list1.size(); i++) { 
           Offer offerdtls = (Offer) list1.get(i);
        	hotela=offerdtls.getHotelclassa();
        	discount=offerdtls.getDiscount();
        	helplineno=offerdtls.getHelpline();
          }
			String finalmsg="Dear "+cname+", you are getting offer from " +hotela+ " discount of" + discount + "%. Contact helpline number " +helplineno;
			 efg.SendSMS(cmob,finalmsg);	 
	    	  %>
	    	  
	    	  <table border="0" cellspacing="3" cellpadding="4" bgcolor="#FFFFFF" width="800"> 
	    	  <tr>
	    	  <td width="30%">&nbsp;</td>
<td align="center" width="50%"><font color="Blue"><% out.println("Customer details added and message successfully sent"); } else{out.println("Registration failed.Please try again later...");} %></font>
   </td>
   <td width="20%">&nbsp;</td>
   </tr>
	<tr><td>&nbsp;</td></tr>
		  <tr>
	<td align="left" width="20%">&nbsp;</td>
	<td valign="top" align="centre" width="60%"><center><img src="IBMlogo1.jpg"></center></td>
	<td align="left" width="20%">&nbsp;</td>
	</tr>

	      </table>
		
	</body>
	</html>