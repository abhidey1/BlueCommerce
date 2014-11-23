
<%@page import="com.dao.BlueCommerceDao"%><jsp:useBean id="obj" class="com.model.Login"></jsp:useBean>
<jsp:setProperty property="*" name="obj"/>
<% 

HttpSession nsession = request.getSession(false);
String unm=request.getParameter("name");
System.out.println(unm);
nsession.setAttribute("unm",unm);
//nsession.setAttribute(unm,"abc");

%>

<%
 String uname=request.getParameter("name");
String password=request.getParameter("password");
/*
	 if((uname.equals("admin") && password.equals("admin")))
	
{
	response.sendRedirect("admin.jsp");
}
else
{
	if((uname.equals("user") && password.equals("user")))
		
	response.sendRedirect("user.jsp");
	else
	{
	
		response.sendRedirect("login1.jsp");
	
	}
} */
if(BlueCommerceDao.checkLoginAdmin(uname,password)==true)
	{
	response.sendRedirect("admin.jsp");
	}
else
{
	if(BlueCommerceDao.checkLoginUser(uname,password)==true)
	{
		response.sendRedirect("user.jsp");
	}
	else
	{
	response.sendRedirect("login1.jsp");	
	}
}

%>